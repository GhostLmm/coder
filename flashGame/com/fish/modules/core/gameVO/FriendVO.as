package com.fish.modules.core.gameVO
{

	/** 好友成员数据
	**/
	public class FriendVO extends BaseVo
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
	 		return _modifyType;
	 	}

		**/

		{
			if(initFlag){
				if(_modifyType!=value){
					var old:int=_modifyType;
					_modifyType=value;
					onChangeAttr("modifyType",_modifyType,old);
				}
			}else{
				_modifyType=value;
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



}