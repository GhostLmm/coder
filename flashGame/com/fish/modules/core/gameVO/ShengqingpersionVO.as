package com.fish.modules.core.gameVO
{

	/** 活动控制
	**/
	public class ShengqingpersionVO extends BaseVo
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



}