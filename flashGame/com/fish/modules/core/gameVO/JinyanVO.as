package com.fish.modules.core.gameVO
{

	/** 禁言
	**/
	public class JinyanVO extends BaseVo
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
	 		return _jinyanShijie;
	 	}

		**/

		{
			if(initFlag){
				if(_jinyanShijie!=value){
					var old:int=_jinyanShijie;
					_jinyanShijie=value;
					onChangeAttr("jinyanShijie",_jinyanShijie,old);
				}
			}else{
				_jinyanShijie=value;
			}
		}

		**/


		**/

	 	{
	 		return _jinyanBanghui;
	 	}

		**/

		{
			if(initFlag){
				if(_jinyanBanghui!=value){
					var old:int=_jinyanBanghui;
					_jinyanBanghui=value;
					onChangeAttr("jinyanBanghui",_jinyanBanghui,old);
				}
			}else{
				_jinyanBanghui=value;
			}
		}

		**/


		**/

	 	{
	 		return _desc;
	 	}

		**/

		{
			if(initFlag){
				if(_desc!=value){
					var old:String=_desc;
					_desc=value;
					onChangeAttr("desc",_desc,old);
				}
			}else{
				_desc=value;
			}
		}


}