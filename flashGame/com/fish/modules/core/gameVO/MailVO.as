package com.fish.modules.core.gameVO
{

	/** 邮件
	**/
	public class MailVO extends BaseVo
	{

		**/


		**/

	 	{
	 		return _type;
	 	}

		**/

		{
			if(initFlag){
				if(_type!=value){
					var old:int=_type;
					_type=value;
					onChangeAttr("type",_type,old);
				}
			}else{
				_type=value;
			}
		}

		**/


		**/

	 	{
	 		return _title;
	 	}

		**/

		{
			if(initFlag){
				if(_title!=value){
					var old:String=_title;
					_title=value;
					onChangeAttr("title",_title,old);
				}
			}else{
				_title=value;
			}
		}

		**/


		**/

	 	{
	 		return _cotent;
	 	}

		**/

		{
			if(initFlag){
				if(_cotent!=value){
					var old:String=_cotent;
					_cotent=value;
					onChangeAttr("cotent",_cotent,old);
				}
			}else{
				_cotent=value;
			}
		}

		**/


		**/

	 	{
	 		return _rewards;
	 	}

		**/

		{
			if(initFlag){
				if(_rewards!=value){
					var old:String=_rewards;
					_rewards=value;
					onChangeAttr("rewards",_rewards,old);
				}
			}else{
				_rewards=value;
			}
		}

		**/


		**/

	 	{
	 		return _sender;
	 	}

		**/

		{
			if(initFlag){
				if(_sender!=value){
					var old:String=_sender;
					_sender=value;
					onChangeAttr("sender",_sender,old);
				}
			}else{
				_sender=value;
			}
		}

		**/


		**/

	 	{
	 		return _senderUid;
	 	}

		**/

		{
			if(initFlag){
				if(_senderUid!=value){
					var old:int=_senderUid;
					_senderUid=value;
					onChangeAttr("senderUid",_senderUid,old);
				}
			}else{
				_senderUid=value;
			}
		}

		**/


		**/

	 	{
	 		return _sendTime;
	 	}

		**/

		{
			if(initFlag){
				if(_sendTime!=value){
					var old:Number=_sendTime;
					_sendTime=value;
					onChangeAttr("sendTime",_sendTime,old);
				}
			}else{
				_sendTime=value;
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



}