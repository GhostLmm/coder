package ui.gonghui
{
	import com.fish.modules.core.gameVO.BanghuipersionVO;
	import com.fish.modules.core.models.FriendModel;
	import com.fish.modules.core.models.GonghuiModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItem;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	import view.CommonControlFun;
	
import flash.display.MovieClip
	public class Item_ChengyuanPanel extends Base_Item implements IGridItem
	{
		private var _btn_tichu:Button;
		
		private var _pos_vip:Position;
		
		private var _fnt_zhiwei:FontField;
		private var _fnt_name:FontField;
		private var _fnt_lv:FontField;
		private var _fnt_paiming:FontField;
		private var _fnt_zonggongxian:FontField;
		private var _fnt_shengyugongxian:FontField;
		private var _fnt_banghuizhan:FontField;
		
		public function Item_ChengyuanPanel()
		{
			super();
		}
		protected override function initModule():void
		{
			_btn_tichu=new Button(itemMaterial.btn_tichu);
			
			_pos_vip=new Position(itemMaterial.pos_vip);
			
			_fnt_zhiwei=new FontField(itemMaterial.fnt_zhiwei);
			_fnt_name=new FontField(itemMaterial.fnt_name);
			_fnt_lv=new FontField(itemMaterial.fnt_lv);
			_fnt_paiming=new FontField(itemMaterial.fnt_paiming);
			_fnt_zonggongxian=new FontField(itemMaterial.fnt_zonggongxian);
			_fnt_shengyugongxian=new FontField(itemMaterial.fnt_shengyugongxian);
			_fnt_banghuizhan=new FontField(itemMaterial.fnt_banghuizhan);
			_fnt_banghuizhan.text=Util.getLanguage("帮会成员已参加帮会战");
		}
		private function destoryMc():void
		{
			if(_btn_tichu){_btn_tichu.destory();_btn_tichu=null;};
			
			if(_pos_vip){_pos_vip.destory();_pos_vip=null;};
			
			if(_fnt_zhiwei){_fnt_zhiwei.destory();_fnt_zhiwei=null;};
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			if(_fnt_lv){_fnt_lv.destory();_fnt_lv=null;};
			if(_fnt_paiming){_fnt_paiming.destory();_fnt_paiming=null;};
			if(_fnt_zonggongxian){_fnt_zonggongxian.destory();_fnt_zonggongxian=null;};
			if(_fnt_shengyugongxian){_fnt_shengyugongxian.destory();_fnt_shengyugongxian=null;};
			if(_fnt_banghuizhan){_fnt_banghuizhan.destory();_fnt_banghuizhan=null;};
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_tichu,TqtEvent.BUTTON_CLICK,onTichuClicked);
		}
		private function onTichuClicked(evt:Event):void
		{
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			if(!gonghuiModel.checkIfIamHuizhang())
			{
				Util.flow("不具有权限");
				return;
			}
			CommonControlFun.confirmDoSth("是否确认踢出成员",confirmTichu);
		}
		private function confirmTichu():void
		{
			GonghuiModel.tichuGonghui(data.uid);
		}
		protected override function setShow():void
		{
			if(null==data)
			{
				return;
			}
			_fnt_lv.text=data.userLevel.toString();
			_fnt_name.text=data.userName;
			if(data.leitaiRank>0)
			{
				_fnt_paiming.text=Util.getLanguage("排名",data.leitaiRank);
			}
			else
			{
				_fnt_paiming.text=Util.getLanguage("没有擂台排名");
			}
			_fnt_shengyugongxian.text=data.shengyuGongxian.toString();
			_fnt_zonggongxian.text=data.totalGongxian.toString();
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			if(gonghuiModel.checkHuizhangByUid(data.uid))
			{
				_fnt_zhiwei.text=Util.getLanguage("工会会长");
			}
			else
			{
				_fnt_zhiwei.text=Util.getLanguage("工会成员");
			}
			if(gonghuiModel.checkIfIamHuizhang())
			{
				if(gonghuiModel.checkHuizhangByUid(data.uid))
				{
					_btn_tichu.visible=false;
				}
				else
				{
					_btn_tichu.visible=true;
				}
			}
			else
			{
				_btn_tichu.visible=false;
			}
			_pos_vip.fillWithBitmapByClassName("vip"+data.vipLevel);
			if(data.banghuizhanFlag>0)
			{
				_fnt_banghuizhan.visible=true;
			}
			else
			{
				_fnt_banghuizhan.visible=false;
			}
		}
		public override function loadData($data:Object):*
		{
			super.loadData($data);
		}
		protected override function get itemClassName():Class
		{
			return Item_BanghuiChengyuan; 
		}
		private function get itemMaterial():Item_BanghuiChengyuan 
		{
			return m_mc as Item_BanghuiChengyuan; 
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get data():BanghuipersionVO
		{
			return m_data as BanghuipersionVO;
		}
	}
}
