package com.fish.modules.core.gameVO
{

	/** 活动数据
	**/
	public class HuodongVO extends BaseVo
	{
		/**  上午领取次数
		**/
		private var _linquNoonCount:int;
		/**  上午领取次数
		**/
		public function get linquNoonCount():int
	 	{
	 		return _linquNoonCount;
	 	}
		/**  上午领取次数
		**/
		public function set linquNoonCount(value:int):void
		{
			if(initFlag){
				if(_linquNoonCount!=value){
					var old:int=_linquNoonCount;
					_linquNoonCount=value;
					onChangeAttr("linquNoonCount",_linquNoonCount,old);
				}
			}else{
				_linquNoonCount=value;
			}
		}
		/**  下午领取次数
		**/
		private var _linquAfternoonCount:int;
		/**  下午领取次数
		**/
		public function get linquAfternoonCount():int
	 	{
	 		return _linquAfternoonCount;
	 	}
		/**  下午领取次数
		**/
		public function set linquAfternoonCount(value:int):void
		{
			if(initFlag){
				if(_linquAfternoonCount!=value){
					var old:int=_linquAfternoonCount;
					_linquAfternoonCount=value;
					onChangeAttr("linquAfternoonCount",_linquAfternoonCount,old);
				}
			}else{
				_linquAfternoonCount=value;
			}
		}
		/**  参拜活动的xmlid
		**/
		private var _canbaiXid:int;
		/**  参拜活动的xmlid
		**/
		public function get canbaiXid():int
	 	{
	 		return _canbaiXid;
	 	}
		/**  参拜活动的xmlid
		**/
		public function set canbaiXid(value:int):void
		{
			if(initFlag){
				if(_canbaiXid!=value){
					var old:int=_canbaiXid;
					_canbaiXid=value;
					onChangeAttr("canbaiXid",_canbaiXid,old);
				}
			}else{
				_canbaiXid=value;
			}
		}
		/**  当前参拜的天数
		**/
		private var _canbaiDay:int;
		/**  当前参拜的天数
		**/
		public function get canbaiDay():int
	 	{
	 		return _canbaiDay;
	 	}
		/**  当前参拜的天数
		**/
		public function set canbaiDay(value:int):void
		{
			if(initFlag){
				if(_canbaiDay!=value){
					var old:int=_canbaiDay;
					_canbaiDay=value;
					onChangeAttr("canbaiDay",_canbaiDay,old);
				}
			}else{
				_canbaiDay=value;
			}
		}
		/**  参拜时间
		**/
		private var _canbaiTime:Number;
		/**  参拜时间
		**/
		public function get canbaiTime():Number
	 	{
	 		return _canbaiTime;
	 	}
		/**  参拜时间
		**/
		public function set canbaiTime(value:Number):void
		{
			if(initFlag){
				if(_canbaiTime!=value){
					var old:Number=_canbaiTime;
					_canbaiTime=value;
					onChangeAttr("canbaiTime",_canbaiTime,old);
				}
			}else{
				_canbaiTime=value;
			}
		}
		public static const Attributes:Array=["linquNoonCount","linquAfternoonCount","canbaiXid","canbaiDay","canbaiTime"];
	}
}