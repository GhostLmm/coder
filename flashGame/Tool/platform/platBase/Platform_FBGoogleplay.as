package Tool.platform.platBase
{
	import Tool.Googlplay.FacebookPlat;
	import Tool.Googlplay.GoogPlayContest;
	import Tool.Googlplay.GooglePlayPlatform;
	import Tool.platform.IPlatform;
	import Tool.platform.ItemsXmlLoaderProxy;
	import Tool.platform.PlatformEvent;
	import Tool.platform.PlatformUserInfo;
	
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	import com.thor.utils.Locales;
	
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	
	/**    facebook 账号登录， googleplay 支付  自己发布的英文版本
	 * */
	public class Platform_FBGoogleplay extends EventDispatcher implements IPlatform
	{
		private var loginCom:Function;
		private var loginFail:Function;
		private var _userInfo:PlatformUserInfo;
		
		protected var ShareLinkUrl:String="";
		
		protected var itemXmlUrl:String="";
		
		private var itemArray:Array=[];
		
		private function get DetailXmlUrl():String
		{
			return EnvironmentParameter.xmlLoadPreUrl+itemXmlUrl;
		}
		
		public function Platform_FBGoogleplay()
		{
			
			initFBGP();
			
			_userInfo=new PlatformUserInfo();
			_userInfo.suportPlatUsername=true;
			_userInfo.suportPlatHeadpic=true;
			_userInfo.suportPlatFriendInfo=false;
			_userInfo.createPlatPicUrl=getPlatPicUrl;
		}
		
		protected function initFBGP():void
		{
			throw new Error("initFBGP 必须被改写");
			FacebookPlat.getInstance().setAppId(FacebookPlat.FaceBookID_EN_Googleplay_Android);
			FacebookPlat.getInstance().init();
			ShareLinkUrl="";
			itemXmlUrl="";
			GoogPlayContest.initGooglay(GoogPlayContest.GooglePlay_Facebook_En_key,GoogPlayContest.BackUrl_Facebook_En);
		}
		
		private static function getPlatPicUrl(openId:String):String
		{
			return "https://graph.facebook.com/"+openId+"/picture";
		}
		public function setLoginFn(_comFn:Function, _failFn:Function):void
		{
			loginCom=_comFn;
			loginFail=_failFn;
		}
		
		public function login():void
		{
			FacebookPlat.getInstance().login(faceBookLoginCom,faceBookLoginFail);
		}
		
		protected function faceBookLoginFail():void
		{
			if(loginFail!=null)
			{
				loginFail();
			}
		}
		
		protected function faceBookLoginCom(data:Object):void
		{
			if(null!=loginCom)
			{
				_userInfo.platUserName=data.name;
				_userInfo.platOpenId=data.openId;
				_userInfo.headPicUrl=getPlatPicUrl(_userInfo.platOpenId);
				loginCom.apply(null,[data.openId,data.token]);
			}
		}
		public function get platCode():String
		{
			return "facebook";
		}
		
		public function get suportShare():Boolean
		{
			return true;
		}
		
		public function share(title:String, comment:String, summary:String):void
		{
			FacebookPlat.getInstance().share(title,comment,summary,ShareLinkUrl,getSharePicUrl(),shareComplete,shareFailed);
		}
		private function shareComplete():void
		{
			dispatchEvent(new PlatformEvent(PlatformEvent.ShareSuccess));
		}
		private function shareFailed():void
		{
			dispatchEvent(new PlatformEvent(PlatformEvent.ShareFail));
		}
		private function getSharePicUrl():String
		{
			var random:int=(int(Math.random()*1000)%5)+1;
			return EnvironmentParameter.headPicPreUrl+"feedimg/"+"share_facebook_en_"+random+".png";
		}
		
		public function getDetailItems():void
		{
			var proxy:ItemsXmlLoaderProxy=new ItemsXmlLoaderProxy();
			proxy.startLoad(this,DetailXmlUrl);
			/*var vars:Object = {name: "gooleItem", noCache: true, onComplete: xmlLoaderComplete};
			var loader:XMLLoader = new XMLLoader(DetailXmlUrl, vars);
			loader.load();*/
		}
		
		/*private function xmlLoaderComplete(evt:Event):void
		{
			var itemXmls:XML = XML(LoaderMax.getContent("gooleItem"));
			itemArray=[];
			for each(var itemXml:XML in itemXmls.item)
			{
				var discount:Boolean=false;
				if(itemXml.@discount && int(itemXml.@discount)==1)
				{
					discount=true;
				}
				var hotSell:Boolean=false;
				if(itemXml.@hotSell && int(itemXml.@hotSell)==1)
				{
					hotSell=true;
				}
				
				itemArray.push({"productName":String(itemXml.@productName), 
					"salePrice":int(itemXml.@salePrice),
					"itemId":String(itemXml.@itemId),
					"discount":discount,
					"hotSell":hotSell
				});
			}
			
			var temp:Array=itemArray.concat([]);
			temp.sortOn("salePrice",Array.NUMERIC);
			for (var index:int=0; index<temp.length; index++)
			{
				temp[index].image="money-"+(index+1)+".png";
			}
			
			var e:PlatformEvent=new PlatformEvent(PlatformEvent.GetItemDetailComplete);
			e.data=itemArray;
			dispatchEvent(e);
		}*/
		
		public function get moneyType():String
		{
			return "$";
		}
		
		public function buyItem(itemType:String):void
		{
			GooglePlayPlatform.getInstance().buyItem(itemType);
		}
		
		public function get suportQiehuan():Boolean
		{
			return true;
		}
		
		public function zhanghaoQiehuan():void
		{
			FacebookPlat.getInstance().loginOut(loginOutCom);
		}
		
		/**  注销成功
		 * */
		private function loginOutCom():void
		{
			//			TextTipManager.getInstance().addTip(Locales.Get("zhanghaoZhuxiaoInfo"));
			GLOBAL.Message(Locales.Get("qiehuan_info_facebook"),Locales.Get("btn_ok"),exit);
		}
		private function exit():void
		{
			NativeApplication.nativeApplication.exit();
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
			return "";
		}
		
		public function getPlatKefu2():String
		{
			return Locales.Get("help_info_appstoreFB_2");
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
		
		
	}
}