package com.fish.modules.core.gameVO
{

	/** 人物详情数据
	**/
	public class PersondetailVO extends BaseVo
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
	 		return _userRank;
	 	}

		**/

		{
			if(initFlag){
				if(_userRank!=value){
					var old:int=_userRank;
					_userRank=value;
					onChangeAttr("userRank",_userRank,old);
				}
			}else{
				_userRank=value;
			}
		}

		**/


		**/

	 	{
	 		return _userGunId;
	 	}

		**/

		{
			if(initFlag){
				if(_userGunId!=value){
					var old:int=_userGunId;
					_userGunId=value;
					onChangeAttr("userGunId",_userGunId,old);
				}
			}else{
				_userGunId=value;
			}
		}

		**/


		**/

	 	{
	 		return _userImage;
	 	}

		**/

		{
			if(initFlag){
				if(_userImage!=value){
					var old:int=_userImage;
					_userImage=value;
					onChangeAttr("userImage",_userImage,old);
				}
			}else{
				_userImage=value;
			}
		}

		**/


		**/

	 	{
	 		return _userMovieFrame;
	 	}

		**/

		{
			if(initFlag){
				if(_userMovieFrame!=value){
					var old:String=_userMovieFrame;
					_userMovieFrame=value;
					onChangeAttr("userMovieFrame",_userMovieFrame,old);
				}
			}else{
				_userMovieFrame=value;
			}
		}

		**/


		**/

	 	{
	 		return _userColors;
	 	}

		**/

		{
			if(initFlag){
				if(_userColors!=value){
					var old:String=_userColors;
					_userColors=value;
					onChangeAttr("userColors",_userColors,old);
				}
			}else{
				_userColors=value;
			}
		}

		**/


		**/

	 	{
	 		return _fightPoint;
	 	}

		**/

		{
			if(initFlag){
				if(_fightPoint!=value){
					var old:int=_fightPoint;
					_fightPoint=value;
					onChangeAttr("fightPoint",_fightPoint,old);
				}
			}else{
				_fightPoint=value;
			}
		}

		**/


		**/

	 	{
	 		return _xidStr;
	 	}

		**/

		{
			if(initFlag){
				if(_xidStr!=value){
					var old:String=_xidStr;
					_xidStr=value;
					onChangeAttr("xidStr",_xidStr,old);
				}
			}else{
				_xidStr=value;
			}
		}

		**/


		**/

	 	{
	 		return _qianghuaStr;
	 	}

		**/

		{
			if(initFlag){
				if(_qianghuaStr!=value){
					var old:String=_qianghuaStr;
					_qianghuaStr=value;
					onChangeAttr("qianghuaStr",_qianghuaStr,old);
				}
			}else{
				_qianghuaStr=value;
			}
		}

		**/


		**/

	 	{
	 		return _starStr;
	 	}

		**/

		{
			if(initFlag){
				if(_starStr!=value){
					var old:String=_starStr;
					_starStr=value;
					onChangeAttr("starStr",_starStr,old);
				}
			}else{
				_starStr=value;
			}
		}



}