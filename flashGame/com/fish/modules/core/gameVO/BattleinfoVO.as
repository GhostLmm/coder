package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class BattleinfoVO extends BaseVo
	{
		/**  主英雄血量
		**/
		private var _heroHp:int;
		/**  主英雄血量
		**/
		public function get heroHp():int
	 	{
	 		return _heroHp;
	 	}
		/**  主英雄血量
		**/
		public function set heroHp(value:int):void
		{
			if(initFlag){
				if(_heroHp!=value){
					var old:int=_heroHp;
					_heroHp=value;
					onChangeAttr("heroHp",_heroHp,old);
				}
			}else{
				_heroHp=value;
			}
		}
		/**  可用技能id
		**/
		private var _skillAvailable:String;
		/**  可用技能id
		**/
		public function get skillAvailable():String
	 	{
	 		return _skillAvailable;
	 	}
		/**  可用技能id
		**/
		public function set skillAvailable(value:String):void
		{
			if(initFlag){
				if(_skillAvailable!=value){
					var old:String=_skillAvailable;
					_skillAvailable=value;
					onChangeAttr("skillAvailable",_skillAvailable,old);
				}
			}else{
				_skillAvailable=value;
			}
		}
		/**  技能cd相关信息
		**/
		private var _skillCD:String;
		/**  技能cd相关信息
		**/
		public function get skillCD():String
	 	{
	 		return _skillCD;
	 	}
		/**  技能cd相关信息
		**/
		public function set skillCD(value:String):void
		{
			if(initFlag){
				if(_skillCD!=value){
					var old:String=_skillCD;
					_skillCD=value;
					onChangeAttr("skillCD",_skillCD,old);
				}
			}else{
				_skillCD=value;
			}
		}
		public static const Attributes:Array=["heroHp","skillAvailable","skillCD"];
	}
}