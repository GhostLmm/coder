package com.fish.modules.core.gameVO
{

	/** 故事数据
	**/
	public class BattleresultVO extends BaseVo
	{

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

		**/


		**/

	 	{
	 		return _time;
	 	}

		**/

		{
			if(initFlag){
				if(_time!=value){
					var old:int=_time;
					_time=value;
					onChangeAttr("time",_time,old);
				}
			}else{
				_time=value;
			}
		}

		**/


		**/

	 	{
	 		return _life;
	 	}

		**/

		{
			if(initFlag){
				if(_life!=value){
					var old:int=_life;
					_life=value;
					onChangeAttr("life",_life,old);
				}
			}else{
				_life=value;
			}
		}


}