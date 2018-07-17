package com.fish.modules.core.gameVO
{

	/** 战斗数据
	**/
	public class CopyVO extends BaseVo
	{
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
		/**  当天挑战次数
		**/
		private var _count:int;
		/**  当天挑战次数
		**/
		public function get count():int
	 	{
	 		return _count;
	 	}
		/**  当天挑战次数
		**/
		public function set count(value:int):void
		{
			if(initFlag){
				if(_count!=value){
					var old:int=_count;
					_count=value;
					onChangeAttr("count",_count,old);
				}
			}else{
				_count=value;
			}
		}
		/**  副本挑战状态，1：过了，0：没过
		**/
		private var _status:int;
		/**  副本挑战状态，1：过了，0：没过
		**/
		public function get status():int
	 	{
	 		return _status;
	 	}
		/**  副本挑战状态，1：过了，0：没过
		**/
		public function set status(value:int):void
		{
			if(initFlag){
				if(_status!=value){
					var old:int=_status;
					_status=value;
					onChangeAttr("status",_status,old);
				}
			}else{
				_status=value;
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
		/**  
		**/
		private var _dropItem:String;
		/**  
		**/
		public function get dropItem():String
	 	{
	 		return _dropItem;
	 	}
		/**  
		**/
		public function set dropItem(value:String):void
		{
			if(initFlag){
				if(_dropItem!=value){
					var old:String=_dropItem;
					_dropItem=value;
					onChangeAttr("dropItem",_dropItem,old);
				}
			}else{
				_dropItem=value;
			}
		}
		/**  收集item 掉落 json数组
		**/
		private var _dropCollectItems:String;
		/**  收集item 掉落 json数组
		**/
		public function get dropCollectItems():String
	 	{
	 		return _dropCollectItems;
	 	}
		/**  收集item 掉落 json数组
		**/
		public function set dropCollectItems(value:String):void
		{
			if(initFlag){
				if(_dropCollectItems!=value){
					var old:String=_dropCollectItems;
					_dropCollectItems=value;
					onChangeAttr("dropCollectItems",_dropCollectItems,old);
				}
			}else{
				_dropCollectItems=value;
			}
		}
		/**  副本通关的星星
		**/
		private var _stars:String;
		/**  副本通关的星星
		**/
		public function get stars():String
	 	{
	 		return _stars;
	 	}
		/**  副本通关的星星
		**/
		public function set stars(value:String):void
		{
			if(initFlag){
				if(_stars!=value){
					var old:String=_stars;
					_stars=value;
					onChangeAttr("stars",_stars,old);
				}
			}else{
				_stars=value;
			}
		}
		public static const Attributes:Array=["xid","count","status","modifyType","dropItem","dropCollectItems","stars"];
		public static const KeyAttr:String="xid";
	}
}