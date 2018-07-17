package com.fish.modules.core.gameVO
{

	/** 抢矿
	**/
	public class XitongkuangVO extends BaseVo
	{
		/**  矿的id
		**/
		private var _xid:int;
		/**  矿的id
		**/
		public function get xid():int
	 	{
	 		return _xid;
	 	}
		/**  矿的id
		**/
		public function set xid(value:int):void
		{
			if(initFlag){
				if(_xid!=value){
					var old:int=_xid;
					_xid=value;
					onChangeAttr("xid",_xid,old);
				}
			}else{
				_xid=value;
			}
		}
		/**  煤矿主
		**/
		private var _name:String;
		/**  煤矿主
		**/
		public function get name():String
	 	{
	 		return _name;
	 	}
		/**  煤矿主
		**/
		public function set name(value:String):void
		{
			if(initFlag){
				if(_name!=value){
					var old:String=_name;
					_name=value;
					onChangeAttr("name",_name,old);
				}
			}else{
				_name=value;
			}
		}
		/**  用户id
		**/
		private var _userId:int;
		/**  用户id
		**/
		public function get userId():int
	 	{
	 		return _userId;
	 	}
		/**  用户id
		**/
		public function set userId(value:int):void
		{
			if(initFlag){
				if(_userId!=value){
					var old:int=_userId;
					_userId=value;
					onChangeAttr("userId",_userId,old);
				}
			}else{
				_userId=value;
			}
		}
		public static const Attributes:Array=["xid","name","userId"];
		public static const KeyAttr:String="xid";
	}
}