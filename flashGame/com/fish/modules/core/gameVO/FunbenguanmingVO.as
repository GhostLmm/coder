package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class FunbenguanmingVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _fubenNameMap;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _guanmingDetail;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _lingquStatus;
	 	}

		**/

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


}