package Tool.platform.meijiPlat
{
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.sj4399.pay.ane.Constants;
	import com.sj4399.pay.ane.PayCallbackEvent;
	import com.sj4399.pay.ane.YjPaymentApi;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;

	public class MJPlat_4399_Andriod extends Plat_Base
	{
		public function MJPlat_4399_Andriod()
		{
			super();
		}
		
		public override function get loginPlatName():String
		{
			return "4399and";
		}
		
		public override function get payPlatName():String
		{
			return "4399and";
		}
		
		public override function get onlyPlatName():String
		{
			return "4399and";
		}
		public override function init():void
		{
			//初始化SDK
			YjPaymentApi.getInstance().init();
//			YjPaymentApi.getInstance().
			//注册回调监听
			YjPaymentApi.getInstance().addEventListener(Constants.EVENT_TYPE_4399PAYSDK_CALLBACK, onCallback); 
		}
		private function onCallback(event:PayCallbackEvent):void{
			
			var callbackType:String = event.callbackType;
			var code:int = event.code;
			var data:Object = event.data;
			
			trace("received callback event: callbackType=" + callbackType + ", code=" + code
				+ ", data=" + (data != null ? data.toString() : "") );
			switch(callbackType){
				case Constants.CB_LOGIN: //登录操作回调
					if(code == Constants.STATUS_LOGIN_COMPLETE){ //登录完成
						
						var user:Object = data;
						outputs("登录完成:\n uid="+user.uid
							+",\nuserName="+user.userName
							+",\nnickName="+user.nickName
							+",\nexpiredAt="+user.expiredAt
							+",\naccessTokene="+user.accessToken);
						setPlatInfo(user.uid,user.accessToken,user.nickName);
						exctueLoginResult(true);
					}else{
						outputs("取消登录");
						exctueLoginResult(false);
					}
					break;
				case Constants.CB_LOGOUT://注销登录操作
					outputs("注销登录成功");
					logout_SN.dispatch(true,{});
					break;
				case Constants.CB_CHARGE: //充值操作
					if(code == Constants.STATUS_CHARGE_COMPLETE){ //充值操作完成，包括成功与失败
						//outputs("充值操作:");
						var resultObj:Object = JSON.parse(data.toString());
						
						switch (resultObj.code) {
							case 10000:
								//支付成功
								outputs(resultObj.result); 
								PlatformManager.getInstance().showTipAfterBuy();
								break;
							case 10001:
								//支付失败
								outputs(resultObj.result); 
								break;
							case 30001:
								//充值处理中
								outputs(resultObj.result); 
								break;
							case 30002:
								//订单已提交
								outputs(resultObj.result); 
								break;
							case 20001:
								//获取配置失败
								outputs(resultObj.result); 
							case 20002:
								//网络异常
								outputs(resultObj.result); 
								break;
							default:
								break;
						}
						
					}else{
						outputs("取消充值");
					}
					proccessBid();
					break;
				
			}
		} 
		
		private function outputs(msg:String){
			trace( "结果：\n"+msg);
		}
		
		public override function login():void
		{
			YjPaymentApi.getInstance().openLogin();
		}
		public override function pay(pid:String, bid:String):void
		{
			proccessBid();
			
			this._tempBid=bid;
			// TODO Auto-generated method stub
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			var rmb:int;
			rmb=node.rmb;
			CONFIG::PayTest{
				rmb=1;
			}
			
			
			var server:int = 0;//服务器标识(可选，供分服使用)，不分服直接不设置，分服则值大于0	
			YjPaymentApi.getInstance().charge(rmb,bid,server);
		}
		
		public override function get osType():String{
			return Plat_Base.OS_And_Guonei;
		}
		public override function get supportLogout():Boolean{
			return true;
		}
		public override function logout():void{
			YjPaymentApi.getInstance().destoryLogin();
		}
		
		
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.ListernExitGame]=true;
			return obj;
		}
		
		public function beforeExit():void{
			YjPaymentApi.getInstance().destory();
		}
		
	}
}