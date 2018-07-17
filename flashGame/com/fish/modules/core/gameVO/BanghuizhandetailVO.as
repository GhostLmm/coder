package com.fish.modules.core.gameVO
{

	/** 魔女塔排行榜
	**/
	public class BanghuizhandetailVO extends BaseVo
	{
		/**  目标帮会id
		**/
		private var _tid:int;
		/**  目标帮会id
		**/
		public function get tid():int
	 	{
	 		return _tid;
	 	}
		/**  目标帮会id
		**/
		public function set tid(value:int):void
		{
			if(initFlag){
				if(_tid!=value){
					var old:int=_tid;
					_tid=value;
					onChangeAttr("tid",_tid,old);
				}
			}else{
				_tid=value;
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
		/**  顺序标识
		**/
		private var _order:int;
		/**  顺序标识
		**/
		public function get order():int
	 	{
	 		return _order;
	 	}
		/**  顺序标识
		**/
		public function set order(value:int):void
		{
			if(initFlag){
				if(_order!=value){
					var old:int=_order;
					_order=value;
					onChangeAttr("order",_order,old);
				}
			}else{
				_order=value;
			}
		}
		/**  0 无 1 胜 2 负
		**/
		private var _result:int;
		/**  0 无 1 胜 2 负
		**/
		public function get result():int
	 	{
	 		return _result;
	 	}
		/**  0 无 1 胜 2 负
		**/
		public function set result(value:int):void
		{
			if(initFlag){
				if(_result!=value){
					var old:int=_result;
					_result=value;
					onChangeAttr("result",_result,old);
				}
			}else{
				_result=value;
			}
		}
		public static const Attributes:Array=["tid","banghuiName","order","result"];
		public static const KeyAttr:String="tid";
	}
}