package Tool.payment
{
	import Tool.account.AccountControl;
	import Tool.chongzhiCheck.CheckItem;
	import Tool.chongzhiCheck.ChongzhiCheckManager;
	
	import com.adobe.protocols.dict.Database;
	import com.fish.GLBaseData;
	import com.ghostlmm.tool.HttpRequest;
	import com.ghostlmm.tool.shakeMovement.$EffectShake;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TweenLite;
	
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import org.osflash.signals.Signal;
	
	import util.Util;

	public class PaymentControl
	{
		public static const IntervalTime:int=5000;
		private var lastTime:int;
		
		private static var _instance:PaymentControl;
		
		public var paySuccessSN:Signal=new Signal(CheckItem);
		
		private var _payment:IPayment;
		
		private var _bidMap:Dictionary=new Dictionary();
		
		public static function getInstance():PaymentControl
		{
			if(_instance==null) _instance=new PaymentControl();
			return _instance;
		}
		public function PaymentControl()
		{
			
		}
		
		public function init():void
		{
			ChongzhiCheckManager.instance.setCheckBackUrl(UrlConfig.payUrl);
			ChongzhiCheckManager.instance.setProccessHandle(onPaySuccess);
			payment.init();
			payment.payBackSingal.add(onPayResult);
		}
		
		private function onPaySuccess(checkItem:CheckItem):void
		{
			if(checkItem.postObj.id==GLBaseData.userId){
				paySuccessSN.dispatch(checkItem);
			}
		}
		
		private function onPayResult(data:Object):void
		{
			openRefresh();
			var bid:String=data.bid;
			if(_bidMap.hasOwnProperty(bid)){
				var pid:int=_bidMap[bid];
				var node:Node_chongzhi=XMLDataManager.getChongzhiById(pid);
				if(node){
					var arg:Object={};
					arg.id=GLBaseData.userId.toString();
					arg.platname=payment.platname;
					arg.cost=node.rmb.toString();
					arg.token="tempToken";
//					arg.poi=createOrderId(pid);
					arg.pay_id=node.id.toString();
					arg.pay_act="pay_check";
					//			arg.PLATNAME
					arg.sign="sd";
					arg.app_key="tqt";
					arg.bill_no=bid;
					
					ChongzhiCheckManager.instance.addCheckData(arg);
				}
			}
//			var 
		}
		
		
		private function test(pid:int):void
		{
			var arg:Object=createPayArg(pid);
			
			ChongzhiCheckManager.instance.addCheckData(arg);
		}

		
		public function pay(pid:int):void
		{
//			test(pid);
			
			var now:int=getTimer();
			if(now-lastTime<=IntervalTime){
				Util.flow("点击频繁");
				return ;
			}
			lastTime=now;
			
			
			requestOrderId(pid);
			
			/*var node:Node_chongzhi=XMLDataManager.getChongzhiById(pid);
			var arg:Object={};
			arg.id=GLBaseData.userId.toString();
			//			arg.platname=AccountControl.getInstance().currentAccount.platname;
			arg.cost=node.rmb.toString();
			arg.token="tempToken";
			//			arg.poi=createOrderId(pid);
			arg.pay_id=pid.toString();
			arg.pay_act="pay_pre";
			//			arg.PLATNAME
			//			arg.sign="sd";
			arg.platname=payment.platname;
			arg.app_key="tqt";*/
		}
		
		/**  请求订单号
		 * */
		private function requestOrderId(pid:int):void
		{
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(pid);
			var arg:Object={};
			arg.id=GLBaseData.userId.toString();
//			arg.platname=AccountControl.getInstance().currentAccount.platname;
			arg.cost=node.rmb.toString();
			arg.token="tempToken";
//			arg.poi=createOrderId(pid);
			arg.pay_id=pid.toString();
			arg.pay_act="pay_pre";
			//			arg.PLATNAME
//			arg.sign="sd";
			arg.platname=payment.platname;
			arg.app_key="tqt";
			
			HttpRequest.getInstance().getRequest(UrlConfig.payUrl,arg,function(data:Object):void
			{
				try{
					var json:Object=JSON.parse(String(data));
					trace("请求订单id 返回:"+data);
					if(json.result>0){
						_bidMap[json.bill_no]=pid;
						payment.pay(pid,json.bill_no);
						closeRefresh();
						lastTime=getTimer();
					}
					
				}catch(e:Error){
					
				}
				
			},60000,false,"text",true);
		}
		

	
		private function closeRefresh():void
		{
			GameRefreshControl.refreshFlag=false;
			TweenLite.delayedCall(20*60,openRefresh);
		}
		
		private function openRefresh():void
		{
			TweenLite.killTweensOf(openRefresh);
			GameRefreshControl.refreshFlag=true;
		}
			
		private function createPayArg(pid:int):Object
		{
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(pid);
			var arg:Object={};
			arg.id=GLBaseData.userId.toString();
//			arg.platname=AccountControl.getInstance().currentAccount.platname;
			arg.cost=node.rmb.toString();
			arg.token="tempToken";
			arg.poi=createOrderId(pid);
			arg.pay_id=node.id.toString();
			arg.pay_act="pay_back";
//			arg.PLATNAME
			arg.sign="sd";
			arg.app_key="tqt";
			return arg;
		}
		
		private static function turnIntToNumberString(iq:int):String
		{
			var n:Number=iq;
			return n.toFixed(4);
		}
		
		private function createOrderId(pid:int):String
		{
			var date:Date=new Date();
			return date.time+"_"+GLBaseData.userId+"_"+pid+"_"+Math.random()*int.MAX_VALUE;
		}
		
		
		private function get payment():IPayment
		{
			if(_payment==null){
				_payment=PaymentFactory.createPayment();
			}
			return _payment;
		}
	}
}