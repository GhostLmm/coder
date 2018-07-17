package ui.friend
{
	import com.fish.modules.core.models.FriendModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	
	public class MDI_HaoyouWindow extends Mediator
	{
		[Inject]
		public var haoyouWindow:HaoyouWindow;
		
		private var friendModel:FriendModel;
		
		private var userModel:UserModel;
		
		public function MDI_HaoyouWindow()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			initModule();
			registerEvent();
			setShow();
		}
		private function initModule():void
		{
			friendModel=Context.getInjectInstance(FriendModel);
			userModel=Context.getInjectInstance(UserModel);
		}
		private function registerEvent():void
		{
			friendModel.modelUpdata_SN.add(onMessage);
			userModel.modelUpdata_SN.add(onMessage);
			
			addViewListener(haoyouWindow._btn_close,TqtEvent.BUTTON_CLICK,haoyouWindow.close);
			addViewListener(haoyouWindow._btn_tianjiahaoyou,TqtEvent.BUTTON_CLICK,onTianjiahaoyouClicked);
		}
		private function onMessage():void
		{
			setShow();
		}
		private function setShow():void
		{
			haoyouWindow._scrollController.initItemClass(Item_Haoyou_DongfuScene);
			setFriendsShow();
			setFriendNumShow();
			setNoFriendMc();
		}
		private function setNoFriendMc():void
		{
			if(friendModel.CurrentHaoyouNum > 0) {
				haoyouWindow._mc_haoyou.visible = false;
			} else {
				haoyouWindow._mc_haoyou.visible = true;
			}
		}
		private function setFriendNumShow():void
		{
			haoyouWindow._prg_haoyou.devider=userModel.MaxFriendsNum;
			haoyouWindow._prg_haoyou.progress=friendModel.CurrentHaoyouNum;
		}
		private function setFriendsShow():void
		{
			haoyouWindow._scrollController.setData(friendModel.firendItemDataArray);			
		}
		private function onTianjiahaoyouClicked(evt:Event):void
		{
			WindowManager.openOnlyWinodw(TianjiaHaoyouWindow);
		}
		public override function destroy():void
		{
			friendModel.modelUpdata_SN.remove(onMessage);
			userModel.modelUpdata_SN.remove(onMessage);
			userModel=null;
			friendModel=null;
			super.destroy();
		}
	}
}