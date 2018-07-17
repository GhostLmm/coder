package com.ghostlmm.notificationAir
{
	import org.osflash.signals.Signal;
	
	public class NotificationAndroid implements INotification
	{
		public function NotificationAndroid()
		{
		}
		
		public function init():void
		{
		}
		
		public function get token():String
		{
			return null;
		}
		
		public function get registerCom_SN():Signal
		{
			return null;
		}
		
		public function scheduleLocalNotification(deltaSeconds:int, alertBody:String, badge:int):void
		{
		}
		
		public function clearLocalNotification():void
		{
		}
	}
}