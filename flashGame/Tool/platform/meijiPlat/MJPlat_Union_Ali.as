package Tool.platform.meijiPlat
{
	import com.alipay.ane.AlipayExtension;
	import com.fish.modules.core.S2CHanlder;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	import flash.events.StatusEvent;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	import Tool.platform.meijiPlat.unionRegisterSdk.UnionSdk;
	import Tool.platform.meijiPlat.unionRegisterSdk.UnionSdkEvent;

	public class MJPlat_Union_Ali extends MJPlat_Union_Register
	{
		public static  var DEFAULT_PARTNER:String = "2088511817251234";
		
		public static  var DEFAULT_SELLER:String = "shanjinzhen@126.com";
		
		public static  var PRIVATE:String ="MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAOYDXqDBFvZxRIj7wOqqngaL7PvmA0AHXO71C5r9XWtf9WEC3LhlhO0sYLCVum+kY8w6VRzSshHIdZr2bQiEXD9zLEaON88wrGuJ5NNyVeoZVM6McR+Dl+QE2FSC+z8YZbtG8nVl0bhuARJICgLFIN+nTak4o951s7szsLKoKjt7AgMBAAECgYAI4gpuhOaBIAC4lZhut6YgtJizZb+sYlxpchc/phdMhUkxtO2XRXxruHIHf9DSbPPZuEr/MPfljetUz72IPaxeSDI8xYD/nJ99dazFtuBRDnq1WCGsLHzfsd/qhtwMDRcfpW9+jqPynyDkeXwAxkzvCz6COIxKiQvyv9qMdY5pEQJBAPeQyOLcS+9fFtEnVvappuM2Toilk1p88+Vp3+kmpg1kzquwiN0aPjmhd/LuJA9YTxEMoDRBPQnYhf+T30Zn2jMCQQDt2X8ckBjJbxrzYZtEV9AG6GenpkuDHsNXM8AUDsQEG6dD2nPafhnn9NVDKGLGmmhQGqdn3GbS3/t4J1AvZuGZAkATqW8a/W4We9HfGKXCf2TexNBl7+iNFkF0pfz/km87vxbe8e1cyhnJD/br11gL0/KrovoSTGAhqQ2zZ7Yi7FqbAkB4i5XHpSRa2uue1CY8IgE1rw3xwu9ceffotzqvL7iamGVSl2HGJ8j7bXO0gMBnBZS+nHOhyOt4DrrFb69NBuhpAkEA5LqKKErwbiwLcX474RaOQRPugVXDoudOODQcB0mIFVZMfUBsuejkdmgeuWD+F4J90IODqbdz+BFn51NTSbYoDw==";
		
		public static  var PUBLIC:String ="MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCnxj/9qwVfgoUh/y2W89L6BkRAFljhNhgPdyPuBV64bfQNN1PjbCzkIM6qRdKBoLPXmKKMiFYnkd6rAoprih3/PrQEB/VsW8OoM8fxn67UDYuyBTqA23MML9q1+ilIZwBC2AQ2UBVOrFXfFl75p6/B5KsiNG9zpgmLCUYuLkxpLQIDAQAB"
		
		public static function get notify_url():String {
			return PlatformManager.WEBIP + "pay/payAli/alikj.jsp";
		}
		public static var service:String = "mobile.securitypay.pay";
		//		public static var return_url:String = "http://m.alipay.com";
		public static var MD5_KEY:String = "";
		public static var server:String="http://m.alipay.com";
		
		public function MJPlat_Union_Ali()
		{
			super();
		}
		
		public override function init():void{
			super.init();
//			dispatchEvent(new UnionSdkEvent(UnionSdkEvent.LoginResult));
//			UnionSdk.instance.addEventListener(UnionSdkEvent.LoginResult,onUnionLoginSuccess);
			S2CHanlder.instance.initCom_SN.add(onGameInit);
		}
		
		private function onGameInit():void{
			AlipayExtension.getInstance().addEventListener(StatusEvent.STATUS,handler_status);
//			AlipayExtension.getInstance().AlipayInit(DEFAULT_PARTNER,DEFAULT_SELLER,MD5_KEY,PRIVATE,PUBLIC,UrlConfig.alipayBackUrl,service,server);
			
			AlipayExtension.getInstance().AlipayInit(DEFAULT_PARTNER,DEFAULT_SELLER,MD5_KEY,PRIVATE,PUBLIC,notify_url,service,server);
		}
		
//		private var aliInitFlag:Boolean=false;
//		private function onUnionLoginSuccess(evt:Event):void{
//			if(aliInitFlag){
//				return ;
//			}
//			aliInitFlag=true;
//			 
//		}
		
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
							_tempBid=bid;
							proccessBid();
//							var obj:Object={orderid:bid};
//							_payback_SN.dispatch(true,obj);
						}
					}
				}
			}
			//			level:result = resultStatus={9000};memo={};result={partner="2088901022676171"&out_trade_no="1223175152-6141"&subject="大箱元宝"&body="ali-20131223175146-212941"&total_fee="1"&notify_url="http%3A%2F%2F210.73.220.241%2Falipay%2Fnotify"&service="mobile.securitypay.pay"&_input_charset="UTF-8"&return_url="http%3A%2F%2Fm.alipay.com"&payment_type="1"&seller_id="2088901022676171"&it_b_pay="1m"&success="true"&sign_type="RSA"&sign="f/f8kxEZdZGlXs2Qwbt6wn3Yy2B3Y4LImVgM7PZAQ4r+crdpHtxylpGVHwFJuThOQQ0nSC2o/zq/0E1yNoKbrVnVHEqBikRKwu6OetALLDmzHMwx6EATKxP8l5FkFD3gPoErAVPhxKsxhHyYWj13p3EuGnrQGjaF23SsDgSLroQ="} ,code:AlipayPay
		}
		
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
//			obj[PlatExtrFlag.SpecialMacAddress]=true;
			obj[PlatExtrFlag.DontSendActiveMsg]=true;
			obj[PlatExtrFlag.HideInitFlash]=true;
			return obj;
			
		}
		
		public override function pay(pid:String, bid:String):void{
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			
			var rmb:int=node.rmb;
			CONFIG::PayTest{
				rmb=1;
			}
			AlipayExtension.getInstance().AlipayPay(node.name,rmb,bid);
		}
		
		
	}
}