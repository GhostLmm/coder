package com.fish.modules.core.gameVO
{

	/** 限制购买数据
	**/
	public class LimitbuyVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _shengwangBuyItems;
	 	}

		**/

		{
			if(initFlag){
				if(_shengwangBuyItems!=value){
					var old:String=_shengwangBuyItems;
					_shengwangBuyItems=value;
					onChangeAttr("shengwangBuyItems",_shengwangBuyItems,old);
				}
			}else{
				_shengwangBuyItems=value;
			}
		}


}