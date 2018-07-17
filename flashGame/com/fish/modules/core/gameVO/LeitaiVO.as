package com.fish.modules.core.gameVO
{

	/** 擂台主体数据
	**/
	public class LeitaiVO extends BaseVo
	{
		/**  挑战冷却时间
		**/
		private var _lenqueTime:Number;
		/**  挑战冷却时间
		**/
		public function get lenqueTime():Number
	 	{
	 		return _lenqueTime;
	 	}
		/**  挑战冷却时间
		**/
		public function set lenqueTime(value:Number):void
		{
			if(initFlag){
				if(_lenqueTime!=value){
					var old:Number=_lenqueTime;
					_lenqueTime=value;
					onChangeAttr("lenqueTime",_lenqueTime,old);
				}
			}else{
				_lenqueTime=value;
			}
		}
		/**  宝箱下次发放时间
		**/
		private var _fafangTime:Number;
		/**  宝箱下次发放时间
		**/
		public function get fafangTime():Number
	 	{
	 		return _fafangTime;
	 	}
		/**  宝箱下次发放时间
		**/
		public function set fafangTime(value:Number):void
		{
			if(initFlag){
				if(_fafangTime!=value){
					var old:Number=_fafangTime;
					_fafangTime=value;
					onChangeAttr("fafangTime",_fafangTime,old);
				}
			}else{
				_fafangTime=value;
			}
		}
		/**  自己排名
		**/
		private var _myRank:int;
		/**  自己排名
		**/
		public function get myRank():int
	 	{
	 		return _myRank;
	 	}
		/**  自己排名
		**/
		public function set myRank(value:int):void
		{
			if(initFlag){
				if(_myRank!=value){
					var old:int=_myRank;
					_myRank=value;
					onChangeAttr("myRank",_myRank,old);
				}
			}else{
				_myRank=value;
			}
		}
		/**  挑战次数
		**/
		private var _tiaozhanCount:int;
		/**  挑战次数
		**/
		public function get tiaozhanCount():int
	 	{
	 		return _tiaozhanCount;
	 	}
		/**  挑战次数
		**/
		public function set tiaozhanCount(value:int):void
		{
			if(initFlag){
				if(_tiaozhanCount!=value){
					var old:int=_tiaozhanCount;
					_tiaozhanCount=value;
					onChangeAttr("tiaozhanCount",_tiaozhanCount,old);
				}
			}else{
				_tiaozhanCount=value;
			}
		}
		/**  上一次排名
		**/
		private var _lastRank:int;
		/**  上一次排名
		**/
		public function get lastRank():int
	 	{
	 		return _lastRank;
	 	}
		/**  上一次排名
		**/
		public function set lastRank(value:int):void
		{
			if(initFlag){
				if(_lastRank!=value){
					var old:int=_lastRank;
					_lastRank=value;
					onChangeAttr("lastRank",_lastRank,old);
				}
			}else{
				_lastRank=value;
			}
		}
		/**  宝箱领取状态
		**/
		private var _baoxiangStatus:int;
		/**  宝箱领取状态
		**/
		public function get baoxiangStatus():int
	 	{
	 		return _baoxiangStatus;
	 	}
		/**  宝箱领取状态
		**/
		public function set baoxiangStatus(value:int):void
		{
			if(initFlag){
				if(_baoxiangStatus!=value){
					var old:int=_baoxiangStatus;
					_baoxiangStatus=value;
					onChangeAttr("baoxiangStatus",_baoxiangStatus,old);
				}
			}else{
				_baoxiangStatus=value;
			}
		}
		public static const Attributes:Array=["lenqueTime","fafangTime","myRank","tiaozhanCount","lastRank","baoxiangStatus"];
	}
}