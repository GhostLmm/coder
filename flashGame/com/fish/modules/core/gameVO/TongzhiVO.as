package com.fish.modules.core.gameVO
{

	/** 通知数据
	**/
	public class TongzhiVO extends BaseVo
	{
		/**  消息的唯一id
		**/
		private var _id:int;
		/**  消息的唯一id
		**/
		public function get id():int
	 	{
	 		return _id;
	 	}
		/**  消息的唯一id
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
		/**  xml对应id
		**/
		private var _xid:int;
		/**  xml对应id
		**/
		public function get xid():int
	 	{
	 		return _xid;
	 	}
		/**  xml对应id
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
		/**  参数json数组
		**/
		private var _args:String;
		/**  参数json数组
		**/
		public function get args():String
	 	{
	 		return _args;
	 	}
		/**  参数json数组
		**/
		public function set args(value:String):void
		{
			if(initFlag){
				if(_args!=value){
					var old:String=_args;
					_args=value;
					onChangeAttr("args",_args,old);
				}
			}else{
				_args=value;
			}
		}
		/**  特殊字符串，直接用于显示
		**/
		private var _specialDesc:String;
		/**  特殊字符串，直接用于显示
		**/
		public function get specialDesc():String
	 	{
	 		return _specialDesc;
	 	}
		/**  特殊字符串，直接用于显示
		**/
		public function set specialDesc(value:String):void
		{
			if(initFlag){
				if(_specialDesc!=value){
					var old:String=_specialDesc;
					_specialDesc=value;
					onChangeAttr("specialDesc",_specialDesc,old);
				}
			}else{
				_specialDesc=value;
			}
		}
		public static const Attributes:Array=["id","xid","args","specialDesc"];
		public static const KeyAttr:String="id";
	}
}