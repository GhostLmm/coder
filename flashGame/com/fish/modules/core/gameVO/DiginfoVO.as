package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class DiginfoVO extends BaseVo
	{
		/**  掉落的道具，map
		**/
		private var _dropItems:String;
		/**  掉落的道具，map
		**/
		public function get dropItems():String
	 	{
	 		return _dropItems;
	 	}
		/**  掉落的道具，map
		**/
		public function set dropItems(value:String):void
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
		/**  是否初始化过
		**/
		private var _hasDiginit:int;
		/**  是否初始化过
		**/
		public function get hasDiginit():int
	 	{
	 		return _hasDiginit;
	 	}
		/**  是否初始化过
		**/
		public function set hasDiginit(value:int):void
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
		/**  加速次数
		**/
		private var _jiashuCount:int;
		/**  加速次数
		**/
		public function get jiashuCount():int
	 	{
	 		return _jiashuCount;
	 	}
		/**  加速次数
		**/
		public function set jiashuCount(value:int):void
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
		/**  自动挖矿获得的钱
		**/
		private var _guajiDigMoney:int;
		/**  自动挖矿获得的钱
		**/
		public function get guajiDigMoney():int
	 	{
	 		return _guajiDigMoney;
	 	}
		/**  自动挖矿获得的钱
		**/
		public function set guajiDigMoney(value:int):void
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
		/**  自动挖矿获得的经验
		**/
		private var _guajiDigExp:int;
		/**  自动挖矿获得的经验
		**/
		public function get guajiDigExp():int
	 	{
	 		return _guajiDigExp;
	 	}
		/**  自动挖矿获得的经验
		**/
		public function set guajiDigExp(value:int):void
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
		/**  自动挖矿持续时间
		**/
		private var _guajiDigTime:int;
		/**  自动挖矿持续时间
		**/
		public function get guajiDigTime():int
	 	{
	 		return _guajiDigTime;
	 	}
		/**  自动挖矿持续时间
		**/
		public function set guajiDigTime(value:int):void
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
		/**  自动挖矿获得的装备
		**/
		private var _guajiDigEquips:String;
		/**  自动挖矿获得的装备
		**/
		public function get guajiDigEquips():String
	 	{
	 		return _guajiDigEquips;
	 	}
		/**  自动挖矿获得的装备
		**/
		public function set guajiDigEquips(value:String):void
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
		/**  出售的装备信息
		**/
		private var _guajiDigSellEquips:String;
		/**  出售的装备信息
		**/
		public function get guajiDigSellEquips():String
	 	{
	 		return _guajiDigSellEquips;
	 	}
		/**  出售的装备信息
		**/
		public function set guajiDigSellEquips(value:String):void
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
		/**  出售设置
		**/
		private var _chushouSetinfo:int;
		/**  出售设置
		**/
		public function get chushouSetinfo():int
	 	{
	 		return _chushouSetinfo;
	 	}
		/**  出售设置
		**/
		public function set chushouSetinfo(value:int):void
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
		/**  挖矿等级
		**/
		private var _digLevel:int;
		/**  挖矿等级
		**/
		public function get digLevel():int
	 	{
	 		return _digLevel;
	 	}
		/**  挖矿等级
		**/
		public function set digLevel(value:int):void
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
		public static const Attributes:Array=["dropItems","hasDiginit","jiashuCount","guajiDigMoney","guajiDigExp","guajiDigTime","guajiDigEquips","guajiDigSellEquips","chushouSetinfo","digLevel"];
	}
}