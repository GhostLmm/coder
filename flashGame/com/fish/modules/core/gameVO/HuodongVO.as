package com.fish.modules.core.gameVO
{

	/** 活动数据
	**/
	public class HuodongVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _linquNoonCount;
	 	}

		**/

		{
			if(initFlag){
				if(_linquNoonCount!=value){
					var old:int=_linquNoonCount;
					_linquNoonCount=value;
					onChangeAttr("linquNoonCount",_linquNoonCount,old);
				}
			}else{
				_linquNoonCount=value;
			}
		}

		**/


		**/

	 	{
	 		return _linquAfternoonCount;
	 	}

		**/

		{
			if(initFlag){
				if(_linquAfternoonCount!=value){
					var old:int=_linquAfternoonCount;
					_linquAfternoonCount=value;
					onChangeAttr("linquAfternoonCount",_linquAfternoonCount,old);
				}
			}else{
				_linquAfternoonCount=value;
			}
		}

		**/


		**/

	 	{
	 		return _canbaiXid;
	 	}

		**/

		{
			if(initFlag){
				if(_canbaiXid!=value){
					var old:int=_canbaiXid;
					_canbaiXid=value;
					onChangeAttr("canbaiXid",_canbaiXid,old);
				}
			}else{
				_canbaiXid=value;
			}
		}

		**/


		**/

	 	{
	 		return _canbaiDay;
	 	}

		**/

		{
			if(initFlag){
				if(_canbaiDay!=value){
					var old:int=_canbaiDay;
					_canbaiDay=value;
					onChangeAttr("canbaiDay",_canbaiDay,old);
				}
			}else{
				_canbaiDay=value;
			}
		}

		**/


		**/

	 	{
	 		return _canbaiTime;
	 	}

		**/

		{
			if(initFlag){
				if(_canbaiTime!=value){
					var old:Number=_canbaiTime;
					_canbaiTime=value;
					onChangeAttr("canbaiTime",_canbaiTime,old);
				}
			}else{
				_canbaiTime=value;
			}
		}


}