package com.fish.modules.core.gameVO
{

	/** 魔女塔排行榜
	**/
	public class GerenzhanjiVO extends BaseVo
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
	 		return _uname;
	 	}

		**/

		{
			if(initFlag){
				if(_uname!=value){
					var old:String=_uname;
					_uname=value;
					onChangeAttr("uname",_uname,old);
				}
			}else{
				_uname=value;
			}
		}

		**/


		**/

	 	{
	 		return _killNum;
	 	}

		**/

		{
			if(initFlag){
				if(_killNum!=value){
					var old:int=_killNum;
					_killNum=value;
					onChangeAttr("killNum",_killNum,old);
				}
			}else{
				_killNum=value;
			}
		}

		**/


		**/

	 	{
	 		return _totalDemage;
	 	}

		**/

		{
			if(initFlag){
				if(_totalDemage!=value){
					var old:int=_totalDemage;
					_totalDemage=value;
					onChangeAttr("totalDemage",_totalDemage,old);
				}
			}else{
				_totalDemage=value;
			}
		}

		**/


		**/

	 	{
	 		return _lingjiangStatus;
	 	}

		**/

		{
			if(initFlag){
				if(_lingjiangStatus!=value){
					var old:int=_lingjiangStatus;
					_lingjiangStatus=value;
					onChangeAttr("lingjiangStatus",_lingjiangStatus,old);
				}
			}else{
				_lingjiangStatus=value;
			}
		}



}