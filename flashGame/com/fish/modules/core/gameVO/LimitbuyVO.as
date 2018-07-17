package com.fish.modules.core.gameVO
{

	/** 限制购买数据
	**/
	public class LimitbuyVO extends BaseVo
	{
		/**  声望购买限定json
		**/
		private var _shengwangBuyItems:String;
		/**  声望购买限定json
		**/
		public function get shengwangBuyItems():String
	 	{
	 		return _shengwangBuyItems;
	 	}
		/**  声望购买限定json
		**/
		public function set shengwangBuyItems(value:String):void
		{
			if(initFlag){
				if(_shengwangBuyItems!=value){
					var old:String=_shengwangBuyItems;
					_shengwangBuyItems=value;
					onChangeAttr("shengwangBuyItems",_shengwangBuyItems,old);
				}
			}else{
				_shengwangBuyItems=value;
			}
		}
		public static const Attributes:Array=["shengwangBuyItems"];
	}
}