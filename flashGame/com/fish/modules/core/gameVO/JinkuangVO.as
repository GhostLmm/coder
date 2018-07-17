package com.fish.modules.core.gameVO
{

	/** 金矿数据
	**/
	public class JinkuangVO extends BaseVo
	{
		/**  金矿操作cd
		**/
		private var _optLengqueTime:Number;
		/**  金矿操作cd
		**/
		public function get optLengqueTime():Number
	 	{
	 		return _optLengqueTime;
	 	}
		/**  金矿操作cd
		**/
		public function set optLengqueTime(value:Number):void
		{
			if(initFlag){
				if(_optLengqueTime!=value){
					var old:Number=_optLengqueTime;
					_optLengqueTime=value;
					onChangeAttr("optLengqueTime",_optLengqueTime,old);
				}
			}else{
				_optLengqueTime=value;
			}
		}
		/**  上次擂台排名
		**/
		private var _lastLeitaiRank:int;
		/**  上次擂台排名
		**/
		public function get lastLeitaiRank():int
	 	{
	 		return _lastLeitaiRank;
	 	}
		/**  上次擂台排名
		**/
		public function set lastLeitaiRank(value:int):void
		{
			if(initFlag){
				if(_lastLeitaiRank!=value){
					var old:int=_lastLeitaiRank;
					_lastLeitaiRank=value;
					onChangeAttr("lastLeitaiRank",_lastLeitaiRank,old);
				}
			}else{
				_lastLeitaiRank=value;
			}
		}
		public static const Attributes:Array=["optLengqueTime","lastLeitaiRank"];
	}
}