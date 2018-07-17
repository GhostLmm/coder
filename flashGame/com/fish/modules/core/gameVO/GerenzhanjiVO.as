package com.fish.modules.core.gameVO
{

	/** 魔女塔排行榜
	**/
	public class GerenzhanjiVO extends BaseVo
	{
		/**  用户id
		**/
		private var _uid:int;
		/**  用户id
		**/
		public function get uid():int
	 	{
	 		return _uid;
	 	}
		/**  用户id
		**/
		public function set uid(value:int):void
		{
			if(initFlag){
				if(_uid!=value){
					var old:int=_uid;
					_uid=value;
					onChangeAttr("uid",_uid,old);
				}
			}else{
				_uid=value;
			}
		}
		/**  用户名称
		**/
		private var _uname:String;
		/**  用户名称
		**/
		public function get uname():String
	 	{
	 		return _uname;
	 	}
		/**  用户名称
		**/
		public function set uname(value:String):void
		{
			if(initFlag){
				if(_uname!=value){
					var old:String=_uname;
					_uname=value;
					onChangeAttr("uname",_uname,old);
				}
			}else{
				_uname=value;
			}
		}
		/**  击杀人数
		**/
		private var _killNum:int;
		/**  击杀人数
		**/
		public function get killNum():int
	 	{
	 		return _killNum;
	 	}
		/**  击杀人数
		**/
		public function set killNum(value:int):void
		{
			if(initFlag){
				if(_killNum!=value){
					var old:int=_killNum;
					_killNum=value;
					onChangeAttr("killNum",_killNum,old);
				}
			}else{
				_killNum=value;
			}
		}
		/**  总伤害
		**/
		private var _totalDemage:int;
		/**  总伤害
		**/
		public function get totalDemage():int
	 	{
	 		return _totalDemage;
	 	}
		/**  总伤害
		**/
		public function set totalDemage(value:int):void
		{
			if(initFlag){
				if(_totalDemage!=value){
					var old:int=_totalDemage;
					_totalDemage=value;
					onChangeAttr("totalDemage",_totalDemage,old);
				}
			}else{
				_totalDemage=value;
			}
		}
		/**  领奖状态
		**/
		private var _lingjiangStatus:int;
		/**  领奖状态
		**/
		public function get lingjiangStatus():int
	 	{
	 		return _lingjiangStatus;
	 	}
		/**  领奖状态
		**/
		public function set lingjiangStatus(value:int):void
		{
			if(initFlag){
				if(_lingjiangStatus!=value){
					var old:int=_lingjiangStatus;
					_lingjiangStatus=value;
					onChangeAttr("lingjiangStatus",_lingjiangStatus,old);
				}
			}else{
				_lingjiangStatus=value;
			}
		}
		public static const Attributes:Array=["uid","uname","killNum","totalDemage","lingjiangStatus"];
		public static const KeyAttr:String="uid";
	}
}