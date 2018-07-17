package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class DailytaskVO extends BaseVo
	{
		/**  任务详细
		**/
		private var _taskDetail:String;
		/**  任务详细
		**/
		public function get taskDetail():String
	 	{
	 		return _taskDetail;
	 	}
		/**  任务详细
		**/
		public function set taskDetail(value:String):void
		{
			if(initFlag){
				if(_taskDetail!=value){
					var old:String=_taskDetail;
					_taskDetail=value;
					onChangeAttr("taskDetail",_taskDetail,old);
				}
			}else{
				_taskDetail=value;
			}
		}
		/**  任务完成情况
		**/
		private var _taskFinish:String;
		/**  任务完成情况
		**/
		public function get taskFinish():String
	 	{
	 		return _taskFinish;
	 	}
		/**  任务完成情况
		**/
		public function set taskFinish(value:String):void
		{
			if(initFlag){
				if(_taskFinish!=value){
					var old:String=_taskFinish;
					_taskFinish=value;
					onChangeAttr("taskFinish",_taskFinish,old);
				}
			}else{
				_taskFinish=value;
			}
		}
		/**  月卡终止时间
		**/
		private var _yuekaEndtime:Number;
		/**  月卡终止时间
		**/
		public function get yuekaEndtime():Number
	 	{
	 		return _yuekaEndtime;
	 	}
		/**  月卡终止时间
		**/
		public function set yuekaEndtime(value:Number):void
		{
			if(initFlag){
				if(_yuekaEndtime!=value){
					var old:Number=_yuekaEndtime;
					_yuekaEndtime=value;
					onChangeAttr("yuekaEndtime",_yuekaEndtime,old);
				}
			}else{
				_yuekaEndtime=value;
			}
		}
		public static const Attributes:Array=["taskDetail","taskFinish","yuekaEndtime"];
	}
}