package Tool.Googlplay
{
	import Tool.chongzhiCheck.ChongzhiCheckManager;
	
	import com.adobe.crypto.MD5;
	import com.greensock.TweenLite;
	import com.milkmangames.nativeextensions.android.AndroidIAB;
	import com.milkmangames.nativeextensions.android.events.AndroidBillingErrorEvent;
	import com.milkmangames.nativeextensions.android.events.AndroidBillingEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.TimerEvent;
	import flash.net.SharedObject;
	import flash.utils.Timer;
	
	import model.login.ServerInfo;
	
	import myDisplay.tips.TextTipManager;
	
	import org.osflash.signals.Signal;

	public class GooglePlayPlatform extends EventDispatcher
	{
		public static const InitComplete:String="initComplete";
		private static var m_instance:GooglePlayPlatform;
		//缓存购买信息
		private var so:SharedObject;
		private var untreatedPurchase:Object;
		private var timer:Timer;
		
		public var chongzhiCompleteSingel:Signal;
		public static function getInstance():GooglePlayPlatform
		{
			if(m_instance==null)
			{
				m_instance=new GooglePlayPlatform();
			}
			return m_instance;
		}
		
		
		
		/**  伪造 充值成功
		 * */
		/*private function forgeBuySuccess():void
		{
			untreatedPurchase={"test":"我的测试"};
			so.data.up=untreatedPurchase;
			so.flush();
			proccessOrder();
		}*/
		
		public function GooglePlayPlatform()
		{
			chongzhiCompleteSingel=new Signal(String);
//			timer=new Timer(10000);
//			timer.addEventListener(TimerEvent.TIMER,onTimer);

		}
		

		/*private function test():void
		{
			untreatedPurchase=turnPurchaseEventToObject(null);
			proccessOrder();
		}*/
		/**   购买
		 * */
		public function buyItem(itemID:String):void
		{
			if(GoogPlayContest.isSupport)
			{
				AndroidIAB.androidIAB.purchaseItem(itemID);
			}
			else
			{
				GoogPlayContest.traceInfo("该设备不支持google play");
				TextTipManager.getInstance().addTip("This device don't suport Googleplay");
			}
			
//			TextTipManager.getInstance().addTip("开始购买");
			GoogPlayContest.traceInfo("buy 新的:  "+itemID,true);
		}
		
		/**  处理缓存订单
		 * */
		private function proccessOrder():void
		{
			if(untreatedPurchase!=null)
			{
				requestWebPurchaseInfo();
				if(!timer.running)
				{
					timer.start();
				}
			}
		}
		
		private function onTimer(evt:TimerEvent):void
		{
			proccessOrder();
		}
		private var tick:int=0;
		private function requestWebPurchaseInfo():void
		{
			
			GoogPlayContest.traceInfo(url,true);
			GoogPlayContest.traceInfo(GoogPlayContest.postBackUrl+"  "+(tick++));
			
			HttpRequest.getInstance().postRequest(GoogPlayContest.postBackUrl,untreatedPurchase,backHandle);
			
			var url:String=GoogPlayContest.postBackUrl+"?";
			for (var key:String in untreatedPurchase)
			{
				url+=key+"="+untreatedPurchase[key];
			}
			
			
			
//			TextTipManager.getInstance().addTip("向后台发送消息  "+url);
		}
		private function backHandle(data:Object):void
		{
			
			//通信成功
			if(data!=null && (String(data).indexOf("error")!=-1 || data.indexOf("ok")!=-1))
			{
				GoogPlayContest.traceInfo("result:  "+data.toString(),true)
				
				
				untreatedPurchase=null;
				if(so!=null)
				{
					so.clear();
					so.flush();
				}
				timer.stop();
			}
			GoogPlayContest.traceInfo(data.toString());
//			TextTipManager.getInstance().addTip("result : "+data.toString());
		}
		internal function init():void
		{
			
			try
			{
				so=SharedObject.getLocal(GoogPlayContest.sharePath);
				untreatedPurchase=so.data.up;
//				untreatedPurchase=JSON.parse(so.data.purchase);
			}
			catch(e:*)
			{
				
			}
			if(AndroidIAB.isSupported())
			{
				AndroidIAB.create();
				AndroidIAB.androidIAB.addEventListener(AndroidBillingEvent.SERVICE_READY,onServiceReady);
				AndroidIAB.androidIAB.addEventListener(AndroidBillingEvent.SERVICE_NOT_SUPPORTED,onServiceUnsupported);
				
				AndroidIAB.androidIAB.startBillingService(GoogPlayContest.publicKey);
				
				
			}
			else
			{
				GoogPlayContest.traceInfo("this devices don't support google play");
			}
			ChongzhiCheckManager.instance.setCheckBackUrl(GoogPlayContest.postBackUrl);
			ChongzhiCheckManager.instance.startPostPerChongzhi();
		}
		private function initListern():void
		{
			
			AndroidIAB.androidIAB.addEventListener(AndroidBillingEvent.PURCHASE_SUCCEEDED,onPurchaseSuccess);
//			AndroidIAB.androidIAB.addEventListener(AndroidBillingEvent.PURCHASE_REFUNDED,onPurchaseRefunded);
			AndroidIAB.androidIAB.addEventListener(AndroidBillingEvent.PURCHASE_CANCELLED,onPurchaseCancelled);
			AndroidIAB.androidIAB.addEventListener(AndroidBillingEvent.PURCHASE_USER_CANCELLED,onPurchaseUserCancelled);
//			AndroidIAB.androidIAB.addEventListener(AndroidBillingEvent.PURCHASE_SUBSCRIPTION_EXPIRED,onSubscriptionExpired);
			AndroidIAB.androidIAB.addEventListener(AndroidBillingErrorEvent.PURCHASE_FAILED,onPurchaseFailed);
//			AndroidIAB.androidIAB.addEventListener(AndroidBillingEvent.TRANSACTIONS_RESTORED,onTransactionsRestored);
//			AndroidIAB.androidIAB.addEventListener(AndroidBillingErrorEvent.TRANSACTION_RESTORE_FAILED,onTransactionRestoreFailed);
		}
		
		
		
		
		/**   googleplay 可以正常使用
		 * */
		private function onServiceReady(evt:AndroidBillingEvent):void
		{
			GoogPlayContest.isSupport=true;
			GoogPlayContest.traceInfo(turnAndroidEventToString(evt));
			initListern();
			dispatchEvent(new Event(InitComplete));
		}
		/**   googleplay 不支持
		 * */
		private function onServiceUnsupported(evt:AndroidBillingEvent):void
		{
			GoogPlayContest.traceInfo("其他因素无法连接service \n"+turnAndroidEventToString(evt));
		}
			
		/**   购买成功
		 * */
		private function onPurchaseSuccess(evt:AndroidBillingEvent):void
		{
			var evtObj:Object=turnPurchaseEventToObject(evt);
			ChongzhiCheckManager.instance.addCheckData(evtObj);
			chongzhiCompleteSingel.dispatch(evtObj.productId);
		}

		private function turnPurchaseEventToObject(evt:AndroidBillingEvent):Object
		{
			
//			evtBack=
//			type:+iabPurchaseSucceeded
//			var itemId:String="redwar.20";
//			var json:String= "{\"nonce\":-4208226429778953917,\"orders\":[{\"notificationId\":\"-1523439512643675120\",\"orderId\":\"432868788897534\",\"packageName\":\"air.sincetimes.redwar.jp\",\"productId\":\"redwar.20\",\"purchaseTime\":1351737969000,\"purchaseState\":0}]}";
//			token:+
//			quantity:+1
//			signature:+W1C5J5ieK/Z8lz+8b+kMyF6H4TJkefd1FXltQRQrsIiKJahuGn9RUnW0AL0gRxSMSqHy81sJc14XDkVMhqHqfSVGUdUwnPMYeg20cpZFOEZ/Ez7ThXcZAzgVsVJ1lF9EJmtgoaBF+VUxwbHl8QCPCgzwRJLbyYWa43FxR4MbFZFEATYPsEMC8cY+uXAwEYKbuBm1McGFCr/OA0HZH3eU8vZN1EnQWYm0q0gJSMjdOInrf5TEs5GlFFtmJEmPj99+zb/uylQHGlHODYfZwmnHoKzvKsyWcgwuM8QU/JQzq3qaAFRMdjZYUvCHzhCUmjpyKK0DRGbEoklA3yVfLV1nnQ==
			
			/*var obj:Object={};
			var jsonData:Object=JSON.parse(json);

			obj.openid=BASE._myOnlyUid;
			obj.uid=BASE._userID;
			obj.productId=itemId;
			obj.purchaseDate=jsonData.orders[0].purchaseTime;
			obj.orderId=jsonData.orders[0].orderId;
			obj.signature=MD5.hash(obj.orderId+"^_^");*/
			
			
			var obj:Object={};
			var jsonData:Object=JSON.parse(evt.jsonData);
			obj.openid=BASE._myOnlyUid;
			obj.uid=BASE._userID;
			obj.productId=evt.itemId;
			obj.purchaseDate=jsonData.orders[0].purchaseTime;
			obj.orderId=jsonData.orders[0].orderId;
			
//			obj.signature=MD5.hash(obj.orderId+"^_^");

			obj["serverid"]=ServerInfo.getInstance().getNowServerId();
			obj.signature=evt.signature;
			obj.signature_data=evt.jsonData;
			
			return obj;
		}
		/**   取消购买 非用户因素
		 * */
		private function onPurchaseCancelled(evt:AndroidBillingEvent):void
		{
//			TextTipManager.getInstance().addTip("非用户因素取消购买");
			GoogPlayContest.traceInfo(turnAndroidEventToString(evt),true);
		}
		/**   取消购买 用户主动取消
		 * */
		private function onPurchaseUserCancelled(evt:AndroidBillingEvent):void
		{
//			TextTipManager.getInstance().addTip("用户因素取消购买");
			GoogPlayContest.traceInfo(turnAndroidEventToString(evt),true);
		}
		/**   由于外在原因，异常推出、 需要记录
		 * */
		private function onPurchaseFailed(evt:AndroidBillingErrorEvent):void
		{
			GoogPlayContest.traceInfo(turnErrorEventToString(evt));
		}
		private static function turnErrorEventToString(error:AndroidBillingErrorEvent):String
		{
			var ms:String="";
			ms+="errorId: "+error.errorID;
			return ms ;
		}
		/**  
		 * */
		private static function turnAndroidEventToString(evt:AndroidBillingEvent):String
		{
			
			/*
			evtBack=
				type:+iabPurchaseSucceeded
			itemId:+redwar.20
				json:+{"nonce":-4208226429778953917,"orders":[{"notificationId":"-1523439512643675120","orderId":"432868788897534","packageName":"air.sincetimes.redwar.jp","productId":"redwar.20","purchaseTime":1351737969000,"purchaseState":0}]}
					token:+
					quantity:+1
						signature:+W1C5J5ieK/Z8lz+8b+kMyF6H4TJkefd1FXltQRQrsIiKJahuGn9RUnW0AL0gRxSMSqHy81sJc14XDkVMhqHqfSVGUdUwnPMYeg20cpZFOEZ/Ez7ThXcZAzgVsVJ1lF9EJmtgoaBF+VUxwbHl8QCPCgzwRJLbyYWa43FxR4MbFZFEATYPsEMC8cY+uXAwEYKbuBm1McGFCr/OA0HZH3eU8vZN1EnQWYm0q0gJSMjdOInrf5TEs5GlFFtmJEmPj99+zb/uylQHGlHODYfZwmnHoKzvKsyWcgwuM8QU/JQzq3qaAFRMdjZYUvCHzhCUmjpyKK0DRGbEoklA3yVfLV1nnQ==
			*/
			var message:String="";
			message+="type: "+evt.type+"\n";
			message+="itemId: "+evt.itemId+"\n";
			message+="json: "+evt.jsonData+"\n";
			message+="token: "+evt.purchaseToken+"\n";
			message+="quantity: "+evt.quantity+"\n";
			message+="signature: "+evt.signature+"\n";
			var obj:Object={"type":evt.type,"itemId":evt.itemId,"json":evt.jsonData,"token":evt.purchaseToken,"quantity":evt.quantity,"signature":evt.signature};
//			HttpRequest.getInstance().getRequest("http://119.161.217.85/google.php",obj,function ():void
//			{
////				debugText.text="成功向后台发送";
//			});
			return message;
		}
	}
}