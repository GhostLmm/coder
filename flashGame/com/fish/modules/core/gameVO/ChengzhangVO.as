package com.fish.modules.core.gameVO
{

	/** 成长计划
	**/
	public class ChengzhangVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _hasGoumai;
	 	}

		**/

		{
			if(initFlag){
				if(_hasGoumai!=value){
					var old:int=_hasGoumai;
					_hasGoumai=value;
					onChangeAttr("hasGoumai",_hasGoumai,old);
				}
			}else{
				_hasGoumai=value;
			}
		}

		**/


		**/

	 	{
	 		return _lingquMsg;
	 	}

		**/

		{
			if(initFlag){
				if(_lingquMsg!=value){
					var old:String=_lingquMsg;
					_lingquMsg=value;
					onChangeAttr("lingquMsg",_lingquMsg,old);
				}
			}else{
				_lingquMsg=value;
			}
		}


}