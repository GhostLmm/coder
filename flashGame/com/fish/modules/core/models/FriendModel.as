package com.fish.modules.core.models
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.FriendVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	
	import ui.friend.FriendItemData;
	
	import util.Util;

	public class FriendModel extends BaseModel
	{
		public static const HaoyouNotExist_Code:int=-36;
		public static const HaoyouNotInThisServer:int=-44;
		public var cacheFriendName:String;
		private var needFresh:Boolean=false;
		
		public var cacheFriendData:FriendItemData;
		
		public function FriendModel()
		{
			super();
		}
		protected override function onGameInitComplete():void
		{
			GameVOManager.getInstance().arrayVoOP_SN.add(onFriendInfoChange);
			S2CHanlder.instance.message_SN.add(onMessage);
		}
		private function onMessage(_messageType:String):void
		{
			if(_messageType==C2SEmitter.REQ_DeleteFriendHandler)
			{
				Util.flow("删除好友浮字",cacheFriendName);
			}
		}
		private function onFriendInfoChange(cls:Class,array:Array):void
		{
			if(cls==FriendVO)
			{
				needFresh=true;
				modelUpdata_SN.dispatch();
			}
		}
		private var _friendItemDataArray:Array;
		public function get firendItemDataArray():Array
		{
			if((_friendItemDataArray==null)||(needFresh))
			{
				updateItemDataArray();
			}
			return _friendItemDataArray;
		}
		private function updateItemDataArray():void
		{
			if(null==_friendItemDataArray)
			{
				_friendItemDataArray=[];
			}
			_friendItemDataArray.length=0;
			var friendsArray:Array=GameVOManager.getInstance().friends;
			var index:int;
			for(index=0;index<friendsArray.length;index++)
			{
				var friendVo:FriendVO=friendsArray[index] as FriendVO;
				if(friendVo.modifyType==-1)
				{
					continue;
				}
				var friendItemData:FriendItemData=new FriendItemData();
				friendItemData.setData(friendVo);
				_friendItemDataArray.push(friendItemData);
			}
			_friendItemDataArray=_friendItemDataArray.sort(compare);
			needFresh=false;
		}
		private function compare(A:FriendItemData,B:FriendItemData):int
		{
			var weightA:int = 0;
			var weightB:int = 0;
			if(A.level > B.level ) {
			weightA += 1;
			}
			if(A.level < B.level ){
			weightB += 1;
			}
			return weightB - weightA;
		}
		public function get CurrentHaoyouNum():int
		{
			return firendItemDataArray.length;
		}
		public function checkIfisFriend(_name:String):Boolean
		{
			var friendsArray:Array=firendItemDataArray;
			var index:int;
			for(index=0;index<friendsArray.length;index++)
			{
				var friendData:FriendItemData=friendsArray[index] as FriendItemData;
				if(friendData.userName==_name)
				{
					return true;
					break;
				}
			}
			return false;
		}
		public function addFriend(_name:String):void
		{
			C2SEmitter.addFriend(_name);
		}
		public function removeFriend(_uid:int):void
		{
			C2SEmitter.removeFriend(_uid);
		}
	}
}