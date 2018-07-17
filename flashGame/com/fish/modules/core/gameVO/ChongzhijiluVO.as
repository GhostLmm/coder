package com.fish.modules.core.gameVO
{

	/** 魔女塔排行榜
	**/
	public class ChongzhijiluVO extends BaseVo
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
		/**  充值的玩家名
		**/
		private var _userChongzhi:String;
		/**  充值的玩家名
		**/
		public function get userChongzhi():String
	 	{
	 		return _userChongzhi;
	 	}
		/**  充值的玩家名
		**/
		public function set userChongzhi(value:String):void
		{
			if(initFlag){
				if(_userChongzhi!=value){
					var old:String=_userChongzhi;
					_userChongzhi=value;
					onChangeAttr("userChongzhi",_userChongzhi,old);
				}
			}else{
				_userChongzhi=value;
			}
		}
		/**  充值数量
		**/
		private var _chonghziCash:int;
		/**  充值数量
		**/
		public function get chonghziCash():int
	 	{
	 		return _chonghziCash;
	 	}
		/**  充值数量
		**/
		public function set chonghziCash(value:int):void
		{
			if(initFlag){
				if(_chonghziCash!=value){
					var old:int=_chonghziCash;
					_chonghziCash=value;
					onChangeAttr("chonghziCash",_chonghziCash,old);
				}
			}else{
				_chonghziCash=value;
			}
		}
		public static const Attributes:Array=["id","userChongzhi","chonghziCash"];
		public static const KeyAttr:String="id";
	}
}