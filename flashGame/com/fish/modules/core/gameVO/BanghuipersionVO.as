package com.fish.modules.core.gameVO
{

	/** 活动控制
	**/
	public class BanghuipersionVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _uid;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _userName;
	 	}

		**/

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
	 		return _leitaiRank;
	 	}

		**/

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
	 		return _totalGongxian;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _shengyuGongxian;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _zhiwei;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _banghuizhanFlag;
	 	}

		**/

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



}