package com.fish.modules.core.gameVO
{

	/** 宝石
	**/
	public class BaoshiVO extends BaseVo
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
	 		return _num;
	 	}

		**/

		{
			if(initFlag){
				if(_num!=value){
					var old:int=_num;
					_num=value;
					onChangeAttr("num",_num,old);
				}
			}else{
				_num=value;
			}
		}



}