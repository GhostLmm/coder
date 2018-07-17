package Tool
{
	import com.greensock.TweenLite;
	import com.hqfy.nativeExtensions.SNSSdkHelper;
	
	import flash.display.Stage;
	import flash.display.StageOrientation;
	import flash.events.Event;
	import flash.events.StatusEvent;
	import flash.events.TimerEvent;
	import flash.net.SharedObject;
	import flash.system.Capabilities;
	import flash.system.System;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	
	import myDisplay.ViewControl;
	


	public class Platform_91_Ane
	{
		private static var m_instance:Platform_91_Ane;
		private var count:int=1;
		public var currentContent:Object;
//		public var payUrl:String ="http://119.161.217.85/pay_91.php";
		public function get payUrl():String
		{
			return EnvironmentParameter.gamePreUrl+"pay_91.php";
		}
		
		public static var sharePath:String="redWar_loginInfomation091";
		public static var chongzhiPath:String="redWar_chongzhi";
		
		//测试
//		public var payUrl:String ="http://192.168.1.123:18080/pay_91.jsp";
		public var so:SharedObject;
		
		private var nowToken:String="";
		
		// 申请图像的回调函数集合
		private var imgHandleDic:Dictionary=new Dictionary();
		private var imgUrlDic:Dictionary=new Dictionary();
		
		private var loginComFn:Function;
		private var loginFailFn:Function;
		
		private var getDetailComfn:Function;
		public function Platform_91_Ane()
		{
			if("rotatedRight"==GLOBAL.Ane_UseStage.orientation)
			{
				SNSSdkHelper.self.initSdk(3);
			}
			else if("rotatedLeft"==GLOBAL.Ane_UseStage.orientation)
			{
				SNSSdkHelper.self.initSdk(4);
			}
			SNSSdkHelper.self.getExtContext().addEventListener(StatusEvent.STATUS, handleStatusEvent);
			so=SharedObject.getLocal(chongzhiPath);
//			SNSSdkHelper.self.beginDetectUpdate();
//			if(EnvironmentParameter.ChongziTest)
//			{
//				SNSSdkHelper.self.setDebugMode();
//			}
			
			ViewControl.getInstance().addEventListener(ViewControl.TEXTUREREBUILD,onBuildAll);
		}
		public static function getInstance():Platform_91_Ane
		{                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
			if(m_instance==null)
				m_instance=new Platform_91_Ane();
			return m_instance;
		}

		private function removeImgBackHandle(uid:String,handle:Function):void
		{
			if(imgHandleDic[uid]==null) return ;
			var handleArray:Array=imgHandleDic[uid];
			var index:int=handleArray.indexOf(handle);
			if(index!=-1)
			{
				handleArray.splice(index,1);
			}
		}
		private function clearBackhandle(uin:String):void
		{
			delete imgHandleDic[uin];
		}
		private function applyImgHandle(uid:String):void
		{
			if(imgHandleDic[uid]==null || imgUrlDic[uid]==null || imgUrlDic[uid]=="") return ;
			var handleArray:Array=imgHandleDic[uid];
			for each(var hanldeFn:Function in handleArray)
			{
				if(hanldeFn!=null)
				{	
					hanldeFn.apply(null,[imgUrlDic[uid]]);
				}
				
			}
			handleArray.length=0;
		}

		
		
		public function setCallBack(comFn:Function,failFn:Function):void
		{
//			callback=func;
			loginComFn=comFn;
			loginFailFn=failFn;
		}
		public function setGetDetailComfn(_detailComfn:Function):void
		{
			getDetailComfn=_detailComfn;
		}
			
		public function detectUpdate():void
		{
			SNSSdkHelper.self.beginDetectUpdate();
		}
		
		public function beginLogin():void
		{
			SNSSdkHelper.self.showLoginInterface();
		}
		public function buy(pid:String,pname:String,pprice:Number,pori:Number):void
		{
			if(nowToken!="")
				return;
			
			var date:Date=new Date();
			nowToken=BASE._userID+"-"+BASE._myOnlyUid+"-"+date.fullYear+((date.month+1)<10?"0":"")+""+(date.month+1)+(date.date<10?"0":"")+""+date.date+(date.hours<10?"0":"")+""+date.hours+(date.minutes<10?"0":"")+""+date.minutes+(date.seconds<10?"0":"")+""+date.seconds+""+date.milliseconds+"-"+Math.ceil(Math.random()*1000000000);
			so.data.token=nowToken;
			so.flush();
			SNSSdkHelper.self.buyItemUseSelfToken(nowToken, pid, pname, pprice, pori, 1);
			trace("91 buy token: "+nowToken);
			
			process91Starling();
			var timer:Timer=new Timer(10000,20);
			timer.start();
			timer.addEventListener(TimerEvent.TIMER,timeFunc);
			
		}
		
		public function getName():String
		{
			var str:String=SNSSdkHelper.self.getUserInfo();
			var userInfo:Object = JSON.parse(str);
			var uin:String = userInfo.uin as String;
			var nickname:String = userInfo.nickname as String;
			var checkSum:String = userInfo.checkSum as String;
			return nickname;
		}
		
		public function show91Window():void
		{
//			SNSSdkHelper.self.showRechargeWindow();
			SNSSdkHelper.self.showPlatfromMainPage();
		}
		private var accountTick:int=0;
		private function process91Starling():void
		{
//			return;
			if(GLOBAL._gameSize.width==960)
				return;
//			GLOBAL.spriteForPlatform=new LOGIN_BACKGROUND();
			if(GLOBAL.spriteForPlatform==null)
			{
				GLOBAL.spriteForPlatform=new LOGIN_BACKGROUND();
			}
//			GLOBAL.WaitShow();
			GLOBAL._layerTop.addChild(GLOBAL.spriteForPlatform);
			GLOBAL.WaitShow();
			accountTick++;
			trace("显示等待："+accountTick);
		}
		private function onBuildAll(evt:Event=null):void
		{
			if(GLOBAL.spriteForPlatform )
			{
				if(GLOBAL._layerTop.contains(GLOBAL.spriteForPlatform))
				{
					GLOBAL._layerTop.removeChild(GLOBAL.spriteForPlatform);
				}
				GLOBAL.WaitHide();
				trace("隐藏等待 ： "+accountTick);
			}
		}
		/**   获取详细item
		 * */
		public function getDetailsItem():void
		{
			SNSSdkHelper.self.getVirtualGoodsInfo(1,10);
			var index:int;
			if(null==SNSSdkHelper.self.extContext)
			{
				index=1;
			}
			else
			{
				index=0;
			}
		}
		
		private function handleStatusEvent(ev:StatusEvent):void{
			var content:Object;
			switch(ev.code){ 
				case "leaveUI":
//					GLOBAL._mainLoader.addChild(new LOGIN_BACKGROUND());
					process91Starling();
					break;
				case "update":
					content=JSON.parse(ev.level);
					if(content.message == "无可用更新"){
//						_debugText.text = "检查更新成功";
						trace("检查更新成功");
						beginLogin();
					}
					else
					{
//						_debugText.text = "检查更新错误：" + content.message;
						trace("检查更新错误：" + content.message);
						if(content.message=="下载普通更新被取消"||content.message=="下载新版本失败")
							beginLogin();
						if(content.message=="检测新版本信息失败"&&count==1)
						{
							count++;
							detectUpdate();
						}
						else if(content.message=="检测新版本信息失败"&&count==2)
						{
							count=1;
							trace("您的网络似乎有些问题");
						}
						trace("有问题");
					}
					
					break;
				case "login":
					content=JSON.parse(ev.level);
					if(content.message == "普通账号登陆成功")
					{
						
//						_debugText.text = "登陆成功";
						trace("登陆成功");
						trace(SNSSdkHelper.self.getUserUIN());
//						trace(SNSSdkHelper.self.getUserInfo().nickname);
						var str:String = SNSSdkHelper.self.getUserInfo();
						var userInfo:Object={};
						if(str){
							try{
								userInfo = JSON.parse(str);
								var uin:String = userInfo.uin as String;
								var nickname:String = userInfo.nickname as String;
								var checkSum:String = userInfo.checkSum as String;
								trace("uin:"+uin + "nickName:"+nickname + "checkSum:" + checkSum);
							}catch(e:Error){
								trace("parse user info error");trace(SNSSdkHelper.self.getSessionId());
						
							}
						}
//						GLOBAL._mainLoader.login91Suc(SNSSdkHelper.self.getUserUIN(),SNSSdkHelper.self.getSessionId(),userInfo.checkSum);
						if(loginComFn!=null)
						{
							loginComFn(SNSSdkHelper.self.getUserUIN(),SNSSdkHelper.self.getSessionId(),userInfo.checkSum);
						}
						//SNSSdkHelper.self.getExtContext().call("getVirtualGoodsInfo", 1, 10);

					}
					else{
//						_debugText.text = "登陆失败:" + content.message;
						trace("登陆失败:"+ content.message);
						if(content.message=="用户未登录")
							beginLogin();
							
					}
					break;
				case "details":
					trace("获取列表");
					content=JSON.parse(ev.level);
					trace(content.records.length);
					for(var i:int=0;i<content.records.length;i++)
					{
						trace(content.records[i].productId);
						trace(content.records[i].productName);
						trace(content.records[i].salePrice);
					}
					currentContent=content;
					if(getDetailComfn!=null)
					{
						getDetailComfn();
					}
					break;
				case "buy":
					content=JSON.parse(ev.level);
					process91Starling();
					TweenLite.delayedCall(10,onBuildAll);
					if(content.message=="购买成功")
					{
						
						trace("购买成功");
						trace(content.buyInfo.cooOrderSerial);
						requestWeb(content.buyInfo.cooOrderSerial);
					}
					else
					{
						trace("购买失败");
						nowToken="";
						so.clear();
						so.flush();
						
						//购买失败后，不会从新加载 纹理
					}
					var time:Timer=new Timer(4000,8);
					time.start();
					time.addEventListener(TimerEvent.TIMER,timeFunc);
					break;
				case "photo":
					if(ev.level){
						try{
							var photoInfo:Object = JSON.parse(ev.level);
//							RedWar.debugTrace("uin:"+photoInfo.uin + "path:"+photoInfo.path + "md5:"+photoInfo.md5);
							imgUrlDic[photoInfo.uin]=photoInfo.path;
							applyImgHandle(photoInfo.uin);
						}
						catch(e:Error){
//							RedWar.debugTrace("parse photo info error");
						}
					}
			}
		}
		
		public function startTickToSendBuyinfo():void
		{
			if(so && so.data.token)
			{
				nowToken=so.data.token;
				var time:Timer=new Timer(4000,8);
				time.start();
				time.addEventListener(TimerEvent.TIMER,timeFunc);
			}
		}
		
		private function timeFunc(evt:TimerEvent):void
		{
			if(nowToken=="")
				trace("gg");
//				evt.target.removeListener(evt.type,arguments.callee);	
			else
				requestWeb(nowToken);
		}
		
		public function requestWeb(receipt:String):void
		{
			if(receipt=="")
				return;
			var postArgs:Object = {};
			postArgs["receipt"] = receipt;
			postArgs["openid"] = BASE._myOnlyUid;
			postArgs["uid"] =BASE._userID;
			postArgs["level"]=BASE.BaseLevel().level;
			HttpRequest.getInstance().postRequest(payUrl,postArgs,function handleFunc(data:Object):void{
				//				log(data.toString());
				nowToken="";
				so.clear();
				so.flush();
				if(data.toString().indexOf("ok")!=-1)
				{
					
//					var num:int=int(data.toString().split(",")[1]);
//					BASE._credits.Add(num);
				}
			}
				
			);	
		}
	}
}