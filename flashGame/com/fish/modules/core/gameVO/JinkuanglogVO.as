package com.fish.modules.core.gameVO
{

	/** 金矿记录
	**/
	public class JinkuanglogVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _id;
	 	}

		**/

		{
			if(initFlag){
				if(_id!=value){
					var old:int=_id;
					_id=value;
					onChangeAttr("id",_id,old);
				}
			}else{
				_id=value;
			}
		}

		**/


		**/

	 	{
	 		return _time;
	 	}

		**/

		{
			if(initFlag){
				if(_time!=value){
					var old:Number=_time;
					_time=value;
					onChangeAttr("time",_time,old);
				}
			}else{
				_time=value;
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
	 		return _type;
	 	}

		**/

		{
			if(initFlag){
				if(_type!=value){
					var old:int=_type;
					_type=value;
					onChangeAttr("type",_type,old);
				}
			}else{
				_type=value;
			}
		}

		**/


		**/

	 	{
	 		return _money;
	 	}

		**/

		{
			if(initFlag){
				if(_money!=value){
					var old:int=_money;
					_money=value;
					onChangeAttr("money",_money,old);
				}
			}else{
				_money=value;
			}
		}

		**/


		**/

	 	{
	 		return _lostMoney;
	 	}

		**/

		{
			if(initFlag){
				if(_lostMoney!=value){
					var old:int=_lostMoney;
					_lostMoney=value;
					onChangeAttr("lostMoney",_lostMoney,old);
				}
			}else{
				_lostMoney=value;
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



}