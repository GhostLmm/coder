package com.fish.modules.core.gameVO
{

	/** 雄霸排行榜数据
	**/
	public class XiongbarankVO extends BaseVo
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
	 		return _rank;
	 	}

		**/

		{
			if(initFlag){
				if(_rank!=value){
					var old:int=_rank;
					_rank=value;
					onChangeAttr("rank",_rank,old);
				}
			}else{
				_rank=value;
			}
		}

		**/


		**/

	 	{
	 		return _chongbaiCount;
	 	}

		**/

		{
			if(initFlag){
				if(_chongbaiCount!=value){
					var old:int=_chongbaiCount;
					_chongbaiCount=value;
					onChangeAttr("chongbaiCount",_chongbaiCount,old);
				}
			}else{
				_chongbaiCount=value;
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