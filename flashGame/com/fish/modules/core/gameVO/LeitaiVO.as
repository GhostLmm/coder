package com.fish.modules.core.gameVO
{

	/** 擂台主体数据
	**/
	public class LeitaiVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _lenqueTime;
	 	}

		**/

		{
			if(initFlag){
				if(_lenqueTime!=value){
					var old:Number=_lenqueTime;
					_lenqueTime=value;
					onChangeAttr("lenqueTime",_lenqueTime,old);
				}
			}else{
				_lenqueTime=value;
			}
		}

		**/


		**/

	 	{
	 		return _fafangTime;
	 	}

		**/

		{
			if(initFlag){
				if(_fafangTime!=value){
					var old:Number=_fafangTime;
					_fafangTime=value;
					onChangeAttr("fafangTime",_fafangTime,old);
				}
			}else{
				_fafangTime=value;
			}
		}

		**/


		**/

	 	{
	 		return _myRank;
	 	}

		**/

		{
			if(initFlag){
				if(_myRank!=value){
					var old:int=_myRank;
					_myRank=value;
					onChangeAttr("myRank",_myRank,old);
				}
			}else{
				_myRank=value;
			}
		}

		**/


		**/

	 	{
	 		return _tiaozhanCount;
	 	}

		**/

		{
			if(initFlag){
				if(_tiaozhanCount!=value){
					var old:int=_tiaozhanCount;
					_tiaozhanCount=value;
					onChangeAttr("tiaozhanCount",_tiaozhanCount,old);
				}
			}else{
				_tiaozhanCount=value;
			}
		}

		**/


		**/

	 	{
	 		return _lastRank;
	 	}

		**/

		{
			if(initFlag){
				if(_lastRank!=value){
					var old:int=_lastRank;
					_lastRank=value;
					onChangeAttr("lastRank",_lastRank,old);
				}
			}else{
				_lastRank=value;
			}
		}

		**/


		**/

	 	{
	 		return _baoxiangStatus;
	 	}

		**/

		{
			if(initFlag){
				if(_baoxiangStatus!=value){
					var old:int=_baoxiangStatus;
					_baoxiangStatus=value;
					onChangeAttr("baoxiangStatus",_baoxiangStatus,old);
				}
			}else{
				_baoxiangStatus=value;
			}
		}


}