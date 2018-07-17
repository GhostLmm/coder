package
{
	import com.fish.GLBaseData;
	import com.ghostlmm.tool.HttpRequest;
	
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import Tool.ApplicationInfoDesc;
	
	import org.osflash.signals.Signal;
	
	import util.Util;
	
	import view.commontools.ServerListManager;
	import view.viewData.ServerData;
	
	public class UrlConfig
	{
		public function UrlConfig()
		{
		}
		
		
		/**
		 *    高版本 Android 测试服务器
		 */
		private static const account_forCheck_and:String="http://and-exa.wow.shanjinzhen.com:8080/pre/AccountServer";
		/**
		 *   正式版本 android 服务器
		 */
		private static const account_publish_and:String="http://and.wow.shanjinzhen.com/pre/AccountServer";
		
		private static const account_test:String="http://apple.dig.shanjinzhen.com/pre/AccountServer";
//		private static const account_test:String="http://120.24.249.95:8080/pre/AccountServer";
		
		
		private static const payUrl_Appstore_check:String="http://pay.apple.dig.shanjinzhen.com/";
		private static const payUrl_Appstore_pub:String="http://pay.apple.dig.shanjinzhen.com/";
		
		private static const payUrl_Neiwang_Check:String="http://120.24.249.95:8080/";
		private static const account_Neiwang_test:String="http://120.24.249.95:8080/pre/AccountServer";
		private static function getUrl():String{
//			if(AppstoreVerify.inVerify){
//				return account_test;
//			}else{
//				return account_test;
//			}
			return account_Neiwang_test;
		}
		
		public static function get payServerUrl():String{
//			if(AppstoreVerify.inVerify){
//				return payUrl_Appstore_check;
//			}else{
//				return payUrl_Appstore_pub;
//			}
			return payUrl_Neiwang_Check;
		}
			
		
		public static function get UnionAccountUrl():String{
			
			//如果远程动态加载swf
			if(SwitchConfig.ST_RemoteLoad){
				
				if(AppstoreVerify.inVerify){
					return GameArgRefelect.logicalServer_Check;
				}else{
					return GameArgRefelect.logicalServerUrl;
				}
			}
			// 阿里云
			return getUrl();
		}

		
		public static function get accountServerUrl():String{
			return _accountServerUrl
		}
		public static function get serverUrl():String
		{
			return _serverUrl;
		}
		public static function get port():int{
			return _port;
		}
		
		public static function get payUrl():String
		{
			return _payUrl;
		}
		
		public static function get assetUrl():String
		{
			return "Assets/";
		}
		
		public static function get annoucementUrl():String
		{
			var obj:Object={};
			//			obj.athor=GLBaseData.author;
			obj.aid=GLBaseData.accountId;
			obj.uid=GLBaseData.userId;
			obj.sid=GLBaseData.serverId;
			obj.annoucementVersion=_annoucementVersion;
			obj.random=new Date().time;
			var anouceUrl:String=Util.transArgToUrl(welcomeUrl,obj);
			trace(anouceUrl);
			return anouceUrl;
		}
		
		public static function get gonglveUrl():String
		{
			var obj:Object={};
			obj.athor=GLBaseData.author;
			obj.uid=GLBaseData.userId;
			obj.aid=GLBaseData.accountId;
			obj.sid=GLBaseData.serverId;
			obj.version=_gonglveVersion;
			var gl:String=Util.transArgToUrl(_gonglveUrl,obj);
			trace(gl);
			return gl;
		}
		
		/*public static function get xmlPreUrl():String
		{
		return assetUrl+"XML/"
		}
		
		public static function get iconPreUrl():String
		{
		return assetUrl+"Icon/";
		}
		public static function get musicPreUrl():String
		{
		return "";
		}*/
		
		//		public static var announceVersion:String="20131209";
		
		/**  xml zip 文件下载地址
		 * */
		public static function get xmlZipUrl():String
		{
			return _xmlUrl;
		}
		public static function get xmlVersion():String
		{
			return _xmlVersion;
		}
		public static function set xmlVersion(value:String):void
		{
			_xmlVersion=value;
		}
		public static function set xmlZipUrl(value:String):void
		{
			_xmlUrl=value;
		}
		
		public static function get languagerUrl():String{
			return "";
		}
		public static function get languagerVer():String
		{
			return "1";
		}
		
		/**  最开始请求的后台地址
		 * */
//		private static const _WebAddressRequestUrl:String=CoreUrl_Neiwang;
		
		public static function get WebAddressRequestUrl():String{
			//如果是统一登录接口
			if(SwitchConfig.ST_UserUnionAccount){
				var serverData:ServerData=ServerListManager.getInstance().getServerDataById(int(GLBaseData.serverId));
				return serverData.serverUrl;
			}
			return "";
//			if(Meiji.serverUrl!=null){
//				return Meiji.serverUrl;
//			}
//			return _WebAddressRequestUrl;
		}
		
		/**accountServerUrl :  账号请求地址**/
		private static var _accountServerUrl:String;
		/**serverUrl  ：  服务器地址**/
		private static var _serverUrl:String;
		
		/** socket port **/
		private static var _port:int;
		/**payUrl  ：  支付请求地址**/
		private static var _payUrl:String;
		/**xmlUrl   ： xml zip 请求地址  **/
		private static var _xmlUrl:String;
		/**annoucementUrl ： 公告 请求地址**/
		private static var _annoucementUrl:String;
		/**xmlVersion  ： xml 版本号**/
		private static var _xmlVersion:String;
		/**_huodongXmlVersion  ：活动xml 版本号**/
		private static var _huodongXmlVersion:String;
		/**_huodongXmlUrl  ：活动xml 下载地址**/
		private static var _huodongXmlUrl:String;
		/**annoucementVersion ： 公告版本号**/
		private static var _annoucementVersion:String;
		
//		public static var appstoreVerifyUrl:String;
		
		public static function get appStoreUrl():String{
			return payServerUrl + "pay/payAppStore/appstorepay.jsp";
		}
		public static function get loginVerifyUrl():String{
			return payServerUrl + "pay/LoginVerify";
		}
		public static function get orderCreaterUrl():String{
			return payServerUrl + "pay/OrderCreater";
		}
		
		/**
		 *   停服公告地址
		 */
		public static var weihuUrl:String;
		
		/**  攻略地址 
		 * */
		private static var _gonglveUrl:String;
		private static var _gonglveVersion:String;
		
		/**   支付宝验证地址
		 * */
		public static var alipayBackUrl:String;
		
		
		private static var repeateAccount:int=3;
		
		public static var requstWebResult:Signal=new Signal(Boolean);
		
		public static var apkUrl:String;
		public static var apkVersion:String;
		
		
		public static var serverListZip:String;
		public static var serverListVersion:String;
		
		public static var maxServerId:String;
		/**
		 * 服务器维护跳转地址
		 */
		public static var maintainUrl:String;
		
		/**
		 *  图片cdn服务器地址  http://oss.aliyuncs.com/testserver/Assets/PNG/
		 */
		public static var cdnCaheImg_PreUrl:String="http://http://oss.aliyuncs.com/gunzombieasset/imgs/";
		
		/**
		 *   首页公告地址
		 */
		public static var welcomeUrl:String;
		
		public static var ShowAlert_SN:Signal=new Signal(Boolean,Number,Number);
		
		public static function resetRepeateCount():void
		{
			repeateAccount=3;
		}
		public static function checkServerUsable():void
		{
			repeateAccount--;
			if(repeateAccount<0)
			{
				requstWebResult.dispatch(false);
				trace("网络错误");
				return ;
			}
			HttpRequest.getInstance().getRequest(maintainUrl,{"sid":GLBaseData.serverId},function(data:Object):void
			{
				var json:Object;
				//				try
				//				{
				trace(data);
				json=JSON.parse(String(data));
				if(json.hasOwnProperty("code"))
				{
					checkServerUsable();
				}
				else
				{
					if(json["result"]==1)
					{
						requstWebResult.dispatch(true);
					}
					else if(json["result"]==0)
					{
						var startTime:Number=json["maintainStart"];
						var endTime:Number=json["maintainEnd"];
						ShowAlert_SN.dispatch(true,startTime,endTime);
					}
					else
					{
						Util.flow("params error");
					}
				}
				//				}
				//				catch(e:Error)
				//				{
				//					checkServerUsable();
				//				}
			},30000,false,"text",true);
		}
		public static function requstWebAddress():void
		{
			repeateAccount--;
			if(repeateAccount<0){
				requstWebResult.dispatch(false);
				trace("网络错误");
				return ;
			}
			HttpRequest.getInstance().getRequest(WebAddressRequestUrl,null,function(data:Object):void{
				var json:Object;
				//				try{
				trace(data);
				json=JSON.parse(String(data));
				if(json.hasOwnProperty("code")){
					requstWebAddress();
				}else{
					_accountServerUrl=json.accountServerUrl;
					
					
					var serverTemp:Array=json.serverUrl.split(":");
					_serverUrl=serverTemp[0];
					_port=int(serverTemp[1]);
					_payUrl=json.payUrl;
					// warning
					_payUrl=_payUrl.replace("dig","web");
//					_payUrl="http://120.24.249.95:8080/web/PayServer";
					
					_annoucementUrl=json.annoucementUrl;
					
					_annoucementVersion=json.annoucementVersion;
					
					_gonglveUrl=json.gonglveUrl;
					_gonglveVersion=json.gonglveVersion;
					
					alipayBackUrl=json.alipayBackUrl;
					
					
					
					if(!SwitchConfig.ST_UserUnionAccount){
						_xmlVersion=json.xmlVersion;
						_xmlUrl=json.xmlUrl;
						apkUrl=json.appUpdateUrl;
						apkVersion=json.appVersion;
						_huodongXmlVersion=json.huodongVersion;
						/*if(json.hasOwnProperty("payServerUrl")){
							payServerUrl=json.payServerUrl;
						}*/
						_huodongXmlUrl=json.huodongXMLUrl;
						checkVersion();
					}
					requstWebResult.dispatch(true);
				}
				//				}catch(e:Error){
				//					requstWebAddress();
				//				}
			},30000,false,"text",true);
		}
		
		
		
		
		public static function checkVersion():void
		{
			if(!GunZombie.needUpdate || apkUrl==null || apkVersion==null){
				return ;
			}
			var targetId:int=ApplicationInfoDesc.handleVersionId(apkVersion);
			
			var tip:String=Util.stringFormat("检测到新版本：{0}\n请在wifi网络下下载安装。",apkVersion);
			
			if(targetId>ApplicationInfoDesc.NativeInfo.versionId){
				TopTip.showExitTip(tip,function():void{
					navigateToURL(new URLRequest(apkUrl),"_blank");
					Util.exitGame();
				},function():void{
					Util.exitGame();
				}
				);
			}
		}
		public static function get huodongXmlVersion():String
		{
			return _huodongXmlVersion;
		}
		public static function set huodongXmlVersion(_url:String):void
		{
			_huodongXmlVersion=_url;
		}
		public static function get huodongXmlUrl():String
		{
			return _huodongXmlUrl;
		}
		public static function set huodongXmlUrl(_url:String):void
		{
			_huodongXmlUrl=_url;
		}
	}
}