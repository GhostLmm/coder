package com.fish.modules.core.gameVO
{

	/** 金矿数据
	**/
	public class JinkuangVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _optLengqueTime;
	 	}

		**/

		{
			if(initFlag){
				if(_optLengqueTime!=value){
					var old:Number=_optLengqueTime;
					_optLengqueTime=value;
					onChangeAttr("optLengqueTime",_optLengqueTime,old);
				}
			}else{
				_optLengqueTime=value;
			}
		}

		**/


		**/

	 	{
	 		return _lastLeitaiRank;
	 	}

		**/

		{
			if(initFlag){
				if(_lastLeitaiRank!=value){
					var old:int=_lastLeitaiRank;
					_lastLeitaiRank=value;
					onChangeAttr("lastLeitaiRank",_lastLeitaiRank,old);
				}
			}else{
				_lastLeitaiRank=value;
			}
		}


}