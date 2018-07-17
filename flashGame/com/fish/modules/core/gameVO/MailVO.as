package com.fish.modules.core.gameVO
{

	/** 邮件
	**/
	public class MailVO extends BaseVo
	{
		/**  类型
		**/
		private var _type:int;
		/**  类型
		**/
		public function get type():int
	 	{
	 		return _type;
	 	}
		/**  类型
		**/
		public function set type(value:int):void
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
		/**  标题
		**/
		private var _title:String;
		/**  标题
		**/
		public function get title():String
	 	{
	 		return _title;
	 	}
		/**  标题
		**/
		public function set title(value:String):void
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
		/**  内容
		**/
		private var _cotent:String;
		/**  内容
		**/
		public function get cotent():String
	 	{
	 		return _cotent;
	 	}
		/**  内容
		**/
		public function set cotent(value:String):void
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
		/**  奖励 json
		**/
		private var _rewards:String;
		/**  奖励 json
		**/
		public function get rewards():String
	 	{
	 		return _rewards;
	 	}
		/**  奖励 json
		**/
		public function set rewards(value:String):void
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
		/**  发送者 名字
		**/
		private var _sender:String;
		/**  发送者 名字
		**/
		public function get sender():String
	 	{
	 		return _sender;
	 	}
		/**  发送者 名字
		**/
		public function set sender(value:String):void
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
		/**  发送者 uid
		**/
		private var _senderUid:int;
		/**  发送者 uid
		**/
		public function get senderUid():int
	 	{
	 		return _senderUid;
	 	}
		/**  发送者 uid
		**/
		public function set senderUid(value:int):void
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
		/**  发送时间
		**/
		private var _sendTime:Number;
		/**  发送时间
		**/
		public function get sendTime():Number
	 	{
	 		return _sendTime;
	 	}
		/**  发送时间
		**/
		public function set sendTime(value:Number):void
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
		/**  邮件唯一id
		**/
		private var _id:Number;
		/**  邮件唯一id
		**/
		public function get id():Number
	 	{
	 		return _id;
	 	}
		/**  邮件唯一id
		**/
		public function set id(value:Number):void
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
		public static const Attributes:Array=["type","title","cotent","rewards","sender","senderUid","sendTime","id","modifyType"];
		public static const KeyAttr:String="id";
	}
}