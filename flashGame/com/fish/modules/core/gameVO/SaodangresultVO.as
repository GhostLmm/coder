package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class SaodangresultVO extends BaseVo
	{
		/**  等级
		**/
		private var _dropItems:String;
		/**  等级
		**/
		public function get dropItems():String
	 	{
	 		return _dropItems;
	 	}
		/**  等级
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
		/**  经验
		**/
		private var _dropCollects:String;
		/**  经验
		**/
		public function get dropCollects():String
	 	{
	 		return _dropCollects;
	 	}
		/**  经验
		**/
		public function set dropCollects(value:String):void
		{
			if(initFlag){
				if(_dropCollects!=value){
					var old:String=_dropCollects;
					_dropCollects=value;
					onChangeAttr("dropCollects",_dropCollects,old);
				}
			}else{
				_dropCollects=value;
			}
		}
		/**  
		**/
		private var _refreshTime:Number;
		/**  
		**/
		public function get refreshTime():Number
	 	{
	 		return _refreshTime;
	 	}
		/**  
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
		public static const Attributes:Array=["dropItems","dropCollects","refreshTime"];
	}
}