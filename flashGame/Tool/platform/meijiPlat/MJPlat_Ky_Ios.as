package Tool.platform.meijiPlat
{
	import com.adobe.crypto.MD5;
	import com.fish.GLBaseData;
	import com.ghostlmm.tool.HttpRequest;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.kuaiyong.sdk.KY_FlashDelegate;
	import com.kuaiyong.sdk.KY_FlashSDK;
	
	import flash.desktop.NativeApplication;
	import flash.events.InvokeEvent;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;

	
	public class MJPlat_Ky_Ios extends Plat_Base implements KY_FlashDelegate
	{
		public override function get platSplashPicClass():Class{
			return KuiYongFlashPage.splashClass;
		}
		private var ss:KY_FlashSDK;
		
		private var token:String;
		
		private var kyid:String;
		
		private var userName:String;
		
		private var request:HttpRequest;
		
		private var orderId:String;
		
		public function MJPlat_Ky_Ios()
		{

			ss = KY_FlashSDK.instance();
			
			ss.setISShowForgetGamePwd("1");
			
			ss.setDelegate(this);
			
			request=HttpRequest.getInstance();
			
			super();
		}
		
		public override function get loginPlatName():String
		{
			return "ky";
		}
		
		public override function get payPlatName():String
		{
			return "ky";
		}
		
		public override function get onlyPlatName():String
		{
			return "ky";
		}
		
		override public function init():void
		{
			// TODO Auto Generated method stub

			ss.initSDK();
			MessageTextAppendString("initSDK");
			
			//super.init();
		}
		
		
		
		/**
		 * ret结果，当只有一位并且不为0时，为请求服务器错误
		 * 第二位为传给sdk的订单号，checkDealseq该方法传递的第一个参数
		 * 第三位位金额
		 * 第四位为sdk内部订单号
		 * 第五位为支付结果是否正确0支付成功，1支付失败
		 * 第六位为userid
		 **/
		public function backCheckDel(ret:Array):void
		{
			trace(ret);
		}
		
		public function callBackForgetGamePwd():void
		{
			trace("callBackForgetGamePwd");
		}
		
		
		
		//以下为回调函数
		
		//登陆成功后回调
		public function loginCallBack(tokenKey:String):void
		{
			trace(tokenKey);
			
			MessageTextAppendString("user quick login");
					
			token=tokenKey;
			
			requestUid();
		}
		
		//快速试玩回调
		public function quickLogCallBack(tokenKey:String):void
		{
			
			MessageTextAppendString("user quick login");
			
			token=tokenKey;
			
			requestUid();
			
		}
		
		public function logOutCallBack(guid:String):void
		{
			trace("abcdefg");
			trace(guid);
		}
		
		public function gameLoginSuc():void
		{
			trace("sdsdsd");
		}
		
		public function closePayCallback():void
		{
			trace("wwwwwww");
			proccessBid();
			//PlatformManager.getInstance().showTipAfterBuy();
			//ss.checkDealseq(orderId,"美姬爱作战","3PXupxWAJoR5ULbgU6J82FLZxamxYJwi");
		}
		
		public function gameLoginCallback(username:String,password:String):void
		{
			//			ss.gameLogMes("","0");
			trace("name"+ username + "password" + password);
			ss.showStateGame("suc");
			
		}
		
		//0:银联成功
		//1:银联失败
		//2:银联退出支付
		//3:没有回传值
		public function UPPayPluginResult(state:String):void
		{
			trace(state);
			MessageTextAppendString("用户银联支付成功");
			proccessBid();
			PlatformManager.getInstance().showTipAfterBuy();
		}
	
		
		
		private function MessageTextAppendString(text:String):void{
			PlatformManager.log(text);
		}
		
		override public function login():void
		{
			// TODO Auto Generated method stub
			MessageTextAppendString("login");
			//控制登陆界面是否含有游戏账号的选项（新游戏没有老用户时，可将游戏账号选项关掉,0:开启，1：关闭）
			ss.changeLogOption("1");
			ss.showUserView();
			
		}
		
		override public function logout():void
		{
			// TODO Auto Generated method stub
			MessageTextAppendString("logout");
			//执行返回登陆界面的操作（该方法回先注销用户，该注销没有回调）
			ss.userBackToLog();
//			ss.userLogOut();
			//super.logout();
		}
		
		override public function get osType():String{
			
			return OS_Ios_Yueyu;
		}
		
		override public function openGamecenter():void
		{
			// TODO Auto Generated method stub
			//in game 调用UserView就是显示设置界面
			MessageTextAppendString("在游戏内部调用UserView就是显示设置界面");
			ss.setUpUser();
			//super.openGamecenter();
		}
		
		override public function pay(pid:String, bid:String):void
		{
			// TODO Auto Generated method stub
			proccessBid();
			
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node==null) return;
			
			_tempBid=bid;
			orderId=bid;
			
			
			var rmb:Number= node.rmb;
			
			CONFIG::PayTest{
				rmb=0.1;
			}
			
			var cooOrderSerial:String = bid;
			var productId:String = pid;
			
			var productName:String = node.name;
			var productPrice:Number = rmb;
			var productOrignalPrice:Number = rmb;
			var productCount:Number = 1;
			var payDescription:String = GLBaseData.userId+"/"+GLBaseData.serverId+"/"+pid;
			ss.showPay(cooOrderSerial,rmb.toString(),"4187","",payDescription,"eB6DV8MjF8cDessa8cpFf8Ekawia2rHg","kytestappscheme");
		
		}
		
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.FlashApale]=true;
			return obj;
			
		}
		
//		//快速试玩的登录成功后回调的函数
//		public function quickGameWithserviceTokenKey(tokenKey:String):void
//		{
//			MessageTextAppendString("user quick login");
//			
//			token=tokenKey;
//			
//			requestUid();
//			
//			
//		}
//		//游戏账号登录后的回调函数
//		public function gameLogBack(username:String,password:String):void
//		{
//			MessageTextAppendString("user log back");
//			
//			
//		}
//		//用户注销后回调的函数
//		public function userLoginOut(guid:String):void
//		{
//			MessageTextAppendString("user log out");
//			
//			
//		}
//		//登录成功后的回调
//		public function userLoginWithserviceTokenKey(tokenKey:String):void
//		{
//			MessageTextAppendString("login success Token is"+tokenKey);
//			
//			token=tokenKey;
//			
//			requestUid();
//			
//		}

		
		
		
		public function cancelUpdateCallBack():void
		{
			trace("asdasdssss");
		}
		
		
		public function userBehavior(userBehavior:String):void
		{
			
			//			"0",    //用户进行银联支付
			//			"1",     //用户提交了卡类订单
			//			"2",     //用户关闭了支付界面
			//			"3",      //用户使用了支付宝wap
			//			"4",  //用户银联支付成功
			//			"5",    //用户银联支付失败
			//			"6"    //用户取消银联支付
			switch(userBehavior)
			{
				case "0":
					MessageTextAppendString("用户进行银联支付");
					break;
				case "1":
					MessageTextAppendString("用户提交了卡类订单");
					break;
				case "2":
					MessageTextAppendString("用户关闭了支付界面");
					break;
				case "3":
					MessageTextAppendString("用户使用了支付宝wap");
					break;
				case "4":
					MessageTextAppendString("用户银联支付成功");
					proccessBid();
					PlatformManager.getInstance().showTipAfterBuy();
					break;
				case "5":
					MessageTextAppendString("用户银联支付失败");
					break;
				case "6":
					MessageTextAppendString("用户取消银联支付");
					break;
				
				
			}
			
			
		}

		public function requestUid():void
		{
			MessageTextAppendString("requestUid");
			
			var url:String="http://f_signin.bppstore.com/loginCheck.php";
			
			var appKey:String="098797918cbc8202282f08d04e3088d4";
			
			var sign:String=MD5.hash(appKey+token);
			
			var requestData:String="tokenKey="+token+"&sign="+sign;
			
			MessageTextAppendString(requestData);
			
			request.getRequest(url,requestData,getGuid);
			
		}
		
		public override function get supportPlatSplash():Boolean{
			return true;
		}
		
		public function getGuid(param1:String):void
		{
			//当使用游戏账号登陆后，需要游戏开发商调用gameLogMes，告诉sdk该账号、密码是否正确。mes为错误信息 state为0时为成功，1时为失败。
			MessageTextAppendString("getGuid"+param1); 
			
			if(param1!=null)
			{
				var obj:Object=JSON.parse(param1);
				MessageTextAppendString(obj.code);
				MessageTextAppendString(obj.msg);
				if(obj.code == 0)
				{
				var obj1:Object=JSON.parse(JSON.stringify(obj.data));
				MessageTextAppendString(obj1.guid);
				MessageTextAppendString(obj1.username);	
				kyid=obj1.guid;
				userName=obj1.username;
				
                setPlatInfo(kyid,token,userName);
				
				exctueLoginResult(true);
				
				}
				else {
				
					exctueLoginResult(false);
				}
				
			}
			
		}
	
	}
}