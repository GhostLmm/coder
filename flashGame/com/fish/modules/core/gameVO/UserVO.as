package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class UserVO extends BaseVo
	{
		/**  等级
		**/
		private var _userLevel:int;
		/**  等级
		**/
		public function get userLevel():int
	 	{
	 		return _userLevel;
	 	}
		/**  等级
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
		/**  经验
		**/
		private var _userExp:int;
		/**  经验
		**/
		public function get userExp():int
	 	{
	 		return _userExp;
	 	}
		/**  经验
		**/
		public function set userExp(value:int):void
		{
			if(initFlag){
				if(_userExp!=value){
					var old:int=_userExp;
					_userExp=value;
					onChangeAttr("userExp",_userExp,old);
				}
			}else{
				_userExp=value;
			}
		}
		/**  铜币
		**/
		private var _userMoney:int;
		/**  铜币
		**/
		public function get userMoney():int
	 	{
	 		return _userMoney;
	 	}
		/**  铜币
		**/
		public function set userMoney(value:int):void
		{
			if(initFlag){
				if(_userMoney!=value){
					var old:int=_userMoney;
					_userMoney=value;
					onChangeAttr("userMoney",_userMoney,old);
				}
			}else{
				_userMoney=value;
			}
		}
		/**  元宝，带金钱
		**/
		private var _userCash:int;
		/**  元宝，带金钱
		**/
		public function get userCash():int
	 	{
	 		return _userCash;
	 	}
		/**  元宝，带金钱
		**/
		public function set userCash(value:int):void
		{
			if(initFlag){
				if(_userCash!=value){
					var old:int=_userCash;
					_userCash=value;
					onChangeAttr("userCash",_userCash,old);
				}
			}else{
				_userCash=value;
			}
		}
		/**  用户头像
		**/
		private var _userIcon:String;
		/**  用户头像
		**/
		public function get userIcon():String
	 	{
	 		return _userIcon;
	 	}
		/**  用户头像
		**/
		public function set userIcon(value:String):void
		{
			if(initFlag){
				if(_userIcon!=value){
					var old:String=_userIcon;
					_userIcon=value;
					onChangeAttr("userIcon",_userIcon,old);
				}
			}else{
				_userIcon=value;
			}
		}
		/**  当前挖矿关卡数
		**/
		private var _curGuanka:int;
		/**  当前挖矿关卡数
		**/
		public function get curGuanka():int
	 	{
	 		return _curGuanka;
	 	}
		/**  当前挖矿关卡数
		**/
		public function set curGuanka(value:int):void
		{
			if(initFlag){
				if(_curGuanka!=value){
					var old:int=_curGuanka;
					_curGuanka=value;
					onChangeAttr("curGuanka",_curGuanka,old);
				}
			}else{
				_curGuanka=value;
			}
		}
		/**  体力，用于战斗
		**/
		private var _currentTili:int;
		/**  体力，用于战斗
		**/
		public function get currentTili():int
	 	{
	 		return _currentTili;
	 	}
		/**  体力，用于战斗
		**/
		public function set currentTili(value:int):void
		{
			if(initFlag){
				if(_currentTili!=value){
					var old:int=_currentTili;
					_currentTili=value;
					onChangeAttr("currentTili",_currentTili,old);
				}
			}else{
				_currentTili=value;
			}
		}
		/**  体力刷新时间
		**/
		private var _tiliRefreshTime:Number;
		/**  体力刷新时间
		**/
		public function get tiliRefreshTime():Number
	 	{
	 		return _tiliRefreshTime;
	 	}
		/**  体力刷新时间
		**/
		public function set tiliRefreshTime(value:Number):void
		{
			if(initFlag){
				if(_tiliRefreshTime!=value){
					var old:Number=_tiliRefreshTime;
					_tiliRefreshTime=value;
					onChangeAttr("tiliRefreshTime",_tiliRefreshTime,old);
				}
			}else{
				_tiliRefreshTime=value;
			}
		}
		/**  体力上限
		**/
		private var _tiliLimit:int;
		/**  体力上限
		**/
		public function get tiliLimit():int
	 	{
	 		return _tiliLimit;
	 	}
		/**  体力上限
		**/
		public function set tiliLimit(value:int):void
		{
			if(initFlag){
				if(_tiliLimit!=value){
					var old:int=_tiliLimit;
					_tiliLimit=value;
					onChangeAttr("tiliLimit",_tiliLimit,old);
				}
			}else{
				_tiliLimit=value;
			}
		}
		/**  嗑药次数，吃多变脑残，限制嗑药
		**/
		private var _tiliBuyNum:int;
		/**  嗑药次数，吃多变脑残，限制嗑药
		**/
		public function get tiliBuyNum():int
	 	{
	 		return _tiliBuyNum;
	 	}
		/**  嗑药次数，吃多变脑残，限制嗑药
		**/
		public function set tiliBuyNum(value:int):void
		{
			if(initFlag){
				if(_tiliBuyNum!=value){
					var old:int=_tiliBuyNum;
					_tiliBuyNum=value;
					onChangeAttr("tiliBuyNum",_tiliBuyNum,old);
				}
			}else{
				_tiliBuyNum=value;
			}
		}
		/**  清除调整次数
		**/
		private var _clearTiaozhanCount:int;
		/**  清除调整次数
		**/
		public function get clearTiaozhanCount():int
	 	{
	 		return _clearTiaozhanCount;
	 	}
		/**  清除调整次数
		**/
		public function set clearTiaozhanCount(value:int):void
		{
			if(initFlag){
				if(_clearTiaozhanCount!=value){
					var old:int=_clearTiaozhanCount;
					_clearTiaozhanCount=value;
					onChangeAttr("clearTiaozhanCount",_clearTiaozhanCount,old);
				}
			}else{
				_clearTiaozhanCount=value;
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
		/**  vip经验
		**/
		private var _vipExp:int;
		/**  vip经验
		**/
		public function get vipExp():int
	 	{
	 		return _vipExp;
	 	}
		/**  vip经验
		**/
		public function set vipExp(value:int):void
		{
			if(initFlag){
				if(_vipExp!=value){
					var old:int=_vipExp;
					_vipExp=value;
					onChangeAttr("vipExp",_vipExp,old);
				}
			}else{
				_vipExp=value;
			}
		}
		/**  可以使用的包裹数量
		**/
		private var _couldUseBugnum:int;
		/**  可以使用的包裹数量
		**/
		public function get couldUseBugnum():int
	 	{
	 		return _couldUseBugnum;
	 	}
		/**  可以使用的包裹数量
		**/
		public function set couldUseBugnum(value:int):void
		{
			if(initFlag){
				if(_couldUseBugnum!=value){
					var old:int=_couldUseBugnum;
					_couldUseBugnum=value;
					onChangeAttr("couldUseBugnum",_couldUseBugnum,old);
				}
			}else{
				_couldUseBugnum=value;
			}
		}
		/**  用户熔炼值
		**/
		private var _userRonglian:int;
		/**  用户熔炼值
		**/
		public function get userRonglian():int
	 	{
	 		return _userRonglian;
	 	}
		/**  用户熔炼值
		**/
		public function set userRonglian(value:int):void
		{
			if(initFlag){
				if(_userRonglian!=value){
					var old:int=_userRonglian;
					_userRonglian=value;
					onChangeAttr("userRonglian",_userRonglian,old);
				}
			}else{
				_userRonglian=value;
			}
		}
		/**  星星获取的历史总值
		**/
		private var _userStarHistory:int;
		/**  星星获取的历史总值
		**/
		public function get userStarHistory():int
	 	{
	 		return _userStarHistory;
	 	}
		/**  星星获取的历史总值
		**/
		public function set userStarHistory(value:int):void
		{
			if(initFlag){
				if(_userStarHistory!=value){
					var old:int=_userStarHistory;
					_userStarHistory=value;
					onChangeAttr("userStarHistory",_userStarHistory,old);
				}
			}else{
				_userStarHistory=value;
			}
		}
		/**  星星当前剩余值
		**/
		private var _userStarCurrent:int;
		/**  星星当前剩余值
		**/
		public function get userStarCurrent():int
	 	{
	 		return _userStarCurrent;
	 	}
		/**  星星当前剩余值
		**/
		public function set userStarCurrent(value:int):void
		{
			if(initFlag){
				if(_userStarCurrent!=value){
					var old:int=_userStarCurrent;
					_userStarCurrent=value;
					onChangeAttr("userStarCurrent",_userStarCurrent,old);
				}
			}else{
				_userStarCurrent=value;
			}
		}
		/**  钱购买次数
		**/
		private var _moneyBuyNum:int;
		/**  钱购买次数
		**/
		public function get moneyBuyNum():int
	 	{
	 		return _moneyBuyNum;
	 	}
		/**  钱购买次数
		**/
		public function set moneyBuyNum(value:int):void
		{
			if(initFlag){
				if(_moneyBuyNum!=value){
					var old:int=_moneyBuyNum;
					_moneyBuyNum=value;
					onChangeAttr("moneyBuyNum",_moneyBuyNum,old);
				}
			}else{
				_moneyBuyNum=value;
			}
		}
		/**  新手引导
		**/
		private var _guideStep:int;
		/**  新手引导
		**/
		public function get guideStep():int
	 	{
	 		return _guideStep;
	 	}
		/**  新手引导
		**/
		public function set guideStep(value:int):void
		{
			if(initFlag){
				if(_guideStep!=value){
					var old:int=_guideStep;
					_guideStep=value;
					onChangeAttr("guideStep",_guideStep,old);
				}
			}else{
				_guideStep=value;
			}
		}
		/**  充值详情
		**/
		private var _chongzhiInfo:String;
		/**  充值详情
		**/
		public function get chongzhiInfo():String
	 	{
	 		return _chongzhiInfo;
	 	}
		/**  充值详情
		**/
		public function set chongzhiInfo(value:String):void
		{
			if(initFlag){
				if(_chongzhiInfo!=value){
					var old:String=_chongzhiInfo;
					_chongzhiInfo=value;
					onChangeAttr("chongzhiInfo",_chongzhiInfo,old);
				}
			}else{
				_chongzhiInfo=value;
			}
		}
		/**  用户荣誉
		**/
		private var _userRongyu:int;
		/**  用户荣誉
		**/
		public function get userRongyu():int
	 	{
	 		return _userRongyu;
	 	}
		/**  用户荣誉
		**/
		public function set userRongyu(value:int):void
		{
			if(initFlag){
				if(_userRongyu!=value){
					var old:int=_userRongyu;
					_userRongyu=value;
					onChangeAttr("userRongyu",_userRongyu,old);
				}
			}else{
				_userRongyu=value;
			}
		}
		/**  充值数量
		**/
		private var _payCount:int;
		/**  充值数量
		**/
		public function get payCount():int
	 	{
	 		return _payCount;
	 	}
		/**  充值数量
		**/
		public function set payCount(value:int):void
		{
			if(initFlag){
				if(_payCount!=value){
					var old:int=_payCount;
					_payCount=value;
					onChangeAttr("payCount",_payCount,old);
				}
			}else{
				_payCount=value;
			}
		}
		public static const Attributes:Array=["userLevel","userExp","userMoney","userCash","userIcon","curGuanka","currentTili","tiliRefreshTime","tiliLimit","tiliBuyNum","clearTiaozhanCount","vipLevel","vipExp","couldUseBugnum","userRonglian","userStarHistory","userStarCurrent","moneyBuyNum","guideStep","chongzhiInfo","userRongyu","payCount"];
	}
}