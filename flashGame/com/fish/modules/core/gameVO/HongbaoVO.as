package com.fish.modules.core.gameVO
{

	/** 魔女塔排行榜
	**/
	public class HongbaoVO extends BaseVo
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
	 		return _userName;
	 	}

		**/

		{
			if(initFlag){
				if(_userName!=value){
					var old:String=_userName;
					_userName=value;
					onChangeAttr("userName",_userName,old);
				}
			}else{
				_userName=value;
			}
		}

		**/


		**/

	 	{
	 		return _leftCount;
	 	}

		**/

		{
			if(initFlag){
				if(_leftCount!=value){
					var old:int=_leftCount;
					_leftCount=value;
					onChangeAttr("leftCount",_leftCount,old);
				}
			}else{
				_leftCount=value;
			}
		}

		**/


		**/

	 	{
	 		return _chongzhiCash;
	 	}

		**/

		{
			if(initFlag){
				if(_chongzhiCash!=value){
					var old:int=_chongzhiCash;
					_chongzhiCash=value;
					onChangeAttr("chongzhiCash",_chongzhiCash,old);
				}
			}else{
				_chongzhiCash=value;
			}
		}



}