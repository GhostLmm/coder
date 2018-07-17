package com.fish.modules.core.gameVO
{

	/** 故事数据
	**/
	public class BattleresultVO extends BaseVo
	{
		/**  0是失败，1是胜利
		**/
		private var _result:int;
		/**  0是失败，1是胜利
		**/
		public function get result():int
	 	{
	 		return _result;
	 	}
		/**  0是失败，1是胜利
		**/
		public function set result(value:int):void
		{
			if(initFlag){
				if(_result!=value){
					var old:int=_result;
					_result=value;
					onChangeAttr("result",_result,old);
				}
			}else{
				_result=value;
			}
		}
		/**  战斗消耗的时间
		**/
		private var _time:int;
		/**  战斗消耗的时间
		**/
		public function get time():int
	 	{
	 		return _time;
	 	}
		/**  战斗消耗的时间
		**/
		public function set time(value:int):void
		{
			if(initFlag){
				if(_time!=value){
					var old:int=_time;
					_time=value;
					onChangeAttr("time",_time,old);
				}
			}else{
				_time=value;
			}
		}
		/**  剩余血量
		**/
		private var _life:int;
		/**  剩余血量
		**/
		public function get life():int
	 	{
	 		return _life;
	 	}
		/**  剩余血量
		**/
		public function set life(value:int):void
		{
			if(initFlag){
				if(_life!=value){
					var old:int=_life;
					_life=value;
					onChangeAttr("life",_life,old);
				}
			}else{
				_life=value;
			}
		}
		public static const Attributes:Array=["result","time","life"];
	}
}