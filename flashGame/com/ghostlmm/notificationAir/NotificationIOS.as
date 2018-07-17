package com.ghostlmm.notificationAir
{
	import com.pushwoosh.nativeExtensions.PushNotification;
	import com.pushwoosh.nativeExtensions.PushNotificationEvent;
	
	import org.osflash.signals.Signal;
	
	public class NotificationIOS implements INotification
	{
		private var pushwoosh:PushNotification;
		private var _registerCom_SN:Signal=new Signal();
		public function NotificationIOS()
		{
			
		}
		
		public function init():void{
			if(pushwoosh==null){
				pushwoosh = PushNotification.getInstance();
				pushwoosh.addEventListener(PushNotificationEvent.PERMISSION_GIVEN_WITH_TOKEN_EVENT, onToken);
				pushwoosh.addEventListener(PushNotificationEvent.PERMISSION_REFUSED_EVENT, onError);
				pushwoosh.addEventListener(PushNotificationEvent.PUSH_NOTIFICATION_RECEIVED_EVENT, onPushReceived);
				
				//Important! must call this functions after callbacks have been set. It will trigger all pending push notifications to be delivered.
				pushwoosh.onDeviceReady();
				
				//register for push
				pushwoosh.registerForPushNotification();
			}
		}
		
		
		public function onToken(e:PushNotificationEvent):void{
			trace( "\n TOKEN received: " + e.token + " ");
			_registerCom_SN.dispatch();
		}
		
		public function onError(e:PushNotificationEvent):void{
			trace( "\n TOKEN error: " + e.errorMessage+ " ");
		}
		
		public function onPushReceived(e:PushNotificationEvent):void{
			trace( "\n Push Received: " + JSON.stringify(e.parameters) + " ");
		}
		
		public function get token():String
		{
			if(pushwoosh){
				return pushwoosh.getPushToken();
			}
			return null;
		}
		
		public function get registerCom_SN():Signal
		{
			return _registerCom_SN;
		}
		
		public function scheduleLocalNotification(deltaSeconds:int, alertBody:String, badge:int):void
		{
			if(pushwoosh){
				var data:Object={};
				data.alertBody=alertBody;
				data.badge=badge;
				pushwoosh.scheduleLocalNotification(deltaSeconds,JSON.stringify(data));
			}
		}
		
		public function clearLocalNotification():void
		{
			if(pushwoosh){
				pushwoosh.clearLocalNotifications();
			}
		}
	}
}