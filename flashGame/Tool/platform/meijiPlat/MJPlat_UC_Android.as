package Tool.platform.meijiPlat
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.ViewDispatcher;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TweenLite;
	
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.events.StatusEvent;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import cn.uc.gamesdk.ane.CallbackEvent;
	import cn.uc.gamesdk.ane.Constants;
	import cn.uc.gamesdk.ane.StatusCode;
	import cn.uc.gamesdk.ane.UCGameSDK;
	
	import util.Util;
	
	import view.commontools.ServerListManager;
	import view.viewData.ServerData;
	
	public class MJPlat_UC_Android extends Plat_Base
	{
		private var isInitSucceeded: Boolean = false;
		private var isLogined: Boolean = false;

		private static var serverId:int=0;
		private static var gameId:int=547794;
		private static var cpId:int=43137;
		private static var apiKey:String="81619b0e033ea84b1c4cddd620f0e616";
				
		public function MJPlat_UC_Android()
		{
			super();
		}
		public override function init():void
		{
			
			isInitSucceeded = false;
			
			log("initing...");
			outputs("initing...");
			
			UCGameSDK.getInstance().addEventListener(Constants.EVENT_TYPE_UCGameSDKCallback, onCallback);
	
			
			UCGameSDK.getInstance().setLogLevel(Constants.LOGLEVEL_DEBUG);
			UCGameSDK.getInstance().setOrientation(Constants.ORIENTATION_PORTRAIT);
			UCGameSDK.getInstance().setLoginUISwitch(Constants.UCLOGIN_FACETYPE_USE_WIDGET);
			
			//warning
			var debugMode:Boolean = false;
			
			var loglevel: int = Constants.LOGLEVEL_DEBUG;
			var serverName: String="服务器名称";
			var enablePayHistory: Boolean = true; 
			var enableLogout: Boolean = true;
			
			UCGameSDK.getInstance().initSDK(
				debugMode,
				loglevel, 
				gameId, 
				cpId, 
				serverId, 
				serverName,
				enablePayHistory,
				enableLogout);
			S2CHanlder.instance.initCom_SN.add(onDataInitCom);
			GameServerManager.instance.addEventListener(GameServerEvent.Evt_Server,ongameServerEvent);
			
			GameStatus.change_SN.add(onGameStatusChange);
		}
		
		private function onGameStatusChange($status:String):void{
			if($status==GameStatus.ST_GameOngoing){
				UCGameSDK.getInstance().showFloatButton(0,0,true);
			}else{
				UCGameSDK.getInstance().showFloatButton(0,0,false);
			}
		}
		
		/*public override function get supportPlatExit():Boolean{
			return true;
		}
		public override function platExit():void{
			UCGameSDK.getInstance().exitSDK();
		}*/
		
		private function ongameServerEvent(evt:GameServerEvent):void
		{
			if(!evt.effect) return ;
			
			if(evt.key==GameServerManager.KEY_GetUserInfo){
				if(evt.data && evt.data.infoResult && evt.data.infoResult.code==0){
//					_openId=evt.data.infoResult.userId;
//					_token="noToken";
//					_nickName="noNick";
					setPlatInfo(evt.data.infoResult.ucid,"noToken","noNick");
					exctueLoginResult(true);
				}else{
					exctueLoginResult(false);
				}
			}
		}
		private function onDataInitCom():void{			
			var userModel:UserModel=Context.getInjectInstance(UserModel);			
			var serverName:String="notFind";
			var serData:ServerData=ServerListManager.getInstance().getServerDataById(int(GLBaseData.serverId));
			if(serData)
			{
				serverName=serData.zoneName;
			}
			var content:String = "{" +
				"\"roleId\":\""+GLBaseData.userId+"\","+          
				"\"roleName\":\""+GLBaseData.userName+"\","+ 
				"\"roleLevel\":\""+userModel.userVo.userLevel.toString()+"\","+ 
				"\"zoneId\":\""+GLBaseData.serverId+"\","+ 
				"\"zoneName\":\""+serverName+"\","+ 
				"}";
			UCGameSDK.getInstance().submitExtendData("loginGameRole", content);
			trace("发送uc统计数据");
		}
		public override function get supportPlatExit():Boolean{
			return true;
		}
		public override function platExit():void{
			UCGameSDK.getInstance().exitSDK();
		}
		public function onCallback(event:CallbackEvent): void 
		{ 
			log("received callback event: " + event.toString());
			var callbackType:String = event.callbackType;
			var code:int = event.code;
			var data:Object = event.data;
			
			outputs("received callback event: callbackType=" + callbackType + ", code=" + code + ", data=" + (data != null ? data.toString() : "") );
			
			switch(callbackType) {
				case Constants.CALLBACKTYE_InitSDK:
					//data 为 String 类型，表示错误说明
					if (code == StatusCode.SUCCESS)
					{
						this.isInitSucceeded = true;
						outputs("SDK初始化成功");
						if(requesLogin){
							login();
						}
					}
					else 
					{
						//初始化失败，需重新初始化
						outputs("SDK初始化失败：" + String(data));
					}
					break;
				
				case Constants.CALLBACKTYE_Login:
					//收到登录结果回调消息
					//data 为 String 类型，表示错误说明
					if (code == StatusCode.SUCCESS)
					{
						//this.sid = ucsdk.getSid();
//						this.sid = UCGameSDK.getInstance().getSid();
//						_openId=UCGameSDK.getInstance().getSid();
//						_token=_openId;
						this.isLogined = true;
						outputs("登录成功：sid=" + openId);
//						exctueLoginResult(true);
						GameServerManager.instance.getUserInfo(UCGameSDK.getInstance().getSid());
						//创建悬浮按钮
						//ucsdk.createFloatButton();
						UCGameSDK.getInstance().createFloatButton();
					}
					else if (code == StatusCode.LOGIN_EXIT)
					{
						//退出登录界面，返回到游戏画面，游戏需根据是否已经登录成功执行相应界面逻辑
						outputs("退出登录界面，返回到游戏画面。。。");
						exctueLoginResult(false);
					}
					else
					{
						//登录失败
						outputs("登录失败：" + data.toString());
						exctueLoginResult(false);
					}
					break;
				
				case Constants.CALLBACKTYE_Logout:
					//收到用户切换账号（注销登录）消息，游戏需将游戏逻辑置于未登录状态，游戏可重新调用登录方法以进行账号切换
					//data 为 String 类型，表示错误说明
					isLogined = false;
					outputs("用户退出当前账号了，需把游戏逻辑和画面置为未登录状态，游戏可重新调用登录方法以进行账号切换。。。");
					UCGameSDK.getInstance().destroyFloatButton();
					
					TweenLite.delayedCall(0.1,logoutDespatch);
					//
					//重置游戏登录状态
					//
					
					//重新登录
//					btnLogin_clickHandler(null);
					break;
				
				case Constants.CALLBACKTYE_ShowFloatButton:
					//收到悬浮按钮打开SDK界面（离开游戏画面） 或 SDK界面关闭（返回游戏画面）的消息
					//data 为 String 类型，无实际意义
					if (code == StatusCode.SDK_OPEN)
					{
						//SDK界面打开
						outputs("打开SDK界面了。。。");
					}
					else if (code == StatusCode.SDK_CLOSE)
					{
						//SDK界面关闭
						outputs("SDK界面关闭了，返回游戏画面。。。");
					}
					break;
				
				case Constants.CALLBACKTYE_EnterUserCenter:
					//收到用户退出九游社区的消息，返回游戏画面
					//data 无实际意义
					if (code == StatusCode.SUCCESS)
					{
						outputs("退出九游社区，返回游戏画面。。。");
					}
					break;
				
				case Constants.CALLBACKTYE_EnterUI:
					//收到用户退出SDK界面的消息，返回游戏画面
					//data 无实际意义
					if (code == StatusCode.SUCCESS)
					{
						outputs("退出SDK界面，返回游戏画面。。。");
						Util.exitGame(null,1);
					}
					break;
				
				case Constants.CALLBACKTYE_Pay:
					//收到充值下单结果的消息，游戏可能需要将下单结果传给游戏服务器。游戏服务器保存后，等待最终支付结果，再为用户发放游戏货币或奖励
					//data 中包含订单结果数据
					if (code == StatusCode.SUCCESS) 
					{
						var orderId:String = data.orderId;
						var orderAmount:Number = data.orderAmount;
						var payWay:int = data.payWay;
						var payWayName:String = data.payWayName;
						
						var txt:String = "orderId=" + orderId + ", orderAmount=" + orderAmount.toString() + ", payWay=" + payWay.toString() + ", payWayName=" + payWayName;
						outputs("充值下单成功：" + txt);
						
						PlatformManager.getInstance().showTipAfterBuy();
						
						
					}
					else if (code == StatusCode.PAY_USER_EXIT)
					{
						//退出充值界面，返回游戏画面
						outputs("退出充值界面，返回游戏画面。。。");
					}
					else if (code == StatusCode.FAIL)
					{
						//充值下单失败
						outputs("充值下单失败！");
					}
					proccessBid();
					break;
				
				case Constants.CALLBACKTYE_UPointCharge:
					//收到 U点充值 完成的消息（U点充值界面已关闭）
					if (code == StatusCode.SDK_CLOSE) 
					{
						outputs("U点充值已完成");
					} 
					else if (code == StatusCode.NO_INIT)
					{
						outputs("尚未初始化");
					}
					else if (code == StatusCode.NO_LOGIN)
					{
						outputs("尚未登录");
					}
					else 
					{
						outputs("未知错误：code=" + code.toString() + ", msg=" + String(data));
					}
					break;
				case Constants.CALLBACKTYE_ExitSDK:
					outputs("退出........code= " + code);
					if (code == StatusCode.SDK_EXIT) 
					{
						outputs("退出游戏");
						UCGameSDK.getInstance().dealloc();
						NativeApplication.nativeApplication.exit();
					}
					else if (code == StatusCode.SDK_EXIT_CONTINUE)
					{
						outputs("继续游戏");
					}
					else 
					{
						outputs("未知错误：code=" + code.toString() + ", msg=" + String(data));
					}
					break;
			}
			
		}
		private function logoutDespatch():void
		{
			logout_SN.dispatch(true,{});
		}
		private function outputs(txt:String):void
		{
//			txtOutputs.appendText(txt + "\n");
//			TestTemplate.traceLog(txt);
			trace(txt);
		}
		
		private function log(msg:String):void
		{
			trace(msg);
		}
		
		public override function get loginPlatName():String
		{
			
			return "ucand";
		}
		
		public override function get payPlatName():String
		{
			return "ucand";
		}
		
		public override function get onlyPlatName():String
		{
//			throw new Error("android 的uc 名称不是 uc，  完毕之后，封测礼包有问题");
			return "ucand";
		}
		
		private function callBack(event:StatusEvent):void
		{
			PlatformManager.log("event : "+event.toString());
//			var xml:XML=new XML(level);
//			var errorCode:int=int(String(xml.errorCode));
//			var orderNo:String
//			switch(code)
//			{
//				case UCGameSDK.getInstance().CODE_LOGIN:
//				{
//					if(errorCode==0){
//						_openId=UCGameSDK.getInstance().getSid();
//						exctueLoginResult(true);
//					}else{
//						exctueLoginResult(false);
//					}
//					break;
//				}
//				case UCGameSDK.getInstance().CODE_PAY:
//					//				{"text":"DL_PAY : <result><orderNo>598_1384_789_21688672_20140402115722</orderNo><errorCode>0</errorCode><errorMsg>支付成功</errorMsg></result>","method":"logcat","tag":"AneLog"}
//					if(errorCode==0){
//						orderNo=String(xml.orderNo);
//						_payback_SN.dispatch(true,{});
//					}
//				default:
//				{
//					break; 
//				}
//			}
		}
		
		private var requesLogin:Boolean=false;
		public override function login():void
		{
			//			TestTemplate.traceLog("try login");
			if(isInitSucceeded){
				UCGameSDK.getInstance().login(false,"",null);
			}else{
				requesLogin=true;
			}
			
		}
		public override function pay(pid:String, bid:String):void
		{
			
			proccessBid();
			
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node==null) return ;
			
			
			_tempBid=bid;
			
			var allowContinuousPay: Boolean=true;
			//warning
//			var amount: Number=0.01;
			var amount: Number=node.rmb;
			CONFIG::PayTest{
				amount=0.01;
			}
			var roleId: String=GLBaseData.userId;
			var roleName: String=GLBaseData.userName;
			var grade: String="grade";
			var customInfo: String=bid;
			
			UCGameSDK.getInstance().pay(allowContinuousPay, amount, serverId, roleId, roleName, grade, customInfo);
		}
	
		
		public override function openGamecenter():void
		{
			UCGameSDK.getInstance().enterUserCenter();
		}
		
		public override function logout():void{ 
			UCGameSDK.getInstance().logout();
		}
		
		public override function get osType():String{
			return Plat_Base.OS_And_Guonei;
		}

		
		public override function get ExtrFlagObj():Object
		{
			var obj:Object={};
			obj[PlatExtrFlag.IgnoreCheckSession]=true;
			obj[PlatExtrFlag.ListernExitGame]=true;
			obj[PlatExtrFlag.ReloadAfterLogout]=true;
			obj[PlatExtrFlag.HideExitGameFn]=true;
			obj[PlatExtrFlag.AutoLoginAfterLogout]=true;
			return obj;
		}
		
		public function beforeExit():void{
			UCGameSDK.getInstance().exitSDK();
			PlatformManager.log("退出前调用");
		}
	}
}