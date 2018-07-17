package Tool.platform
{

	import Tool.ApplicationInfoDesc;
	import Tool.PersistentObj;
	import Tool.chongzhiCheck.ChongzhiCheckManager;
	
	import com.greensock.TweenLite;
	import com.nd.complatform.NdComPlatform;
	import com.nd.complatform.NdComPlatformEvents;
	import com.thor.constants.FontNames;
	import com.thor.utils.EmbedFontUtil;
	import com.thor.utils.Locales;
	
	import flash.desktop.NativeApplication;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	
	import model.login.ServerInfo;
	
	import myDisplay.ViewControl;
	import myDisplay.WindowManager;
	import myDisplay.global.GlobalConfig;
	import myDisplay.global.GlobalConsts;
	import myDisplay.tips.TextTipManager;
		
		public class Platform_91_V20 extends EventDispatcher implements IPlatform
		{
		private static const ItemsUrl:String="p91Items.xml";
		private static const AppId_iphone:int=104698;
		private static const AppKey_iphone:String="""";
		private static const AppId_ipad:int=106903;
		private static const AppKey_ipad:String="521267e97f81bb366669484f839bfb39d25f21f17566a977";
		private static var Orientation:int=4;
	
		private var _loginCom:Function;
		private var _loginFail:Function;
	

		[Embed(source = "assets/exit.png")]
		public static const exitPng:Class;
		
	

		private static const TryBuyPath:String="buy.data91";
		private var _tryBuyData:PersistentObj;
	

		public function get payUrl():String
		{
			return EnvironmentParameter.gamePreUrl+"pay_91.php";
		}
	
		public function Platform_91_V20()
		{
	
			
		}
	
	
	private function onStatus(evt:StatusEvent):void
	{
		var resultXml:XML=new XML(evt.level);
		trace("91返回结果: "+evt.code+"\n"+resultXml);
		switch(evt.code)
		{
			case NdComPlatformEvents.kAppVersionUpdateDidFinish:
				start91Login();
			break;
			case NdComPlatformEvents.kNdCPLoginNotification:
				analysisLogin(resultXml);
			break;
			case NdComPlatformEvents.kNdCPBuyResultNotification:
				process91Starling();
				TweenLite.delayedCall(10,onBuildAll);
				analysisBuy(resultXml);
			break;
			case NdComPlatformEvents.kNdCPLeavePlatformNotification:
				if(logoutComplete)
				{
					WindowManager.getInstance().closeWindowByName(WindowManager.ZhanghaoWindow);
					
					BASE.Save();
					
					var sp:Sprite=new Sprite();
					sp.graphics.beginFill(0,0.5);
					sp.graphics.drawRect(0,0,GLOBAL._gameSize.width,GLOBAL._gameSize.height);
					sp.graphics.endFill();
					
					GLOBAL._mainLoader.mouseChildren=false;
					var wait:waitPanel=new waitPanel();
					wait.tA.text=Locales.Get("changeId_title");
//					wait.tA1.text="";
					EmbedFontUtil.setText(wait.tA,Locales.Get("changeId_body"),FontNames.NORMAL);
					wait.x = (GLOBAL._gameSize.width - wait.width) * 0.5;
					wait.y = (GLOBAL._gameSize.height - wait.height) * 0.5;
					GLOBAL._layerWindows.addChild(sp);
					GLOBAL._mainLoader.addChild(wait);
					
					//						TweenLite.delayedCall(1,function():void
					//						{
					//							BASE.Save();
					//							GLOBAL._mainLoader.mouseChildren=false;
					//							POPUPS.DisplayCCbot(Locales.Get("changeId_title"),Locales.Get("changeId_body"),Locales.Get("btn_ok"),function():void{
					//								
					//								//						GLOBAL._mainLoader.addChild(new Bitmap(new LOGO_BACKGROUND(0,0) as BitmapData));
					//								NativeApplication.nativeApplication.exit();
					//								POPUPS.Next();
					//							});
					//							
					//						});
					(new exitPng() as Bitmap).bitmapData.getPixel(0,0);
				}
			break;
		
		}
		
	}
		private function onBuildAll(evt:Event=null):void
		{
		if(GLOBAL.spriteForPlatform )
		{
		if(GLOBAL._layerTop.contains(GLOBAL.spriteForPlatform))
		{
		GLOBAL._layerTop.removeChild(GLOBAL.spriteForPlatform);
		}
		GLOBAL.WaitHide();
		trace("隐藏等待 ： "+accountTick);
		}
		}
		
		private var accountTick:int=0;
		private function process91Starling():void
		{
		//			return;
		if(GLOBAL._gameSize.width==960)
			return;
		//			GLOBAL.spriteForPlatform=new LOGIN_BACKGROUND();
		if(GLOBAL.spriteForPlatform==null)
		{
		GLOBAL.spriteForPlatform=new LOGIN_BACKGROUND();
		}
		//			GLOBAL.WaitShow();
		GLOBAL._layerTop.addChild(GLOBAL.spriteForPlatform);
		GLOBAL.WaitShow();
		accountTick++;
		trace("显示等待："+accountTick);
		}
		
		/**    登录91账号
		 * */
		private function start91Login():void
		{
			NdComPlatform.getInstance().NdLogin(0);
		}
		
		private function getResult(xml:XML):Boolean
		{
			var result:Boolean=false;
			if(xml && xml.result )
			{
				result=(String(xml.error)=="0");
			}
			trace("result: "+result);
			return result;
		}
		
		private var logoutComplete:Boolean=false;
		/**  分析登录结果
		 * */
		private function analysisLogin(xml:XML):void
		{
			var result:Boolean=getResult(xml);
			if(qiehuanFlag)
			{
				if(result)
				{
			
				}else
				{
					logoutComplete=true;
				}
			
			return ;
			}
			
			
			if(!result)
			{
				if(_loginFail!=null)
				{
					_loginFail();
				}
			}
			else
			{
				if(_loginCom!=null)
				{
					_loginCom(NdComPlatform.getInstance().loginUin(),NdComPlatform.getInstance().sessionId());
				}
			}
		}
		
		/**   分析购买结果
		 * */
		private function analysisBuy(xml:XML):void
		{
			var result:Boolean = getResult(xml);
			
			var error:int = int(xml.error);
			
			var cooOrderSerial:String = String(xml.cooOrderSerial);
			
			var productId:String = String(xml.productId);
			
			var productName:String = String(xml.productName);
			
			var productPrice:Number = Number(xml.productPrice);
			
			var productOrignalPrice:Number = Number(xml.productOrignalPrice);
			
			var productCount:uint = uint(xml.productCount);
			
			var payDescription:String = String(xml.payDescription);
			
	
			var postArgs:Object = {};
			postArgs["receipt"] = cooOrderSerial;
			postArgs["openid"] = BASE._myOnlyUid;
			postArgs["uid"] =BASE._userID;
			postArgs["level"]=BASE.BaseLevel().level;
			postArgs["serverid"]=ServerInfo.getInstance().getNowServerId();
			
			ChongzhiCheckManager.instance.addCheckData(postArgs);


			
			if(cooOrderSerial){
			_tryBuyData.deleteKey(cooOrderSerial);
			}
		
		
		}
		
		/**  检查版本更新
		 * */
		private function checkVersion():void
		{
			NdComPlatform.getInstance().NdAppVersionUpdate(0);
		}
		
		public function setLoginFn(_comFn:Function, _failFn:Function):void
		{
			_loginCom=_comFn;
			_loginFail=_failFn;
		}
		
		public function login():void
		{
			checkVersion();
		}
		
		public function get platCode():String
		{
			return "p91";
		}
		
		public function get suportShare():Boolean
		{
			return false;
		}
		
		public function share(title:String, comment:String, summary:String):void
		{
		}
		
		
		private var _xmlProxy:ItemsXmlLoaderProxy;
		private var _itemArray:Array;
		public function getDetailItems():void
		{
			if(_xmlProxy==null)
			{
				addEventListener(PlatformEvent.GetItemDetailComplete,onLoadComplete);
				_xmlProxy=new ItemsXmlLoaderProxy();
			}
			_xmlProxy.startLoad(this,EnvironmentParameter.xmlLoadPreUrl+ItemsUrl);
		}
		
		private function onLoadComplete(evt:PlatformEvent):void
		{
			_itemArray=evt.data as Array;
		}
		
		private function createOrderGID():String
		{
			var date:Date=new Date();
			var gid:String=BASE._userID+"-"+BASE._myOnlyUid+"-"+date.fullYear+((date.month+1)<10?"0":"")+""+(date.month+1)+(date.date<10?"0":"")+""+date.date+(date.hours<10?"0":"")+""+date.hours+(date.minutes<10?"0":"")+""+date.minutes+(date.seconds<10?"0":"")+""+date.seconds+""+date.milliseconds+"-"+Math.ceil(Math.random()*1000000000);
			trace("gid:"+gid);
			return gid;
		}
		
		public function get moneyType():String
		{
			return "91豆";
		}
		
		public function buyItem(itemType:String):void
		{
			if(_itemArray==null) return ;
			var obj:Object=getItemById(itemType);
			if(obj==null) return ;

		
			var num:int=int(String(obj.productName).replace("勋章",""));
			trace("勋章数量： "+num);
			var productName:String=num+"勋章";
		
			
			var gid:String=createOrderGID();
			var postArgs:Object = {};
			postArgs["receipt"] = gid;
			postArgs["openid"] = BASE._myOnlyUid;
			postArgs["uid"] =BASE._userID;
			postArgs["level"]=BASE.BaseLevel().level;
			postArgs["serverid"]=ServerInfo.getInstance().getNowServerId();
			_tryBuyData.setVaule(gid,postArgs);
			NdComPlatform.getInstance().NdUniPayAsyn(gid,obj.itemId,productName,obj.salePrice,obj.salePrice,1,"");
			
			
			
		}
			
			private function getItemById(id:String):Object
			{
				for each(var obj:Object in _itemArray)
				{
					if(obj.itemId==id)
					{
						return obj;
					}
				}
				return null;
			}
				
			public function get suportQiehuan():Boolean
			{
				return true;
			}
			
			private var qiehuanFlag:Boolean=false;
			public function zhanghaoQiehuan():void
			{
				qiehuanFlag=true;
				NdComPlatform.getInstance().NdEnterPlatform(0);
			
			}
			
			public function init():void
			{
				NdComPlatform.getInstance().setAppId(AppId_iphone);
				NdComPlatform.getInstance().setAppKey(AppKey_iphone);
				
				NdComPlatform.getInstance().NdSetAutoRotation(true);
				if("rotatedRight"==GLOBAL.Ane_UseStage.orientation)
				{
					Orientation=4;
				}
				else if("rotatedLeft"==GLOBAL.Ane_UseStage.orientation)
				{
					Orientation=3;
				}
				NdComPlatform.getInstance().NdSetScreenOrientation(Orientation);
				
				//调试模式
				
				//			NdComPlatform.getInstance().NdSetDebugMode(0);
				
				
				NdComPlatform.getInstance().addEventListener(StatusEvent.STATUS,onStatus);
				
				ViewControl.getInstance().addEventListener(ViewControl.TEXTUREREBUILD,onBuildAll);
				
				ChongzhiCheckManager.instance.setCheckBackUrl(payUrl);
				ChongzhiCheckManager.instance.startPostPerChongzhi();
				
				//取出 所有可能存在的充值错误
				_tryBuyData=new PersistentObj(TryBuyPath);
				var keyArray:Array=_tryBuyData.getKeyArray();
				for each(var key:String in keyArray){
					var data:Object=_tryBuyData.getValueByKey(key);
					ChongzhiCheckManager.instance.addCheckData(data);
				}
			}
			
			public function getPlatUserName():String
			{
				return NdComPlatform.getInstance().nickName();
			}
			
			public function getPlatKefu1():String
			{
				return Locales.Get("help_info_p91_1");
			}
			
			public function getPlatKefu2():String
			{
				return Locales.Get("help_info_p91_2");
			}
			
			public function get suportMoreHelp():Boolean
			{
				return false;
			}
			
			public function get suportSocialInfo():Boolean
			{
				return false;
			}
			
			public function getPlatformUserInfo():PlatformUserInfo
			{
				return null;
			}
			
			public function get ExtrFlagObj():Object
			{
				var obj:Object={};
				obj[PlatExtrFlag.HideLevelGiftVaule]=true;
				return obj;
			}
			
			public function get platName():String
			{
				return "p91";
			}
			
			
			}
			}