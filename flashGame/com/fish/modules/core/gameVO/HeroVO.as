package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class HeroVO extends BaseVo
	{
		/**  英雄id
		**/
		private var _id:int;
		/**  英雄id
		**/
		public function get id():int
	 	{
	 		return _id;
	 	}
		/**  英雄id
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
		/**  对应xml配置上的卡牌id
		**/
		private var _xid:int;
		/**  对应xml配置上的卡牌id
		**/
		public function get xid():int
	 	{
	 		return _xid;
	 	}
		/**  对应xml配置上的卡牌id
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
		/**  等级
		**/
		private var _level:int;
		/**  等级
		**/
		public function get level():int
	 	{
	 		return _level;
	 	}
		/**  等级
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
		/**  卡牌经验
		**/
		private var _exp:int;
		/**  卡牌经验
		**/
		public function get exp():int
	 	{
	 		return _exp;
	 	}
		/**  卡牌经验
		**/
		public function set exp(value:int):void
		{
			if(initFlag){
				if(_exp!=value){
					var old:int=_exp;
					_exp=value;
					onChangeAttr("exp",_exp,old);
				}
			}else{
				_exp=value;
			}
		}
		/**  装备武器的id 需要手动赋值
		**/
		private var _wuqiId:int=-1;
		/**  装备武器的id 需要手动赋值
		**/
		public function get wuqiId():int
	 	{
	 		return _wuqiId;
	 	}
		/**  装备武器的id 需要手动赋值
		**/
		public function set wuqiId(value:int):void
		{
			if(initFlag){
				if(_wuqiId!=value){
					var old:int=_wuqiId;
					_wuqiId=value;
					onChangeAttr("wuqiId",_wuqiId,old);
				}
			}else{
				_wuqiId=value;
			}
		}
		/**  装备衣裳的id 需要手动赋值
		**/
		private var _yishanId:int=-1;
		/**  装备衣裳的id 需要手动赋值
		**/
		public function get yishanId():int
	 	{
	 		return _yishanId;
	 	}
		/**  装备衣裳的id 需要手动赋值
		**/
		public function set yishanId(value:int):void
		{
			if(initFlag){
				if(_yishanId!=value){
					var old:int=_yishanId;
					_yishanId=value;
					onChangeAttr("yishanId",_yishanId,old);
				}
			}else{
				_yishanId=value;
			}
		}
		/**  装备首饰的id 需要手动赋值
		**/
		private var _shoushiId:int=-1;
		/**  装备首饰的id 需要手动赋值
		**/
		public function get shoushiId():int
	 	{
	 		return _shoushiId;
	 	}
		/**  装备首饰的id 需要手动赋值
		**/
		public function set shoushiId(value:int):void
		{
			if(initFlag){
				if(_shoushiId!=value){
					var old:int=_shoushiId;
					_shoushiId=value;
					onChangeAttr("shoushiId",_shoushiId,old);
				}
			}else{
				_shoushiId=value;
			}
		}
		/**  英雄type
		**/
		private var _herotype:int;
		/**  英雄type
		**/
		public function get herotype():int
	 	{
	 		return _herotype;
	 	}
		/**  英雄type
		**/
		public function set herotype(value:int):void
		{
			if(initFlag){
				if(_herotype!=value){
					var old:int=_herotype;
					_herotype=value;
					onChangeAttr("herotype",_herotype,old);
				}
			}else{
				_herotype=value;
			}
		}
		/**  英雄主枪id
		**/
		private var _gunId:int;
		/**  英雄主枪id
		**/
		public function get gunId():int
	 	{
	 		return _gunId;
	 	}
		/**  英雄主枪id
		**/
		public function set gunId(value:int):void
		{
			if(initFlag){
				if(_gunId!=value){
					var old:int=_gunId;
					_gunId=value;
					onChangeAttr("gunId",_gunId,old);
				}
			}else{
				_gunId=value;
			}
		}
		public static const Attributes:Array=["id","xid","level","exp","wuqiId","yishanId","shoushiId","herotype","gunId"];
	}
}