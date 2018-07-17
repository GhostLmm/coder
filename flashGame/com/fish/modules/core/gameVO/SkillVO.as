package com.fish.modules.core.gameVO
{

	/** 技能数据
	**/
	public class SkillVO extends BaseVo
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
		/**  技能等级
		**/
		private var _level:int;
		/**  技能等级
		**/
		public function get level():int
	 	{
	 		return _level;
	 	}
		/**  技能等级
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
		/**  被使用的英雄 id
		**/
		private var _heroId:int;
		/**  被使用的英雄 id
		**/
		public function get heroId():int
	 	{
	 		return _heroId;
	 	}
		/**  被使用的英雄 id
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
		/**  位置id
		**/
		private var _posId:int;
		/**  位置id
		**/
		public function get posId():int
	 	{
	 		return _posId;
	 	}
		/**  位置id
		**/
		public function set posId(value:int):void
		{
			if(initFlag){
				if(_posId!=value){
					var old:int=_posId;
					_posId=value;
					onChangeAttr("posId",_posId,old);
				}
			}else{
				_posId=value;
			}
		}
		/**  技能经验
		**/
		private var _exp:int;
		/**  技能经验
		**/
		public function get exp():int
	 	{
	 		return _exp;
	 	}
		/**  技能经验
		**/
		public function set exp(value:int):void
		{
			if(initFlag){
				if(_exp!=value){
					var old:int=_exp;
					_exp=value;
					onChangeAttr("exp",_exp,old);
				}
			}else{
				_exp=value;
			}
		}
		public static const Attributes:Array=["id","xid","level","heroId","modifyType","posId","exp"];
		public static const KeyAttr:String="id";
	}
}