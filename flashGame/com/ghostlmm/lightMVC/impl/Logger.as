package com.ghostlmm.lightMVC.impl
{
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.api.ILogger;
	
	import flash.utils.getTimer;
	
	public class Logger implements ILogger
	{
		private var _messageParser:LogMessageParser=new LogMessageParser();
		public function Logger()
		{
		}
		
		/**
		 * @inheritDoc
		 */
		public function debug(message:*, params:Array = null):void
		{
			if(32>Context.logLevel){
				return ;
			}
			logTrace( 32, getTimer(), message, params);
		}
		
		/**
		 * @inheritDoc
		 */
		public function info(message:*, params:Array = null):void
		{
			if(16>Context.logLevel){
				return ;
			}
			logTrace( 16, getTimer(), message, params);
		}
		
		/**
		 * @inheritDoc
		 */
		public function warn(message:*, params:Array = null):void
		{
			if(8>Context.logLevel){
				return ;
			}
			logTrace( 8, getTimer(), message, params);
		}
		
		/**
		 * @inheritDoc
		 */
		public function error(message:*, params:Array = null):void
		{
			if(4>Context.logLevel){
				return ;
			}
			logTrace( 4, getTimer(), message, params);
		}
		
		/**
		 * @inheritDoc
		 */
		public function fatal(message:*, params:Array = null):void
		{
			if(2>Context.logLevel){
				return ;
			}
			logTrace( 2, getTimer(), message, params);
		}
		
		
		/**
		 * @inheritDoc
		 */
		public function logTrace(level:uint, timestamp:int, message:String, params:Array = null):void
		{
			if(level>Context.logLevel){
				return ;
			}
			trace(timestamp // (START + timestamp)
				+ ' ' + LogLevel.NAME[level]
				+ ' ' + _messageParser.parseMessage(message, params));
		}
	}
}