package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class DiginfoVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _dropItems;
	 	}

		**/

		{
			if(initFlag){
				if(_dropItems!=value){
					var old:String=_dropItems;
					_dropItems=value;
					onChangeAttr("dropItems",_dropItems,old);
				}
			}else{
				_dropItems=value;
			}
		}

		**/


		**/

	 	{
	 		return _hasDiginit;
	 	}

		**/

		{
			if(initFlag){
				if(_hasDiginit!=value){
					var old:int=_hasDiginit;
					_hasDiginit=value;
					onChangeAttr("hasDiginit",_hasDiginit,old);
				}
			}else{
				_hasDiginit=value;
			}
		}

		**/


		**/

	 	{
	 		return _jiashuCount;
	 	}

		**/

		{
			if(initFlag){
				if(_jiashuCount!=value){
					var old:int=_jiashuCount;
					_jiashuCount=value;
					onChangeAttr("jiashuCount",_jiashuCount,old);
				}
			}else{
				_jiashuCount=value;
			}
		}

		**/


		**/

	 	{
	 		return _guajiDigMoney;
	 	}

		**/

		{
			if(initFlag){
				if(_guajiDigMoney!=value){
					var old:int=_guajiDigMoney;
					_guajiDigMoney=value;
					onChangeAttr("guajiDigMoney",_guajiDigMoney,old);
				}
			}else{
				_guajiDigMoney=value;
			}
		}

		**/


		**/

	 	{
	 		return _guajiDigExp;
	 	}

		**/

		{
			if(initFlag){
				if(_guajiDigExp!=value){
					var old:int=_guajiDigExp;
					_guajiDigExp=value;
					onChangeAttr("guajiDigExp",_guajiDigExp,old);
				}
			}else{
				_guajiDigExp=value;
			}
		}

		**/


		**/

	 	{
	 		return _guajiDigTime;
	 	}

		**/

		{
			if(initFlag){
				if(_guajiDigTime!=value){
					var old:int=_guajiDigTime;
					_guajiDigTime=value;
					onChangeAttr("guajiDigTime",_guajiDigTime,old);
				}
			}else{
				_guajiDigTime=value;
			}
		}

		**/


		**/

	 	{
	 		return _guajiDigEquips;
	 	}

		**/

		{
			if(initFlag){
				if(_guajiDigEquips!=value){
					var old:String=_guajiDigEquips;
					_guajiDigEquips=value;
					onChangeAttr("guajiDigEquips",_guajiDigEquips,old);
				}
			}else{
				_guajiDigEquips=value;
			}
		}

		**/


		**/

	 	{
	 		return _guajiDigSellEquips;
	 	}

		**/

		{
			if(initFlag){
				if(_guajiDigSellEquips!=value){
					var old:String=_guajiDigSellEquips;
					_guajiDigSellEquips=value;
					onChangeAttr("guajiDigSellEquips",_guajiDigSellEquips,old);
				}
			}else{
				_guajiDigSellEquips=value;
			}
		}

		**/


		**/

	 	{
	 		return _chushouSetinfo;
	 	}

		**/

		{
			if(initFlag){
				if(_chushouSetinfo!=value){
					var old:int=_chushouSetinfo;
					_chushouSetinfo=value;
					onChangeAttr("chushouSetinfo",_chushouSetinfo,old);
				}
			}else{
				_chushouSetinfo=value;
			}
		}

		**/


		**/

	 	{
	 		return _digLevel;
	 	}

		**/

		{
			if(initFlag){
				if(_digLevel!=value){
					var old:int=_digLevel;
					_digLevel=value;
					onChangeAttr("digLevel",_digLevel,old);
				}
			}else{
				_digLevel=value;
			}
		}


}