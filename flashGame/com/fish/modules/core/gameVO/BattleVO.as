package com.fish.modules.core.gameVO
{

	/** 战斗数据
	**/
	public class BattleVO extends BaseVo
	{
		/**  攻击方用户id
		**/
		private var _gongjiUserid:int;
		/**  攻击方用户id
		**/
		public function get gongjiUserid():int
	 	{
	 		return _gongjiUserid;
	 	}
		/**  攻击方用户id
		**/
		public function set gongjiUserid(value:int):void
		{
			if(initFlag){
				if(_gongjiUserid!=value){
					var old:int=_gongjiUserid;
					_gongjiUserid=value;
					onChangeAttr("gongjiUserid",_gongjiUserid,old);
				}
			}else{
				_gongjiUserid=value;
			}
		}
		/**  防御方用户id
		**/
		private var _fangyuUserid:int;
		/**  防御方用户id
		**/
		public function get fangyuUserid():int
	 	{
	 		return _fangyuUserid;
	 	}
		/**  防御方用户id
		**/
		public function set fangyuUserid(value:int):void
		{
			if(initFlag){
				if(_fangyuUserid!=value){
					var old:int=_fangyuUserid;
					_fangyuUserid=value;
					onChangeAttr("fangyuUserid",_fangyuUserid,old);
				}
			}else{
				_fangyuUserid=value;
			}
		}
		/**  获胜方用户id
		**/
		private var _winUserid:int;
		/**  获胜方用户id
		**/
		public function get winUserid():int
	 	{
	 		return _winUserid;
	 	}
		/**  获胜方用户id
		**/
		public function set winUserid(value:int):void
		{
			if(initFlag){
				if(_winUserid!=value){
					var old:int=_winUserid;
					_winUserid=value;
					onChangeAttr("winUserid",_winUserid,old);
				}
			}else{
				_winUserid=value;
			}
		}
		public static const Attributes:Array=["gongjiUserid","fangyuUserid","winUserid"];
		public static const KeyAttr:String="1";
	}
}