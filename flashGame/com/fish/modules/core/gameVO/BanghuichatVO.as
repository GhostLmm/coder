package com.fish.modules.core.gameVO
{

	/** 聊天
	**/
	public class BanghuichatVO extends BaseVo
	{
		/**  聊天信息
		**/
		private var _chatInfo:String;
		/**  聊天信息
		**/
		public function get chatInfo():String
	 	{
	 		return _chatInfo;
	 	}
		/**  聊天信息
		**/
		public function set chatInfo(value:String):void
		{
			if(initFlag){
				if(_chatInfo!=value){
					var old:String=_chatInfo;
					_chatInfo=value;
					onChangeAttr("chatInfo",_chatInfo,old);
				}
			}else{
				_chatInfo=value;
			}
		}
		/**  修改标志： 0：正常， -1：删除， 1：添加
		**/
		private var _modifyType:int;
		/**  修改标志： 0：正常， -1：删除， 1：添加
		**/
		public function get modifyType():int
	 	{
	 		return _modifyType;
	 	}
		/**  修改标志： 0：正常， -1：删除， 1：添加
		**/
		public function set modifyType(value:int):void
		{
			if(initFlag){
				if(_modifyType!=value){
					var old:int=_modifyType;
					_modifyType=value;
					onChangeAttr("modifyType",_modifyType,old);
				}
			}else{
				_modifyType=value;
			}
		}
		/**  
		**/
		private var _id:Number;
		/**  
		**/
		public function get id():Number
	 	{
	 		return _id;
	 	}
		/**  
		**/
		public function set id(value:Number):void
		{
			if(initFlag){
				if(_id!=value){
					var old:Number=_id;
					_id=value;
					onChangeAttr("id",_id,old);
				}
			}else{
				_id=value;
			}
		}
		public static const Attributes:Array=["chatInfo","modifyType","id"];
		public static const KeyAttr:String="id";
	}
}