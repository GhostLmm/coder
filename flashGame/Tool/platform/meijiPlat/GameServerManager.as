package Tool.platform.meijiPlat
{
	import com.ghostlmm.tool.HttpRequest;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;

	public class GameServerManager extends EventDispatcher
	{
		
		public static const session_id:String = "sessionId";
		public static const platformflag:String = "platformflag";
		public static const uid:String = "uid";
		public static const udid:String = "udid";
		public static const paytypeflag:String = "paytypeflag";
		public static const account:String = "account";
		public static const goodsid:String = "goodsid";
		public static const authCode:String = "authCode";
		public static const gameid:String = "gameid";
		public static const serverid:String = "serverid";
		public static const roleid:String = "roleid";
		public static const roleName:String = "roleName";
		public static const nickName:String = "nickName";
		public static const userName:String = "userName";
		public static const os:String = "os";
		public function GameServerManager()
		{
		}
		
		private static var _instance:GameServerManager;
		public static function get instance():GameServerManager
		{
			if(_instance==null){
				_instance=new GameServerManager();
			}
			return _instance;
		}
		
		private var _ip:String;
		private var _platformflag:String;
		private var _gameId:String;
		private var _country:String;
		private var _udid:String;
		private var _paytypeflag:String;
		
		public function setIp($ip:String,$platformflag:String,$gameid:String,udid:String,paytypeflag:String=null,$country:String="CN"):void
		{
			_ip=$ip;
			if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.Lengjing)){
				_platformflag="ljand";
			}else{
				_platformflag=$platformflag;
			}
			
			_gameId=$gameid;
			_country=$country;
			_udid=udid;
			_paytypeflag=paytypeflag;
			if(_paytypeflag==null){
				_paytypeflag=_platformflag;
			}
		}
		
		
		
		/**  游戏激活信息推送接口
		 *   account : 平台登录时获得的 平台账号
		 *   serverid : 服务器 id
		 *   udid  : 设备唯一号   mac 或者其他
		 * */
		public function gameActive(account:String,serverid:String):void
		{
//			var arg:Object={};
//			arg.account=account;
//			arg.serverid=serverid;
//			requestWeb(KEY_GameActivate,arg);
		}
		
		
		/** 创建订单接口
		 *  account : 游戏主账号
		 *  roleid : 游戏角色id 根据这个id 添加元宝
		 * */
		public function createOrder(account:String,goodsid:String,roleid:String,serverid:String,rolename:String,nickname:String):void
		{
			var arg:Object={};
//			platformflag=xxx&paytypeflag=xxx&account=xxx&goodsid=xxx&gameid=xxx&serverid=xxx&roleid=xxx&roleName=xxx&nickName=xxx&udid=xxx
//			arg.paytypeflag=paytypeflag;
			arg.account=account;
			arg.goodsid=goodsid;
			arg.roleid=roleid;
			arg.serverid=serverid;
			arg.rolename=rolename;
			arg.nickname=nickname;
			requestWeb(KEY_CreateOrder,arg,false);
		}
		
		
		/**  获取token接口
		 * */
		public function getAccessToken(authCode:String):void
		{
			var arg:Object={};
//			http://ip/user!getAccessToken.action?platformflag=xxx&paytypeflag=xxx&authCode=xxx&udid=xxx
			arg.authCode=authCode;
			
			requestWeb(KEY_GetAccessToken,arg);
		}
		
		/**  验证sessionId有效性接口
		 * 
		 *  uid 平台的 openid
		 * */
		public function checkSession(sessionId:String,uid:String):void
		{
			var arg:Object={};
//			platformflag=xxx&paytypeflag=xxx&sessionId=xxx&uid=xxx&udid=xxx
//			arg.paytypeflag=paytypeflag;
			arg.sessionId=sessionId;
			arg.uid=uid;
			
			requestWeb(KEY_CheckSession,arg);
		}
		
		/**  获取用户信息接口
		 * */
		public function getUserInfo(accessToken:String,accessSecret:String=null):void
		{
			var arg:Object={};
//			platformflag=xxx&paytypeflag=xxx&accessToken=xxx&udid=xxx
//			arg.paytypeflag=paytypeflag;
			arg[session_id]=accessToken;
			arg["accessToken"]=accessToken;
			if(accessSecret){
				arg.accessSecret=accessSecret;
			}
			
			requestWeb(KEY_GetUserInfo,arg);
		}
		
		private var infoCount:int=0;
		
		private function requestWeb(type:String,arg:Object,accountRequest:Boolean=true):void
		{
			arg.platformflag=_platformflag;
			arg.gameid=_gameId;
			arg.udid=_udid;
			arg.country=_country;
			arg.paytypeflag=_paytypeflag;
			arg.act=type;
			arg[os]=PlatformManager.getInstance().getOsType();
			
			var pix:String=accountRequest? "pay/LoginVerify" : "pay/OrderCreater";
			
			var url:String=createUrl(_ip+pix,arg);
			infoCount++;
			trace("请求："+infoCount+"\t"+url);
			HttpRequest.getInstance().getRequest(_ip+pix,arg,function(data:String):void{
				trace("请求结果："+infoCount+"\t"+data);
				var evt:GameServerEvent=new GameServerEvent(GameServerEvent.Evt_Server);
//				evt.key=type;
				evt.setKeyAndJson(type,data);
				evt.url=url;
				dispatchEvent(evt);
			},60000,false,"text",true);
		}
		
		private static function createUrl(url:String,arg:Object):String
		{
			var re:String=url+"?";
			for (var key:String in arg){
				if(arg[key]!=null){
					re+=key+"="+arg[key]+"&";
				}
			}
			re=re.substr(0,re.length-1);
			return re;
		}
		
		
		
		/**  游戏激活信息推送接口
		 * */
		public static const KEY_GameActivate:String="gameActivate";
		
		/**  创建订单接口
		 * */
		public static const KEY_CreateOrder:String="OrderCreater";
		
		/**  获取token接口
		 * */
		public static const KEY_GetAccessToken:String="getAccessToken";
		
		/**  验证sessionId有效性接口
		 * */
		public static const KEY_CheckSession:String="checkSession";
		
		/**  获取用户信息接口
		 * */
		public static const KEY_GetUserInfo:String="getUserInfo";
		
		CONFIG::PayTest{
			public static const KEY_CreateTestOrder:String="";
		}
	}
}