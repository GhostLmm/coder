package com.fish.modules.core.gameVO
{

	/** 聊天
	**/
	public class BanghuichatVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _chatInfo;
	 	}

		**/

		{
			if(initFlag){
				if(_chatInfo!=value){
					var old:String=_chatInfo;
					_chatInfo=value;
					onChangeAttr("chatInfo",_chatInfo,old);
				}
			}else{
				_chatInfo=value;
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
	 		return _id;
	 	}

		**/

		{
			if(initFlag){
				if(_id!=value){
					var old:Number=_id;
					_id=value;
					onChangeAttr("id",_id,old);
				}
			}else{
				_id=value;
			}
		}



}