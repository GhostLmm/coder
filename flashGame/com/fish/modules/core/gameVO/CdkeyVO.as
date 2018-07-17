package com.fish.modules.core.gameVO
{

	/** cdkey 礼包
	**/
	public class CdkeyVO extends BaseVo
	{
		/**  cdkey礼包返回的收货数据
		**/
		private var _rewards:String;
		/**  cdkey礼包返回的收货数据
		**/
		public function get rewards():String
	 	{
	 		return _rewards;
	 	}
		/**  cdkey礼包返回的收货数据
		**/
		public function set rewards(value:String):void
		{
			if(initFlag){
				if(_rewards!=value){
					var old:String=_rewards;
					_rewards=value;
					onChangeAttr("rewards",_rewards,old);
				}
			}else{
				_rewards=value;
			}
		}
		/**  cdkey 礼包名字
		**/
		private var _name:String;
		/**  cdkey 礼包名字
		**/
		public function get name():String
	 	{
	 		return _name;
	 	}
		/**  cdkey 礼包名字
		**/
		public function set name(value:String):void
		{
			if(initFlag){
				if(_name!=value){
					var old:String=_name;
					_name=value;
					onChangeAttr("name",_name,old);
				}
			}else{
				_name=value;
			}
		}
		public static const Attributes:Array=["rewards","name"];
	}
}