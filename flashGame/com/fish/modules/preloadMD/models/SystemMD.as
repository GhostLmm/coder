package com.fish.modules.preloadMD.models
{

	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Model;
	import com.ghostlmm.notificationAir.NotificationManager;
	import com.ghostlmm.xmldata.Node_push_notification;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.system.ApplicationDomain;
	
	import Tool.PersistentObj;
	import Tool.login.LoginControl;
	
	import org.osflash.signals.Signal;
	
	import util.GameTime;
	import util.SwitchManager;
	import util.Util;
	
	public class SystemMD extends Model
	{
		private static const Yinyue:String="yinyue";
		private static const Yinxiao:String="yinxiao";
		private static const PushNotification:String="pushNotification";
		private static const ShortKey:String="shortkey";
		
		private static const path:String="systemControl";
		private var localData:PersistentObj;
		
		private var m_yinyueSwitch:int;
		private var m_yinxiaoSwitch:int;
		private var m_pushSwitch:int;
		
		public var _YinyueSigal:Signal=new Signal(int);
		public var _YinxiaoSigal:Signal=new Signal(int);
		public var _PushSignal:Signal=new Signal(int);
		
		public function SystemMD()
		{
			super();
			initModel();
			S2CHanlder.instance.initCom_SN.addOnce(onGameInitComplete);
		}
		private function onGameInitComplete():void
		{
			NotificationManager.instance.init();
			if(NotificationManager.instance.getToken()==null){
				NotificationManager.instance.tokenRegisterCom_SN.addOnce(registerNotificationToken);
			}else{
				registerNotificationToken();
			}
			controlPushNotification();
		}
		
		
		private function registerNotificationToken():void{
			LoginControl.getInstance().registerPushToken(NotificationManager.instance.getToken());
		}
		
		
		public function getShortkeySwitch():Boolean{
			var switchKey:Object=localData.getValueByKey(ShortKey);
			if(null==switchKey){
				localData.setVaule(ShortKey,0);
			}
			return int(localData.getValueByKey(ShortKey))==1;
		}
		public function setShortkeySwitch(value:Boolean):void{
			localData.setVaule(ShortKey,value?1:0);
		}
		
		private function initModel():void
		{
			localData=new PersistentObj(path);
			var yinyueObj:Object=localData.getValueByKey(Yinyue);
			if(null==yinyueObj)
			{
				localData.setVaule(Yinyue,1);
				m_yinyueSwitch=1;
			}
			else
			{
				m_yinyueSwitch=int(yinyueObj);
			}
			var yinxiaoObj:Object=localData.getValueByKey(Yinxiao);
			if(null==yinxiaoObj)
			{
				localData.setVaule(Yinxiao,1);
				m_yinxiaoSwitch=1;
			}
			else
			{
				m_yinxiaoSwitch=int(yinxiaoObj);
			}
			
			var pushObj:Object=localData.getValueByKey(PushNotification);
			if(null==pushObj){
				localData.setVaule(PushNotification,1);
				m_pushSwitch=1;
			}else{
				m_pushSwitch=int(pushObj);
			}
			
			controlYinyue();
			controlYinxiao();
//			controlPushNotification();
		}
		private function controlYinyue():void
		{
			Music.changeYinyueSwitch(Boolean(m_yinyueSwitch));
		}
		private function controlYinxiao():void
		{
			Music.changeYinxiaoSwitch(Boolean(m_yinxiaoSwitch));
		}
		
		private function controlPushNotification():void
		{
			NotificationManager.instance.clearLocalNotification();
			
			if(SwitchManager.getInstance().Switch_PushNotification){
				if(m_pushSwitch==1){
					scheduleLocalNotification();
				}
			}
			
		}
		
		private function scheduleLocalNotification():void{
			
			if(Context.getInjectInstance(TimerModel)){
				var pushDay:int=XMLDataManager.getConstById("push_day").value;
				var serverDate:Date=new Date(TimerModel.instance.serverTime);
				trace(serverDate.toLocaleTimeString());
				for each(var node:Node_push_notification in XMLDataManager.Node_push_notificationArray){
					var date:Date=new Date(serverDate.time);
					var time:Array=node.time.split(":");
					date.hours=time[0];
					date.minutes=time[1];
					date.seconds=time[2];
					for (var index:int=0; index<pushDay; index++){
						date.time+=index*24*60*60*1000;
						var delta:int=(date.time-serverDate.time)/1000;
						if(delta>0){
							NotificationManager.instance.addLocalNotification(delta,node.desc,1);
							trace("添加本地通知： "+date.toTimeString()+"\t"+node.desc);
						}
					}
				}
			}
		}
		
		/**
		 *  改变音乐设置
		 */
		public function changeYinyue():void
		{
			if(m_yinyueSwitch)
			{
				m_yinyueSwitch=0;
			}
			else
			{
				m_yinyueSwitch=1;
			}
			localData.setVaule(Yinyue,m_yinyueSwitch);
			_YinyueSigal.dispatch(m_yinyueSwitch);
			controlYinyue();
		}
		/**
		 * 改变音效设置
		 */
		public function changeYinxiao():void
		{
			if(m_yinxiaoSwitch)
			{
				m_yinxiaoSwitch=0;
			}
			else
			{
				m_yinxiaoSwitch=1;
			}
			localData.setVaule(Yinxiao,m_yinxiaoSwitch);
			_YinxiaoSigal.dispatch(m_yinxiaoSwitch);
			controlYinxiao();
		}
		
		/**  改变push 设置
		 * */
		public function changePushNotification():void
		{
			if(m_pushSwitch)
			{
				m_pushSwitch=0;
			}
			else
			{
				m_pushSwitch=1;
			}
			localData.setVaule(PushNotification,m_pushSwitch);
			_PushSignal.dispatch(m_pushSwitch);
			controlPushNotification();
		}
		
		public function get yinyueSwitch():int
		{
			return m_yinyueSwitch;
		}
		public function get yinxiaoSwitch():int
		{
			return m_yinxiaoSwitch;	
		}
		public function get pushSwitch():int
		{
			return m_pushSwitch;
		}
	}
}