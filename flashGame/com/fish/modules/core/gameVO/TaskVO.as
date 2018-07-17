package com.fish.modules.core.gameVO
{

	/** 邮件
	**/
	public class TaskVO extends BaseVo
	{
		/**  
		**/
		private var _id:int;
		/**  
		**/
		public function get id():int
	 	{
	 		return _id;
	 	}
		/**  
		**/
		public function set id(value:int):void
		{
			if(initFlag){
				if(_id!=value){
					var old:int=_id;
					_id=value;
					onChangeAttr("id",_id,old);
				}
			}else{
				_id=value;
			}
		}
		/**  更改类型
		**/
		private var _modifyType:int;
		/**  更改类型
		**/
		public function get modifyType():int
	 	{
	 		return _modifyType;
	 	}
		/**  更改类型
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
		/**  是否完成
		**/
		private var _hasComplete:int;
		/**  是否完成
		**/
		public function get hasComplete():int
	 	{
	 		return _hasComplete;
	 	}
		/**  是否完成
		**/
		public function set hasComplete(value:int):void
		{
			if(initFlag){
				if(_hasComplete!=value){
					var old:int=_hasComplete;
					_hasComplete=value;
					onChangeAttr("hasComplete",_hasComplete,old);
				}
			}else{
				_hasComplete=value;
			}
		}
		/**  完成量
		**/
		private var _info:String;
		/**  完成量
		**/
		public function get info():String
	 	{
	 		return _info;
	 	}
		/**  完成量
		**/
		public function set info(value:String):void
		{
			if(initFlag){
				if(_info!=value){
					var old:String=_info;
					_info=value;
					onChangeAttr("info",_info,old);
				}
			}else{
				_info=value;
			}
		}
		public static const Attributes:Array=["id","modifyType","hasComplete","info"];
		public static const KeyAttr:String="id";
	}
}