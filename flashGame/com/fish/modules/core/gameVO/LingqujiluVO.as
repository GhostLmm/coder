package com.fish.modules.core.gameVO
{

	/** 魔女塔排行榜
	**/
	public class LingqujiluVO extends BaseVo
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
		/**  领取的玩家名
		**/
		private var _lingquName:String;
		/**  领取的玩家名
		**/
		public function get lingquName():String
	 	{
	 		return _lingquName;
	 	}
		/**  领取的玩家名
		**/
		public function set lingquName(value:String):void
		{
			if(initFlag){
				if(_lingquName!=value){
					var old:String=_lingquName;
					_lingquName=value;
					onChangeAttr("lingquName",_lingquName,old);
				}
			}else{
				_lingquName=value;
			}
		}
		/**  领取数量
		**/
		private var _lingquCount:int;
		/**  领取数量
		**/
		public function get lingquCount():int
	 	{
	 		return _lingquCount;
	 	}
		/**  领取数量
		**/
		public function set lingquCount(value:int):void
		{
			if(initFlag){
				if(_lingquCount!=value){
					var old:int=_lingquCount;
					_lingquCount=value;
					onChangeAttr("lingquCount",_lingquCount,old);
				}
			}else{
				_lingquCount=value;
			}
		}
		/**  充值玩家名
		**/
		private var _chongzhiName:String;
		/**  充值玩家名
		**/
		public function get chongzhiName():String
	 	{
	 		return _chongzhiName;
	 	}
		/**  充值玩家名
		**/
		public function set chongzhiName(value:String):void
		{
			if(initFlag){
				if(_chongzhiName!=value){
					var old:String=_chongzhiName;
					_chongzhiName=value;
					onChangeAttr("chongzhiName",_chongzhiName,old);
				}
			}else{
				_chongzhiName=value;
			}
		}
		public static const Attributes:Array=["id","lingquName","lingquCount","chongzhiName"];
		public static const KeyAttr:String="id";
	}
}