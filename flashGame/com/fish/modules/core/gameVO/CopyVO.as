package com.fish.modules.core.gameVO
{

	/** 战斗数据
	**/
	public class CopyVO extends BaseVo
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
	 		return _count;
	 	}

		**/

		{
			if(initFlag){
				if(_count!=value){
					var old:int=_count;
					_count=value;
					onChangeAttr("count",_count,old);
				}
			}else{
				_count=value;
			}
		}

		**/


		**/

	 	{
	 		return _status;
	 	}

		**/

		{
			if(initFlag){
				if(_status!=value){
					var old:int=_status;
					_status=value;
					onChangeAttr("status",_status,old);
				}
			}else{
				_status=value;
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
	 		return _dropItem;
	 	}

		**/

		{
			if(initFlag){
				if(_dropItem!=value){
					var old:String=_dropItem;
					_dropItem=value;
					onChangeAttr("dropItem",_dropItem,old);
				}
			}else{
				_dropItem=value;
			}
		}

		**/


		**/

	 	{
	 		return _dropCollectItems;
	 	}

		**/

		{
			if(initFlag){
				if(_dropCollectItems!=value){
					var old:String=_dropCollectItems;
					_dropCollectItems=value;
					onChangeAttr("dropCollectItems",_dropCollectItems,old);
				}
			}else{
				_dropCollectItems=value;
			}
		}

		**/


		**/

	 	{
	 		return _stars;
	 	}

		**/

		{
			if(initFlag){
				if(_stars!=value){
					var old:String=_stars;
					_stars=value;
					onChangeAttr("stars",_stars,old);
				}
			}else{
				_stars=value;
			}
		}



}