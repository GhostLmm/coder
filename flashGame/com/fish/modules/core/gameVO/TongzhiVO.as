package com.fish.modules.core.gameVO
{

	/** 通知数据
	**/
	public class TongzhiVO extends BaseVo
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
	 		return _args;
	 	}

		**/

		{
			if(initFlag){
				if(_args!=value){
					var old:String=_args;
					_args=value;
					onChangeAttr("args",_args,old);
				}
			}else{
				_args=value;
			}
		}

		**/


		**/

	 	{
	 		return _specialDesc;
	 	}

		**/

		{
			if(initFlag){
				if(_specialDesc!=value){
					var old:String=_specialDesc;
					_specialDesc=value;
					onChangeAttr("specialDesc",_specialDesc,old);
				}
			}else{
				_specialDesc=value;
			}
		}



}