package com.fish.modules.core.gameVO
{

	/** 战斗数据
	**/
	public class BattlegunVO extends BaseVo
	{
		/**  枪的唯一id
		**/
		private var _id:Number;
		/**  枪的唯一id
		**/
		public function get id():Number
	 	{
	 		return _id;
	 	}
		/**  枪的唯一id
		**/
		public function set id(value:Number):void
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
		private var _hp:int;
		/**  
		**/
		public function get hp():int
	 	{
	 		return _hp;
	 	}
		/**  
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
		/**  所属英雄id
		**/
		private var _heroid:int;
		/**  所属英雄id
		**/
		public function get heroid():int
	 	{
	 		return _heroid;
	 	}
		/**  所属英雄id
		**/
		public function set heroid(value:int):void
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
		public static const Attributes:Array=["id","xid","hp","atk","def","speed","cri","renxing","hit","eva","heroid"];
		public static const KeyAttr:String="id";
	}
}