package com.fish.modules.core.gameVO
{

	/** 活动控制
	**/
	public class HuodongswitchVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _startTime;
	 	}

		**/

		{
			if(initFlag){
				if(_startTime!=value){
					var old:Number=_startTime;
					_startTime=value;
					onChangeAttr("startTime",_startTime,old);
				}
			}else{
				_startTime=value;
			}
		}

		**/


		**/

	 	{
	 		return _endTime;
	 	}

		**/

		{
			if(initFlag){
				if(_endTime!=value){
					var old:Number=_endTime;
					_endTime=value;
					onChangeAttr("endTime",_endTime,old);
				}
			}else{
				_endTime=value;
			}
		}

		**/


		**/

	 	{
	 		return _huodongFlag;
	 	}

		**/

		{
			if(initFlag){
				if(_huodongFlag!=value){
					var old:int=_huodongFlag;
					_huodongFlag=value;
					onChangeAttr("huodongFlag",_huodongFlag,old);
				}
			}else{
				_huodongFlag=value;
			}
		}

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



}