package Tool.payment
{
	import com.alipay.ane.AlipayExtension;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.StatusEvent;
	
	import org.osflash.signals.Signal;

	public class AlipayPay implements IPayment
	{
		
		
		public static  var DEFAULT_PARTNER:String = "2088901022676171";
		
		public static  var DEFAULT_SELLER:String = "2088901022676171";
		
		public static  var PRIVATE:String ="MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAMyKGI2rQa93JF0P"+
			"aGhwsGjp6AjJs1mr/v0fhqDLT7fphsjEsFAACiaHOH6G8wUOoA00s6KOb/sh+qPQ"+
			"DV8wilNW/NJwYqjT+THtGuRfyiS00EAKC5fDgHkz/G8wOsSeP9w7N/Umjt5MJLE1"+
			"to1TI9ejavUQ0UhhufbpEgakAsV3AgMBAAECgYEAmPWE2x0BKCjfBsDpAYGUS0Dx"+
			"BvFfsGWRcNXMph6k5RI8e5OrjogZDyr8MpLU1ilTw8xvsdb3I0UL3MlP1qnEJqvI"+
			"ycBoNRxF5T46tfHh8gkp1RcPKELDvKuf0X86IdraJXYSNBMU0gfmGggku7ooGRA2"+
			"vrfGml/h1yJMlh1JsqECQQD1TpvFZ43tLsbiPfSEWhCxo0YXWl1xmZPE7CSRoyaR"+
			"64wgC0IBZ0fEcZz0x6oMpQyET6L1bFR41HX8imRwzG3ZAkEA1XSPUEgUeWWBDaRj"+
			"IpIqqnOIdZGxPJ8pIfv3bQDFCoWkK7ljACsKRFZqewuDSPuIarDPbLdV+MZLJz4Y"+
			"mEarzwJBAOJ7vV45CdSeh4mC4isAbMFVmfUdvYCQ5tm9nNXJ6GZ5L1q2ii55iM1a"+
			"iCuH3PzntfLDBBXL+wHER1ru+2UZmaECP18NiMQ3VOa6TL3Gdl7uuBEvYZT5S/Oy"+
			"7J41lfj0XspQuMq/w1ZP1EKaONCST+QwHo9kLPo8qgweQVk4TbuBvQJBAOLg/2CK"+
			"jbpCYi+MD2hDWO96UM9tSpHWIYkkHBu4URk8hqpGKm7XT7R6Q/2te2ff0NV5jUAE"+
			"Xz3chm7GfQH0beA=";
		
		public static  var PUBLIC:String ="MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRA"+
			"FljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQE"+
			"B/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5Ksi"+
			"NG9zpgmLCUYuLkxpLQIDAQAB";
		
		public static var notify_url:String = "http://notify.java.jpxx.org/index.jsp";
		public static var service:String = "mobile.securitypay.pay";
//		public static var return_url:String = "http://m.alipay.com";
		public static var MD5_KEY:String = "";
		public static var server:String="http://m.alipay.com";
		
		public function AlipayPay()
		{
			
		}
		
		public function init():void
		{
			AlipayExtension.getInstance().addEventListener(StatusEvent.STATUS,handler_status);
			AlipayExtension.getInstance().AlipayInit(DEFAULT_PARTNER,DEFAULT_SELLER,MD5_KEY,PRIVATE,PUBLIC,UrlConfig.alipayBackUrl,service,server);
		}
		
		public function pay(pid:int,bid:String):void
		{
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(pid);
			AlipayExtension.getInstance().AlipayPay(node.name,node.rmb,bid);
		}
		
		public function get platname():String{
			return "ali";
		}
		
		private function handler_status($evt:StatusEvent):void
		{
//			level:result = resultStatus={9000};memo={};result={partner="2088901022676171"&out_trade_no="1220192423-3210"&subject="大箱元宝"&body="ali-20131220192415-212941"&total_fee="1"&notify_url="http%3A%2F%2F210.73.220.241%2Falipay%2Fnotify"&service="mobile.securitypay.pay"&_input_charset="UTF-8"&return_url="http%3A%2F%2Fm.alipay.com"&payment_type="1"&seller_id="2088901022676171"&it_b_pay="1m"&success="true"&sign_type="RSA"&sign="meAbnILc5T8ly9/AmGzU9yp9PdL9ftoREwaGF0JH0BDrCg9fNnWKWNas9pAIFwPgNzaWqVRatlEIdgYdtzb3ZzgzRxrJaMD57GRHSbpiJoHfHFH5cOuc+Mh5bFSZTLNRaHo6ThOGaXkEGgK4+2sNfMfCmAW0cUFTPOs8PuEOvTo="}
			trace('------------------');
			trace('level:'+ $evt.level , ',code:'+$evt.code);
			if($evt.code=="AlipayPay"){
				if($evt.level.indexOf("resultStatus={9000}")!=-1){
					var temp:Array=$evt.level.split("&");
					for each(var s:String in temp){
						if(s.indexOf("body=\"")!=-1){
							var bid:String=s.slice("body=\"".length,s.length-1);
							trace("bid: "+bid);
							
							var obj:Object={bid:bid};
							_payBackSingal.dispatch(obj);
						}
					}
				}
			}
//			level:result = resultStatus={9000};memo={};result={partner="2088901022676171"&out_trade_no="1223175152-6141"&subject="大箱元宝"&body="ali-20131223175146-212941"&total_fee="1"&notify_url="http%3A%2F%2F210.73.220.241%2Falipay%2Fnotify"&service="mobile.securitypay.pay"&_input_charset="UTF-8"&return_url="http%3A%2F%2Fm.alipay.com"&payment_type="1"&seller_id="2088901022676171"&it_b_pay="1m"&success="true"&sign_type="RSA"&sign="f/f8kxEZdZGlXs2Qwbt6wn3Yy2B3Y4LImVgM7PZAQ4r+crdpHtxylpGVHwFJuThOQQ0nSC2o/zq/0E1yNoKbrVnVHEqBikRKwu6OetALLDmzHMwx6EATKxP8l5FkFD3gPoErAVPhxKsxhHyYWj13p3EuGnrQGjaF23SsDgSLroQ="} ,code:AlipayPay
		}
		
		private var _payBackSingal:Signal=new Signal(Object);
		public function get payBackSingal():Signal
		{
			return _payBackSingal;
		}
	}
}