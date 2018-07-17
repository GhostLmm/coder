package Tool.platform.meijiPlat
{
//	import com.ghostlmm.huawei.HuaweiSdkHelper;
	import com.fish.GLBaseData;
	import com.ghostlmm.huawei.HuaweiSdkHelper;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.StatusEvent;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;

	public class MJPlat_Huawei_Android extends Plat_Base
	{
		
		/**
		 * 联盟为应用分配的应用ID
		 */
		public static const APP_ID:String = "10176731";//"10172150";
		
		/**
		 * 浮标ID
		 */
		public static const BUO_ID:String = "900086000021200796";
		
		/**
		 * 浮标密钥
		 */
		public static const BUO_SECRET:String ="MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBANCdHpgTz4AmlPMMK0Cq94DN4e9v6WRq79POl4WOHiek1pquajUXQ0pzbSiwJvnlYOQLLIHX3QpZwt+eSG6LxxVbUXpGPa2AvbSiHZKZaOy7NwFevSpADmz5UuI7ocioX6bzK6FZY7qXGP/Vr3zz2ivbfb99RxqPcDndv4nHX5JnAgMBAAECgYEAzizq5rx1kJ8RCODXApO2B3vzN1Qwo8k4e+orQJjD3sSAQOHuH8h8/eD0Wok2DDaSOu98LlusnyU1fxKNXYwR1ZPVRPCOPNv4DMQeCxDJVdgZqZlHhqP5lQcSlv2Gx7QXlp3E+vPyqYCalNBhjcqavDnFeuUPg4esWxGnd7qp5/kCQQD99tfzgNCxA5oNAzP+sVBuC6wFb3XEq6nqfM400x7zEFViqpfxKnJOf7dkJAugts2tGhVbFGXJkSeXVen2XJobAkEA0kk2fa4CAatwBT+u7OjSu2MwkHBXD7fMKmXSgunBcFn1p34jBNSnH74cEv6IEfMJ7h3k+X2nJPVVDfVjFWStpQJBAJFv+i2luF2W3XLUQcN6kb/jiUi3ku7lC/KQNJrFyLSTxwIxBcCDeWCA/WooxkvsRA78n/w/yybKrKya89g1Ib8CQBXVvk+8gr7To1UYMLyuzDri6McGszORnSSF4B7x0MEuxiA3K8GzpwrXvaiHP2/FsbFE72Kslm9y/fruEPTGuHUCQEgLXHDQGjAh41zZqbQuHmS0AUYaB6Zj6MzslEqNfRUuvqVJzNOAqSOJLNo+P9A9V8LEEKYEwlCyOZ/7cRQhHzw=";// "MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBAK2yrlGlXXF6E+e2z8QHXB5cF+Eb434jGTf7H9AOOaSz4GceTSJakqKcrID6tntId4JbZXXhTNvMRubEXVwjlkhuH5kOLCN2dgaMzqyVtsKCf6YwR0KkRp84Cv84o9kyZDcmvPJvSNLOS+zGCzN7Iaxu7HPtauKlhGhGr3KrwWqdAgMBAAECgYAHgYEm5g5zqOLTUIMJ5YeFiFU/1QSvnrSoRqHJS9QR2fQIgLa0lVVg0YRiznK0QR1o9Kodve6kUN9/eVzPbno/9KUg3x2OYKLv7Sc3sDaLdM3u0PsTTOTmyKnLg7D8eTv12PP6N5vV5HvLLI8UCzyOvDleHBHp+Tc822scSe6aAQJBAO6Xo4LK1GRLF8oG9Ekd+AgvhAFo5V/uFNu3BxT2J99CxW4mZT+UCctbBWi18NQWo1XGXKS4AxAiA8E5kYQgW/UCQQC6Xvabbo1tKuG8WVyCRUufEZ04GUbaBcRvE/QHEXlwvbsKJAFKo6e3lF6nnYWyjzI/d5j2QYN1dKVdsHt0vxMJAkEAsSdspA+gNju/lSUmuyeCY+mL9VQChAEOAbnbi0fegRpd55Sgtt1fjFuwH3iAMaoBaw3W+gMbWx42dYEeN+GjBQJBAI7+C4IIGXSYASiM+6Br4HCEiDchla3z3NpI2eOOcbmhqN9H7sHAvQ7qRJGgF5N/sNLnRTIz49P7kmFG5gIWFFkCQDv4lcPjCffuW63qKn6exq6968v/J5IRYU0hBxV0OC6oFdZfI8QO/j8e46fwSLnsjGJDIzKRBp/8shY8N8BvNQM=";
		
		/**
		 * 支付ID
		 */
		public static const PAY_ID:String = "900086000021200796";
		
		/**
		 * 支付私钥
		 */
		public static const PAY_RSA_PRIVATE:String ="MIIBVQIBADANBgkqhkiG9w0BAQEFAASCAT8wggE7AgEAAkEAqJel4cBf4d/nug9YwHQ4hRgwweJIZ/w2mVKvXRAZQu/7cwvKYSxpYZXg5hlmxQtqqZZms0IR4E82acgd6iMjmwIDAQABAkEAiDJ6f/W5f/Ayc80SFefOATeZrAfyFo9aTGLP6I6o2blRJn7oBC5I3vvEL0+TZ5eWVEQxQeGBSVAKDqaBp+rwAQIhAPXpokOetQUjLSMTwxiG7Mqgsvu0y6odNP8TsNUTnYOBAiEAr4IP8fjmlDkgPEJrpSp+Qg58L8fUY2CcU9AXq3xUxRsCIAeMsKqayLvrpIsbJDYwjjx6SoRnvIjwdJwQIrGn9IIBAiEAisz7u0wzXwoGumF1LHx8udUm1crd53IicA5kidScXf0CIAXur251Oa1yhC3KID9PXvpXrxcrW/mDg60ap25/kR3b";// "MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEAjdeJFzQ5fFZDpIKyf5n4UpiV+aommZ3B06SAXX0U+PwsQ68+WnZpFl7YPO1YzJoFE5SuIYOM6Ux1Id0vVZ23zwIDAQABAkA850sp93aneLLatHPIbmg9rt7WsMSaOS68nWmwusCCl7/whM1S1za1gil8kWCmW0KosXG/5m8R/IoKU25C95ohAiEA1nVhMDDC2JGiDYv+MqNJr9ncLjuT8YtHJgeAM4bM/f0CIQCpUTo+IKKzvKkBSXPsV0ZHubOZ54kSGjG9hNyh8L/wuwIfLTyVQ5UFhKkzhagB9qx63p0V1Kq8ijbWyy7J3BSTKQIhAJUob4ynp217d88gbDT6NXmeSG/+nqwJ02PHla47rntdAiEAryI2K6zcq77OCSEIRT4QyuvJKHXfq/be6GrLUH20QUM=";
		
		/**
		 * 支付公钥
		 */
		public static const PAY_RSA_PUBLIC:String ="MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAKiXpeHAX+Hf57oPWMB0OIUYMMHiSGf8NplSr10QGULv+3MLymEsaWGV4OYZZsULaqmWZrNCEeBPNmnIHeojI5sCAwEAAQ==";// "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAI3XiRc0OXxWQ6SCsn+Z+FKYlfmqJpmdwdOkgF19FPj8LEOvPlp2aRZe2DztWMyaBROUriGDjOlMdSHdL1Wdt88CAwEAAQ==";

		public function MJPlat_Huawei_Android()
		{
			super();
		}
		public override function get loginPlatName():String
		{
			return "hwand";
		}
		
		public override function get payPlatName():String
		{
			return "hwand";
		}
		
		public override function get onlyPlatName():String
		{
			return "hwand";
		}
		
		public override function get osType():String{
			return Plat_Base.OS_And_Guonei;
		}
		
		public override function init():void{
//			HuaweiSdkHelper.instance.init("10176731","23","8sn8vwdw9v4e6d4oldsjsa58gtlbcvkn");
		
//			SdkMainExtension.getInstance().addEventListener(StatusEvent.STATUS, statusHandler);
//			SdkMainExtension.getInstance().doSdkInit(APP_ID,BUO_ID,BUO_SECRET,PAY_ID,PAY_RSA_PRIVATE,PAY_RSA_PUBLIC);
			GameStatus.change_SN.add(onChange);
			HuaweiSdkHelper.instance.init(APP_ID,BUO_ID,BUO_SECRET,PAY_ID,PAY_RSA_PUBLIC,PAY_RSA_PRIVATE,false);
			HuaweiSdkHelper.instance.setOnStatus(statusHandler);
			hideFloat();
		}
		
		private function onChange($status:String):void{
			if(GameStatus.status==GameStatus.ST_GameOngoing){
				showFloat();
			}else{
				hideFloat();
			}
		}
		
		private function statusHandler(code:String,data:Object):void{
			if(code=="loginResult"){
				if(data.success){
					setPlatInfo(data.userID,data.accessToken);
					exctueLoginResult(true);
					hideFloat();
				}else{
					exctueLoginResult(false);
				}
			}
			if(code=="payResult"){
				if(data.success){
					PlatformManager.getInstance().showTipAfterBuy();
				}else{
					
				}
				proccessBid();
			}
			if(code=="switchResult"){
				if(data.success){
					logout_SN.dispatch(true,{});
				}
			}
		}
		
		/*private function statusHandler(evt:StatusEvent):void{
			trace("消息返回:\t["+evt.code+"]\t"+evt.level);
			var data:Object;
			try{
				data=JSON.parse(evt.level);
			}catch(e:Error){}
			if(evt.code=="status_login"){
				if(data.code==200){
					var token:String=data.accessToken;
					var uid:String=data.userID;
					var uname:String=data.userName;
					setPlatInfo(uid,token,uname);
					exctueLoginResult(true);
				}else{
					exctueLoginResult(false);
				}
			}
			if(evt.code=="status_pay"){
				if(data.code==100){
					PlatformManager.getInstance().showTipAfterBuy();
				}
				proccessBid();
			}
		}*/
		
		public override function login():void{
//			SdkMainExtension.getInstance().doSdkLogin();
			HuaweiSdkHelper.instance.login();
			hideFloat();
		}
		
		
		public override function pay(pid:String, bid:String):void{
			
			if(_tempBid!=null){
				proccessBid();
			}
			this._tempBid=bid;
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node==null) return ;
			
			var rmb:String=node.rmb.toString()+".00";
			CONFIG::PayTest{
				rmb="0.01";
			}
//				HuaweiSdkHelper.instance.onDestory()
//			SdkMainExtension.getInstance().doSdkPay(bid,node.name,node.desc,GLBaseData.userName,bid,rmb,true);
			HuaweiSdkHelper.instance.pay(bid,rmb,node.name,node.desc,GLBaseData.userName,bid,false);
		}
		
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.ReloadAfterLogout]=true;
			obj[PlatExtrFlag.ListernExitGame]=true;
			return obj;
		}
		
		public function beforeExit():void{
			HuaweiSdkHelper.instance.onDestory();
		}
		
		
		public function showFloat():void{
			HuaweiSdkHelper.instance.showFloat();
//			SdkMainExtension.getInstance().showFloatButton();
		}
		public function hideFloat():void{
			HuaweiSdkHelper.instance.hideFloat();
//			SdkMainExtension.getInstance().hideFloatButton();
		}
		
	}
}