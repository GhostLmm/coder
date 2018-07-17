package com.fish.modules.core.gameVO
{

	/** 魔女塔排行榜
	**/
	public class BaomingbanghuiVO extends BaseVo
	{
		/**  帮会id
		**/
		private var _bid:int;
		/**  帮会id
		**/
		public function get bid():int
	 	{
	 		return _bid;
	 	}
		/**  帮会id
		**/
		public function set bid(value:int):void
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
		/**  成员数量
		**/
		private var _personNum:int;
		/**  成员数量
		**/
		public function get personNum():int
	 	{
	 		return _personNum;
	 	}
		/**  成员数量
		**/
		public function set personNum(value:int):void
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
		/**  帮会名称
		**/
		private var _banghuiName:String;
		/**  帮会名称
		**/
		public function get banghuiName():String
	 	{
	 		return _banghuiName;
	 	}
		/**  帮会名称
		**/
		public function set banghuiName(value:String):void
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
		/**  帮会等级
		**/
		private var _banghuiLevel:int;
		/**  帮会等级
		**/
		public function get banghuiLevel():int
	 	{
	 		return _banghuiLevel;
	 	}
		/**  帮会等级
		**/
		public function set banghuiLevel(value:int):void
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
		/**  帮会图标
		**/
		private var _banghuiIcon:int;
		/**  帮会图标
		**/
		public function get banghuiIcon():int
	 	{
	 		return _banghuiIcon;
	 	}
		/**  帮会图标
		**/
		public function set banghuiIcon(value:int):void
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
		/**  会长名字
		**/
		private var _huizhangName:String;
		/**  会长名字
		**/
		public function get huizhangName():String
	 	{
	 		return _huizhangName;
	 	}
		/**  会长名字
		**/
		public function set huizhangName(value:String):void
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
		/**  会长uid
		**/
		private var _huizhangUid:int;
		/**  会长uid
		**/
		public function get huizhangUid():int
	 	{
	 		return _huizhangUid;
	 	}
		/**  会长uid
		**/
		public function set huizhangUid(value:int):void
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
		public static const Attributes:Array=["bid","personNum","banghuiName","banghuiLevel","banghuiIcon","huizhangName","huizhangUid"];
		public static const KeyAttr:String="bid";
	}
}