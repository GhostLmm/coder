package com.fish.modules.core.gameVO
{

	/** 道具
	**/
	public class ItemVO extends BaseVo
	{
		/**  道具id，对应xml的id
		**/
		private var _xid:int;
		/**  道具id，对应xml的id
		**/
		public function get xid():int
	 	{
	 		return _xid;
	 	}
		/**  道具id，对应xml的id
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
		/**  道具数量
		**/
		private var _num:int;
		/**  道具数量
		**/
		public function get num():int
	 	{
	 		return _num;
	 	}
		/**  道具数量
		**/
		public function set num(value:int):void
		{
			if(initFlag){
				if(_num!=value){
					var old:int=_num;
					_num=value;
					onChangeAttr("num",_num,old);
				}
			}else{
				_num=value;
			}
		}
		public static const Attributes:Array=["xid","num"];
		public static const KeyAttr:String="xid";
	}
}