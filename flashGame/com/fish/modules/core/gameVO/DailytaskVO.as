package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class DailytaskVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _taskDetail;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _taskFinish;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _yuekaEndtime;
	 	}

		**/

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


}