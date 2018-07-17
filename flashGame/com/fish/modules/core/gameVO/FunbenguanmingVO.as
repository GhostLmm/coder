package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class FunbenguanmingVO extends BaseVo
	{
		/**  副本名称
		**/
		private var _fubenNameMap:String;
		/**  副本名称
		**/
		public function get fubenNameMap():String
	 	{
	 		return _fubenNameMap;
	 	}
		/**  副本名称
		**/
		public function set fubenNameMap(value:String):void
		{
			if(initFlag){
				if(_fubenNameMap!=value){
					var old:String=_fubenNameMap;
					_fubenNameMap=value;
					onChangeAttr("fubenNameMap",_fubenNameMap,old);
				}
			}else{
				_fubenNameMap=value;
			}
		}
		/**  冠名详情
		**/
		private var _guanmingDetail:String;
		/**  冠名详情
		**/
		public function get guanmingDetail():String
	 	{
	 		return _guanmingDetail;
	 	}
		/**  冠名详情
		**/
		public function set guanmingDetail(value:String):void
		{
			if(initFlag){
				if(_guanmingDetail!=value){
					var old:String=_guanmingDetail;
					_guanmingDetail=value;
					onChangeAttr("guanmingDetail",_guanmingDetail,old);
				}
			}else{
				_guanmingDetail=value;
			}
		}
		/**  副本冠名奖励领取
		**/
		private var _lingquStatus:String;
		/**  副本冠名奖励领取
		**/
		public function get lingquStatus():String
	 	{
	 		return _lingquStatus;
	 	}
		/**  副本冠名奖励领取
		**/
		public function set lingquStatus(value:String):void
		{
			if(initFlag){
				if(_lingquStatus!=value){
					var old:String=_lingquStatus;
					_lingquStatus=value;
					onChangeAttr("lingquStatus",_lingquStatus,old);
				}
			}else{
				_lingquStatus=value;
			}
		}
		public static const Attributes:Array=["fubenNameMap","guanmingDetail","lingquStatus"];
	}
}