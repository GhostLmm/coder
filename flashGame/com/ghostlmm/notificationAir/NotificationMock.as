package com.ghostlmm.notificationAir
{
	import org.osflash.signals.Signal;
	
	public class NotificationMock implements INotification
	{
		private var sn:Signal=new Signal();
		public function NotificationMock()
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
			return sn;
		}
		
		public function scheduleLocalNotification(deltaSeconds:int, alertBody:String, badge:int):void
		{
		}
		
		public function clearLocalNotification():void
		{
		}
	}
}