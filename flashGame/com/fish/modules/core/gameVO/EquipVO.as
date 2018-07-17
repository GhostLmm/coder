package com.fish.modules.core.gameVO
{

	/** 装备数据
	**/
	public class EquipVO extends BaseVo
	{
		/**  唯一id
		**/
		private var _id:Number;
		/**  唯一id
		**/
		public function get id():Number
	 	{
	 		return _id;
	 	}
		/**  唯一id
		**/
		public function set id(value:Number):void
		{
			if(initFlag){
				if(_id!=value){
					var old:Number=_id;
					_id=value;
					onChangeAttr("id",_id,old);
				}
			}else{
				_id=value;
			}
		}
		/**  对应xml的id
		**/
		private var _xid:int;
		/**  对应xml的id
		**/
		public function get xid():int
	 	{
	 		return _xid;
	 	}
		/**  对应xml的id
		**/
		public function set xid(value:int):void
		{
			if(initFlag){
				if(_xid!=value){
					var old:int=_xid;
					_xid=value;
					onChangeAttr("xid",_xid,old);
				}
			}else{
				_xid=value;
			}
		}
		/**  装备等级
		**/
		private var _level:int;
		/**  装备等级
		**/
		public function get level():int
	 	{
	 		return _level;
	 	}
		/**  装备等级
		**/
		public function set level(value:int):void
		{
			if(initFlag){
				if(_level!=value){
					var old:int=_level;
					_level=value;
					onChangeAttr("level",_level,old);
				}
			}else{
				_level=value;
			}
		}
		/**  装备上的英雄id
		**/
		private var _heroId:int;
		/**  装备上的英雄id
		**/
		public function get heroId():int
	 	{
	 		return _heroId;
	 	}
		/**  装备上的英雄id
		**/
		public function set heroId(value:int):void
		{
			if(initFlag){
				if(_heroId!=value){
					var old:int=_heroId;
					_heroId=value;
					onChangeAttr("heroId",_heroId,old);
				}
			}else{
				_heroId=value;
			}
		}
		/**  修改标志： 0：正常， -1：删除， 1：添加
		**/
		private var _modifyType:int;
		/**  修改标志： 0：正常， -1：删除， 1：添加
		**/
		public function get modifyType():int
	 	{
	 		return _modifyType;
	 	}
		/**  修改标志： 0：正常， -1：删除， 1：添加
		**/
		public function set modifyType(value:int):void
		{
			if(initFlag){
				if(_modifyType!=value){
					var old:int=_modifyType;
					_modifyType=value;
					onChangeAttr("modifyType",_modifyType,old);
				}
			}else{
				_modifyType=value;
			}
		}
		/**  创建时间
		**/
		private var _createTime:Number;
		/**  创建时间
		**/
		public function get createTime():Number
	 	{
	 		return _createTime;
	 	}
		/**  创建时间
		**/
		public function set createTime(value:Number):void
		{
			if(initFlag){
				if(_createTime!=value){
					var old:Number=_createTime;
					_createTime=value;
					onChangeAttr("createTime",_createTime,old);
				}
			}else{
				_createTime=value;
			}
		}
		/**  神装xid
		**/
		private var _shenzhuangXid:int;
		/**  神装xid
		**/
		public function get shenzhuangXid():int
	 	{
	 		return _shenzhuangXid;
	 	}
		/**  神装xid
		**/
		public function set shenzhuangXid(value:int):void
		{
			if(initFlag){
				if(_shenzhuangXid!=value){
					var old:int=_shenzhuangXid;
					_shenzhuangXid=value;
					onChangeAttr("shenzhuangXid",_shenzhuangXid,old);
				}
			}else{
				_shenzhuangXid=value;
			}
		}
		/**  神装经验值
		**/
		private var _shenzhuangExp:int;
		/**  神装经验值
		**/
		public function get shenzhuangExp():int
	 	{
	 		return _shenzhuangExp;
	 	}
		/**  神装经验值
		**/
		public function set shenzhuangExp(value:int):void
		{
			if(initFlag){
				if(_shenzhuangExp!=value){
					var old:int=_shenzhuangExp;
					_shenzhuangExp=value;
					onChangeAttr("shenzhuangExp",_shenzhuangExp,old);
				}
			}else{
				_shenzhuangExp=value;
			}
		}
		public static const Attributes:Array=["id","xid","level","heroId","modifyType","createTime","shenzhuangXid","shenzhuangExp"];
		public static const KeyAttr:String="id";
	}
}