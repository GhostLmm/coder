package com.fish.modules.core.gameVO
{

	/** 故事数据
	**/
	public class ChaonengliVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _currentType;
	 	}

		**/

		{
			if(initFlag){
				if(_currentType!=value){
					var old:int=_currentType;
					_currentType=value;
					onChangeAttr("currentType",_currentType,old);
				}
			}else{
				_currentType=value;
			}
		}

		**/


		**/

	 	{
	 		return _xidList;
	 	}

		**/

		{
			if(initFlag){
				if(_xidList!=value){
					var old:String=_xidList;
					_xidList=value;
					onChangeAttr("xidList",_xidList,old);
				}
			}else{
				_xidList=value;
			}
		}

		**/


		**/

	 	{
	 		return _upEnable;
	 	}

		**/

		{
			if(initFlag){
				if(_upEnable!=value){
					var old:int=_upEnable;
					_upEnable=value;
					onChangeAttr("upEnable",_upEnable,old);
				}
			}else{
				_upEnable=value;
			}
		}


}