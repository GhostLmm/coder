package com.fish.modules.core.gameVO
{

	/** 故事数据
	**/
	public class BattlebaseVO extends BaseVo
	{
		/**  战斗最晚结束时间
		**/
		private var _battleMustEndTime:Number;
		/**  战斗最晚结束时间
		**/
		public function get battleMustEndTime():Number
	 	{
	 		return _battleMustEndTime;
	 	}
		/**  战斗最晚结束时间
		**/
		public function set battleMustEndTime(value:Number):void
		{
			if(initFlag){
				if(_battleMustEndTime!=value){
					var old:Number=_battleMustEndTime;
					_battleMustEndTime=value;
					onChangeAttr("battleMustEndTime",_battleMustEndTime,old);
				}
			}else{
				_battleMustEndTime=value;
			}
		}
		/**  战斗开始时间
		**/
		private var _battleBeginTime:Number;
		/**  战斗开始时间
		**/
		public function get battleBeginTime():Number
	 	{
	 		return _battleBeginTime;
	 	}
		/**  战斗开始时间
		**/
		public function set battleBeginTime(value:Number):void
		{
			if(initFlag){
				if(_battleBeginTime!=value){
					var old:Number=_battleBeginTime;
					_battleBeginTime=value;
					onChangeAttr("battleBeginTime",_battleBeginTime,old);
				}
			}else{
				_battleBeginTime=value;
			}
		}
		public static const Attributes:Array=["battleMustEndTime","battleBeginTime"];
	}
}