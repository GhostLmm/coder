package com.fish.modules.core.gameVO
{

	/** 神秘商店
	**/
	public class ShenmishangdianVO extends BaseVo
	{

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

		**/


		**/

	 	{
	 		return _goumaiItems;
	 	}

		**/

		{
			if(initFlag){
				if(_goumaiItems!=value){
					var old:String=_goumaiItems;
					_goumaiItems=value;
					onChangeAttr("goumaiItems",_goumaiItems,old);
				}
			}else{
				_goumaiItems=value;
			}
		}

		**/


		**/

	 	{
	 		return _buyItems;
	 	}

		**/

		{
			if(initFlag){
				if(_buyItems!=value){
					var old:String=_buyItems;
					_buyItems=value;
					onChangeAttr("buyItems",_buyItems,old);
				}
			}else{
				_buyItems=value;
			}
		}

		**/


		**/

	 	{
	 		return _shuaxinCount;
	 	}

		**/

		{
			if(initFlag){
				if(_shuaxinCount!=value){
					var old:int=_shuaxinCount;
					_shuaxinCount=value;
					onChangeAttr("shuaxinCount",_shuaxinCount,old);
				}
			}else{
				_shuaxinCount=value;
			}
		}


}