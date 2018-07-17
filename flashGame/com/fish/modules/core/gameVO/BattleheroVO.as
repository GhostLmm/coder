package com.fish.modules.core.gameVO
{

	/** 战斗数据
	**/
	public class BattleheroVO extends BaseVo
	{
		/**  
		**/
		private var _id:int;
		/**  
		**/
		public function get id():int
	 	{
	 		return _id;
	 	}
		/**  
		**/
		public function set id(value:int):void
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
		/**  
		**/
		private var _xid:int;
		/**  
		**/
		public function get xid():int
	 	{
	 		return _xid;
	 	}
		/**  
		**/
		public function set xid(value:int):void
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
		/**  
		**/
		private var _level:int;
		/**  
		**/
		public function get level():int
	 	{
	 		return _level;
	 	}
		/**  
		**/
		public function set level(value:int):void
		{
			if(initFlag){
				if(_level!=value){
					var old:int=_level;
					_level=value;
					onChangeAttr("level",_level,old);
				}
			}else{
				_level=value;
			}
		}
		/**  基础血量
		**/
		private var _hp:int;
		/**  基础血量
		**/
		public function get hp():int
	 	{
	 		return _hp;
	 	}
		/**  基础血量
		**/
		public function set hp(value:int):void
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
		/**  
		**/
		private var _atk:int;
		/**  
		**/
		public function get atk():int
	 	{
	 		return _atk;
	 	}
		/**  
		**/
		public function set atk(value:int):void
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
		/**  
		**/
		private var _def:int;
		/**  
		**/
		public function get def():int
	 	{
	 		return _def;
	 	}
		/**  
		**/
		public function set def(value:int):void
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
		/**  
		**/
		private var _speed:int;
		/**  
		**/
		public function get speed():int
	 	{
	 		return _speed;
	 	}
		/**  
		**/
		public function set speed(value:int):void
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
		/**  
		**/
		private var _cri:int;
		/**  
		**/
		public function get cri():int
	 	{
	 		return _cri;
	 	}
		/**  
		**/
		public function set cri(value:int):void
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
		/**  
		**/
		private var _renxing:int;
		/**  
		**/
		public function get renxing():int
	 	{
	 		return _renxing;
	 	}
		/**  
		**/
		public function set renxing(value:int):void
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
		/**  
		**/
		private var _hit:int;
		/**  
		**/
		public function get hit():int
	 	{
	 		return _hit;
	 	}
		/**  
		**/
		public function set hit(value:int):void
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
		/**  
		**/
		private var _eva:int;
		/**  
		**/
		public function get eva():int
	 	{
	 		return _eva;
	 	}
		/**  
		**/
		public function set eva(value:int):void
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
		/**  用户形象帧
		**/
		private var _userMovieFrame:String;
		/**  用户形象帧
		**/
		public function get userMovieFrame():String
	 	{
	 		return _userMovieFrame;
	 	}
		/**  用户形象帧
		**/
		public function set userMovieFrame(value:String):void
		{
			if(initFlag){
				if(_userMovieFrame!=value){
					var old:String=_userMovieFrame;
					_userMovieFrame=value;
					onChangeAttr("userMovieFrame",_userMovieFrame,old);
				}
			}else{
				_userMovieFrame=value;
			}
		}
		/**  用户形象color
		**/
		private var _userColors:String;
		/**  用户形象color
		**/
		public function get userColors():String
	 	{
	 		return _userColors;
	 	}
		/**  用户形象color
		**/
		public function set userColors(value:String):void
		{
			if(initFlag){
				if(_userColors!=value){
					var old:String=_userColors;
					_userColors=value;
					onChangeAttr("userColors",_userColors,old);
				}
			}else{
				_userColors=value;
			}
		}
		/**  
		**/
		private var _nbSpeed:Number;
		/**  
		**/
		public function get nbSpeed():Number
	 	{
	 		return _nbSpeed;
	 	}
		/**  
		**/
		public function set nbSpeed(value:Number):void
		{
			if(initFlag){
				if(_nbSpeed!=value){
					var old:Number=_nbSpeed;
					_nbSpeed=value;
					onChangeAttr("nbSpeed",_nbSpeed,old);
				}
			}else{
				_nbSpeed=value;
			}
		}
		/**  
		**/
		private var _nbCri:Number;
		/**  
		**/
		public function get nbCri():Number
	 	{
	 		return _nbCri;
	 	}
		/**  
		**/
		public function set nbCri(value:Number):void
		{
			if(initFlag){
				if(_nbCri!=value){
					var old:Number=_nbCri;
					_nbCri=value;
					onChangeAttr("nbCri",_nbCri,old);
				}
			}else{
				_nbCri=value;
			}
		}
		/**  
		**/
		private var _nbRenxing:Number;
		/**  
		**/
		public function get nbRenxing():Number
	 	{
	 		return _nbRenxing;
	 	}
		/**  
		**/
		public function set nbRenxing(value:Number):void
		{
			if(initFlag){
				if(_nbRenxing!=value){
					var old:Number=_nbRenxing;
					_nbRenxing=value;
					onChangeAttr("nbRenxing",_nbRenxing,old);
				}
			}else{
				_nbRenxing=value;
			}
		}
		/**  
		**/
		private var _nbHit:Number;
		/**  
		**/
		public function get nbHit():Number
	 	{
	 		return _nbHit;
	 	}
		/**  
		**/
		public function set nbHit(value:Number):void
		{
			if(initFlag){
				if(_nbHit!=value){
					var old:Number=_nbHit;
					_nbHit=value;
					onChangeAttr("nbHit",_nbHit,old);
				}
			}else{
				_nbHit=value;
			}
		}
		/**  
		**/
		private var _nbEva:Number;
		/**  
		**/
		public function get nbEva():Number
	 	{
	 		return _nbEva;
	 	}
		/**  
		**/
		public function set nbEva(value:Number):void
		{
			if(initFlag){
				if(_nbEva!=value){
					var old:Number=_nbEva;
					_nbEva=value;
					onChangeAttr("nbEva",_nbEva,old);
				}
			}else{
				_nbEva=value;
			}
		}
		/**  
		**/
		private var _nbDamage:Number;
		/**  
		**/
		public function get nbDamage():Number
	 	{
	 		return _nbDamage;
	 	}
		/**  
		**/
		public function set nbDamage(value:Number):void
		{
			if(initFlag){
				if(_nbDamage!=value){
					var old:Number=_nbDamage;
					_nbDamage=value;
					onChangeAttr("nbDamage",_nbDamage,old);
				}
			}else{
				_nbDamage=value;
			}
		}
		/**  
		**/
		private var _nbXixue:Number;
		/**  
		**/
		public function get nbXixue():Number
	 	{
	 		return _nbXixue;
	 	}
		/**  
		**/
		public function set nbXixue(value:Number):void
		{
			if(initFlag){
				if(_nbXixue!=value){
					var old:Number=_nbXixue;
					_nbXixue=value;
					onChangeAttr("nbXixue",_nbXixue,old);
				}
			}else{
				_nbXixue=value;
			}
		}
		/**  
		**/
		private var _nbFanshang:Number;
		/**  
		**/
		public function get nbFanshang():Number
	 	{
	 		return _nbFanshang;
	 	}
		/**  
		**/
		public function set nbFanshang(value:Number):void
		{
			if(initFlag){
				if(_nbFanshang!=value){
					var old:Number=_nbFanshang;
					_nbFanshang=value;
					onChangeAttr("nbFanshang",_nbFanshang,old);
				}
			}else{
				_nbFanshang=value;
			}
		}
		/**  
		**/
		private var _nbMoney:Number;
		/**  
		**/
		public function get nbMoney():Number
	 	{
	 		return _nbMoney;
	 	}
		/**  
		**/
		public function set nbMoney(value:Number):void
		{
			if(initFlag){
				if(_nbMoney!=value){
					var old:Number=_nbMoney;
					_nbMoney=value;
					onChangeAttr("nbMoney",_nbMoney,old);
				}
			}else{
				_nbMoney=value;
			}
		}
		/**  
		**/
		private var _nbExp:Number;
		/**  
		**/
		public function get nbExp():Number
	 	{
	 		return _nbExp;
	 	}
		/**  
		**/
		public function set nbExp(value:Number):void
		{
			if(initFlag){
				if(_nbExp!=value){
					var old:Number=_nbExp;
					_nbExp=value;
					onChangeAttr("nbExp",_nbExp,old);
				}
			}else{
				_nbExp=value;
			}
		}
		/**  
		**/
		private var _mainGun:int;
		/**  
		**/
		public function get mainGun():int
	 	{
	 		return _mainGun;
	 	}
		/**  
		**/
		public function set mainGun(value:int):void
		{
			if(initFlag){
				if(_mainGun!=value){
					var old:int=_mainGun;
					_mainGun=value;
					onChangeAttr("mainGun",_mainGun,old);
				}
			}else{
				_mainGun=value;
			}
		}
		/**  
		**/
		private var _nbCridamage:Number;
		/**  
		**/
		public function get nbCridamage():Number
	 	{
	 		return _nbCridamage;
	 	}
		/**  
		**/
		public function set nbCridamage(value:Number):void
		{
			if(initFlag){
				if(_nbCridamage!=value){
					var old:Number=_nbCridamage;
					_nbCridamage=value;
					onChangeAttr("nbCridamage",_nbCridamage,old);
				}
			}else{
				_nbCridamage=value;
			}
		}
		/**  当前剩余血量
		**/
		private var _curhp:int;
		/**  当前剩余血量
		**/
		public function get curhp():int
	 	{
	 		return _curhp;
	 	}
		/**  当前剩余血量
		**/
		public function set curhp(value:int):void
		{
			if(initFlag){
				if(_curhp!=value){
					var old:int=_curhp;
					_curhp=value;
					onChangeAttr("curhp",_curhp,old);
				}
			}else{
				_curhp=value;
			}
		}
		public static const Attributes:Array=["id","xid","level","hp","atk","def","speed","cri","renxing","hit","eva","userMovieFrame","userColors","nbSpeed","nbCri","nbRenxing","nbHit","nbEva","nbDamage","nbXixue","nbFanshang","nbMoney","nbExp","mainGun","nbCridamage","curhp"];
		public static const KeyAttr:String="id";
	}
}