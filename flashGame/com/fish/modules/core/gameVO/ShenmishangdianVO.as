package com.fish.modules.core.gameVO
{

	/** 神秘商店
	**/
	public class ShenmishangdianVO extends BaseVo
	{
		/**  下次刷新时间
		**/
		private var _refreshTime:Number;
		/**  下次刷新时间
		**/
		public function get refreshTime():Number
	 	{
	 		return _refreshTime;
	 	}
		/**  下次刷新时间
		**/
		public function set refreshTime(value:Number):void
		{
			if(initFlag){
				if(_refreshTime!=value){
					var old:Number=_refreshTime;
					_refreshTime=value;
					onChangeAttr("refreshTime",_refreshTime,old);
				}
			}else{
				_refreshTime=value;
			}
		}
		/**  可以购买的item，json格式
		**/
		private var _goumaiItems:String;
		/**  可以购买的item，json格式
		**/
		public function get goumaiItems():String
	 	{
	 		return _goumaiItems;
	 	}
		/**  可以购买的item，json格式
		**/
		public function set goumaiItems(value:String):void
		{
			if(initFlag){
				if(_goumaiItems!=value){
					var old:String=_goumaiItems;
					_goumaiItems=value;
					onChangeAttr("goumaiItems",_goumaiItems,old);
				}
			}else{
				_goumaiItems=value;
			}
		}
		/**  购买过的items
		**/
		private var _buyItems:String;
		/**  购买过的items
		**/
		public function get buyItems():String
	 	{
	 		return _buyItems;
	 	}
		/**  购买过的items
		**/
		public function set buyItems(value:String):void
		{
			if(initFlag){
				if(_buyItems!=value){
					var old:String=_buyItems;
					_buyItems=value;
					onChangeAttr("buyItems",_buyItems,old);
				}
			}else{
				_buyItems=value;
			}
		}
		/**  已经刷新的次数
		**/
		private var _shuaxinCount:int;
		/**  已经刷新的次数
		**/
		public function get shuaxinCount():int
	 	{
	 		return _shuaxinCount;
	 	}
		/**  已经刷新的次数
		**/
		public function set shuaxinCount(value:int):void
		{
			if(initFlag){
				if(_shuaxinCount!=value){
					var old:int=_shuaxinCount;
					_shuaxinCount=value;
					onChangeAttr("shuaxinCount",_shuaxinCount,old);
				}
			}else{
				_shuaxinCount=value;
			}
		}
		public static const Attributes:Array=["refreshTime","goumaiItems","buyItems","shuaxinCount"];
	}
}