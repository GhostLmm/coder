package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class HeroVO extends BaseVo
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
	 		return _level;
	 	}

		**/

		{
			if(initFlag){
				if(_level!=value){
					var old:int=_level;
					_level=value;
					onChangeAttr("level",_level,old);
				}
			}else{
				_level=value;
			}
		}

		**/


		**/

	 	{
	 		return _exp;
	 	}

		**/

		{
			if(initFlag){
				if(_exp!=value){
					var old:int=_exp;
					_exp=value;
					onChangeAttr("exp",_exp,old);
				}
			}else{
				_exp=value;
			}
		}

		**/


		**/

	 	{
	 		return _wuqiId;
	 	}

		**/

		{
			if(initFlag){
				if(_wuqiId!=value){
					var old:int=_wuqiId;
					_wuqiId=value;
					onChangeAttr("wuqiId",_wuqiId,old);
				}
			}else{
				_wuqiId=value;
			}
		}

		**/


		**/

	 	{
	 		return _yishanId;
	 	}

		**/

		{
			if(initFlag){
				if(_yishanId!=value){
					var old:int=_yishanId;
					_yishanId=value;
					onChangeAttr("yishanId",_yishanId,old);
				}
			}else{
				_yishanId=value;
			}
		}

		**/


		**/

	 	{
	 		return _shoushiId;
	 	}

		**/

		{
			if(initFlag){
				if(_shoushiId!=value){
					var old:int=_shoushiId;
					_shoushiId=value;
					onChangeAttr("shoushiId",_shoushiId,old);
				}
			}else{
				_shoushiId=value;
			}
		}

		**/


		**/

	 	{
	 		return _herotype;
	 	}

		**/

		{
			if(initFlag){
				if(_herotype!=value){
					var old:int=_herotype;
					_herotype=value;
					onChangeAttr("herotype",_herotype,old);
				}
			}else{
				_herotype=value;
			}
		}

		**/


		**/

	 	{
	 		return _gunId;
	 	}

		**/

		{
			if(initFlag){
				if(_gunId!=value){
					var old:int=_gunId;
					_gunId=value;
					onChangeAttr("gunId",_gunId,old);
				}
			}else{
				_gunId=value;
			}
		}


}