package com.fish.modules.core.gameVO
{

	/** 战斗数据
	**/
	public class BattlegunVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _id;
	 	}

		**/

		{
			if(initFlag){
				if(_id!=value){
					var old:Number=_id;
					_id=value;
					onChangeAttr("id",_id,old);
				}
			}else{
				_id=value;
			}
		}

		**/


		**/

	 	{
	 		return _xid;
	 	}

		**/

		{
			if(initFlag){
				if(_xid!=value){
					var old:int=_xid;
					_xid=value;
					onChangeAttr("xid",_xid,old);
				}
			}else{
				_xid=value;
			}
		}

		**/


		**/

	 	{
	 		return _hp;
	 	}

		**/

		{
			if(initFlag){
				if(_hp!=value){
					var old:int=_hp;
					_hp=value;
					onChangeAttr("hp",_hp,old);
				}
			}else{
				_hp=value;
			}
		}

		**/


		**/

	 	{
	 		return _atk;
	 	}

		**/

		{
			if(initFlag){
				if(_atk!=value){
					var old:int=_atk;
					_atk=value;
					onChangeAttr("atk",_atk,old);
				}
			}else{
				_atk=value;
			}
		}

		**/


		**/

	 	{
	 		return _def;
	 	}

		**/

		{
			if(initFlag){
				if(_def!=value){
					var old:int=_def;
					_def=value;
					onChangeAttr("def",_def,old);
				}
			}else{
				_def=value;
			}
		}

		**/


		**/

	 	{
	 		return _speed;
	 	}

		**/

		{
			if(initFlag){
				if(_speed!=value){
					var old:int=_speed;
					_speed=value;
					onChangeAttr("speed",_speed,old);
				}
			}else{
				_speed=value;
			}
		}

		**/


		**/

	 	{
	 		return _cri;
	 	}

		**/

		{
			if(initFlag){
				if(_cri!=value){
					var old:int=_cri;
					_cri=value;
					onChangeAttr("cri",_cri,old);
				}
			}else{
				_cri=value;
			}
		}

		**/


		**/

	 	{
	 		return _renxing;
	 	}

		**/

		{
			if(initFlag){
				if(_renxing!=value){
					var old:int=_renxing;
					_renxing=value;
					onChangeAttr("renxing",_renxing,old);
				}
			}else{
				_renxing=value;
			}
		}

		**/


		**/

	 	{
	 		return _hit;
	 	}

		**/

		{
			if(initFlag){
				if(_hit!=value){
					var old:int=_hit;
					_hit=value;
					onChangeAttr("hit",_hit,old);
				}
			}else{
				_hit=value;
			}
		}

		**/


		**/

	 	{
	 		return _eva;
	 	}

		**/

		{
			if(initFlag){
				if(_eva!=value){
					var old:int=_eva;
					_eva=value;
					onChangeAttr("eva",_eva,old);
				}
			}else{
				_eva=value;
			}
		}

		**/


		**/

	 	{
	 		return _heroid;
	 	}

		**/

		{
			if(initFlag){
				if(_heroid!=value){
					var old:int=_heroid;
					_heroid=value;
					onChangeAttr("heroid",_heroid,old);
				}
			}else{
				_heroid=value;
			}
		}



}