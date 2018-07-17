package ui.paihangbang
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.models.RankModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import snake.PlayerThumb;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItem;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	import view.CommonControlFun;
	import view.viewData.TuhaoData;

	public class Item_TuhaoPanel extends Base_Item implements IGridItem
	{
		public function Item_TuhaoPanel()
		{
			super();
		}
		private var _btn_chongbai:Button;
		private var _btn_yincang:Button;
		private var _btn_xianshi:Button;
		
		private var _fnt_lv:FontField;
		private var _fnt_chongbai:FontField;
		private var _fnt_name:FontField;

		private var _pos_vip:Position;
		
		private var _pos_touxiang:Position;
		
		protected override function initModule():void
		{
			_btn_chongbai = new Button(itemMaterial.btn_chongbai);
			_btn_yincang=new Button(itemMaterial.btn_yincang);
			_btn_xianshi=new Button(itemMaterial.btn_xianshi);
			
			_fnt_lv = new FontField(itemMaterial.fnt_lv);
			_fnt_chongbai = new FontField(itemMaterial.fnt_chongbai);
			_fnt_name=new FontField(itemMaterial.fnt_name);

			_pos_vip=new Position(itemMaterial.pos_vip);
			_pos_touxiang = new Position(itemMaterial.pos_touxiang);
			
		}
		private function detoryMc():void
		{
			if(_btn_chongbai){_btn_chongbai.destory();_btn_chongbai=null};
			if(_btn_yincang){_btn_yincang.destory();_btn_yincang=null};
			if(_btn_xianshi){_btn_xianshi.destory();_btn_xianshi=null};
			
			if(_fnt_lv){_fnt_lv.destory();_fnt_lv=null};
			if(_fnt_chongbai){_fnt_chongbai.destory();_fnt_chongbai=null};
			if(_fnt_name){_fnt_name.destory();_fnt_name=null};
			
			if(_pos_vip){_pos_vip.destory();_pos_vip=null};
			if(_pos_touxiang){_pos_touxiang.destory();_pos_touxiang=null};
			
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_chongbai,TqtEvent.BUTTON_CLICK,onChongbaiClicked);
			addTargetEvent(_btn_chongbai,TqtEvent.BUTTON_CLICK_DISABLE,onChongbaiClicked);
			addTargetEvent(_btn_xianshi,TqtEvent.BUTTON_CLICK,onXianshiClicked);
			addTargetEvent(_btn_yincang,TqtEvent.BUTTON_CLICK,onYincangClicked);
			addTargetEvent(_pos_touxiang,TQTTouchEvent.TOUCH_TAP,onShowDetail);
		}
		private function onShowDetail(evt:Event):void
		{
			CommonControlFun.showXiangqingWindow(data.userId);
		}
		private function onXianshiClicked(evt:Event):void
		{
			if(data.userId.toString()!=GLBaseData.userId)
			{
				Util.flow("不是自己，不能操作");
				return;
			}
			var rankModel:RankModel=Context.getInjectInstance(RankModel);
			if(rankModel.rankOptVo.isHide==0)
			{
				Util.flow("排行榜已经显示自己了");
				return;
			}
			rankModel.rank_xianshi(data.userId,RankModel.Label_Tuhao);
		}
		private function onYincangClicked(evt:Event):void
		{
			if(data.userId.toString()!=GLBaseData.userId)
			{
				Util.flow("不是自己，不能操作");
				return;
			}
			var rankModel:RankModel=Context.getInjectInstance(RankModel);
			if(rankModel.rankOptVo.isHide==1)
			{
				Util.flow("排行榜已经隐藏自己了");
				return;
			}
			rankModel.rank_yincang(data.userId,RankModel.Label_Tuhao);
		}
		private function onBishiClicked(evt:Event):void
		{
			var rankModel:RankModel=Context.getInjectInstance(RankModel);
			if(rankModel.checkIfAreadyBishi(data.userId))
			{
				Util.flow("今日已经鄙视过了");
				return;
			}
			if(rankModel.checkIfReachMaxRankOptNum())
			{
				Util.flow("已达今日最大排行榜操作次数");
				return;
			}
			rankModel.bishi(data.userId,RankModel.Label_Tuhao);
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
			rankModel.chongbai(data.userId,RankModel.Label_Tuhao);
		}
		protected override function setShow():void
		{
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
			_fnt_lv.text=data.level.toString();
			
			_pos_vip.fillWithBitmapByClassName(("vip"+data.vipLevel).toString());
			setChongbaiBtnShow();
			setXianshiYincangShow();
			
			_pos_touxiang.fillWithBitmapByClassName(Util.getUserImageNameByImageId(data.userImage));
		}
		private function setXianshiYincangShow():void
		{
			if(data.userId.toString()!=GLBaseData.userId)
			{
				_btn_xianshi.visible=false;
				_btn_yincang.visible=false;
			}
			else
			{
				var rankModel:RankModel=Context.getInjectInstance(RankModel);
				if(rankModel.rankOptVo.isHide==0)
				{
					_btn_xianshi.visible=false;
					_btn_yincang.visible=true;
				}
				else
				{
					_btn_xianshi.visible=true;
					_btn_yincang.visible=false;
				}
			}
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
			if(rankModel.checkIfAreadyChongbai(data.userId,RankModel.Label_Tuhao))
			{
				return true;
			}
			return false;
		}
		private static const MaxShowJiangbeiNum:int=3;
		public function setData($data:Object):*
		{
			super.loadData($data);
		}
		public override function destory():void
		{
			detoryMc();
			super.destory();
		}
		private function get itemMaterial():ItemTuhaoBang 
		{
			return m_mc as ItemTuhaoBang; 
		}
		protected override function get itemClassName():Class
		{
			return ItemTuhaoBang; 
		}
		public function get data():TuhaoData
		{
			return m_data as TuhaoData;
		}
	}
}
