package Tool.platform.meijiPlat
{
	import com.adobe.ane.productStore.Product;
	import com.adobe.ane.productStore.ProductEvent;
	import com.adobe.ane.productStore.ProductStore;
	import com.adobe.ane.productStore.Transaction;
	import com.adobe.ane.productStore.TransactionEvent;
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TweenLite;
	
	import flash.net.SharedObject;
	import flash.utils.Dictionary;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import util.Util;

	public class MJPlat_Appstore_Union extends MJPlat_Union_Register
	{
		private var productStore:ProductStore;
		private var hasInit:Boolean;
		
		private var lock:Boolean=false;
		private function getLocalBillIdByPid(pid:String):String{
			try{
				var so:SharedObject=SharedObject.getLocal("com.ghostlmm.bill.so");
				if(so && so.data && so.data[pid]){
					return so.data[pid];
				}else{
					return null;
				}
				so.close();
			}catch(e:Error){
				return null;
			}
			return null;
		}
		
		
		private function setLocalBillWithPid(pid:String,bid:String):void{
			try{
				var so:SharedObject=SharedObject.getLocal("com.ghostlmm.bill.so");
				so.data[pid]=bid;
				so.flush();
				so.close();
			}catch(e:Error){}
		}
		private function closeLoaclBillCash(pid:String):void{
			try{
				var so:SharedObject=SharedObject.getLocal("com.ghostlmm.bill.so");
				so.data[pid]=null;
				delete so.data[pid];
				so.flush();
				so.close();
			}catch(e:Error){}
		}
		
		
		
		public function MJPlat_Appstore_Union()
		{
			super();
		}
		
		public override function get loginPlatName():String
		{
			return "appstore";
		}
		
		private function hasAleardy():Boolean
		{
			if(ProductStore.isSupported && productStore && hasInit){
				return true;
			}
			return false;
		}
		
		public override function get payPlatName():String
		{
			return "appstore";
		}
		
		public override function get onlyPlatName():String
		{
			return "appstore";
		}
		
		public override function init():void{
			super.init();
			S2CHanlder.instance.initCom_SN.addOnce(onGameInitComplete);
		}
		private function onGameInitComplete():void{
			AppstoreCheckItem.initUrl(UrlConfig.appStoreUrl);
			if(productStore==null){
				if(ProductStore.isSupported){
					productStore=new ProductStore();
					productStore.addEventListener(ProductEvent.PRODUCT_DETAILS_SUCCESS,productDetailsSucceeded);
					productStore.addEventListener(ProductEvent.PRODUCT_DETAILS_FAIL, productDetailsFailed);
					productStore.addEventListener(TransactionEvent.PURCHASE_TRANSACTION_SUCCESS, purchaseTransactionSucceeded);
					productStore.addEventListener(TransactionEvent.PURCHASE_TRANSACTION_CANCEL, purchaseTransactionCanceled);
					productStore.addEventListener(TransactionEvent.PURCHASE_TRANSACTION_FAIL, purchaseTransactionFailed);
					loadProducts();
				}
			}
		}
		
		private function loadProducts():void{
			var vect:Vector.<String>=new Vector.<String>();
			for each(var node:Node_chongzhi in XMLDataManager.Node_chongzhiArray){
				vect.push(node.ios_id);
			}
			productStore.requestProductsDetails(vect);
		}
		
		private function purchaseTransactionSucceeded(evt:TransactionEvent):void{
			trace("消费成功");
			finishTransAction(evt,true);
			unlock();
		}
		private function purchaseTransactionCanceled(evt:TransactionEvent):void{
			finishTransAction(evt,false);
			unlock();
		}
		private function purchaseTransactionFailed(evt:TransactionEvent):void{
			finishTransAction(evt,false);
			unlock();
		}
		
		private function unlock():void{
			lock=false;
			TweenLite.killDelayedCallsTo(unlock);
		}
		
		private function finishTransAction(e:TransactionEvent,isSuccess:Boolean):void{
			var i:int=0;
			while(e.transactions && i < e.transactions.length)
			{
				var t:Transaction = e.transactions[i];
				printTransaction(t);
				i++;
				if(isSuccess){
					trace("FinishTransactions" + t.identifier);
					loadToGameSever(t);
				}
				productStore.finishTransaction(t.identifier);
			}
		}
		
		private function loadToGameSever(ta:Transaction):void{
			var bid:String=getLocalBillIdByPid(ta.productIdentifier);
			if(bid){
				AppstoreCheckItem.addCheckTranaction(ta,bid);
			}
		}
		
		private function productDetailsFailed(evt:ProductEvent):void{
			
		}
		public function getPendingTransaction(prdStore:ProductStore):void
		{
			
			trace("pending transaction");
			
			var transactions:Vector.<Transaction> = prdStore.pendingTransactions; 
			
			var i:uint=0;
			
			while(transactions && i<transactions.length)
				
			{
				
				var t:Transaction = transactions[i];
				
				printTransaction(t);
				
				i++;
				
			}
			
		}
		public function printTransaction(t:Transaction):void
		{
			
			trace("-------------------in Print Transaction----------------------");
			
			trace("identifier :"+t.identifier);
			
			trace("productIdentifier: "+ t.productIdentifier);
			
			trace("productQuantity: "+t.productQuantity);
			
			trace("date: "+t.date);
			
			trace("receipt: "+t.receipt);
			
			trace("error: "+t.error);
			
			trace("originalTransaction: "+t.originalTransaction);
			
			
			if(t.originalTransaction)
				
				printTransaction(t.originalTransaction);
			
			trace("---------end of print transaction----------------------------");
			
		}	
		private function productDetailsSucceeded(e:ProductEvent):void{
			hasInit=true;
			trace("in productDetailsSucceeded "+e);
			
			var i:uint=0;
			
			while(e.products && i < e.products.length)
				
			{
				
				var p:Product = e.products[i];
				
				//				trace("\nTITLE: " + p.title + "\nDescription: " + p.description + "\nIdentifier : " + p.identifier + "PriceLocale : " + p.priceLocale + "\nPrice: " + p.price);
				
				trace("title : "+p.title);
				
				trace("description: "+p.description);
				
				trace("identifier: "+p.identifier);
				
				trace("priceLocale: "+p.priceLocale);
				
				trace("price :"+p.price);
				
				i++;
				
			}
			
			trace("加载产品列表成功");
			getPendingTransaction(productStore);
		}
		
		
		public override function pay(pid:String, bid:String):void{
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node){
				if(lock){
					Util.flow("有一个购买项目正在进行中，请稍后");
				}else{
					if(hasAleardy()){
						trace("触发购买，上锁");
						lock=true;
						TweenLite.delayedCall(60*3,unlock);
						setLocalBillWithPid(node.ios_id,bid);
						productStore.makePurchaseTransaction(node.ios_id,1);
					}else{
						Util.flow("内购项目暂未准备完毕");
					}
				}
				
			}
			
		}
		
		public override function get osType():String{
			return PlatformManager.OT_AppstoreIos;
		}
		
		public override function get ExtrFlagObj():Object{
			var obj:Object=super.ExtrFlagObj;
			obj[PlatExtrFlag.HidePlatFlag]=true;
			return obj;
		}
	}
}