package com.fish.modules.core.gameVO
{

	/** 邮件
	**/
	public class TaskVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _id;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _modifyType;
	 	}

		**/

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

		**/


		**/

	 	{
	 		return _hasComplete;
	 	}

		**/

		{
			if(initFlag){
				if(_hasComplete!=value){
					var old:int=_hasComplete;
					_hasComplete=value;
					onChangeAttr("hasComplete",_hasComplete,old);
				}
			}else{
				_hasComplete=value;
			}
		}

		**/


		**/

	 	{
	 		return _info;
	 	}

		**/

		{
			if(initFlag){
				if(_info!=value){
					var old:String=_info;
					_info=value;
					onChangeAttr("info",_info,old);
				}
			}else{
				_info=value;
			}
		}



}