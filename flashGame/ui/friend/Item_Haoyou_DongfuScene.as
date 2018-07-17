package ui.friend
{
	import com.fish.modules.core.models.FriendModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItem;
	import ui.widget.Position;
	import ui.window.JinggaoWindow;
	import ui.window.mail.HaoyouLiuyanWindow;
	
	import util.Util;
	
	import view.Base_Item;
	import view.viewData.MailReceiverInfo;
	
	public class Item_Haoyou_DongfuScene extends Base_Item implements IGridItem
	{
		private var _btn_shanchu:Button;
		private var _fnt_lv:FontField;
		private var _fnt_name:FontField;
		private var _fnt_paiming:FontField;
		private var _pos_touxiang:Position;
		private var friendModel:FriendModel;
		private var _btn_fasong:Button;
		
		public function Item_Haoyou_DongfuScene()
		{
			super();
		}
		protected override function initModule():void
		{
			friendModel=Context.getInjectInstance(FriendModel);
			_btn_shanchu = new Button(itemMaterial.btn_shanchu);
			_fnt_lv = new FontField(itemMaterial.fnt_lv);
			_fnt_name = new FontField(itemMaterial.fnt_name);
			_fnt_paiming = new FontField(itemMaterial.fnt_paiming);
			_pos_touxiang = new Position(itemMaterial.pos_item);
			_btn_fasong=new Button(itemMaterial.btn_fasong);
		}
		public override function loadData($data:Object):*
		{
			super.loadData($data);
		}
		public override function destory():void
		{
			if(_btn_shanchu) { _btn_shanchu.destory(); _btn_shanchu=null; };
			if(_fnt_lv) { _fnt_lv.destory(); _fnt_lv=null; };
			if(_fnt_name) { _fnt_name.destory(); _fnt_name=null; };
			if(_fnt_paiming) { _fnt_paiming.destory(); _fnt_paiming=null; };
			if(_pos_touxiang) { _pos_touxiang.destory(); _pos_touxiang=null; };
			if(_btn_fasong){_btn_fasong.destory();_btn_fasong=null;};
			super.destory();
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_shanchu,TqtEvent.BUTTON_CLICK,onShanchuClicked);
			addTargetEvent(_btn_fasong,TqtEvent.BUTTON_CLICK,onFasongClicked);
		}
		private function onFasongClicked(evt:Event):void
		{
			var param:MailReceiverInfo=new MailReceiverInfo();
			param.name=itemData.m_friendVo.userName;
			param.uid=itemData.m_friendVo.uid;
			WindowManager.openOnlyWinodw(HaoyouLiuyanWindow,param);
		}
		private function onClickFuliDisable(evt:Event):void
		{
			Util.flow("好友已经赠送过了");
		}
		
		protected function onShanchuClicked(evt:TqtEvent):void
		{
			var alert:JinggaoWindow = new JinggaoWindow({data:{"msg":Util.getLanguage("删除好友提示")}});
			alert.addEventListener(TqtEvent.ALERT_OK,onShanchuOK,false,0,true);
			alert.open();
		}
		protected function onShanchuOK(evt:Event):void
		{
			friendModel.cacheFriendName=itemData.userName;
			friendModel.removeFriend(itemData.m_friendVo.uid);
		}
		protected override function setShow():void
		{
			_fnt_lv.text = itemData.level.toString();
			_fnt_name.text = itemData.userName;
			if(itemData.userRank > 0) {
				_fnt_paiming.text = Util.getLanguage("排名",itemData.userRank);
			} else {
				_fnt_paiming.text = Util.getLanguage("擂台无名次");
			}
			_pos_touxiang.fillWithBitmapByClassName(Util.getUserImageNameByImageId(itemData.m_friendVo.userImage));
		}
		protected override function get itemClassName():Class
		{
			return ItemHaoyou; 
		}
		private function get itemMaterial():ItemHaoyou 
		{
			return m_mc as ItemHaoyou; 
		}
		private function get itemData():FriendItemData
		{
			return m_data as FriendItemData;
		}
	}
}
