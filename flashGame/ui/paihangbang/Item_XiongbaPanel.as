package ui.paihangbang
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.models.RankModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItem;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	import view.CommonControlFun;
	import view.viewData.XiongbaData;

	public class Item_XiongbaPanel extends Base_Item implements IGridItem
	{
		public function Item_XiongbaPanel()
		{
			super();
		}
		private var _btn_chongbai:Button;
		private var _fnt_leitai:FontField;
		private var _fnt_chongbai:FontField;
		private var _fnt_name:FontField;
		private var _fnt_mingci:FontField;
		private var _pos_touxiang:Position;
		private var _pos_jiangbei:Position;
		
		protected override function initModule():void
		{
			_btn_chongbai = new Button(itemMaterial.btn_chongbai);
			_fnt_leitai = new FontField(itemMaterial.fnt_leitai);
			_fnt_chongbai = new FontField(itemMaterial.fnt_chongbai);
			_fnt_name=new FontField(itemMaterial.fnt_name);
			_fnt_mingci=new FontField(itemMaterial.fnt_mingci);
			_pos_touxiang = new Position(itemMaterial.pos_touxiang);
			_pos_jiangbei=new Position(itemMaterial.pos_jiangbei);
			
		}
		private function detoryMc():void
		{
			if(_btn_chongbai){_btn_chongbai.destory();_btn_chongbai=null};
			if(_fnt_leitai){_fnt_leitai.destory();_fnt_leitai=null};
			if(_fnt_chongbai){_fnt_chongbai.destory();_fnt_chongbai=null};
			if(_fnt_name){_fnt_name.destory();_fnt_name=null};
			if(_fnt_mingci){_fnt_mingci.destory();_fnt_mingci=null;};
			if(_pos_touxiang){_pos_touxiang.destory();_pos_touxiang=null};
			if(_pos_jiangbei){_pos_jiangbei.destory();_pos_jiangbei=null};
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_chongbai,TqtEvent.BUTTON_CLICK,onChongbaiClicked);
			addTargetEvent(_btn_chongbai,TqtEvent.BUTTON_CLICK_DISABLE,onChongbaiClicked);
			addTargetEvent(_pos_touxiang,TQTTouchEvent.TOUCH_TAP,onShowDetail);
		}
		private function onShowDetail(evt:Event):void
		{
			CommonControlFun.showXiangqingWindow(data.userId);
		}
		private function onChongbaiClicked(evt:Event):void
		{
			if(checkIfAreadyChongbai())
			{
				Util.flow("今日已经崇拜过了");
				return;
			}
			var rankModel:RankModel=Context.getInjectInstance(RankModel);
			if(rankModel.checkIfReachMaxRankOptNum())
			{
				Util.flow("已达今日最大排行榜操作次数");
				return;
			}
			rankModel.chongbai(data.userId,RankModel.Label_Xiongba);
		}
		protected override function setShow():void
		{
			if(data.leitaiRank==0)
			{
				_fnt_leitai.text=Util.getLanguage("擂台无名次");
			}
			else
			{
				_fnt_leitai.text = data.leitaiRank.toString();
			}
			var green:uint=uint(XMLDataManager.getConstById("color_self_paiming").desc);
			if(data.userId.toString()==GLBaseData.userId)
			{
				_fnt_name.textColor=green;
			}
			else
			{
				_fnt_name.textColor=_fnt_name.defaultColor;
			}
			_fnt_name.text = data.name;
			_fnt_chongbai.text = data.chongbaiCount.toString();
			if(data.rank==0)
			{
				_fnt_mingci.text=Util.getLanguage("无");
			}
			else
			{
				_fnt_mingci.text=data.rank.toString();
			}
			
			setJiangbeiShou();
			
			setChongbaiBtnShow();
			
			_pos_touxiang.fillWithBitmapByClassName(Util.getUserImageNameByImageId(data.userImage));
		}
		private function setChongbaiBtnShow():void
		{
			if(checkIfAreadyChongbai())
			{
				_btn_chongbai.isEnabled=false;
			}
			else
			{
				_btn_chongbai.isEnabled=true;
			}
		}
		private function checkIfAreadyChongbai():Boolean
		{
			var rankModel:RankModel=Context.getInjectInstance(RankModel);
			if(rankModel.checkIfAreadyChongbai(data.userId,RankModel.Label_Xiongba))
			{
				return true;
			}
			return false;
		}
		private static const MaxShowJiangbeiNum:int=3;
		private function setJiangbeiShou():void
		{
			if((data.rank<=MaxShowJiangbeiNum)&&(data.rank>0))
			{
				_pos_jiangbei.fillWithBitmapByClassName(("jiangbei"+data.rank).toString());
			}
			else
			{
				_pos_jiangbei.destoryChild();
			}
		}
		public function setData($data:Object):*
		{
			super.loadData($data);
		}
		public override function destory():void
		{
			detoryMc();
			super.destory();
		}
		private function get itemMaterial():ItemXiongbaBang		{
			return m_mc as ItemXiongbaBang;		}
		protected override function get itemClassName():Class
		{
			return ItemXiongbaBang 
		}
		private function get data():XiongbaData
		{
			return m_data as XiongbaData;
		}
	}
}
