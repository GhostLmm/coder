package com.fish.modules.core.gameVO
{

	/** 魔女塔排行榜
	**/
	public class HongbaoVO extends BaseVo
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
		/**  用户名
		**/
		private var _userName:String;
		/**  用户名
		**/
		public function get userName():String
	 	{
	 		return _userName;
	 	}
		/**  用户名
		**/
		public function set userName(value:String):void
		{
			if(initFlag){
				if(_userName!=value){
					var old:String=_userName;
					_userName=value;
					onChangeAttr("userName",_userName,old);
				}
			}else{
				_userName=value;
			}
		}
		/**  剩余数量
		**/
		private var _leftCount:int;
		/**  剩余数量
		**/
		public function get leftCount():int
	 	{
	 		return _leftCount;
	 	}
		/**  剩余数量
		**/
		public function set leftCount(value:int):void
		{
			if(initFlag){
				if(_leftCount!=value){
					var old:int=_leftCount;
					_leftCount=value;
					onChangeAttr("leftCount",_leftCount,old);
				}
			}else{
				_leftCount=value;
			}
		}
		/**  充值金额
		**/
		private var _chongzhiCash:int;
		/**  充值金额
		**/
		public function get chongzhiCash():int
	 	{
	 		return _chongzhiCash;
	 	}
		/**  充值金额
		**/
		public function set chongzhiCash(value:int):void
		{
			if(initFlag){
				if(_chongzhiCash!=value){
					var old:int=_chongzhiCash;
					_chongzhiCash=value;
					onChangeAttr("chongzhiCash",_chongzhiCash,old);
				}
			}else{
				_chongzhiCash=value;
			}
		}
		public static const Attributes:Array=["id","userName","leftCount","chongzhiCash"];
		public static const KeyAttr:String="id";
	}
}