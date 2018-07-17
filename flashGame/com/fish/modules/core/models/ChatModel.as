package com.fish.modules.core.models
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.BanghuichatVO;
	import com.fish.modules.core.gameVO.ChatVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.DigC2SProto;
	
	import org.osflash.signals.Signal;
	
	import view.viewData.BanghuiChatData;
	import view.viewData.ChatData;

	public class ChatModel extends BaseModel
	{
		public var ChatCostItemId:int;
		public var ChatCostItemNum:int;
		public var BanghuiChatCostItemNum:int;
		
		public var sendChat_SN:Signal=new Signal(String);
		
		public static const CANNOT_CHAT:int = 2;
		
		private var isInit:Boolean=false;
		
		public function ChatModel()
		{
			super();
		}
		protected override function onGameInitComplete():void
		{
			GameVOManager.getInstance().arrayVoOP_SN.add(onArrayChange);
			ChatCostItemId=XMLDataManager.getConstById("liaotian_costItemId").value;
			ChatCostItemNum=XMLDataManager.getConstById("liaotian_cost").value;
			BanghuiChatCostItemNum=XMLDataManager.getConstById("Banghui_liaotian_hongchun").value;
			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int){
			if(C2SEmitter.REQ_ActionChatHandler==msType){
				if(code==1){
					sendChat_SN.dispatch(c2s.chat.info);
				}
			}
		}
		
		private var needBanghuiFresh:Boolean=false;
		public var banghuiVoArrayChange:Signal=new Signal();
		
		private var needFresh:Boolean=false;
		public var voArrayChange:Signal=new Signal();
		private function onArrayChange(cls:Class,array:Array):void
		{
			if(cls==ChatVO)
			{
				needFresh=true;
				voArrayChange.dispatch();
			}
			if(cls==BanghuichatVO)
			{
				needBanghuiFresh=true;
				banghuiVoArrayChange.dispatch();
			}
		}
		private var _banghuiChatDataArray:Array;
		public function get banghuiChatDataArray():Array
		{
			if((null==_banghuiChatDataArray)||(needBanghuiFresh))
			{
				updateBanghuiChatDataArray();
			}
			return _banghuiChatDataArray;
		}
		private function updateBanghuiChatDataArray():void
		{
			if(null==_banghuiChatDataArray)
			{
				_banghuiChatDataArray=[];
			}
			_banghuiChatDataArray.length=0;
			var voArray:Array=GameVOManager.getInstance().banghuichats;
			var index:int;
			for(index=0;index<voArray.length;index++)
			{
				var vo:BanghuichatVO=voArray[index] as BanghuichatVO;
				var chatData:BanghuiChatData=new BanghuiChatData(vo);
				_banghuiChatDataArray.push(chatData);
			}
			_banghuiChatDataArray.sortOn("id",Array.NUMERIC);
			needBanghuiFresh=false;
		}
		private var _chatDataArray:Array;
		public function get chatDataArray():Array
		{
			if((null==_chatDataArray)||(needFresh))
			{
				updateChatDataArray();
			}
			return _chatDataArray;
		}
		private function updateChatDataArray():void
		{
			if(null==_chatDataArray)
			{
				_chatDataArray=[];
			}
			_chatDataArray.length=0;
			var voArray:Array=GameVOManager.getInstance().chats;
			var index:int;
			for(index=0;index<voArray.length;index++)
			{
				var vo:ChatVO=voArray[index] as ChatVO;
				var chatData:ChatData=new ChatData(vo);
				_chatDataArray.push(chatData);
			}
			_chatDataArray.sortOn("id",Array.NUMERIC);
			needFresh=false;
		}
		public function sendMessage(_info:String):void
		{
			C2SEmitter.sendChatInfo(_info);
		}
		public function sendBanghuiMessage(_info:String):void
		{
			C2SEmitter.sendBanghuiChatInfo(_info);
		}
		public function refreshChatInfo(_needLoading:Boolean=false):void
		{
			if(!isInit)
			{
				C2SEmitter.initChatInfo(true);
				isInit=true;
			}
			else
			{
				C2SEmitter.refreshChatInfo(_needLoading);
			}
		}
		public function refreshBanghuiChatInfo(_needLoading:Boolean=false):void
		{
			if(!isInit)
			{
				C2SEmitter.initBanghuiChatInfo(true);
				isInit=true;
			}
			else
			{
				C2SEmitter.refreshBanghuiChatInfo(_needLoading);
			}
		}
		public override function destory():void
		{
			sendChat_SN.removeAll();
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			GameVOManager.getInstance().arrayVoOP_SN.remove(onArrayChange);
			super.destory();
		}
		public static function checkCouldAddFriend(_chatData:Object):Boolean
		{
			if(_chatData.uid.toString()==GLBaseData.userId)
			{
				return false;
			}
			var friendModel:FriendModel=Context.getInjectInstance(FriendModel);
			if(friendModel.checkIfisFriend(_chatData.userName))
			{
				return false;
			}
			return true;
		}
		private var _hasNewChat:Boolean=false;
		public function get hasNewChat():Boolean
		{
			return _hasNewChat;
		}
		public function set hasNewChat(_value:Boolean):void
		{
			_hasNewChat=_value; 
//			_hasNewChat=true;
		}
	}
}