package ui.liaotian
{
	import com.fish.modules.core.models.ChatModel;
	import com.fish.modules.core.models.FriendModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	import view.CommonControlFun;
	import view.viewData.ChatData;
	
	public class Item_Liaotian extends Base_Item implements IGridItemMax
	{
		private var _btn_haoyou:Button;
		
		private var _pos_vip:Position;
		
		private var _fnt_name:FontField;
		private var _fnt_time:FontField;
		private var _fnt_lv:FontField;
		private var _fnt_liaotian:FontField;
		private var _fnt_zhiwei:FontField;
		
		public function Item_Liaotian()
		{
			super();
		}
		protected override function initModule():void
		{
			_btn_haoyou=new Button(itemMaterial.btn_haoyou);
			
			_pos_vip=new Position(itemMaterial.pos_vip);
			
			_fnt_name=new FontField(itemMaterial.fnt_name);
			_fnt_time=new FontField(itemMaterial.fnt_time);
			_fnt_lv=new FontField(itemMaterial.fnt_lv);
			_fnt_liaotian=new FontField(itemMaterial.fnt_liaotian);
			_fnt_zhiwei=new FontField(itemMaterial.fnt_zhiwei);
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_haoyou,TqtEvent.BUTTON_CLICK,onHaoyouClicked);
		}
		private function onHaoyouClicked(evt:Event):void
		{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			var friendModel:FriendModel=Context.getInjectInstance(FriendModel);
			if (!userModel.friendNumCouldAfford(friendModel.CurrentHaoyouNum)) {
				Util.flow("好友已达上限");
				return;
			}
			friendModel.addFriend(chatData.userName);
		}
		protected override function setShow():void
		{
			_fnt_liaotian.text=chatData.info;
			_fnt_lv.text=chatData.userLevel.toString();
			_fnt_name.text=chatData.userName;
			_pos_vip.fillWithBitmapByClassName("vip"+chatData.vipLevel);
			_fnt_time.text=CommonControlFun.timeToString(chatData.time);
			_fnt_zhiwei.visible=false;
		
			if(ChatModel.checkCouldAddFriend(chatData))
			{
				_btn_haoyou.visible=true;
			}
			else
			{
				_btn_haoyou.visible=false;
			}
		}
		public override function destory():void
		{
			if(_btn_haoyou){_btn_haoyou.destory();_btn_haoyou=null;};
			
			if(_pos_vip){_pos_vip.destory();_pos_vip=null;};
			
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			if(_fnt_time){_fnt_time.destory();_fnt_time=null;};
			if(_fnt_lv){_fnt_lv.destory();_fnt_lv=null;};
			if(_fnt_liaotian){_fnt_liaotian.destory();_fnt_liaotian=null;};
			if(_fnt_zhiwei){_fnt_zhiwei.destory();_fnt_zhiwei=null;};
			super.destory();
		}
		protected override function get itemClassName():Class
		{
			return ItemLiaotian;
			
		}
		public override function loadData($data:Object):*
		{
			super.loadData($data);
		}
		private function get itemMaterial():ItemLiaotian			
		{
			return m_mc as ItemLiaotian;			
		}
		public function set enable(value:Boolean):void
		{
		}
		
		public function get enable():Boolean
		{
			return false;
		}
		
		public function set selected(value:Boolean):void
		{
		}
		
		public function get selected():Boolean
		{
			return false;
		}
		
		public function set index(value:int):void
		{
		}
		
		public function get index():int
		{
			return 0;
		}
		public function get data():Object
		{
			return null;
		}
		public function get chatData():ChatData
		{
			return m_data as ChatData;
		}
		public function enterMovie():*
		{
			return null;
		}
	}
}
