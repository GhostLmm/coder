package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class SaodangresultVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _dropItems;
	 	}

		**/

		{
			if(initFlag){
				if(_dropItems!=value){
					var old:String=_dropItems;
					_dropItems=value;
					onChangeAttr("dropItems",_dropItems,old);
				}
			}else{
				_dropItems=value;
			}
		}

		**/


		**/

	 	{
	 		return _dropCollects;
	 	}

		**/

		{
			if(initFlag){
				if(_dropCollects!=value){
					var old:String=_dropCollects;
					_dropCollects=value;
					onChangeAttr("dropCollects",_dropCollects,old);
				}
			}else{
				_dropCollects=value;
			}
		}

		**/


		**/

	 	{
	 		return _refreshTime;
	 	}

		**/

		{
			if(initFlag){
				if(_refreshTime!=value){
					var old:Number=_refreshTime;
					_refreshTime=value;
					onChangeAttr("refreshTime",_refreshTime,old);
				}
			}else{
				_refreshTime=value;
			}
		}


}