package Tool.Inapp_appstore
{
	import Tool.ApplicationInfoDesc;
	import Tool.PersistentObj;
	import Tool.chongzhiCheck.CheckItem;
	import Tool.chongzhiCheck.ChongzhiCheckManager;
	import Tool.platform.ItemsXmlLoaderProxy;
	import Tool.platform.PlatformManager;
	import Tool.talkingdata.TalkingDataManager;
	
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	import com.hurlant.util.Base64;
	import com.milkmangames.nativeextensions.ios.StoreKit;
	import com.milkmangames.nativeextensions.ios.StoreKitProduct;
	import com.milkmangames.nativeextensions.ios.events.StoreKitErrorEvent;
	import com.milkmangames.nativeextensions.ios.events.StoreKitEvent;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.net.SharedObject;
	import flash.utils.Timer;
	
	import model.login.ServerInfo;
	
	import myDisplay.global.GlobalConfig;

	public class ChongzhiTool 
	{
		/** AppStore支付商品列表xml
		 * */
		public static const AppStore_ItemsXmlName:String="appstoreItems.xml";
		/** AppStore支付后台地址
		 * */
		public static const AppStore_PayUrlName:String="pay_ios.php";
		
		/** AppStore支付后台沙箱测试地址
		 * */
		public static const AppStore_PayUrl_Test:String="pay_ios_sandbox.php";
		/** FaceBook英文版支付商品列表Xml
		 * */
		public static const FaceBook_En_ItemsXmlName:String="fbAppstoreItems.xml";
		/** FaceBook英文版支付后台地址
		 * */
		public static const FaceBook_En_PayUrlName:String="pay_ios.php";
		
		/**  飞流版本的商品列表
		 * */
		public static const feiliuItemXmlUrl:String="feiliuItems.xml";
		/** 飞流版本后台支付
		 * */
		public static const feiliuBackUrl:String="pay_ios.php";
		/**
		 *  飞流沙箱支付的测试地址
		 * */
		public static const feiliuBackUrl_Test:String="pay_ios_sandbox.php";
		/**
		 *  App获取支付验证地址
		 * */
		public static function get App_cn_payUrlName():String
		{
			if(GlobalConfig.isSandBoxPayTest)
			{
				return AppStore_PayUrl_Test;
			}
			else
			{
				return AppStore_PayUrlName;
			}
		}
		/**
		 *  飞流获取后台支付地址
		 * */
		public static function get Feiliu_cn_payUrlName():String
		{
			if(GlobalConfig.isSandBoxPayTest)
			{
				return feiliuBackUrl_Test;
			}
			else
			{
				return feiliuBackUrl;
			}
		}
		/** 支付xml名字
		 * */
		private static var payXmlNameStr:String;
		/** 支付后台地址名字
		 * */
		private static var payUrlStr:String;
		
		private static var initFlag:Boolean=false;
		
		private static function get DetailXmlUrl():String
		{
			return EnvironmentParameter.xmlLoadPreUrl+payXmlNameStr;
		}
		private static function get payUrl():String
		{
			return EnvironmentParameter.gamePreUrl+payUrlStr;
		}
		/** 设置支付xml的名字
		 * */
		public static function setPayXmlNameStr(_payXmlName:String):void
		{
			payXmlNameStr=_payXmlName;
		}
		/** 设置支付的后台地址
		 * */
		public static function setPayUrl(_payUrl:String):void
		{
			payUrlStr=_payUrl;
		}
		private static var m_instance:ChongzhiTool;
		public var loadedProducts:Vector.<StoreKitProduct>;
		private var PRODUCT_ID_LIST:Vector.<String>=new Vector.<String>();
//		private var product_arr:Array=["com.sincetimes.hongjing.66","com.sincetimes.hongjing.363","com.sincetimes.hongjing.1028","com.sincetimes.hongjing.2114","com.sincetimes.hongjing.5407","com.sincetimes.hongjing.11393"];
		private var callback:Function;
		
		private var productInitCom:Function;
		
		private var _itemsArray:Array=[];
		
		private const SharePath:String="redwar.ioschongzhi";
		private var so:SharedObject;
		
		private static const TryBuyPath:String="appstore.trydata";
		private var _tryBuyData:PersistentObj;
		
		public function get itemsArray():Array
		{
			return _itemsArray;
		}
		
		public function setArg():void
		{
			
		}
		
		/**  appstore获取商品的机制比较复杂，需要先获得商品的id，
		 * */
		public function ChongzhiTool()
		{	
			_tryBuyData=new PersistentObj(TryBuyPath);
			PlatformManager.getInstance().addEventListener(Event.COMPLETE,onGameInitComplele);
			
		}
		private function onGameInitComplele(evt:Event):void{
			var obj:Object={};
			obj["openid"] = BASE._myOnlyUid;
			obj["uid"] =BASE._userID;
			obj["serverid"]=ServerInfo.getInstance().getNowServerId();
			_tryBuyData.setVaule("userInfo",obj);
		}
		/*private function startTick():void
		{
			var time:Timer=new Timer(4000,8);
			time.addEventListener(TimerEvent.TIMER,onTimer);
			time.start();
		}
		
		private function onTimer(evt:Event):void
		{
			if(so && so.data && so.data.cache)
			{
				var postArg:Object;
				try{
					postArg=JSON.parse(so.data.cache);
				}
				catch(e:*)
				{
					
				}
				if(postArg==null) 
					return ;
				HttpRequest.getInstance().realyPostRequest(payUrl,postArg,function handleFunc(data:Object):void{
					//				log(data.toString());
					if(data.toString().indexOf("ok")!=-1 || data.toString().indexOf("error")!=-1)
					{
						
						if(so)
						{
							delete so.data["cache"];
							so.clear();
							so.flush();						
						}
						
						(evt.target as Timer).stop();
						//					var num:int=int(data.toString().split(",")[1]);
						//					BASE._credits.Add(num);
						
					}
					else
					{
						
					}
				});
				
			}
		}*/
		
		public function init():void
		{
			/*try
			{
				so=SharedObject.getLocal(SharePath);				
			}
			catch(e:*)
			{
				
			}
			
			if(so && so.data && so.data.cache)
			{
				startTick();
			}*/
			
			ChongzhiCheckManager.instance.setCheckBackUrl(payUrl);
			ChongzhiCheckManager.instance.setProccessHandle(handleTrancsaction);
			ChongzhiCheckManager.instance.startPostPerChongzhi();
			
			
			
			if (!StoreKit.isSupported())
			{
				log("Store Kit iOS purchases is not supported on this platform.");
				return;
			}
			
			log("initializing StoreKit..");	
			
			StoreKit.create();
			
			log("StoreKit Initialized.");
			
			// make sure that purchases will actually work on this device before continuing!
			// (for example, parental controls may be preventing them.)
			if (!StoreKit.storeKit.isStoreKitAvailable())
			{
				log("Store is disable on this device.");
				return;
			}
			
			StoreKit.storeKit.setManualTransactionMode(true);
			
			StoreKit.storeKit.addEventListener(StoreKitEvent.PRODUCT_DETAILS_LOADED,onProductsLoaded);
			StoreKit.storeKit.addEventListener(StoreKitEvent.PURCHASE_SUCCEEDED,onPurchaseSuccess);
			StoreKit.storeKit.addEventListener(StoreKitEvent.PURCHASE_CANCELLED,onPurchaseUserCancelled);
			StoreKit.storeKit.addEventListener(StoreKitEvent.TRANSACTIONS_RESTORED,onTransactionsRestored);
			
			// adding error events. always listen for these to avoid your program failing.
			StoreKit.storeKit.addEventListener(StoreKitErrorEvent.PRODUCT_DETAILS_FAILED,onProductDetailsFailed);
			StoreKit.storeKit.addEventListener(StoreKitErrorEvent.PURCHASE_FAILED,onPurchaseFailed);
			StoreKit.storeKit.addEventListener(StoreKitErrorEvent.TRANSACTION_RESTORE_FAILED,onTransactionRestoreFailed);
			
			//			PRODUCT_ID_LIST.push.apply(null,product_arr);
			//			
			//			// when this is done, we'll get a PRODUCT_DETAILS_LOADED or PRODUCT_DETAILS_FAILED event and go on from there...
			//			StoreKit.storeKit.loadProductDetails(PRODUCT_ID_LIST);
		}
		public function applyPrudctXml(_productInitCom:Function):void
		{
			productInitCom=_productInitCom;
			
			if(initFlag)
			{
				if(productInitCom!=null)
				{
					productInitCom(_itemsArray);
				}
			}
			else
			{
				var vars:Object = {name: "appstoreItem", noCache: true, onComplete: xmlLoaderComplete};
				var loader:XMLLoader = new XMLLoader(DetailXmlUrl, vars);
				loader.load();
			}
			
		}
		
		private function xmlLoaderComplete(evt:LoaderEvent):void
		{
			PRODUCT_ID_LIST=new Vector.<String>();
			_itemsArray=[];
			var itemXmls:XML = XML(LoaderMax.getContent("appstoreItem"));
			
			_itemsArray=ItemsXmlLoaderProxy.decodeItemsXml(itemXmls);
			
			for each(var item:Object in _itemsArray)
			{
				//编码中包含hd 为pad版本
				var id:String=ApplicationInfoDesc.NativeInfo.packageId;
				if(id.indexOf("hd")!=-1 || id.indexOf("HD")!=-1 || id.indexOf("Hd")!=-1 || id.indexOf("hD")!=-1)
//				if(ApplicationInfoDesc.NativeInfo.packageId.indexOf(".hd")!=-1)
				{
					var id:String=item.itemId;
					id=id.replace("redwarfare","redwarfarehd");
					item.itemId=id;
				}

				
				PRODUCT_ID_LIST.push(item.itemId);
			}
			
			/*for each(var item:XML in itemXmls.item)
			{
				PRODUCT_ID_LIST.push(String(item.@itemXml.@itemId));
				var obj:Object={"productName":String(item.@productName), 
					"salePrice":String(item.@salePrice),
					"itemId":String(item.@itemId)};
				if(GLOBAL._gameSize.width==1024)
				{
					var id:String=obj.itemId;
					id=id.replace("redwarfare","redwarfarehd");
					obj.itemId=id;
				}
				
				_itemsArray.push(obj);
			}
			var temp:Array=_itemsArray.concat([]);
			temp.sortOn("salePrice",Array.NUMERIC);
			for (var index:int=0; index<temp.length; index++)
			{
				temp[index].image="money-"+(
					index+1)+".png";
			}*/
			StoreKit.storeKit.loadProductDetails(PRODUCT_ID_LIST);
			
		}
		
		public function setCallBack(func:Function):void
		{
			callback=func;
		}
		
//		public function purchaseIndex(i:int):void
//		{
//			StoreKit.storeKit.purchaseProduct(PRODUCT_ID_LIST[i]);
//		}
		
		/**   购买
		 * */
		public function buy(itemId:String):void
		{
			StoreKit.storeKit.purchaseProduct(itemId);
		}
		
		public static function getInstance():ChongzhiTool
		{
			if(m_instance==null)
				m_instance=new ChongzhiTool();
			return m_instance;
		}
		
		private function onPurchaseSuccess(e:StoreKitEvent):void
		{
			log("Successful purchase of '"+e.productId+"'");
			
			// update our sharedobject with the state of this inventory item.
			// this is just an example to make the process clear.  you will
			// want to make your own inventory manager class to handle these
			// types of things.
//			switch(e.productId)
//			{
//				case LEVELPACK_PRODUCT_ID:
//					inventory[LEVELPACK_PRODUCT_ID]="purchased";
//					break;
//				case SPELL_PRODUCT_ID:
//					if (inventory[SPELL_PRODUCT_ID]==null)
//					{
//						inventory[SPELL_PRODUCT_ID]=0;
//					}
//					inventory[SPELL_PRODUCT_ID]++;
//					break;
//				default:
					// we don't do anything for unknown items.
//			}
//			e.validProducts[0].
			
			var array:Array=e.productId.split(".");
			var currency:int=int(array[array.length-1]);
			
//			e.

			
			
			requestWeb(Base64.encode(e.receipt),currency,e.transactionId);
			
			try{
				//添加订单统计
				//			TalkingDataManager.getInstance().setChargeRequest(e.transactionId,e.productId,0,"CNY",currency,"AppStoreCN");
				TalkingDataManager.getInstance().setChargeRequestAdapt(e.transactionId,e.productId,currency,"CNY","AppStoreCN");
			}catch(error:Error){
				trace(error.message);
			}
			
		}
		
		private function handleTrancsaction(item:CheckItem):void{
			var postArg:Object=item.postArg;
			if(postArg && postArg.tid){
				var tid:String=postArg.tid;
				trace("订单 完毕 tid:"+tid);
				StoreKit.storeKit.manualFinishTransaction(tid);
				try{
					//如果成功，发送充值统计
					TalkingDataManager.getInstance().setChargeSuccess(tid);
				}catch(err:Error){
					trace(err.message);
				}
			}
			
		}
		
		private function requestWeb(receipt:String,currency:int,tid:String):void
		{
			var postArgs:Object = {};
			var info:Object=_tryBuyData.getValueByKey("userInfo");
			postArgs["tid"]=tid;
			postArgs["receipt"] = receipt;
			postArgs["openid"] = BASE._myOnlyUid;
			postArgs["uid"] =BASE._userID;
			postArgs["serverid"]=ServerInfo.getInstance().getNowServerId();

			if(BASE._myOnlyUid=="" && info!=null)
			{
				postArgs["openid"] = info.openid;
				postArgs["uid"] =info.uid;
				postArgs["serverid"]=info.serverid;
			}
			var url:String=payUrl+"?";
			for(var key:String in postArgs)
			{
				url+=key+"="+"\""+postArgs[key]+"\""+"&";
			}
			url=url.slice(0,url.length-1);
			trace("payUrl: "+url)
			
			ChongzhiCheckManager.instance.addCheckData(postArgs);
			
			var cache:String=JSON.stringify(postArgs);
			/*if(so)
			{
				so.data["cache"]=cache;
				so.flush();
				startTick();
			}*/
			
			/*HttpRequest.getInstance().realyPostRequest(payUrl,postArgs,function handleFunc(data:Object):void{
				//				log(data.toString());
				if(data.toString().indexOf("ok")!=-1)
				{
					
					if(so)
					{
						delete so.data["cache"];
						so.clear();
						so.flush();						
					}
					
//					var num:int=int(data.toString().split(",")[1]);
//					BASE._credits.Add(num);
					
					trace("购买成功");
				}
				else
				{
					trace("购买失败")
				}
			}
				
			);	*/
		}
		
		
		private function onProductDetailsFailed(e:StoreKitErrorEvent):void
		{
			log("ERR loading products:"+e.text);
		}
		
		private function productSort(a:StoreKitProduct,b:StoreKitProduct):Number
		{
			if(Number(a.price)>Number(b.price))
				return 1;
			else if(Number(a.price)<Number(b.price))
				return -1;
			else 
				return 0;
		}
		
		private function onProductsLoaded(e:StoreKitEvent):void
		{
			log("products loaded.");
			
			/*for each(var p:StoreKitProduct in e.validProducts)
			{
				for each(var obj:Object in _itemsArray)
				{
					if(obj.itemId==p.productId)
					{
						obj.salePrice=p
					}
				}
			}*/
			
			if(productInitCom!=null)
			{
				productInitCom(_itemsArray);
			}
			TalkingDataManager.getInstance().addPurcheConfig(_itemsArray);
			initFlag=true;
			
			// save the products that were loaded locally  for later use.
			/*this.loadedProducts=e.validProducts;
			this.loadedProducts.sort(productSort);
			if(callback)
				callback.apply();
			// if any of the product ids we tried to pass in were not found on the server,
			// we won't be able to by them so something is wrong.
			if (e.invalidProductIds!=null)
			{
				if (e.invalidProductIds.length>0)
				{
					log("[ERR]: these products not valid:"+e.invalidProductIds.join(","));
					return;
				}
			}*/
		}
		
		private function onPurchaseFailed(e:StoreKitErrorEvent):void
		{
			log("Failure purchasing '"+e.productId+"', reason:"+e.text);
		}
		
		private function onPurchaseUserCancelled(e:StoreKitEvent):void
		{
			log("the user canceled the purchase for '"+e.productId+"'");
		}
		
		private function onTransactionsRestored(e:StoreKitEvent):void
		{
			log("transactions restored.");
		}
		
		private function onTransactionRestoreFailed(e:StoreKitErrorEvent):void
		{
			log("an error occurred in restore purchases:"+e.text);		
		}
		
		
		/** Log */
		private function log(msg:String):void
		{
			trace("[StoreKitExample] "+msg);
		}
		
	}
}