package com.fish.modules.core.gameVO
{

	/** 选秀数据
	**/
	public class ChoujiangVO extends BaseVo
	{
		/**  海选刷新时间
		**/
		private var _haixuanFreshTime:Number;
		/**  海选刷新时间
		**/
		public function get haixuanFreshTime():Number
	 	{
	 		return _haixuanFreshTime;
	 	}
		/**  海选刷新时间
		**/
		public function set haixuanFreshTime(value:Number):void
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
		/**  精选刷新时间
		**/
		private var _jingxuanFreshTime:Number;
		/**  精选刷新时间
		**/
		public function get jingxuanFreshTime():Number
	 	{
	 		return _jingxuanFreshTime;
	 	}
		/**  精选刷新时间
		**/
		public function set jingxuanFreshTime(value:Number):void
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
		/**  海选初始化卡牌数组，json格式
		**/
		private var _haixuanCards:String;
		/**  海选初始化卡牌数组，json格式
		**/
		public function get haixuanCards():String
	 	{
	 		return _haixuanCards;
	 	}
		/**  海选初始化卡牌数组，json格式
		**/
		public function set haixuanCards(value:String):void
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
		/**  海选已选卡牌下标
		**/
		private var _haixuanChosenid:int;
		/**  海选已选卡牌下标
		**/
		public function get haixuanChosenid():int
	 	{
	 		return _haixuanChosenid;
	 	}
		/**  海选已选卡牌下标
		**/
		public function set haixuanChosenid(value:int):void
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
		/**  海选十连抽消耗铜币
		**/
		private var _haixuanLianxuanCost:int;
		/**  海选十连抽消耗铜币
		**/
		public function get haixuanLianxuanCost():int
	 	{
	 		return _haixuanLianxuanCost;
	 	}
		/**  海选十连抽消耗铜币
		**/
		public function set haixuanLianxuanCost(value:int):void
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
		/**  海选十连卡牌数据，json格式
		**/
		private var _haixuanShilian:String;
		/**  海选十连卡牌数据，json格式
		**/
		public function get haixuanShilian():String
	 	{
	 		return _haixuanShilian;
	 	}
		/**  海选十连卡牌数据，json格式
		**/
		public function set haixuanShilian(value:String):void
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
		/**  精选十连卡牌数据，json格式
		**/
		private var _jingxuanShilian:String;
		/**  精选十连卡牌数据，json格式
		**/
		public function get jingxuanShilian():String
	 	{
	 		return _jingxuanShilian;
	 	}
		/**  精选十连卡牌数据，json格式
		**/
		public function set jingxuanShilian(value:String):void
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
		/**  精选十连抽次数
		**/
		private var _jingxuanShilianCount:int;
		/**  精选十连抽次数
		**/
		public function get jingxuanShilianCount():int
	 	{
	 		return _jingxuanShilianCount;
	 	}
		/**  精选十连抽次数
		**/
		public function set jingxuanShilianCount(value:int):void
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
		/**  精选十连消耗元宝
		**/
		private var _jingxuanShilianCost:int;
		/**  精选十连消耗元宝
		**/
		public function get jingxuanShilianCost():int
	 	{
	 		return _jingxuanShilianCost;
	 	}
		/**  精选十连消耗元宝
		**/
		public function set jingxuanShilianCost(value:int):void
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
		/**  精选消耗元宝
		**/
		private var _jingxuanCost:int;
		/**  精选消耗元宝
		**/
		public function get jingxuanCost():int
	 	{
	 		return _jingxuanCost;
	 	}
		/**  精选消耗元宝
		**/
		public function set jingxuanCost(value:int):void
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
		/**  精选获得卡牌xid
		**/
		private var _jingxuanXid:int;
		/**  精选获得卡牌xid
		**/
		public function get jingxuanXid():int
	 	{
	 		return _jingxuanXid;
	 	}
		/**  精选获得卡牌xid
		**/
		public function set jingxuanXid(value:int):void
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
		/**  精选次数
		**/
		private var _jingxuanCount:int;
		/**  精选次数
		**/
		public function get jingxuanCount():int
	 	{
	 		return _jingxuanCount;
	 	}
		/**  精选次数
		**/
		public function set jingxuanCount(value:int):void
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
		/**  分解枪的id数组，json格式
		**/
		private var _fenjieXids:String;
		/**  分解枪的id数组，json格式
		**/
		public function get fenjieXids():String
	 	{
	 		return _fenjieXids;
	 	}
		/**  分解枪的id数组，json格式
		**/
		public function set fenjieXids(value:String):void
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
		public static const Attributes:Array=["haixuanFreshTime","jingxuanFreshTime","haixuanCards","haixuanChosenid","haixuanLianxuanCost","haixuanShilian","jingxuanShilian","jingxuanShilianCount","jingxuanShilianCost","jingxuanCost","jingxuanXid","jingxuanCount","fenjieXids"];
	}
}