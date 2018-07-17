package Tool.platform.meijiPlat
{
	import com.dklib.AneDispatcher;
	import com.fish.modules.core.ResourceConst;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.StatusEvent;
	
	import Tool.ApplicationInfoDesc;
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import util.Util;

	public class MJPlat_Duoku_Android extends Plat_Base
	{
		[Embed(source="Assets/Splash/baidu.png")]
		private var splash_asset:Class;
		
		public override function get supportPlatSplash():Boolean{
			return false;
		}
		public override function get platSplashPicClass():Class{
			return splash_asset;
		}
		
		public override function get platSplashArg():Object{
			var arg:Object={};
			arg.backColor=0x00000000;
			return arg;
		}

		public function MJPlat_Duoku_Android()
		{
			super();
		}
		
		public override function init():void
		{
			AneDispatcher.getInstance().DKSdkInit("3880653","DsaojbIfhrNlx5zWG6LPoq93",1,ApplicationInfoDesc.NativeInfo.versionStr);
//			DuokuSdkHelper.instance.init("3880653","DsaojbIfhrNlx5zWG6LPoq93",1);
//			AneDispatcher.getInstance().DKSdkInit("3825","9f61f1edbf1b4925edb82e2e5044b69a");
			AneDispatcher.getInstance().addEventListener(StatusEvent.STATUS,statusEventListener);
		}
		
		private function statusEventListener(e:StatusEvent):void
		{
//			logView.text = e.code + ": " + e.level;
			PlatformManager.log("api返回： "+e.code + ": " + e.level);
			
			//普通登录：
			if(e.code == "LoginCallBack")
			{
				var LoginCallBack:Object=JSON.parse(e.level);
				var _loginState:int = int(LoginCallBack.state_code);
				var _userName:String = LoginCallBack.user_name; 
				var _userId:String = LoginCallBack.user_id;
				var _userSessionId:String = LoginCallBack.user_sessionid;		
				
				//e.level为返回结果JSON串，例如：登录成功通知内容格式如下：
				//{"user_id":"103256","user_name":"dktest","user_sessionid":"52469875215469875462545698754562","state_code":1021}
				//其中：state_code为状态码，"user_id"为用户id, "user_name"为用户的用户名，"user_sessionid"为用户的sessionid
				if (1021 == _loginState) {
					//登录成功回调，必须正确处理
//					logView1.text="登录成功";
//					LoginState = true;
					setPlatInfo(_userId,_userSessionId,_userName);
					exctueLoginResult(true);
				} else if (1106 == _loginState) 
				{
					exctueLoginResult(false);
					//取消登录回调，必须正确处理
//					logView1.text="用户取消登录";
					//Toast.makeText(UserLoginActivity.this, "用户取消登录", Toast.LENGTH_LONG).show();
					
				} else if (1004 == _loginState)
				{
					//用户登录状态失效回调，必须正确处理
//					logView1.text="用户登录状态失效";
					if(GameStatus.status==GameStatus.ST_GameOngoing || GameStatus.status==GameStatus.ST_LoadAsset){
						logout_SN.dispatch(true,{});
					}else{
						exctueLoginResult(true);
					}
					
				}
			}			
				//设置悬浮窗回调，目前悬浮窗中仅切换帐号功能支持回调，暂时只需处理这一种情况。不设置该回调或者设置错误回调，将无法通过上线测试
			else if (e.code == "SusWinCallBack") 
			{
				var SusWinCallBack:Object=JSON.parse(e.level);
				var _stateCode:int = int(SusWinCallBack.state_code);//状态码
//				logView3.text = e.level;
//				logView2.text = "_stateCode:"+_stateCode; 
				if(_stateCode == 2005){
					//切换帐号处理逻辑，cp可根据自身需要进行操作，如重新弹出登录界面让用户重新登陆、重启游戏、退出游戏。
//					logView1.text = "切换账户";
//					logView2.text = "";
//					logView3.text =  e.level;
//					LoginState = false;
					logout_SN.dispatch(true,{});
				}
//				setPlatInfo(_userId,_userSessionId,_userName);
//				exctueLoginResult(true);
				
			}
				//支付的回调
			else if (e.code == "PayCallBack") 
			{
				var PayCallBack:Object=JSON.parse(e.level);
				var mStateCode:int = int(PayCallBack.state_code);//状态码
				var mMessage:String = PayCallBack.message; //信息		
				var mOrderId:String = PayCallBack.cp_order_id;//订单号
				
				proccessBid();
//				logView3.text = e.level;
//				logView2.text = "mStateCode:"+ mStateCode + "\n" + "mMessage:" + mMessage + "\n"
//					+"mOrderId:"+ mOrderId ; 
//				// 此处只表示是否有充值行为，无法判断充值结果，充值结果由多酷服务器通知至CP的回调地址
//				if(mStateCode == 0) { 	// 需要查询订单
//					logView1.text = "退出充值中心,此时应去查询订单:" + mOrderId  + "的状态！";
//				} else if (mStateCode == -1) {	// 不需要查询订单
//					logView1.text = mMessage;
//				}
				
			}
		}
		public override function pay(pid:String, bid:String):void
		{
			proccessBid();
			_tempBid=bid;
			
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			
			var ratio:int=10;
			var gamebi:String= Util.getLanguage(ResourceConst.R_cash);
			var orderid:String=bid;
			
		
			var amount:int=node.rmb;
			CONFIG::PayTest{
				amount=1;
			}
			var payDesc:String=node.desc;
			AneDispatcher.getInstance().DKUnitPay(amount,ratio,node.name,orderid,orderid);
//			DuokuSdkHelper.instance.pay(gamebi,ratio,amount.toString(),orderid);
//			AneDispatcher.getInstance().DKUnitPay(ratio,gamebi,orderid,amount,payDesc);
//			AneDispatcher.getInstance().DKUnitPay(10,"元宝",bid,1,"it is a desc");
		}
		public override function login():void
		{
			AneDispatcher.getInstance().DKLogin();
//			DuokuSdkHelper.instance.login();
		}
		public override function get loginPlatName():String
		{
			return "dkand";
		}
		
		public override function get payPlatName():String
		{
			return "dkand";
		}
		
		public override function get onlyPlatName():String
		{
			return "dkand";
		}
		
		public override function get supportGamecenter():Boolean
		{
			return false;
		}
		
		public override function get supportLogout():Boolean{
			return false;
		}
		public override function logout():void{
			AneDispatcher.getInstance().DKLogout();
//			DuokuSdkHelper.instance.loguot();
		}
		
		
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.ListernExitGame]=true;
			obj[PlatExtrFlag.ReloadAfterLogout]=true;
			return obj;
		}
		
		public function beforeExit():void{
			AneDispatcher.getInstance().DKReleaseResourceFunction();
		}
		
		
//		public override function openGamecenter():void
//		{
//			AneDispatcher.getInstance().DKAccountManager();
//		}
		public override function get osType():String{
			return Plat_Base.OS_And_Guonei;
		}
		
	}
}