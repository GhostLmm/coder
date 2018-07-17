package Tool.platform
{
	import Tool.FileLog;
	import Tool.chongzhiCheck.CheckItem;
	import Tool.chongzhiCheck.ChongzhiCheckManager;
	
	import com.cc.display.ImageCache;
	import com.ghostlmm.mobage.MobageAuthorEvent;
	import com.ghostlmm.mobage.MobageDocumentType;
	import com.ghostlmm.mobage.MobageLoginEvent;
	import com.ghostlmm.mobage.MobageLogoutEvent;
	import com.ghostlmm.mobage.MobagePayEvent;
	import com.ghostlmm.mobage.MobageSdkHelper;
	import com.greensock.TweenLite;
	import com.thor.constants.FontNames;
	import com.thor.utils.EmbedFontUtil;
	import com.thor.utils.Locales;
	
	import flash.desktop.NativeApplication;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.InvokeEvent;
	import flash.events.MouseEvent;
	
	import model.login.ServerInfo;
	
	import myDisplay.ScaleManager;
	import myDisplay.global.GlobalConfig;
	import myDisplay.window.Wnd_Chongzhi_New;
	
	public class Platform_Mobage_Korea extends EventDispatcher implements IPlatform
	{
		private var _loginComfn:Function;
		private var _loginFailFn:Function;
		
		private static const appId:String= "13000303";
		private static const sandboxKey:String= "sdk_app_id:13000303";
		private static const sandboxSecret:String= "c1c7a3fc88d2fa47c68a6aa823754d87";
		private static const productKey:String= "sdk_app_id:13000303";
		private static const productSecret:String= "45cedbac65f4e815d875e70b4ee75c19"; 
		
		private var loginState:int=0;
		
		private static function get tempTokenUrl():String
		{
			return EnvironmentParameter.gamePreUrl+"mobaga/request_temporary_credential.php";
		}
		
		private static function get itemsXmlUrl():String
		{
			return EnvironmentParameter.xmlLoadPreUrl+"item_config.xml";
		}
//		private static function get verifyTokenUrl():String
//		{
//			return EnvironmentParameter.gamePreUrl+"mobaga/request_token.php";
//		}
		
		private static function get chongzhiCheckUrl():String
		{
			return EnvironmentParameter.gamePreUrl+"pay_mobaga.php";
//			return EnvironmentParameter.gamePreUrl+"pay_mobaga_test.php";
		}
		
		private var _userInfo:PlatformUserInfo;
		
		private var _verifyToken:String;
		
		private var _xmlProxy:ItemsXmlLoaderProxy;
		private static var ItemsXml:XML=
			<itemInfo>
				<item flag="0" discount="0" line3="100" line2="+送る0" line1="金貨10" itemId="test_11" productName="金貨10" salePrice="100"/>
				<item flag="0" discount="1" line3="25" line2="+送る8" line1="金貨17" itemId="redwar.25" productName="金貨25" salePrice="170"/> 
				<item flag="1" discount="1" line3="100" line2="+送る55" line1="金貨45" itemId="redwar.100" productName="金貨100" salePrice="450"/> 
				<item flag="0" discount="1" line3="250" line2="+送る165" line1="金貨85" itemId="redwar.250" productName="金貨250" salePrice="850"/> 
				<item flag="0" discount="1" line3="1000" line2="+送る740" line1="金貨260" itemId="redwar.1000" productName="金貨1000" salePrice="2600"/> 
				<item flag="2" discount="1" line3="4000" line2="+送る3200" line1="金貨800" itemId="redwar.4000" productName="金貨4000" salePrice="8000"/> 
			</itemInfo>;
		
		public function Platform_Mobage_Korea()
		{
			FileLog.log("Platform_Mobage_Korea","start 84");
			_userInfo=new PlatformUserInfo();
			_userInfo.suportPlatFriendInfo=false;
			_userInfo.suportPlatHeadpic=false;
			_userInfo.suportPlatUsername=true;
			
//			if(GLOBAL._mainLoader.cfg.platform.indexOf("sandbox")!=-1)
//			{
//				MobageSdkHelper.self.init(sandboxKey,sandboxSecret,appId,true,true);
//			}
//			else
//			{
//				MobageSdkHelper.self.init(productKey,productSecret,appId,false,false);
//			}
			
			MobageSdkHelper.self.addEventListener(MobageLoginEvent.LoginResult,onLoginComplete);
			MobageSdkHelper.self.addEventListener(MobagePayEvent.PayResult,onPayResult);
			MobageSdkHelper.self.addEventListener(MobageLogoutEvent.LogoutResult,onLgout);
			MobageSdkHelper.self.addEventListener(MobageAuthorEvent.AuthorResult,onGetauthorResult);
			ChongzhiCheckManager.instance.setCheckBackUrl(chongzhiCheckUrl);
			
			ChongzhiCheckManager.instance.setProccessHandle(processPayment);
			
			NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE,onInvoke);
			
			FileLog.log("Platform_Mobage_Korea","start 109");
			
		}
		
		private function processPayment(item:CheckItem):void{
			if(!item.success)
			{
				if(item.postObj.tid){
					MobageSdkHelper.self.cancelTransaction(item.postObj.tid);
				}
			}
		}
		
		private function onInvoke(evt:InvokeEvent):void
		{
			FileLog.log("PaltMobage onInvoke 121","loginState:"+loginState);
			if(loginState==1)
			{
				MobageSdkHelper.self.login();
			}
		}
		
		public function setClickIcon(icon:Object):void
		{
			icon.addEventListener(MouseEvent.CLICK,goForum);
		}
		
		/*private var _container:DisplayObjectContainer;
		private var _icon:Sprite;
		[Embed(source="assets/mobage_top_left.png")]
		private var iconPng:Class;
		public function setContaienr(container:DisplayObjectContainer):void
		{
			_container=container;
		}
		
		public function showIcon():void
		{
			if(_icon==null)
			{
				_icon=new Sprite();
				_icon.addChild(new iconPng() as DisplayObject);
				_icon.addEventListener(MouseEvent.CLICK,goForum);
				_icon.width=50*ScaleManager.getInstance().scaleX/30*50;
				_icon.height=50*ScaleManager.getInstance().scaleY/33*50;
			}
			if(_container!=null)
			{
				_container.addChild(_icon);
			}
		}
		public function hideIcon():void
		{
			if(_container && _icon && _container.contains(_icon))
			{
				_container.removeChild(_icon);
			}
		}*/
		
//		private var page:GONGGAO_ITEM; 
		
		public function createMobageHelpPage():DisplayObject
		{

			var page:GONGGAO_ITEM=new GONGGAO_ITEM();
			EmbedFontUtil.setText(page.help_content_1,getPlatKefu1(),FontNames.NORMAL);
			EmbedFontUtil.setText(page.help_content_2,getPlatKefu2(),FontNames.NORMAL);
			
			EmbedFontUtil.setText(page.needhelp_tf,Locales.Get("mobage_needhelp"),FontNames.NORMAL);
			EmbedFontUtil.setText(page.forum_tf,Locales.Get("mobage_forum"),FontNames.NORMAL);
			
			page.needhelp_btn.addEventListener(MouseEvent.CLICK,goHelp);
			page.forum_btn.addEventListener(MouseEvent.CLICK,goForum);
			page.helpbtn.addEventListener(MouseEvent.CLICK,goHelp);
			page.luntanbtn.addEventListener(MouseEvent.CLICK,goForum);
			return page;
		}
		
		private function onLgout(evt:MobageLogoutEvent):void
		{
			if(evt.success)
			{
				NativeApplication.nativeApplication.exit(0);
			}
		}
		
		public function goForum(evt:MouseEvent):void
		{
			MobageSdkHelper.self.launchPortalApp();
		}
		public function goHelp(evt:MouseEvent):void
		{
			MobageSdkHelper.self.openDocument(MobageDocumentType.CONTACT);
		}
		
		private function onPayResult(evt:MobagePayEvent):void
		{
			
			if(evt.success)
			{
				var obj:Object=evt.item.item;
				
				obj.openid=BASE._myOnlyUid;
				obj.uid=BASE._userID;
				
				obj.quantity  = evt.item.quantity;
				obj.comment=evt.comment;
				obj.tid=evt.tId;
				obj.description =evt.description;
				obj["serverid"]=ServerInfo.getInstance().getNowServerId();
//				obj.state="closed";
//				obj.medal=11;
			

				ChongzhiCheckManager.instance.addCheckData(obj);
			}
			else
			{
				if(evt.tId!=null)
				{
					MobageSdkHelper.self.cancelTransaction(evt.tId);
				}
				Wnd_Chongzhi_New.stopWaitForBuy();
			}
		}
		
		private function excuteLoginCom():void
		{
			if(_loginComfn!=null)
			{
				_loginComfn(_userInfo.platOpenId,_verifyToken);
			}
		}
		private function excuteLoginFail():void
		{
			if(_loginFailFn!=null)
			{
				TweenLite.delayedCall(4,_loginFailFn);
				
			}
		}
		
		private function onLoginComplete(evt:MobageLoginEvent):void
		{
			FileLog.log("PaltMobage onLoginComplete 249","success:"+evt.success+" id:"+evt.platformId);
			if(evt.success)
			{
				_userInfo.platOpenId=evt.platformId;
				_userInfo.headPicUrl=evt.picUrl;
				_userInfo.platUserName=evt.nickName;
//				_verifyToken=evt.authToken;
//				excuteLoginCom();
				getAuthor();
				loginState=2;
			}
			else
			{
				excuteLoginFail();
			}
		}
		
		private var authorCount:int=5;
		private function getAuthor():void
		{
			authorCount--;
			if(authorCount<0)
			{
				return ;
			}
			trace(tempTokenUrl+"?"+"openId="+_userInfo.platOpenId);
			FileLog.log("PaltMobage getAuthor 275",tempTokenUrl+"?"+"openId="+_userInfo.platOpenId);
			HttpRequest.getInstance().getRequest(tempTokenUrl,{openId:_userInfo.platOpenId},function(data:Object):void
			{
				trace(data);
				FileLog.log("PaltMobage getAuthor 279",data.toString());
				if(true)
				{
					try
					{
						var obj:Object=JSON.parse(data.toString());
						
						MobageSdkHelper.self.getAuthor(obj.oauth_token);
						
						ChongzhiCheckManager.instance.startPostPerChongzhi();
					}
					catch(e:Error)
					{
						getAuthor();
					}
				}
				
			});
		}
		
		private function onGetauthorResult(evt:MobageAuthorEvent):void
		{
			if(evt.success)
			{
				_verifyToken=evt.authorToken;
				excuteLoginCom();
			}
			else
			{
				getAuthor();
			}
		}
		public function setLoginFn(_comFn:Function, _failFn:Function):void
		{
			_loginComfn=_comFn;
			_loginFailFn=_failFn;
		}
		
		public function login():void
		{
			FileLog.log("Platform_Mobage_Korea login 323");
			MobageSdkHelper.self.login();
			loginState=1;
			FileLog.log("Platform_Mobage_Korea login 326");
			/*HttpRequest.getInstance().getRequest(tempTokenUrl,{},function(data:Object):void
			{
				trace(data);
				if(true)
				{
					var obj:Object=JSON.parse(data.toString());
					
					MobageSdkHelper.self.login(obj.oauth_token);
				}
				
			});*/
		}
		
		public function get platCode():String
		{
			return "mobaga";
		}
		
		public function get suportShare():Boolean
		{
			return false;
		}
		
		public function share(title:String, comment:String, summary:String):void
		{
		}
		
		public function getDetailItems():void
		{
			if(_xmlProxy==null)
			{
				_xmlProxy=new ItemsXmlLoaderProxy();
			}
			_xmlProxy.startLoad(this,itemsXmlUrl);
//			var array:Array=ItemsXmlLoaderProxy.decodeItemsXml(ItemsXml);
//			var e:PlatformEvent=new PlatformEvent(PlatformEvent.GetItemDetailComplete);
//			e.data=array;
//			this.dispatchEvent(e);
		}
		
		public function get moneyType():String
		{
			return "코인";
		}
		
		public function buyItem(itemType:String):void
		{
			MobageSdkHelper.self.pay(itemType,getCommentById(itemType));
		}
		
		private function getCommentById(itemId:String):String
		{
			return "";
		}
		
		
		public function get suportQiehuan():Boolean
		{
			return true;
		}
		
		public function zhanghaoQiehuan():void
		{
			MobageSdkHelper.self.logout();
		}
		
		public function init():void
		{
			
		}
		
		public function getPlatUserName():String
		{
			return _userInfo.platUserName;
		}
		
		public function getPlatKefu1():String
		{
			return Locales.Get("help_info_mobage_korea_1");
		}
		
		public function getPlatKefu2():String
		{
			return Locales.Get("help_info_mobage_korea_2");
		}
		
		public function get suportMoreHelp():Boolean
		{
			return false;
		}
		
		public function get suportSocialInfo():Boolean
		{
			return true;
		}
		
		public function getPlatformUserInfo():PlatformUserInfo
		{
			return _userInfo;
		}
		
		public function get ExtrFlagObj():Object
		{
			return null;
		}
		
		public function get platName():String
		{
			return "mobage_korea";
		}
		
		
	}
}