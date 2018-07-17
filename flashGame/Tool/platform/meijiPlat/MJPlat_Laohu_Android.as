package Tool.platform.meijiPlat
{
	import com.fish.GLBaseData;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.wanmei.tigersdkextension.TigerSDKExtension;
	
	import flash.events.StatusEvent;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;

	public class MJPlat_Laohu_Android extends Plat_Base
	{
		
		//登陆回调状态码
		public static var LIB_PLATFORM_LOGIN_SUCCESS:int = 1;
		public static var LIB_PLATFORM_LOGIN_FAIL:int = 2;
		public static var LIB_PLATFORM_LOGIN_CANCEL:int = 3;
		//关闭SDK界面（回到游戏或其他应用）
		public static var LIB_PLATFORM_HIDDEN:int = 4;
		public static var LIB_PLATFORM_LOGOUT:int = 5;
		//支付回调状态码
		public static var LIB_PLATFORM_ORDER_SUCCESS:int = 0;
		public static var LIB_PLATFORM_ORDER_FAIL:int = 1;
		public static var LIB_PLATFORM_ORDER_INVALID_ORDERNUM:int = 10013;
		//屏幕方向参数
		public static var SCREEN_ORIENTATION_NO_SETTING:int = 0;
		public static var SCREEN_ORIENTATION_LAND:int = 1;
		public static var SCREEN_ORIENTATION_SENSOR_LAND:int = 2;
		public static var SCREEN_ORIENTATION_PORT:int = 3;
		public static var SCREEN_ORIENTATION_SENSOR_PORT:int = 4;
		//用户登录状态
		public static var NOT_LOGIN:int = 0;
		public static var ACCOUNT_LOGIN:int = 1;
		public static var GUEST_LOGIN:int = 2;
		
		private var ane:TigerSDKExtension = new TigerSDKExtension();
		private static var appId:int = 10127;
		private static var appKey:String = "iYutXfYtl4bkofWyQWMRdBzSrJzDsTpa";
		private static var channelId:int = 1;
		private static var result:Object={};
		
		
		public function MJPlat_Laohu_Android()
		{
			super();
		}
		
		public override function get loginPlatName():String
		{
			return "wmand";
		}
		
		public override function get payPlatName():String
		{
			return "wmand";
		}
		
		public override function get onlyPlatName():String
		{
			return "wmand";
		}
		public override function get osType():String{
			return Plat_Base.OS_And_Guonei;
		}
		
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.ShowWanmeiLogo]=true;
			return obj;
		}
		
		public override function init():void{
			ane.initSDK(appId,appKey,channelId,3,listener);
			GameStatus.change_SN.add(onChageStatus);
		}
		
		private function onChageStatus(status:String):void{
			if(status==GameStatus.ST_GameOngoing){
				ane.doStartFloatView(0,0);
			}else{
				ane.doStopFloatView(true);
			}
			
		}
		
		private function listener(e : StatusEvent) :void{
			trace("listener: "+"e.level: "+e.level+" e.code: "+e.code+" result:"+JSON.stringify(result))
			trace(JSON.stringify(ane.getUserInfo()));
			if(e.level=="LibDoLogin"){ 
				if(e.code=="1"){
					trace("userId: "+result.userId+" nick: "+result.nick+" token: " + result.token);
					setPlatInfo(result.userId,result.token,result.nick);
					exctueLoginResult(true);
				}else if(e.code=="4"){
					// 注销账号
//					if(result.loginStatus==NOT_LOGIN){
//						// 登出
//						trace("注销账号");
//						logout_SN.dispatch(true,{});
//					}else{
//						
//					}
					trace("userInfo : "+ane.getUserInfo().toString());
					if(JSON.stringify(ane.getUserInfo())=="{}"){
						logout_SN.dispatch(true,{});
					}
				}
				// 登出
//				e.level: LibDoLogin e.code: 5 result:{"userId":8743623,"nick":"yhffghv","loginStatus":1,"token":"bdc1c469f28040a3ac0a08149f63c24b"}
				else{
					exctueLoginResult(false);
				}
				
				
			}else if(e.level=="LibDoPay"){
//				listener: e.level: LibDoPay e.code: 0 result:{"userId":3046045,"loginStatus":1,"nick":"GhostLmm","token":"4d103f2fd2f040298050262260a80900"}
//				e.level: LibDoPay e.code: 0 result:{"userId":3046045,"nick":"GhostLmm","token":"7848e4e1a42340c7a251ab9994f1ca30","loginStatus":1}
//				if(e.code=="0"){
//					PlatformManager.getInstance().showTipAfterBuy();
//					trace("order success");
//					
//				}
				proccessBid();
			}
		}
		
		public override function login():void{
			var autoLogin:Boolean = true;
			
			ane.doLogin(result,autoLogin);
			
		}
		
		public override function pay(pid:String, bid:String):void{
			proccessBid();
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node==null) return ;
			
			_tempBid=bid;
			
			var orderNo:String = bid;//外部订单号
//			var price:int = 1;//单位为分
			var price:int = node.rmb*100;
			CONFIG::PayTest{
				price=1;
			}
			
			var description:String = node.name;//商品名称
			var serverId:int = int(GLBaseData.serverId);//服务器ID
			var ext:String = bid;//附加信息
			
			ane.doPay(orderNo,price,description,serverId,ext);
		}
	
		public override function openGamecenter():void{
			ane.doStartAccountHome();
		}
		
		public override function get supportLuntan():Boolean{
			return true;
		}
		public override function enterLuntan():void{
			ane.doStartAccountForum();
		}
		
		public override function logout():void{
//			ane.doSwitchAccount();
		}
		public override function get supportLogout():Boolean{
			return false;
		}
		public override function get supportSwitchAccount():Boolean{
			return true;
		}
		public override function switchAccount():void{
			ane.doSwitchAccount();
		}
		
		/*public static var LIB_PLATFORM_LOGIN_SUCCESS = 1;
		public static var LIB_PLATFORM_LOGIN_FAIL = 2;
		public static var LIB_PLATFORM_LOGIN_CANCEL = 3;
		//关闭SDK界面（回到游戏或其他应用）
		public static var LIB_PLATFORM_HIDDEN = 4;
		public static var LIB_PLATFORM_LOGOUT = 5;
		//支付回调状态码
		public static var LIB_PLATFORM_ORDER_SUCCESS = 0;
		public static var LIB_PLATFORM_ORDER_FAIL = 1;
		public static var LIB_PLATFORM_ORDER_INVALID_ORDERNUM = 10013;
		//屏幕方向参数
		public static var SCREEN_ORIENTATION_NO_SETTING = 0;
		public static var SCREEN_ORIENTATION_LAND = 1;
		public static var SCREEN_ORIENTATION_SENSOR_LAND = 2;
		public static var SCREEN_ORIENTATION_PORT = 3;
		public static var SCREEN_ORIENTATION_SENSOR_PORT = 4;
		//用户登录状态
		public static var NOT_LOGIN = 0;
		public static var ACCOUNT_LOGIN = 1;
		public static var GUEST_LOGIN = 2;
		*/
		
	}
}