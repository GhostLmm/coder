package com.fish.modules.core.gameVO
{

	/** 故事数据
	**/
	public class BattlebaseVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _battleMustEndTime;
	 	}

		**/

		{
			if(initFlag){
				if(_battleMustEndTime!=value){
					var old:Number=_battleMustEndTime;
					_battleMustEndTime=value;
					onChangeAttr("battleMustEndTime",_battleMustEndTime,old);
				}
			}else{
				_battleMustEndTime=value;
			}
		}

		**/


		**/

	 	{
	 		return _battleBeginTime;
	 	}

		**/

		{
			if(initFlag){
				if(_battleBeginTime!=value){
					var old:Number=_battleBeginTime;
					_battleBeginTime=value;
					onChangeAttr("battleBeginTime",_battleBeginTime,old);
				}
			}else{
				_battleBeginTime=value;
			}
		}


}