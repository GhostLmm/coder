package com.fish.modules.core.gameVO
{

	/** 魔女塔排行榜
	**/
	public class BanghuizhandetailVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _tid;
	 	}

		**/

		{
			if(initFlag){
				if(_tid!=value){
					var old:int=_tid;
					_tid=value;
					onChangeAttr("tid",_tid,old);
				}
			}else{
				_tid=value;
			}
		}

		**/


		**/

	 	{
	 		return _banghuiName;
	 	}

		**/

		{
			if(initFlag){
				if(_banghuiName!=value){
					var old:String=_banghuiName;
					_banghuiName=value;
					onChangeAttr("banghuiName",_banghuiName,old);
				}
			}else{
				_banghuiName=value;
			}
		}

		**/


		**/

	 	{
	 		return _order;
	 	}

		**/

		{
			if(initFlag){
				if(_order!=value){
					var old:int=_order;
					_order=value;
					onChangeAttr("order",_order,old);
				}
			}else{
				_order=value;
			}
		}

		**/


		**/

	 	{
	 		return _result;
	 	}

		**/

		{
			if(initFlag){
				if(_result!=value){
					var old:int=_result;
					_result=value;
					onChangeAttr("result",_result,old);
				}
			}else{
				_result=value;
			}
		}



}