package com.fish.modules.core.gameVO
{

	/** 活动控制
	**/
	public class HuodongswitchVO extends BaseVo
	{
		/**  活动开始时间
		**/
		private var _startTime:Number;
		/**  活动开始时间
		**/
		public function get startTime():Number
	 	{
	 		return _startTime;
	 	}
		/**  活动开始时间
		**/
		public function set startTime(value:Number):void
		{
			if(initFlag){
				if(_startTime!=value){
					var old:Number=_startTime;
					_startTime=value;
					onChangeAttr("startTime",_startTime,old);
				}
			}else{
				_startTime=value;
			}
		}
		/**  活动结束时间
		**/
		private var _endTime:Number;
		/**  活动结束时间
		**/
		public function get endTime():Number
	 	{
	 		return _endTime;
	 	}
		/**  活动结束时间
		**/
		public function set endTime(value:Number):void
		{
			if(initFlag){
				if(_endTime!=value){
					var old:Number=_endTime;
					_endTime=value;
					onChangeAttr("endTime",_endTime,old);
				}
			}else{
				_endTime=value;
			}
		}
		/**  1:活动开启
		**/
		private var _huodongFlag:int;
		/**  1:活动开启
		**/
		public function get huodongFlag():int
	 	{
	 		return _huodongFlag;
	 	}
		/**  1:活动开启
		**/
		public function set huodongFlag(value:int):void
		{
			if(initFlag){
				if(_huodongFlag!=value){
					var old:int=_huodongFlag;
					_huodongFlag=value;
					onChangeAttr("huodongFlag",_huodongFlag,old);
				}
			}else{
				_huodongFlag=value;
			}
		}
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
		public static const Attributes:Array=["startTime","endTime","huodongFlag","id"];
		public static const KeyAttr:String="id";
	}
}