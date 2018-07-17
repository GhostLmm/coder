package com.fish.modules.core.gameVO
{

	/** 故事数据
	**/
	public class ChaonengliVO extends BaseVo
	{
		/**  超能力关数
		**/
		private var _currentType:int;
		/**  超能力关数
		**/
		public function get currentType():int
	 	{
	 		return _currentType;
	 	}
		/**  超能力关数
		**/
		public function set currentType(value:int):void
		{
			if(initFlag){
				if(_currentType!=value){
					var old:int=_currentType;
					_currentType=value;
					onChangeAttr("currentType",_currentType,old);
				}
			}else{
				_currentType=value;
			}
		}
		/**  当前关卡解锁xid
		**/
		private var _xidList:String;
		/**  当前关卡解锁xid
		**/
		public function get xidList():String
	 	{
	 		return _xidList;
	 	}
		/**  当前关卡解锁xid
		**/
		public function set xidList(value:String):void
		{
			if(initFlag){
				if(_xidList!=value){
					var old:String=_xidList;
					_xidList=value;
					onChangeAttr("xidList",_xidList,old);
				}
			}else{
				_xidList=value;
			}
		}
		/**  是否已经进化
		**/
		private var _upEnable:int;
		/**  是否已经进化
		**/
		public function get upEnable():int
	 	{
	 		return _upEnable;
	 	}
		/**  是否已经进化
		**/
		public function set upEnable(value:int):void
		{
			if(initFlag){
				if(_upEnable!=value){
					var old:int=_upEnable;
					_upEnable=value;
					onChangeAttr("upEnable",_upEnable,old);
				}
			}else{
				_upEnable=value;
			}
		}
		public static const Attributes:Array=["currentType","xidList","upEnable"];
	}
}