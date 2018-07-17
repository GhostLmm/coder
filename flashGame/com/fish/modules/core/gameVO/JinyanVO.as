package com.fish.modules.core.gameVO
{

	/** 禁言
	**/
	public class JinyanVO extends BaseVo
	{
		/**  禁言开始时间
		**/
		private var _startTime:Number;
		/**  禁言开始时间
		**/
		public function get startTime():Number
	 	{
	 		return _startTime;
	 	}
		/**  禁言开始时间
		**/
		public function set startTime(value:Number):void
		{
			if(initFlag){
				if(_startTime!=value){
					var old:Number=_startTime;
					_startTime=value;
					onChangeAttr("startTime",_startTime,old);
				}
			}else{
				_startTime=value;
			}
		}
		/**  禁言结束时间
		**/
		private var _endTime:Number;
		/**  禁言结束时间
		**/
		public function get endTime():Number
	 	{
	 		return _endTime;
	 	}
		/**  禁言结束时间
		**/
		public function set endTime(value:Number):void
		{
			if(initFlag){
				if(_endTime!=value){
					var old:Number=_endTime;
					_endTime=value;
					onChangeAttr("endTime",_endTime,old);
				}
			}else{
				_endTime=value;
			}
		}
		/**  世界聊天禁言
		**/
		private var _jinyanShijie:int;
		/**  世界聊天禁言
		**/
		public function get jinyanShijie():int
	 	{
	 		return _jinyanShijie;
	 	}
		/**  世界聊天禁言
		**/
		public function set jinyanShijie(value:int):void
		{
			if(initFlag){
				if(_jinyanShijie!=value){
					var old:int=_jinyanShijie;
					_jinyanShijie=value;
					onChangeAttr("jinyanShijie",_jinyanShijie,old);
				}
			}else{
				_jinyanShijie=value;
			}
		}
		/**  帮会聊天禁言
		**/
		private var _jinyanBanghui:int;
		/**  帮会聊天禁言
		**/
		public function get jinyanBanghui():int
	 	{
	 		return _jinyanBanghui;
	 	}
		/**  帮会聊天禁言
		**/
		public function set jinyanBanghui(value:int):void
		{
			if(initFlag){
				if(_jinyanBanghui!=value){
					var old:int=_jinyanBanghui;
					_jinyanBanghui=value;
					onChangeAttr("jinyanBanghui",_jinyanBanghui,old);
				}
			}else{
				_jinyanBanghui=value;
			}
		}
		/**  禁言描述
		**/
		private var _desc:String;
		/**  禁言描述
		**/
		public function get desc():String
	 	{
	 		return _desc;
	 	}
		/**  禁言描述
		**/
		public function set desc(value:String):void
		{
			if(initFlag){
				if(_desc!=value){
					var old:String=_desc;
					_desc=value;
					onChangeAttr("desc",_desc,old);
				}
			}else{
				_desc=value;
			}
		}
		public static const Attributes:Array=["startTime","endTime","jinyanShijie","jinyanBanghui","desc"];
	}
}