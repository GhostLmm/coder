package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class ZombieVO extends BaseVo
	{
		/**  主键id
		**/
		private var _id:int;
		/**  主键id
		**/
		public function get id():int
	 	{
	 		return _id;
	 	}
		/**  主键id
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
		/**  配置文件id
		**/
		private var _xid:int;
		/**  配置文件id
		**/
		public function get xid():int
	 	{
	 		return _xid;
	 	}
		/**  配置文件id
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
		/**  僵尸等级
		**/
		private var _lv:int;
		/**  僵尸等级
		**/
		public function get lv():int
	 	{
	 		return _lv;
	 	}
		/**  僵尸等级
		**/
		public function set lv(value:int):void
		{
			if(initFlag){
				if(_lv!=value){
					var old:int=_lv;
					_lv=value;
					onChangeAttr("lv",_lv,old);
				}
			}else{
				_lv=value;
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
		/**  怪物的堆id
		**/
		private var _heapid:int;
		/**  怪物的堆id
		**/
		public function get heapid():int
	 	{
	 		return _heapid;
	 	}
		/**  怪物的堆id
		**/
		public function set heapid(value:int):void
		{
			if(initFlag){
				if(_heapid!=value){
					var old:int=_heapid;
					_heapid=value;
					onChangeAttr("heapid",_heapid,old);
				}
			}else{
				_heapid=value;
			}
		}
		public static const Attributes:Array=["id","xid","lv","modifyType","heapid"];
		public static const KeyAttr:String="id";
	}
}