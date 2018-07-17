package com.fish.modules.core.gameVO
{

	/** 活动控制
	**/
	public class BanghuipersionVO extends BaseVo
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
		/**  个人总贡献
		**/
		private var _totalGongxian:int;
		/**  个人总贡献
		**/
		public function get totalGongxian():int
	 	{
	 		return _totalGongxian;
	 	}
		/**  个人总贡献
		**/
		public function set totalGongxian(value:int):void
		{
			if(initFlag){
				if(_totalGongxian!=value){
					var old:int=_totalGongxian;
					_totalGongxian=value;
					onChangeAttr("totalGongxian",_totalGongxian,old);
				}
			}else{
				_totalGongxian=value;
			}
		}
		/**  剩余贡献
		**/
		private var _shengyuGongxian:int;
		/**  剩余贡献
		**/
		public function get shengyuGongxian():int
	 	{
	 		return _shengyuGongxian;
	 	}
		/**  剩余贡献
		**/
		public function set shengyuGongxian(value:int):void
		{
			if(initFlag){
				if(_shengyuGongxian!=value){
					var old:int=_shengyuGongxian;
					_shengyuGongxian=value;
					onChangeAttr("shengyuGongxian",_shengyuGongxian,old);
				}
			}else{
				_shengyuGongxian=value;
			}
		}
		/**  帮会职位
		**/
		private var _zhiwei:int;
		/**  帮会职位
		**/
		public function get zhiwei():int
	 	{
	 		return _zhiwei;
	 	}
		/**  帮会职位
		**/
		public function set zhiwei(value:int):void
		{
			if(initFlag){
				if(_zhiwei!=value){
					var old:int=_zhiwei;
					_zhiwei=value;
					onChangeAttr("zhiwei",_zhiwei,old);
				}
			}else{
				_zhiwei=value;
			}
		}
		/**  是否报名帮会战
		**/
		private var _banghuizhanFlag:int;
		/**  是否报名帮会战
		**/
		public function get banghuizhanFlag():int
	 	{
	 		return _banghuizhanFlag;
	 	}
		/**  是否报名帮会战
		**/
		public function set banghuizhanFlag(value:int):void
		{
			if(initFlag){
				if(_banghuizhanFlag!=value){
					var old:int=_banghuizhanFlag;
					_banghuizhanFlag=value;
					onChangeAttr("banghuizhanFlag",_banghuizhanFlag,old);
				}
			}else{
				_banghuizhanFlag=value;
			}
		}
		public static const Attributes:Array=["uid","userName","vipLevel","leitaiRank","userLevel","totalGongxian","shengyuGongxian","zhiwei","banghuizhanFlag"];
		public static const KeyAttr:String="uid";
	}
}