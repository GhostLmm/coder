package com.ghostlmm.notificationAir
{
	import org.osflash.signals.Signal;

	public class NotificationManager
	{
		public function NotificationManager()
		{
		}
		private static var _instance:NotificationManager;
		public static function get instance():NotificationManager{
			if(_instance==null) _instance=new NotificationManager();
			return _instance;
		}
		private var notifer:INotification;
		public function init():void{
			if(notifer!=null) return ;
			CONFIG::IosPush{
				notifer=new NotificationIOS();
				notifer.init();
				return ;
			}
			notifer=new NotificationMock();
			notifer.init();
			return ;
		}
		
		public function getToken():String{
			if(notifer!=null) return notifer.token;
			return null;
		}
		public function get tokenRegisterCom_SN():Signal{
			return notifer.registerCom_SN;
		}
		
		public function destory():void{
			notifer.registerCom_SN.removeAll();
		}
		public function addLocalNotification(deltaSeconds:int,alertBody:String,badge:int):void{
			if(notifer){
				notifer.scheduleLocalNotification(deltaSeconds,alertBody,badge);
			}
		}
		public function clearLocalNotification():void{
			if(notifer) notifer.clearLocalNotification();
		}
		
	}
}