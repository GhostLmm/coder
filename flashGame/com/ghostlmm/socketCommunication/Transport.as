package  com.ghostlmm.socketCommunication {
	import com.fish.GLBaseData;
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.ViewControl;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.api.ILogger;
	import com.greensock.TweenLite;
	import com.mutou.tqt.DigC2SProto;
	import com.mutou.tqt.S2C.DigS2CProto;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.Endian;
	import flash.utils.Timer;
	
	import core.LayerController;
	
	import org.osflash.signals.Signal;
	
	import util.Util;

	/**
	 * C++ ProtocolBuffer 传输层
	 * @author liyin
	 */
	public class Transport {
		//private static var timeID:int = -1;
		/**信令队列*/
		public static var dataList:Array = [];
		/**服务器IP地址*/
		public static var ip:String;
		/**服务器PORT*/
		public static var port:int;
		/**是否执行信令*/
		public static var receiveBool:Boolean = true;
		/**登陆次数*/
		public static var loginCount:int;
		/**是否已经登陆*/
		public static var isLogin:Boolean;
		/**登陆计时器*/
		private static var loginTimer:Timer;
		
		/** 消息长度字节的长度：4字节 **/
		public static var LENGTH_SIZE:int = 4;
		/** 消息类型字节的长度：1字节 **/
		public static var TYEP_LENGTH:int = 1;
		/** 消息类型：String **/
		public static var TYPE_STRING:int = 1;
		/** 消息类型：Protobuf **/
		public static var TYPE_PROTOBUF:int = 2;
		
		public static const Biaozhi1:String="***********************************************************************************************";
		public static const Biaozhi2:String="-----------------------------------------------------------------------------------------------";
		public static const Biaozhi3:String="###############################################################################################";
		
		
		
//		private static var portAry:Array;
		
		public static var connectComplete_SN:Signal=new Signal();
		public static var connectError_SN:Signal=new Signal(int);
		public static var connectData_SN:Signal=new Signal(ByteArray);
		
		private static var _beatTimer:Timer=new Timer(15000);
		
		private static var _lastMessage:DigC2SProto;
		
		private static function log(tag:*,msg:*=null):void{
			if(msg==null){
				trace(tag);
				return ;
			}
			trace("["+tag+"]\t"+msg);
		}
		
		private static function initSocket():void {
			try{
				_socket = new Socket();
				_socket.endian = Endian.BIG_ENDIAN;
				_socket.timeout = 15000;
				_socket.addEventListener(Event.CONNECT, ConnectHandler);
				_socket.addEventListener(Event.CLOSE, CloseHandler);
				_socket.addEventListener(IOErrorEvent.IO_ERROR, IoErrorHandler);
				_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, SecurityErrorHandler);
				_socket.addEventListener(ProgressEvent.SOCKET_DATA, SocketDataHandler);
			}
			catch(e:Error){
				_socket = null;
			}
			if(_socket){
				TweenLite.delayedCall(20,connectTimeoutProccess);
			}
		}
		
//		private static var timeOutNeedProccess:Boolean=false;
		
		//连接超时处理
		private static function connectTimeoutProccess():void
		{
			if(_socket)
			{
				trace("socket 超时重连  20s");
				_connectState = 0;
//				if (_connectState == 1) _connectState = 0;
				Transport.CloseSocket();
				Connect(Transport.ip, Transport.port, true);
			}
		}
		//连接超时  验证取消
		private static function connectTimeoutCancel():void
		{
//			timeOutNeedProccess=false;
			TweenLite.killTweensOf(connectTimeoutProccess);
		}
		
		
		private static var isClose:Boolean;
		/**
		 * 关闭连接
		 * 
		 */		
		public static function CloseSocket():void{
			trace("主动关闭socket");
			isClose = true;
			if(_socket == null) return ;
			
			_socket.removeEventListener(Event.CONNECT, ConnectHandler);
			_socket.removeEventListener(Event.CLOSE, CloseHandler);
			_socket.removeEventListener(IOErrorEvent.IO_ERROR, IoErrorHandler);
			_socket.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, SecurityErrorHandler);
			_socket.removeEventListener(ProgressEvent.SOCKET_DATA, SocketDataHandler);
			
			connectTimeoutCancel();
			if(loginTimer != null){
				loginTimer.removeEventListener(TimerEvent.TIMER, onLoginTimer_hd);
				loginTimer.stop();
			}
			try{
				_socket.close();
			}catch(e:Error){
				
			}
			if(_beatTimer){
				_beatTimer.removeEventListener(TimerEvent.TIMER,onBeatTimer);
				_beatTimer.stop();
			}
			_socket = null;
			loginTimer = null;
			_connectState=0;
//			loginTimer = null;
//			_socket = null;
		}
		/**
		 * 响应方法
		 * @param onActive 响应方法
		 * 
		 */
		public static function SetOnActive(onActive:Function):void {
			_onActive = onActive;
		}
		/**
		 * 连接服务器
		 * @param ip 服务器ID
		 * @param port 服务器PORT
		 * @param isReConnect 是否为重新连接
		 * 
		 */
		public static function Connect( ip : String, port : int, isReConnect:Boolean = false) : void {
			
//			ip="120.24.249.95";
//			port=8007;
			trace("connect  ", ip, port);
			
			if(_socket != null){
				Transport.CloseSocket();
			}
			if ( _connectState == 0 ) {
				
				//
				_lastMessage=null;
				//初始化连接状态
				isClose = false;
				if (isReConnect) {
					log("log", "SocketReConnecting!");
				}else {
					log("log", "SocketConnecting!");
				}
				loginTimer = new Timer(10000);
				loginTimer.addEventListener(TimerEvent.TIMER, onLoginTimer_hd);
				//启动计时器
				initSocket();
				if(_socket == null){
					TweenLite.delayedCall(20, function (){ Connect(Transport.ip, Transport.port, true); });
					return;
				}
				Transport.ip = ip;
				Transport.port = port;
				//Transport.port = port;
				_socket.connect(Transport.ip, Transport.port); 
				_connectState = 1;
				
				
				
				log("log", "connect socket:" + "ip:" + Transport.ip + "port:" + Transport.port);
//				portAry.length = 0;
				
				//if(GLOBAL.checkLoginIdLast(BASE._loginID, "4"))
				//{
				//sendToURL(new URLRequest("http://app100616028.qzone.qzoneapp.com/event.war?" + "log=qq-war-" + BASE._loginID + "-0-" + "connectSocket" + "-" + "start" + "-" + "0" + "-0-0-0"));// 统计：链接socket
				//}
			}
		}
//		private static var reConnectAccount:int;
		private static var connectHand:Boolean = false;
		/**
		 * 重连
		 * @param _handle 是否玩家手动连接，手动连接使用无视挂机断线的key。偷偷连接的话使用的key在挂机的情况下连不上
		 */
		public static function reConnect(_handle:Boolean = false):void
		{
			trace("重新连接");
			connectHand = _handle;
			isLogin=false;
			loginCount=0;
			receiveBool=true;
			dataList=[];
			isClose=false;
			_waitBytes= 0;
			//private static var _encodeKey : String;
			_connectState = 0;
			_pkgHead = new PkgHead();
			_socket = new Socket();
			_socket.endian = Endian.BIG_ENDIAN;
			_socket.timeout = 15000;
			loginTimer = new Timer(5000, 2);
			

			loginTimer.addEventListener(TimerEvent.TIMER, onLoginTimer_hd);
			_socket.addEventListener(Event.CONNECT, ConnectHandler);
			_socket.addEventListener(Event.CLOSE, CloseHandler);
			_socket.addEventListener(IOErrorEvent.IO_ERROR, IoErrorHandler);
			_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, SecurityErrorHandler);
			_socket.addEventListener(ProgressEvent.SOCKET_DATA, SocketDataHandler);
			_socket.connect(Transport.ip,Transport.port);
			
//			reConnectAccount--;
			webTick=1;
			updateWaiter()
		}
		
		
		
		/**
		 *   发送string
		 */
		public static function sendString(msg:String):void{
			var ba:ByteArray=new ByteArray();
			ba.writeUTFBytes(msg);
			_socket.writeUnsignedInt(ba.length+5);
			_socket.writeByte(TYPE_STRING);
			_socket.writeBytes(ba);
			_socket.flush();
			
//			Context.getInsance().logger.fatal("\n{1}\n发送String:\t{0}\n{1}",[msg,Biaozhi1]);
			
		}
		
		private static var webTick:int=0;
		private static var webWaiterDic:Dictionary=new Dictionary();
		private static function updateWaiter():void
		{
			if(webTick<=0){
				LayerController.instance.webWaiterLayer && LayerController.instance.webWaiterLayer.hideWait();
			}else{
				LayerController.instance.webWaiterLayer && LayerController.instance.webWaiterLayer.showWait();
			}
		}
		public static function addWebTick():void{
			webTick++;
			updateWaiter();
		}
		public static function subWebTick():void{
			webTick--;
			updateWaiter();
		}
		/**
		 * 发送信令
		 * @param pkg 发送的信令对象
		 * 
		 */
		public static function Send( message:DigC2SProto ,_isNeedLoading:Boolean=true) : void {
			if(isClose){
				log("socket已关闭，取消发送。");
				return;
			}
//			_socket.connected
			c2sDic[message.protoId]=message;
			webWaiterDic[message.protoId]=_isNeedLoading;
			_lastMessage=message;
			
			if(_isNeedLoading)
			{
				webTick++;
			}
			updateWaiter();
			
			var ba:ByteArray=new ByteArray();
			message.writeTo(ba);
			var logger:com.ghostlmm.lightMVC.api.ILogger=Context.getInjectInstance(com.ghostlmm.lightMVC.api.ILogger);
			logger.fatal("\n{2}\n 发送协议：req:{0}\tid:{3}\tlength:{4}\n{1}\n{2}\n",[message.req,message,Biaozhi1,message.protoId,ba.length]);
			ba.position=0;
			writeToSocket(ba);
//			TweenLite.delayedCall(5,writeToSocket,[ba]);
//			_socket.
//			_socket.writeUnsignedInt(ba.length+5);
//			_socket.writeByte(TYPE_PROTOBUF);
//			_socket.writeBytes(ba);
//			_socket.flush();
		}
		
		private static function writeToSocket(ba:ByteArray):void{
			_socket.writeUnsignedInt(ba.length+5);
			_socket.writeByte(TYPE_PROTOBUF);
			_socket.writeBytes(ba);
			_socket.flush();
		}
		
		/**
		 * 是否登录成功
		 * @param pass 是否成功
		 * 
		 */
		public static function OnAuthPass(pass:Boolean):void {
			if(isLogin){
				return;
			}
			loginComplete();
			isLogin = true;
			if (pass) {
				_connectState = 2;
//				_onActive(BASE._userID);
			} else {
				_connectState = 0;
				_onActive("-4");
			}
		}
		
//		private var dataLength:uint
		
		/**
		 * socket数据接收监听
		 * @param evt 接收数据的事件
		 * 
		 */		
		public static function SocketDataHandler(evt : ProgressEvent = null) : void {
			log("socket开始接收数据");
			if (_waitBytes == 0 ) {
				if ( _socket.bytesAvailable >= 5 ) {
					_waitBytes = _socket.readInt()-5;
					_waitType = _socket.readByte();
				} else {
					return;
				}
			}
			
			while (_socket.bytesAvailable >= _waitBytes) {
				var ba:ByteArray = new ByteArray();
				
				ba.endian = Endian.LITTLE_ENDIAN;
				if (_waitBytes > 0) {
					_socket.readBytes(ba, 0, _waitBytes);
				}
				_waitBytes = 0;
				
				if(_waitType==TYPE_PROTOBUF){
//					try{
//						ba.position=0;
//						parseResult(ba);
//					}catch(e:Error){
//						trace(e.message);
//					}
					ba.position=0;
					parseResult(ba);
//					TweenLite.delayedCall(5,parseResult,[ba]);
				}
				if(_waitType==TYPE_STRING){
					ba.position=0;
					var msg:String=ba.readUTFBytes(_waitBytes);
					parseResultString(msg);
				}
				
				
				
				
				
				if ( _socket.bytesAvailable >= 5 ) {
					_waitBytes = _socket.readInt()-5;
					_waitType = _socket.readByte();
				} else {
					_waitBytes = 0;
					return;
				}
			}
			
			
		}
		
		private static function parseResultString(msg:String):void{
			Context.getInsance().logger.fatal("\n{1}\n接受字符串消息：\n{0}\n{1}",[msg,Biaozhi2]);
		}
		
		private static function parseResult(bytes:ByteArray):void
		{
			var message:DigS2CProto=new DigS2CProto();
			
			message.mergeFrom(bytes);
			Context.getInsance().logger.fatal("\n{4}\n  接受消息 rce:{0}\tcode:{1}\tlength:{5}\textr:{2}\n{3}\n{4}\n",[message.rce,message.retCode,message.extr,message,Biaozhi2,bytes.length]);
			
			var c2s:DigC2SProto=null;
			if(message.hasProtoId){
				c2s=c2sDic[message.protoId];
				if(_lastMessage && _lastMessage.protoId==message.protoId){
					_lastMessage=null;
				}
				if(webWaiterDic[message.protoId]){
					webTick--;
					updateWaiter();
				}
			}
			S2CHanlder.instance.processMessage(message,c2s);
			
			if(message.rce==C2SEmitter.REQ_Initgame){
				onBeatTimer();
				_beatTimer.addEventListener(TimerEvent.TIMER,onBeatTimer);
				_beatTimer.start();
			}
			
			if(message.hasProtoId){
				delete c2sDic[message.protoId];
			}
		}
		
		
		/**
		 * 连接成功响应事件
		 * @param evt
		 * 
		 */
		private static function ConnectHandler( evt : Event ) : void {
			
//			reConnectAccount=1;
			
			connectTimeoutCancel();
			

			trace("链接成功，发送认证消息。");
			log("log", "Connected!!!");
			webTick=0;
			updateWaiter();
			connectComplete_SN.dispatch();
			
			
//			if(_lastMessage){
//				Send(_lastMessage,true);
//			}
			
		}
		
		private static function onBeatTimer(evt:Event=null):void{
			if(_socket.connected){
//				trace("发送心跳包");
				sendString(GLBaseData.userId);
			}
		}
		
		// socket链接成功，发送tgw和a指令10秒后如果没有返回，断开socket重新连接socket
		private static function onLoginTimer_hd(evt:Event):void{
			//sendTGWAndA();
			trace("connect time out! ! ! ! ! ! ! ! ");
			_connectState = 0;
			Connect(Transport.ip, Transport.port, true);
			if( _onActive != null ) {
				_onActive("-3");
			}
		}
		/**
		 * 登陆成功
		 * 
		 */		
		public static function loginComplete():void{
			if(loginTimer.running)
			{
				loginTimer.stop();
			}
			loginTimer.removeEventListener(TimerEvent.TIMER, onLoginTimer_hd);
			loginTimer = null;
			
		}
		/**
		 * 发送TGW数据和a验证
		 * 
		 */		
		private static function sendTGWAndA():void{
			loginCount ++;
			log("log", "Send LoginCounts：" + loginCount);
			//TGW改造
			var authStr : ByteArray = new ByteArray();
			var str : String;
			
			authStr.writeUTFBytes(str);
			_socket.writeBytes(authStr);
			_socket.flush();
			authStr.length = 0;
			log("log", "Send TGW：" + str);
			//a信令验证
			var key:String = "";
			if(connectHand)
			{
				if(key == "8613910246899")
				{
					key = "161391"+"0246899";
				}
				connectHand = false;
			}
//			str = "a," + BASE._userID + "," + key + "," + EnvironmentParameter.getPlatVerision();
			authStr.writeShort(str.length);
			authStr.writeUTFBytes(str);
			_socket.writeBytes(authStr);
			_socket.flush();
			log("log", "Send logininfo：" + str);
		}
		/**
		 * 服务器关闭连接
		 * @param evt
		 * 
		 */
		private static function CloseHandler( evt : Event ) : void {
			connectTimeoutCancel();
			_connectState = 0;
			trace(" socket断开！！")
			if( _onActive != null ) {
				_onActive("-1");
			}
			isClose=true;
			_beatTimer.stop();
			
			TopTip.showExitTip(Util.getLanguage("网络连接错误，是否重启游戏"),
				ViewControl.reEnterGame,Util.exitGame,true,Util.getLanguage("重启"),Util.getLanguage("退出游戏"));
			/*if(reConnectAccount>0){
				reConnect();
			}else{
//				TopTip.showExitTip(Util.getLanguage(""),tipReconnect,null,false);
//				CloseSocket();
				TopTip.showExitTip(Util.getLanguage("网络连接错误，是否重启游戏"),
					ViewControl.reEnterGame,Util.exitGame,true,Util.getLanguage("重新连接"),Util.getLanguage("退出游戏"));
			}*/
		}
		
		private static function tipReconnect():void{
//			reConnectAccount=1;
			reConnect();
		}
		
		/**
		 * 连接错误
		 * @param evt
		 * 
		 */
		private static function IoErrorHandler( evt : IOErrorEvent ) : void {
			connectTimeoutCancel();
			trace("IoError : socket断开");
			_connectState = 0;
			if (_connectState == 1) _connectState = 0;
			Transport.CloseSocket();
//			trace("IoError : socket断开");
			connectError_SN.dispatch(-1);
			_beatTimer.stop();
//			if( _onActive != null && GLOBAL._mode != "build") {
//				_onActive("-2");
//			}else{
//				Connect(Transport.ip, Transport.port, true);
//			}
//			if(reConnectAccount>0){
//				reConnect();
//			}else{
//				TopTip.showExitTip(Util.getLanguage(""),tipReconnect,null,false);
//			}
			if(!isClose){
				TopTip.showExitTip(Util.getLanguage("网络连接错误，请检查网络连接是否正常"),ViewControl.reEnterGameStartScene,Util.exitGame,true,Util.getLanguage("重新连接"),Util.getLanguage("退出游戏"));	
			}
			
		}

		private static function SecurityErrorHandler( evt : SecurityErrorEvent ) : void {
			connectTimeoutCancel();
			trace("SecurityError : socket断开");
			_connectState = 0;
			trace("SecurityError : socket断开");
			//Transport.CloseSocket();
			Connect(Transport.ip, Transport.port, true);
			if( _onActive != null ) {
				_onActive("-3");
			}
			connectError_SN.dispatch(-3);
			_beatTimer.stop();
		}

		private static var _pkgHead : PkgHead;
		public static var _socket : Socket;
		private static var _waitBytes : uint = 0;
		private static var _waitType:uint;
		//private static var _encodeKey : String;
		/** 连接状态 0:连接失败或未连接, 1:连接中, 2:连接成功并且验证成功, */
		private static var _connectState : int = 0;
		private static var _onActive : Function;
		
		/**
		 * 是否需加、解密
		 * */
		private static var _codeSwitch:Boolean = false;
		
//		/** 解密ARC4库 */
//		private static var _decoder:ARC4;
//		/** 加密ARC4库 */
//		private static var _encoder:ARC4;
		
		/**
		 * sid
		 * */
		private static var _szSid:String = null;
		
		/** 解密密钥 */
		private static var _decodeKeyStr:String;
		/** 加密密钥 */
		private static var _encodeKeyStr:String;
		
		/** arc4初始化 */
		private static function setArc4(codeSwitch:Boolean):void 
		{
			_codeSwitch = codeSwitch;
			
			if(_szSid == null)
			{
//				_decodeKeyStr = BASE._loginID;
//				_encodeKeyStr = BASE._loginID;
			}
			else
			{
//				//协议
//				_decodeKeyStr = BASE._loginID + _szSid
//				
//				//指令
//				_encodeKeyStr = _szSid + BASE._loginID;
			}
			
//			var b:ByteArray = new ByteArray();
//			b.writeUTFBytes(_decodeKeyStr);
//			
//			var b1:ByteArray = new ByteArray();
//			b1.writeUTFBytes(_encodeKeyStr);
			
//			_decoder = new ARC4(b);
//			_encoder = new ARC4(b1);
		}
		
		/**
		 * 解密
		 * */
		private static function decode(bytes:ByteArray):void 
		{
			if (bytes.bytesAvailable != 0) 
			{
//				_decoder.decrypt(bytes);				
			}
		}
		
		/**
		 * 初始化加密数据
		 * @param codeSwitch 加密开关
		 * @param uid 玩家uid
		 * @param sid sid
		 */
		public static function setInitEncryptData(codeSwitch:Boolean, sid:String=null):void
		{
			_szSid = sid;
			setArc4(codeSwitch);
		}
		
		
		private static var c2sDic:Dictionary=new Dictionary();
	}
}