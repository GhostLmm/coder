package com.fish.modules.core.gameVO
{

	/** 魔女塔排行榜
	**/
	public class BanghuizhanjifenVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _rank;
	 	}

		**/

		{
			if(initFlag){
				if(_rank!=value){
					var old:int=_rank;
					_rank=value;
					onChangeAttr("rank",_rank,old);
				}
			}else{
				_rank=value;
			}
		}

		**/


		**/

	 	{
	 		return _jifen;
	 	}

		**/

		{
			if(initFlag){
				if(_jifen!=value){
					var old:int=_jifen;
					_jifen=value;
					onChangeAttr("jifen",_jifen,old);
				}
			}else{
				_jifen=value;
			}
		}

		**/


		**/

	 	{
	 		return _bid;
	 	}

		**/

		{
			if(initFlag){
				if(_bid!=value){
					var old:int=_bid;
					_bid=value;
					onChangeAttr("bid",_bid,old);
				}
			}else{
				_bid=value;
			}
		}

		**/


		**/

	 	{
	 		return _personNum;
	 	}

		**/

		{
			if(initFlag){
				if(_personNum!=value){
					var old:int=_personNum;
					_personNum=value;
					onChangeAttr("personNum",_personNum,old);
				}
			}else{
				_personNum=value;
			}
		}

		**/


		**/

	 	{
	 		return _banghuiName;
	 	}

		**/

		{
			if(initFlag){
				if(_banghuiName!=value){
					var old:String=_banghuiName;
					_banghuiName=value;
					onChangeAttr("banghuiName",_banghuiName,old);
				}
			}else{
				_banghuiName=value;
			}
		}

		**/


		**/

	 	{
	 		return _banghuiLevel;
	 	}

		**/

		{
			if(initFlag){
				if(_banghuiLevel!=value){
					var old:int=_banghuiLevel;
					_banghuiLevel=value;
					onChangeAttr("banghuiLevel",_banghuiLevel,old);
				}
			}else{
				_banghuiLevel=value;
			}
		}

		**/


		**/

	 	{
	 		return _banghuiIcon;
	 	}

		**/

		{
			if(initFlag){
				if(_banghuiIcon!=value){
					var old:int=_banghuiIcon;
					_banghuiIcon=value;
					onChangeAttr("banghuiIcon",_banghuiIcon,old);
				}
			}else{
				_banghuiIcon=value;
			}
		}

		**/


		**/

	 	{
	 		return _huizhangName;
	 	}

		**/

		{
			if(initFlag){
				if(_huizhangName!=value){
					var old:String=_huizhangName;
					_huizhangName=value;
					onChangeAttr("huizhangName",_huizhangName,old);
				}
			}else{
				_huizhangName=value;
			}
		}

		**/


		**/

	 	{
	 		return _huizhangUid;
	 	}

		**/

		{
			if(initFlag){
				if(_huizhangUid!=value){
					var old:int=_huizhangUid;
					_huizhangUid=value;
					onChangeAttr("huizhangUid",_huizhangUid,old);
				}
			}else{
				_huizhangUid=value;
			}
		}



}