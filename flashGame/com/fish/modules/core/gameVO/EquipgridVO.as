package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class EquipgridVO extends BaseVo
	{
		/**  
		**/
		private var _gridQiang:String;
		/**  
		**/
		public function get gridQiang():String
	 	{
	 		return _gridQiang;
	 	}
		/**  
		**/
		public function set gridQiang(value:String):void
		{
			if(initFlag){
				if(_gridQiang!=value){
					var old:String=_gridQiang;
					_gridQiang=value;
					onChangeAttr("gridQiang",_gridQiang,old);
				}
			}else{
				_gridQiang=value;
			}
		}
		/**  
		**/
		private var _gridXing:String;
		/**  
		**/
		public function get gridXing():String
	 	{
	 		return _gridXing;
	 	}
		/**  
		**/
		public function set gridXing(value:String):void
		{
			if(initFlag){
				if(_gridXing!=value){
					var old:String=_gridXing;
					_gridXing=value;
					onChangeAttr("gridXing",_gridXing,old);
				}
			}else{
				_gridXing=value;
			}
		}
		/**  
		**/
		private var _gridBaoshi:String;
		/**  
		**/
		public function get gridBaoshi():String
	 	{
	 		return _gridBaoshi;
	 	}
		/**  
		**/
		public function set gridBaoshi(value:String):void
		{
			if(initFlag){
				if(_gridBaoshi!=value){
					var old:String=_gridBaoshi;
					_gridBaoshi=value;
					onChangeAttr("gridBaoshi",_gridBaoshi,old);
				}
			}else{
				_gridBaoshi=value;
			}
		}
		/**  
		**/
		private var _gridRonglian:String;
		/**  
		**/
		public function get gridRonglian():String
	 	{
	 		return _gridRonglian;
	 	}
		/**  
		**/
		public function set gridRonglian(value:String):void
		{
			if(initFlag){
				if(_gridRonglian!=value){
					var old:String=_gridRonglian;
					_gridRonglian=value;
					onChangeAttr("gridRonglian",_gridRonglian,old);
				}
			}else{
				_gridRonglian=value;
			}
		}
		/**  更改类型
		**/
		private var _modifyType:int;
		/**  更改类型
		**/
		public function get modifyType():int
	 	{
	 		return _modifyType;
	 	}
		/**  更改类型
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
		public static const Attributes:Array=["gridQiang","gridXing","gridBaoshi","gridRonglian","modifyType"];
	}
}