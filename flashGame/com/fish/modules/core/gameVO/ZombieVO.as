package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class ZombieVO extends BaseVo
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
	 		return _lv;
	 	}

		**/

		{
			if(initFlag){
				if(_lv!=value){
					var old:int=_lv;
					_lv=value;
					onChangeAttr("lv",_lv,old);
				}
			}else{
				_lv=value;
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
	 		return _heapid;
	 	}

		**/

		{
			if(initFlag){
				if(_heapid!=value){
					var old:int=_heapid;
					_heapid=value;
					onChangeAttr("heapid",_heapid,old);
				}
			}else{
				_heapid=value;
			}
		}



}