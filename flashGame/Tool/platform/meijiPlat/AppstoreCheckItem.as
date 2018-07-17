package Tool.platform.meijiPlat
{
	import com.adobe.ane.productStore.Transaction;
	import com.hurlant.util.Base64;
	
	import flash.net.SharedObject;
	import flash.utils.Dictionary;
	

	public class AppstoreCheckItem
	{
		
		public static const SpanArray:Array=[5,10,20,30,100,300];
		
		public function AppstoreCheckItem()
		{
		}
		
		public static const ST_Outrange:int=-1000;
		public static const ST_HanldComplete:int=2000;
		public static const ST_Normal:int=1;
		private static var url:String;
		public static function initUrl($url:String):void{
			if(url==null && $url!=null){
				url=$url;
				trace("设置appstore验证地址： "+url);
				if(itemDic){
					for each(var item:AppstoreCheckItem in itemDic){
						item.startRequest();
					}
				}else{
					init();
				}
			}
			
		}
		
		public var bid:String;
		public var tid:String;
		public var checkState:int;
		public var repeatCount:int;
		public var arg:Object;
		
		private var cycleRequest:CycleRequest;
		
		public function initFromTransaction(t:Transaction,$bid:String):void{
			bid=$bid;
			tid=t.identifier;
			arg={};
			arg.receipt=Base64.encode(t.receipt);
//			arg.receipt=t.receipt;
			arg.billNo=bid;
			checkState=ST_Normal;
		}
		
		public function needRequest():Boolean{
			return checkState==ST_Normal;
		}
		
		public function initFromObj(data:Object):void{
			this.bid=data.bid;
			this.tid=data.tid;
			this.checkState=data.checkState;
			this.repeatCount=data.repeatCount;
			this.arg=data.arg;
		}
		
		public function toObj():Object{
			var obj:Object={};
			obj.bid=bid;
			obj.tid=tid;
			obj.checkState=checkState;
			obj.repeatCount=repeatCount;
			obj.arg=arg;
			return obj;
		}
		
		public function startRequest():void{
			if(!needRequest()){
				return ;
			}
			trace("开始向后台发送验证：  "+"bid:"+bid+"\ttid:"+tid);
			if(cycleRequest==null){
				cycleRequest=new CycleRequest(url,arg,SpanArray);
				cycleRequest.result_SN.add(onResult);
			}
			repeatCount++;
			if(repeatCount>=3){
				checkState=ST_Outrange;
			}
			loadToLocal(this);
		}
		private static const  S_OK:int = 0;
//		String M_OK = "succcess";
		private static const   S_FAIL:int = 1;
//		String M_FAIL = "fail";
		private static const   S_REPEAT:int = 2;
//		String M_REPEAT = "repeat";
		private static const   S_HANDLE:int = 3;
//		String M_HANDLE = "handle";
		private static const   S_ERROR:int = 4;
//		String M_ERROR = "error";
		private function onResult(data:Object):void{
			trace(data);
			try{
				var json:Object=JSON.parse(String(data));
				if(json.hasOwnProperty("status")){
					if(json.status==S_OK || json.status==S_REPEAT){
						cycleRequest.destory();
						checkState=ST_HanldComplete;
						loadToLocal(this);
					}
				}
			}catch(e:Error){}
//			if(true){
//				// 明确此订单已经处理过的
//				cycleRequest.destory();
//			}
		}
		
		/*private static function hasLocalItem(tid:String):Boolean{
			try{
				var so:SharedObject=SharedObject.getLocal("com.ghostlmm.appstore.localItem");
				if(so.data.hasOwnProperty(tid)){
					return true;
				}else{
					return false;
				}
			}catch(e:Error){}
		}*/
		
		private static function loadToLocal(item:AppstoreCheckItem):void{
			itemDic[item.tid]=item;
			try{
				var so:SharedObject=SharedObject.getLocal("com.ghostlmm.appstore.localItem");
				if(so.data){
					if(so.data.hasOwnProperty(item.tid)){
						delete so.data[item.tid];
					}
					so.data[item.tid]=item.toObj();
					so.flush();
				}
			}catch(e:Error){}
		}
		
		private static var itemDic:Dictionary;
		private static function init():void{
			if(itemDic!=null) return ;
			itemDic=new Dictionary();
			try{
				var so:SharedObject=SharedObject.getLocal("com.ghostlmm.appstore.localItem");
				if(so.data){
					for (var tid:String in so.data){
						var obData:Object=so.data[tid];
						if(obData && obData.hasOwnProperty("bid")){
							var item:AppstoreCheckItem=new AppstoreCheckItem();
							item.initFromObj(obData);
							itemDic[tid]=item;
							if(url && item.checkState){
								item.startRequest();
							}
						}
					}
				}
			}catch(e:Error){}
		}
		
		public static function addCheckTranaction(t:Transaction,$bid:String):void{
			init();
			if(itemDic[t.identifier]==null){
				// 如果之前有相关记录的话 就不做处理  
				var item:AppstoreCheckItem=new AppstoreCheckItem();
				item.initFromTransaction(t,$bid);
				loadToLocal(item);
				if(url){
					item.startRequest();
				}
			}
		}
		
	}
}