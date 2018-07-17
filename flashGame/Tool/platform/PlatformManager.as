package Tool.platform
{
	
	import com.fish.GLBaseData;
	import com.fish.modules.core.ViewControl;
	import com.fish.modules.preloadMD.models.XMLLoader_MD;
	import com.ghostlmm.tool.HttpRequest;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TweenLite;
	import com.hurlant.util.Base64;
	
	import flash.events.EventDispatcher;
	import flash.utils.getTimer;
	
	import Tool.ApplicationInfoDesc;
	import Tool.PersistentObj;
	import Tool.chongzhiCheck.CheckItem;
	import Tool.chongzhiCheck.ChongzhiCheckManager;
	import Tool.platform.meijiPlat.GameServerEvent;
	import Tool.platform.meijiPlat.GameServerManager;
	import Tool.platform.meijiPlat.IMJPlatform;
	import Tool.platform.meijiPlat.PlatAdapt;
	import Tool.platform.meijiPlat.StaticConfig;
	
	import net.NetWorkInfoManager;
	
	import org.osflash.signals.Signal;
	
	import util.Util;
	
//	import myDisplay.WindowManager;
//	import myDisplay.global.GlobalConfig;
//	import myDisplay.tips.TextTipManager;



	public class PlatformManager extends EventDispatcher
	{

		public static const APP_KEY:String="dig";
		/**  李成 后台服务器 地址
		 * */
//		public static var WEBIP:String="http://mjazz-pay.autopatch.173.com/"; // appstore 后台
//		private static const WEBIP:String="http://192.168.200.108/";  // 内网测试
//		private static const WEBIP:String="http://112.64.150.42/";  //外网测试
		
		// 完美推广 混服地址请求
//		public static var WEBIP:String="http://mjazz-payment.autopatch.173.com/";  
//		
//		CONFIG::AppstoreLaohu{
//			WEBIP="http://mjazz-pay.autopatch.173.com/";
//		}
		/**
		 *   测试地址
		 */
//		private static const webIp_test:String="http://120.24.249.95:8080/";
		
		/**
		 *   android 正式充值 检查地址
		 */
//		private static const webIp_publish_and:String="http://pay.wow.shanjinzhen.com/";
		
		/*public static function getProxyWebIP():String{
			return webIp_test;
//			return webIp_publish_and;
		}
		*/
		/**
		 *   李成 账号验证地址
		 */
		/*public static function get WEBIP():String{
			// 混服地址
			if(SwitchConfig.ST_RemoteLoad){
				var wp:String=GameArgRefelect.accountServerUrl;
				if(wp){
					return wp;
				}
				return getProxyWebIP();
			}
			return getProxyWebIP();
		}*/
		
		
		private static const gameId:String="10002";
		
		private static var _udid:String;
		public static function get udid():String
		{
			if(_udid==null){
				_udid=NetWorkInfoManager.getInstance().getMac();
			}
			return _udid;
		}
		
		
		public var paySuccessSN:Signal=new Signal(CheckItem);
		private var loginComFn:Function; 
		private var _bidMap:PersistentObj=new PersistentObj("pay.billmap");
		
		public static const IntervalTime:int=5000;
		private var lastTime:int;
		

		private static var _instance:PlatformManager;
		
//		private var platformObj:PlatformQQ2;
		private var _platformObj:IMJPlatform;
		private var _shareFail:Function;
		private var _shareSuccess:Function;
		
		public var union_login_SN:Signal=new Signal(Boolean);
		
		public static function log(text:String):void
		{
			trace(text);
			
//			AndroidToolHelper.instance.logcat("zombieGame",text);
		}
		
		public function get platformObj():IMJPlatform
		{
			if(_platformObj==null)
			{
				_platformObj=PlatAdapt.createPlatform();
				
			}
			return _platformObj;
		}
		
		public function PlatformManager()
		{
			
		}

		public static function getInstance():PlatformManager
		{
			if(!_instance)
				_instance=new PlatformManager();
			return _instance;
		} 
		
		/**
		 *   激活游戏帐号
		 */
		public function activeGameAccount():void
		{
			if(getFlagByAttr(PlatExtrFlag.DontSendActiveMsg)){
				return ;
			}
			GameServerManager.instance.gameActive(platformObj.openId,GLBaseData.serverId);
		}
		
		/**   后台服务器的平台代码
		 * */
		public function getLoginPlatName():String
		{
			if(platformObj.supportGameconfig){
				return String(GLBaseData.gameConfig.loginPlatName[0]);
			}
			return platformObj.loginPlatName;
		}
		
		public function newLogin():void
		{
			platformObj.login_SN.add(onLoginResult);
			platformObj.login();
		}
		private function onLoginResult(success:Boolean,arg:Object):void
		{
			if(success){
				//如果平台登录成功的话去后台检测
				//warning  现在是测试
				if(getFlagByAttr(PlatExtrFlag.IgnoreCheckSession)){
					PlatformManager.log("onLoginResult 175");
					union_login_SN.dispatch(true);
				}else{
					PlatformManager.log("onLoginResult 178");
					GameServerManager.instance.checkSession(_platformObj.token,_platformObj.openId);
				}
			}
		}
		
//		public function 
		
		/**   账号登陆
		 *   @ _completeFn 账号登陆成功后执行
		 *   _nomalLogin 
		 * */
		public function startLogin(_normalLogin:Function,_completeFn:Function,_failFn:Function=null):void
		{
			
			if(platformObj.supportPlatAccount){
				log("startLogin 193");
				platformObj.setLoginFn(_completeFn,_failFn);
				platformObj.login();
			}else{
				log("startLogin 197");
				_normalLogin();
			}
		}

		
		private var platInitFlag:Boolean=false;
		public function init():void
		{
			if(platInitFlag) return ;
			
			platInitFlag=true;
			
			platformObj.init();
			initGameserver();
			platformObj.payBackSingal.add(onPayResult);
			
			platformObj.logout_SN.add(onLogoutResult);
			//如果使用平台登录了，那就
			platformObj.accountSwitch_SN.add(onSwitchAccount);
			
		}
		
		
		
		public function initGameserver():void
		{
			
			GameServerManager.instance.setIp(UrlConfig.payServerUrl,platformObj.onlyPlatName,gameId,udid);
			
			GameServerManager.instance.addEventListener(GameServerEvent.Evt_Server,ongameServerEvent);
		}
		
		private function ongameServerEvent(evt:GameServerEvent):void
		{
			if(!evt.effect) return ;
			
			if(evt.key==GameServerManager.KEY_CreateOrder){
				//				{"orderResult":{"code":0,"orderId":"xxx","goodsId":"xxx"}} 
				if(evt.data && evt.data.orderResult && evt.data.orderResult.code==0){
					//					unipayAsyn_clickHandler(evt.data.orderResult.orderId,evt.data.orderResult.goodsId);
					_bidMap.setVaule(evt.data.orderResult.orderId,evt.data.orderResult.goodsId);
					closeRefresh();
					platformObj.pay(evt.data.orderResult.goodsId,evt.data.orderResult.orderId);
					
				}else{
					Util.flow("生成订单失败");
				}
				
			}
			if(evt.key==GameServerManager.KEY_CheckSession){
				if(evt.data && evt.data.checkResult && evt.data.checkResult.code==0){
					Util.flow("帐号验证成功");
					union_login_SN.dispatch(true);
				}else{
					Util.flow("账号验证出错");
					union_login_SN.dispatch(false);
				}
			}
			if(evt.key==GameServerManager.KEY_GameActivate){
				if(evt.data && evt.data.activeResult && evt.data.activeResult.code==0){
					trace("游戏激活成功");
				}else{
					activeCount--;
					if(activeCount>0){
						activeGameAccount();
					}
					
				}
			}
		}
		
		private var activeCount:int=10;
		
		
		private var chongInitFlag:Boolean=false;
		/**   初始化充值 检测
		 * */
		public function initChongCheck():void
		{
			if(chongInitFlag) return ;
			chongInitFlag=true;
			trace("充值初始化");
//			ChongzhiCheckManager.instance.setCheckBackUrl(UrlConfig.payUrl);
//			ChongzhiCheckManager.instance.setProccessHandle(onPaySuccess);
//			ChongzhiCheckManager.instance.startPostPerChongzhi();
		}
		
		private function onLogoutResult(success:Boolean,data:Object=null):void
		{
			if(success){
				if(getFlagByAttr(PlatExtrFlag.ReloadAfterLogout)){
					GameRefreshControl.refreshFlag=false;
					ViewControl.reEnterGame();
				}else{
					Util.exitGame();
					showWaitAfterLogout();
				}
				
			}else{
				Util.flow("注销失败");
			}
		}
		
		private function onSwitchAccount(success:Boolean,data:Object=null):void{
			if(success){
				Util.flow("账号切换成功，退出游戏");
				Util.exitGame(null,1);
				showWaitAfterLogout();
			}else{
				Util.flow("切换账号失败");
			}
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
			arg.platname=getPayPlatName();
//			arg.app_key="tqt";
			
			HttpRequest.getInstance().getRequest(UrlConfig.payUrl,arg,function(data:Object):void
			{
				try{
					var json:Object=JSON.parse(String(data));
					trace("请求订单id 返回:"+data);
					if(json.result>0){
//						_bidMap[json.bill_no]=pid;
						_bidMap.setVaule(json.bill_no,pid);
						closeRefresh();
						lastTime=getTimer();
						
						platformObj.pay(pid.toString(),json.bill_no);
						
					}
					
				}catch(e:Error){
					
				}
				
			},60000,false,"text",true);
		}
		
		private function onPaySuccess(checkItem:CheckItem):void
		{
			if(checkItem.success && checkItem.postObj.id==GLBaseData.userId){
				paySuccessSN.dispatch(checkItem);
			}
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
		
		private function onPayResult(success:Boolean,data:Object):void
		{
			openRefresh();
			var bid:String=data.orderid;
			if(_bidMap.getValueByKey(bid)!=null){
				var pid:int=int(_bidMap.getValueByKey(bid));
				var node:Node_chongzhi=XMLDataManager.getChongzhiById(pid);
				if(node){
					var arg:Object={};
					arg.id=GLBaseData.userId.toString();
					arg.platname=getPayPlatName();
					arg.cost=node.rmb.toString();
					arg.token="tempToken";
					//					arg.poi=createOrderId(pid);
					arg.pay_id=node.id.toString();
					arg.pay_act="pay_check";
					//			arg.PLATNAME
					arg.sign="sd";
//					arg.app_key="tqt";
					
					arg.bill_no=bid;
					
//					ChongzhiCheckManager.instance.addCheckData(arg);
					_bidMap.deleteKey(bid);
				}
			}
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
			
			if(SwitchConfig.ST_UserUnionAccount){
				//如果使用统一平台登录
				if(SwitchConfig.ST_TestChongzhi){
					requestOrderId(pid);
				}else{
					if(getFlagByAttr(PlatExtrFlag.Pay_Ali)){
						requestOrderId(pid);
					}else{
						var goodsId:String=createGoodsId(pid);
						GameServerManager.instance.createOrder(platformObj.openId,
							goodsId,GLBaseData.userId,GLBaseData.serverId,GLBaseData.userName,GLBaseData.userName);
					}
					
				}
				
//				GameServerManager.instance.createOrder(gameId,pid,"",GLBaseData.serverId,
			}else{
				requestOrderId(pid);
			}
			
			
		}
		
		private function createGoodsId(bid:int):String
		{
			return bid.toString();
//			var node:Node_chongzhi=XMLDataManager.getChongzhiById(bid);
//			
//			if(platformObj.onlyPlatName=="gccn"){
////				return "";
//				return node.ios_id;
//			}else{
//				return bid.toString();
//			}
		}
		
		
		public function getFlagByAttr(attr:String):Boolean
		{
			var flag:Object=platformObj.ExtrFlagObj;
			if(flag && flag[attr])
			{
				return flag[attr];
			}
			else
			{
				return false;
			}
		}
		/**  支付平台名称
		 * */
		public function getPayPlatName():String{
			if(platformObj.supportGameconfig){
				return String(GLBaseData.gameConfig.payPlatName[0]);
			}
			return platformObj.payPlatName;
		}
		/**  各个平台的唯一id
		 * */
		public function getOnlyPlatName():String
		{
			if(platformObj.supportGameconfig){
				return String(GLBaseData.gameConfig.onlyPlatName[0]);
			}
			return platformObj.onlyPlatName;
		}
		public function logout():void
		{
			if(platformObj.supportLogout){
				platformObj.logout();
			}
		}
		public function switchAccount():void{
			if(platformObj.supportSwitchAccount){
				platformObj.switchAccount();
			}
		}
		/**
		 *  是否支持切换账号
		 */
		public function supportSwitchAccount():Boolean{
			return platformObj.supportSwitchAccount;
		}
		
		public function supportLogout():Boolean{
			return platformObj.supportLogout;
		}
		public function supportBindAccount():Boolean{
			return platformObj.supportBindAccount;
		}
		public function supportGamecenter():Boolean{
			return platformObj.supportGamecenter;
		}
		public function openGamecenter():void{
			if(platformObj.supportGamecenter){
				platformObj.openGamecenter();
			}
		}
		public function supportLuntan():Boolean{
			return platformObj.supportLuntan;
		}
		public function supportPlatExit():Boolean{
			return platformObj.supportPlatExit;
		}
		public function platExit():void{
			if(platformObj.supportPlatExit){
				platformObj.platExit();
			}
		}
		
		/**
		 *   进入论坛
		 */
		public function enterLuntan():void{
			if(platformObj.supportLuntan){
				platformObj.enterLuntan();
			}
		}
		public function supportPlatAccount():Boolean{
			return platformObj.supportPlatAccount;
		}
		/**   注销游戏显示的界面
		 * */
		public function showWaitAfterLogout():void{
			
		}
		
		/**  获取福利qq群号
		 * */
		public function getFuliQQ():String{
			//warning 同一平台后 qq 群需要重新改一下
//			var zone:int=0;
//			for each(var node:Node_qq in XMLDataManager.Node_qqArray){
//				if(node.tag==getOnlyPlatName()){
//					zone++;
//					if(zone==int(GLBaseData.serverId)){
//						return String(node.qq).replace("qq","");
//					}
//				}
//			}
			return getOnlyPlatName()+"/"+GLBaseData.serverId+"/缺失qq";
		}
		
		/**
		 *  支付成功 提示
		 */
		public function showTipAfterBuy():void
		{
			Util.flow("你已经购买成功，元宝稍后到账");
		}
		
		/**   提示
		 * */
		public function getServerZoneTip():String
		{
			if(SwitchConfig.ST_UserUnionAccount){
				
				var s:String="V"+ApplicationInfoDesc.NativeInfo.versionStr;
				if(SwitchConfig.ST_RemoteLoad){
					s="V"+AppVersionInfo.VERSION;
				}
				if(!getFlagByAttr(PlatExtrFlag.HidePlatFlag)){
					s+=" "+getOnlyPlatName();
				}
				
				if(XMLLoader_MD.UseCache==false){
					s+="警x";
				}
				CONFIG::PayTest{
					s+="充";
				}
				
				return s;
			}
			var serverBase64:String=Base64.encode(UrlConfig.WebAddressRequestUrl);
			var serverType:String=StaticConfig.UrlMap["default"];
			if(StaticConfig.UrlMap.hasOwnProperty(serverBase64)){
				serverType=StaticConfig.UrlMap[serverBase64];
			}
			var re:String = serverType+"  V"+ApplicationInfoDesc.NativeInfo.versionStr+" "+getOnlyPlatName();
			
			if(XMLLoader_MD.UseCache==false){
				re+="警告xml";
			}
			
			trace("app信息: "+re);
			return re;
		}
		
		
		public function getOsType():int
		{
//			1 IOS越狱
//			2 安卓国内
//			3 IOS官服简体
//			4 IOS官服繁体		NUMBER
			var osType:String=platformObj.osType;
			return int(osType);
		}
		
		public static const OT_YueyuIos:String="1";
		public static const OT_GuoneiAnd:String="2";
		public static const OT_AppstoreIos:String="3";
		
		private static const OSMAP:Object={
			"gccn":3
		};
		
	}
}