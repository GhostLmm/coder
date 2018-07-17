package ui.friend
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.FriendModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import core.event.TqtEvent;
	
	import flash.events.Event;
	
	import util.Util;
	
	public class MDI_TianjiaHaoyouWindow extends Mediator
	{
		[Inject]
		public var tianjiaHaoyouWindow:TianjiaHaoyouWindow;
		
		private var userModel:UserModel;
		
		private var friendModel:FriendModel;
		
		public function MDI_TianjiaHaoyouWindow()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			initModule();
			registerEvent();
		}
		private function initModule():void
		{
			userModel=Context.getInjectInstance(UserModel);
			friendModel=Context.getInjectInstance(FriendModel);
		}
		private function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onError);
			S2CHanlder.instance.message_SN.add(onMessage);
			
			addViewListener(tianjiaHaoyouWindow._btn_close,TqtEvent.BUTTON_CLICK,tianjiaHaoyouWindow.close);
			addViewListener(tianjiaHaoyouWindow._btn_queding,TqtEvent.BUTTON_CLICK,onQueDingClick);
			addViewListener(tianjiaHaoyouWindow._btn_quxiao,TqtEvent.BUTTON_CLICK,tianjiaHaoyouWindow.close);
			addViewListener(tianjiaHaoyouWindow._btn_suiji,TqtEvent.BUTTON_CLICK,getRandFriend);
			
			
		}
		
		private function getRandFriend(evt:Event):void
		{
			C2SEmitter.getRandomFriend();
		}
		
		private function onError(_messageType:String,_code:int):void
		{
			if(_messageType==C2SEmitter.REQ_AddFriendHandler)
			{
				if(_code==FriendModel.HaoyouNotExist_Code)
				{
					Util.flow("搜索玩家不存在");
				}
				if(_code==FriendModel.HaoyouNotInThisServer)
				{
					Util.flow("玩家不在同一服区");
				}
			}
		}
		private function onMessage(_messageType:String):void
		{
			if(_messageType==C2SEmitter.REQ_AddFriendHandler)
			{
				Util.flow("添加好友成功");
				tianjiaHaoyouWindow.close();
			}
			if(_messageType==C2SEmitter.REQ_GetFriendNameHandler){
				if(GameVOManager.getInstance().extrdata.rndFriend==null || GameVOManager.getInstance().extrdata.rndFriend=="null"){
					Util.flow("没有获得随机好友");
				}else{
					tianjiaHaoyouWindow._fnt_shuru_name.text=GameVOManager.getInstance().extrdata.rndFriend;
				}
			}
		}
		private function onQueDingClick(evt:Event):void
		{
			if(tianjiaHaoyouWindow._fnt_shuru_name.isInputed() == false) {
				Util.flow("用户名为空");
			}
			else if (!userModel.friendNumCouldAfford(friendModel.CurrentHaoyouNum)) {
				Util.flow("好友已达上限");
			}
			else if (tianjiaHaoyouWindow._fnt_shuru_name.text == GLBaseData.userName){
				Util.flow("不能添加自己为好友");
			} 
			else if (friendModel.checkIfisFriend(tianjiaHaoyouWindow._fnt_shuru_name.text)) {
				Util.flow("玩家已是好友");
			} 
			else {
				friendModel.addFriend(tianjiaHaoyouWindow._fnt_shuru_name.text);
			}
		}
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onError);
			S2CHanlder.instance.message_SN.remove(onMessage);
			userModel=null;
			friendModel=null;
			super.destroy();
		}
	}
}