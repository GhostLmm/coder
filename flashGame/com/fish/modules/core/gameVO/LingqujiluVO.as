package com.fish.modules.core.gameVO
{

	/** 魔女塔排行榜
	**/
	public class LingqujiluVO extends BaseVo
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
	 		return _lingquName;
	 	}

		**/

		{
			if(initFlag){
				if(_lingquName!=value){
					var old:String=_lingquName;
					_lingquName=value;
					onChangeAttr("lingquName",_lingquName,old);
				}
			}else{
				_lingquName=value;
			}
		}

		**/


		**/

	 	{
	 		return _lingquCount;
	 	}

		**/

		{
			if(initFlag){
				if(_lingquCount!=value){
					var old:int=_lingquCount;
					_lingquCount=value;
					onChangeAttr("lingquCount",_lingquCount,old);
				}
			}else{
				_lingquCount=value;
			}
		}

		**/


		**/

	 	{
	 		return _chongzhiName;
	 	}

		**/

		{
			if(initFlag){
				if(_chongzhiName!=value){
					var old:String=_chongzhiName;
					_chongzhiName=value;
					onChangeAttr("chongzhiName",_chongzhiName,old);
				}
			}else{
				_chongzhiName=value;
			}
		}



}