package com.fish.modules.core.gameVO
{

	/** 选秀数据
	**/
	public class ChoujiangVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _haixuanFreshTime;
	 	}

		**/

		{
			if(initFlag){
				if(_haixuanFreshTime!=value){
					var old:Number=_haixuanFreshTime;
					_haixuanFreshTime=value;
					onChangeAttr("haixuanFreshTime",_haixuanFreshTime,old);
				}
			}else{
				_haixuanFreshTime=value;
			}
		}

		**/


		**/

	 	{
	 		return _jingxuanFreshTime;
	 	}

		**/

		{
			if(initFlag){
				if(_jingxuanFreshTime!=value){
					var old:Number=_jingxuanFreshTime;
					_jingxuanFreshTime=value;
					onChangeAttr("jingxuanFreshTime",_jingxuanFreshTime,old);
				}
			}else{
				_jingxuanFreshTime=value;
			}
		}

		**/


		**/

	 	{
	 		return _haixuanCards;
	 	}

		**/

		{
			if(initFlag){
				if(_haixuanCards!=value){
					var old:String=_haixuanCards;
					_haixuanCards=value;
					onChangeAttr("haixuanCards",_haixuanCards,old);
				}
			}else{
				_haixuanCards=value;
			}
		}

		**/


		**/

	 	{
	 		return _haixuanChosenid;
	 	}

		**/

		{
			if(initFlag){
				if(_haixuanChosenid!=value){
					var old:int=_haixuanChosenid;
					_haixuanChosenid=value;
					onChangeAttr("haixuanChosenid",_haixuanChosenid,old);
				}
			}else{
				_haixuanChosenid=value;
			}
		}

		**/


		**/

	 	{
	 		return _haixuanLianxuanCost;
	 	}

		**/

		{
			if(initFlag){
				if(_haixuanLianxuanCost!=value){
					var old:int=_haixuanLianxuanCost;
					_haixuanLianxuanCost=value;
					onChangeAttr("haixuanLianxuanCost",_haixuanLianxuanCost,old);
				}
			}else{
				_haixuanLianxuanCost=value;
			}
		}

		**/


		**/

	 	{
	 		return _haixuanShilian;
	 	}

		**/

		{
			if(initFlag){
				if(_haixuanShilian!=value){
					var old:String=_haixuanShilian;
					_haixuanShilian=value;
					onChangeAttr("haixuanShilian",_haixuanShilian,old);
				}
			}else{
				_haixuanShilian=value;
			}
		}

		**/


		**/

	 	{
	 		return _jingxuanShilian;
	 	}

		**/

		{
			if(initFlag){
				if(_jingxuanShilian!=value){
					var old:String=_jingxuanShilian;
					_jingxuanShilian=value;
					onChangeAttr("jingxuanShilian",_jingxuanShilian,old);
				}
			}else{
				_jingxuanShilian=value;
			}
		}

		**/


		**/

	 	{
	 		return _jingxuanShilianCount;
	 	}

		**/

		{
			if(initFlag){
				if(_jingxuanShilianCount!=value){
					var old:int=_jingxuanShilianCount;
					_jingxuanShilianCount=value;
					onChangeAttr("jingxuanShilianCount",_jingxuanShilianCount,old);
				}
			}else{
				_jingxuanShilianCount=value;
			}
		}

		**/


		**/

	 	{
	 		return _jingxuanShilianCost;
	 	}

		**/

		{
			if(initFlag){
				if(_jingxuanShilianCost!=value){
					var old:int=_jingxuanShilianCost;
					_jingxuanShilianCost=value;
					onChangeAttr("jingxuanShilianCost",_jingxuanShilianCost,old);
				}
			}else{
				_jingxuanShilianCost=value;
			}
		}

		**/


		**/

	 	{
	 		return _jingxuanCost;
	 	}

		**/

		{
			if(initFlag){
				if(_jingxuanCost!=value){
					var old:int=_jingxuanCost;
					_jingxuanCost=value;
					onChangeAttr("jingxuanCost",_jingxuanCost,old);
				}
			}else{
				_jingxuanCost=value;
			}
		}

		**/


		**/

	 	{
	 		return _jingxuanXid;
	 	}

		**/

		{
			if(initFlag){
				if(_jingxuanXid!=value){
					var old:int=_jingxuanXid;
					_jingxuanXid=value;
					onChangeAttr("jingxuanXid",_jingxuanXid,old);
				}
			}else{
				_jingxuanXid=value;
			}
		}

		**/


		**/

	 	{
	 		return _jingxuanCount;
	 	}

		**/

		{
			if(initFlag){
				if(_jingxuanCount!=value){
					var old:int=_jingxuanCount;
					_jingxuanCount=value;
					onChangeAttr("jingxuanCount",_jingxuanCount,old);
				}
			}else{
				_jingxuanCount=value;
			}
		}

		**/


		**/

	 	{
	 		return _fenjieXids;
	 	}

		**/

		{
			if(initFlag){
				if(_fenjieXids!=value){
					var old:String=_fenjieXids;
					_fenjieXids=value;
					onChangeAttr("fenjieXids",_fenjieXids,old);
				}
			}else{
				_fenjieXids=value;
			}
		}


}