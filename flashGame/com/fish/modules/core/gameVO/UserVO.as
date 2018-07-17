package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class UserVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _userLevel;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _userExp;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _userMoney;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _userCash;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _userIcon;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _curGuanka;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _currentTili;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _tiliRefreshTime;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _tiliLimit;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _tiliBuyNum;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _clearTiaozhanCount;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _vipLevel;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _vipExp;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _couldUseBugnum;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _userRonglian;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _userStarHistory;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _userStarCurrent;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _moneyBuyNum;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _guideStep;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _chongzhiInfo;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _userRongyu;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _payCount;
	 	}

		**/

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


}