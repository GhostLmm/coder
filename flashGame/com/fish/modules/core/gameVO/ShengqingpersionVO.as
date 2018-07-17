package com.fish.modules.core.gameVO
{

	/** 活动控制
	**/
	public class ShengqingpersionVO extends BaseVo
	{
		/**  申请人uid
		**/
		private var _uid:int;
		/**  申请人uid
		**/
		public function get uid():int
	 	{
	 		return _uid;
	 	}
		/**  申请人uid
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
		/**  用户名字
		**/
		private var _userName:String;
		/**  用户名字
		**/
		public function get userName():String
	 	{
	 		return _userName;
	 	}
		/**  用户名字
		**/
		public function set userName(value:String):void
		{
			if(initFlag){
				if(_userName!=value){
					var old:String=_userName;
					_userName=value;
					onChangeAttr("userName",_userName,old);
				}
			}else{
				_userName=value;
			}
		}
		/**  vip等级
		**/
		private var _vipLevel:int;
		/**  vip等级
		**/
		public function get vipLevel():int
	 	{
	 		return _vipLevel;
	 	}
		/**  vip等级
		**/
		public function set vipLevel(value:int):void
		{
			if(initFlag){
				if(_vipLevel!=value){
					var old:int=_vipLevel;
					_vipLevel=value;
					onChangeAttr("vipLevel",_vipLevel,old);
				}
			}else{
				_vipLevel=value;
			}
		}
		/**  擂台排名
		**/
		private var _leitaiRank:int;
		/**  擂台排名
		**/
		public function get leitaiRank():int
	 	{
	 		return _leitaiRank;
	 	}
		/**  擂台排名
		**/
		public function set leitaiRank(value:int):void
		{
			if(initFlag){
				if(_leitaiRank!=value){
					var old:int=_leitaiRank;
					_leitaiRank=value;
					onChangeAttr("leitaiRank",_leitaiRank,old);
				}
			}else{
				_leitaiRank=value;
			}
		}
		/**  用户等级
		**/
		private var _userLevel:int;
		/**  用户等级
		**/
		public function get userLevel():int
	 	{
	 		return _userLevel;
	 	}
		/**  用户等级
		**/
		public function set userLevel(value:int):void
		{
			if(initFlag){
				if(_userLevel!=value){
					var old:int=_userLevel;
					_userLevel=value;
					onChangeAttr("userLevel",_userLevel,old);
				}
			}else{
				_userLevel=value;
			}
		}
		public static const Attributes:Array=["uid","userName","vipLevel","leitaiRank","userLevel"];
		public static const KeyAttr:String="uid";
	}
}