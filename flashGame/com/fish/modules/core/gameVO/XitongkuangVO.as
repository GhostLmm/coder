package com.fish.modules.core.gameVO
{

	/** 抢矿
	**/
	public class XitongkuangVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _xid;
	 	}

		**/

		{
			if(initFlag){
				if(_xid!=value){
					var old:int=_xid;
					_xid=value;
					onChangeAttr("xid",_xid,old);
				}
			}else{
				_xid=value;
			}
		}

		**/


		**/

	 	{
	 		return _name;
	 	}

		**/

		{
			if(initFlag){
				if(_name!=value){
					var old:String=_name;
					_name=value;
					onChangeAttr("name",_name,old);
				}
			}else{
				_name=value;
			}
		}

		**/


		**/

	 	{
	 		return _userId;
	 	}

		**/

		{
			if(initFlag){
				if(_userId!=value){
					var old:int=_userId;
					_userId=value;
					onChangeAttr("userId",_userId,old);
				}
			}else{
				_userId=value;
			}
		}



}