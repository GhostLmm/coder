package com.fish.modules.core.gameVO
{

	/** 成长计划
	**/
	public class ChengzhangVO extends BaseVo
	{
		/**  是否已经购买过
		**/
		private var _hasGoumai:int;
		/**  是否已经购买过
		**/
		public function get hasGoumai():int
	 	{
	 		return _hasGoumai;
	 	}
		/**  是否已经购买过
		**/
		public function set hasGoumai(value:int):void
		{
			if(initFlag){
				if(_hasGoumai!=value){
					var old:int=_hasGoumai;
					_hasGoumai=value;
					onChangeAttr("hasGoumai",_hasGoumai,old);
				}
			}else{
				_hasGoumai=value;
			}
		}
		/**  奖励领取情况
		**/
		private var _lingquMsg:String;
		/**  奖励领取情况
		**/
		public function get lingquMsg():String
	 	{
	 		return _lingquMsg;
	 	}
		/**  奖励领取情况
		**/
		public function set lingquMsg(value:String):void
		{
			if(initFlag){
				if(_lingquMsg!=value){
					var old:String=_lingquMsg;
					_lingquMsg=value;
					onChangeAttr("lingquMsg",_lingquMsg,old);
				}
			}else{
				_lingquMsg=value;
			}
		}
		public static const Attributes:Array=["hasGoumai","lingquMsg"];
	}
}