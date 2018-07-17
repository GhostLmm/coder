package com.fish.modules.preloadMD.mediators
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.preloadMD.events.PreloadEvent;
	import com.fish.modules.preloadMD.models.LoaderLanguagerMD;
	import com.fish.modules.preloadMD.models.XMLLoader_MD;
	import com.ghostlmm.dig.GameConstConfig;
	import com.ghostlmm.guide.GuideSelectControl;
	import com.ghostlmm.guide.SceneCaption;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.tool.HttpRequest;
	import com.greensock.TweenLite;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	
	import Tool.account.AccountControl;
	import Tool.login.LoginControl;
	import Tool.login.LoginUIControl;
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import core.LayerController;
	import core.event.TqtEvent;
	
	import ui.window.GongaoPreloadPage;
	import ui.window.TingfuPage;
	
	import util.Util;
	
	import view.commontools.ServerListManager;
	import view.login.MC_Denglu;
	import view.login.MC_Name_Login;
	import view.login.MC_XuanquWindow;
	import view.login.MC_Zhuce;
	import view.login.Mc_ChooseKapai_Login_New2;
	import view.viewData.ServerData;
	
	public class PreloadMediatorNew extends Mediator
	{
		[Inject]
		public var preloadLayer:PreloadLayer;
		
		[Inject]
		public var xmlLoader:XMLLoader_MD;
		[Inject]
		public var langMD:LoaderLanguagerMD;
		
		private var tipTimer:Timer;
		
		//		private var _tingfuPage:TingfuPage;
		
		public function PreloadMediatorNew()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			
			GameRefreshControl.freshSwitch=false;
			ExitGameControl.setExitQuite(true);
			
			preloadLayer._fnt_version.text="";
			//			requestWebAddress();
			
			
			registerEvent();
			
//			preloadLayer._mc_anim.visible=false;
			
			preloadLayer._fnt_version.text=PlatformManager.getInstance().getServerZoneTip();
			
//			preloadLayer._fnt_version.x=-GlobalRef.width/2;
//			preloadLayer._fnt_version.y=-GlobalRef.height/2;
			
//			if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.ShowWanmeiLogo)){
//				preloadLayer._mc_log.gotoAndStop(2);
//			}
//			
//			if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.HidePreLoadingMovie)){
//				preloadLayer._mc_donghua.gotoAndPlay("denglu");
//				platInit();
//				return ;
//			}
			
			//如果是切换游戏账号进入的话
			if(GameStatus.status==GameStatus.ST_SwitchAccount){
				showSwitchAccount();
			}else{
				showGameTitle();
			}
			
			AppstoreVerify.setCallBack(platInit);
			
			TAbDebug.debug_SN.add(onDebug);
			
			if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.UseFastLogin)){
				preloadLayer._btn_login_denglu.visible=false;
//				preloadLayer._btn_denglu_denglu.visible=false;
			}
			
		}
		private function onDebug(type:String,arg:Array):void{
			if(type=="enter"){
				startEnterGame();
			}
		}
		private function showSwitchAccount():void{
//			preloadLayer._mc_donghua.gotoAndPlay("denglu");
			if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.AutoLoginAfterLogout)){
				LoginControl.getInstance().showLoginInterface(true);
			}else{
				LoginControl.getInstance().showLoginInterface(false);
			}
			
//			preloadLayer._btn_login_denglu.visible=true;
		}
		
		
		private function showGameTitle():void
		{
//			preloadLayer._btn_login_denglu.visible=false;
//			preloadLayer._mc_donghua.gotoAndPlay(1);
//			addViewListener(GlobalRef.stage,Event.ENTER_FRAME,onMovieFrame);
		}
		
		private function onMovieFrame(evt:Event):void{
		}
		
		private function platInit():void{
			PlatformManager.getInstance().init();
			PlatformManager.log("platInit : "+129);
			if(! PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.NotAutoLogin)){
				if(PlatformManager.getInstance().platformObj.openId!=null){
					if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.AutoLoginAfterLogout)){
						LoginControl.getInstance().showLoginInterface(true);
						PlatformManager.log("platInit : "+134);
					}else{
						LoginControl.getInstance().showLoginInterface(false);
						PlatformManager.log("platInit : "+136);
					}
					
				}else{
					LoginControl.getInstance().showLoginInterface();
					PlatformManager.log("platInit : "+142);
				}
				
			}
			preloadLayer._btn_login_denglu.visible=true;
		}
		
		
		// 第一步 登录 平台
		private function step1_PlatLogin():void
		{
			_lastClickTime=getTimer();
			PlatformManager.getInstance().init();
			LoginControl.getInstance().showLoginInterface();
		}
		
		private var _lastClickTime:int;
		private function onClickLogin(evt:Event):void
		{
			if(getTimer()-_lastClickTime>3000){
				step1_PlatLogin();
			}else{
				Util.flow("请勿频繁点击");
			}
		}
		
		private function requestWebAddress(param:*=null):void
		{
			UrlConfig.requstWebResult.addOnce(onRequsetBack);
			UrlConfig.resetRepeateCount();
			UrlConfig.requstWebAddress();
		}
		
		private function onRequsetBack(re:Boolean):void
		{
			//动态地址分配完毕后 正在进入游戏
			trace("正在开始进入游戏");
			if(re){
				PlatformManager.getInstance().initChongCheck();
				
				//				showLoadXmlPage();
				goEnterGame();
			}else{
				TopTip.showExitTip("网络连接错误或服务器维护");
			}
			
		}
		
		// 显示加载xml页面
		private function showLoadXmlPage():void{
			trace("显示加载xml页面");
//			PaiduiControl.getInstance().destory();
			Util.showWebWait();
			preloadLayer.showMC(PreloadLayer.McName_Loading);
			startShowTip();
//			preloadLayer._mc_anim.visible=false;
			xmlLoader.startLoadMainXml();
		}
		
		/**
		 *   开始显示 loading tip
		 */
		private function startShowTip():void{
			if(tipTimer==null){
				tipTimer=new Timer(3000);
				tipTimer.addEventListener(TimerEvent.TIMER,onTipTimer);
			}
			if(!tipTimer.running){
				tipTimer.start();
			}
			onTipTimer();
		}
		private function onTipTimer(evt:Event=null):void{
//			preloadLayer._fnt_loading_tips.text=LoadingTips.getRandomTip();
		}
		private function stopShowTip():void{
			if(tipTimer!=null){
				tipTimer.removeEventListener(TimerEvent.TIMER,onTipTimer);
				tipTimer.stop();
				tipTimer=null;
			}
		}
		
//		private var socketConnectFlag:Boolean=false;
//		private function onSocketCom():void{
//			socketConnectFlag=true;
//			setProgress();
//		}
		private function onSocketError(code:int):void{
			
		}
		
		private function registerEvent():void
		{
			
			//  增加一部 socket的 连接
//			C2SEmitter.connectCom_SN.add(onSocketCom);
//			C2SEmitter.connectError_SN.add(onSocketError);
			
			xmlLoader.mainXmlCom_SN.addOnce(onMainXmlCom);
			xmlLoader.childXmlCom_SN.add(setProgress);
			langMD.complete_SN.add(setProgress);
			LoginControl.getInstance().union_plataccount_com_SN.add(onUnionLoginCom);
			//			LoginControl.getInstance().loginWayChange_SN.add(onLoginWayChange);
			LoginControl.getInstance().loginDataSet_SN.add(onDataSet_Res);
			
			LoginUIControl.getInstance().uiMessage_SN.add(onUIControl);
			AccountControl.getInstance().loginStep_SN.add(onLoginMessage);
			
			preloadLayer.changState_SN.add(onStateChange);					
			
			//			GLBaseData.LastServerChange_SN.add(onLastServerChange);
			
			addViewListener(preloadLayer._btn_login_denglu,TqtEvent.BUTTON_CLICK,onClickLogin);
			addViewListener(preloadLayer._btn_jinru_zhanghao,TqtEvent.BUTTON_CLICK,showDengluWindow);
			addViewListener(preloadLayer._btn_jinru_xuanqu,TqtEvent.BUTTON_CLICK,showXuanqu);
			addViewListener(preloadLayer._btn_jinru_jinru,TqtEvent.BUTTON_CLICK,startEnterGame);
			
			addViewListener(preloadLayer._btn_denglu_denglu,TqtEvent.BUTTON_CLICK,showDengluWindow);
			addViewListener(preloadLayer._btn_denglu_jinru,TqtEvent.BUTTON_CLICK,startEnterGame);
			addViewListener(preloadLayer._btn_denglu_xuanqu,TqtEvent.BUTTON_CLICK,showXuanqu);
			addViewListener(preloadLayer._btn_denglu_zhuce,TqtEvent.BUTTON_CLICK,showZhuceWindow);
		}
		
		private function onMainXmlCom():void{
			Util.hideWebWait();
			langMD.startLoadeLanguager();
			setProgress();
//			C2SEmitter.startConectSocket(UrlConfig.serverUrl,UrlConfig.port);
		}
		
		
		
		
		private function onUnionLoginCom():void
		{
			
			
			
			
			// 加载服务器列表 显示转圈圈
			//			HttpRequest
			//			setProgress();
			
			//加载服务器xml
			
			GameStatus.setStatus(GameStatus.ST_LoadAsset);
			
			preloadLayer._btn_login_denglu.visible=false;
			requestForServerList();
			
			
			//			preloadLayer.showMC(PreloadLayer.McName_Loading);
			//			
			//			xmlLoader.startLoadMainXml();
		}
		
		
		
		
		/**
		 * 控制登录界面的开关
		 */
		private function onUIControl(_str:String):void
		{
			switch(_str)
			{
				case LoginUIControl.UI_MSG_CloseZhuce:
					closeZhuceWindow();
					break;
				case LoginUIControl.UI_MSG_CloseXuanqu:
					closeXuanqu();
					break;
				case LoginUIControl.UI_MSG_CloseDenglu:
					dengluCloseFunc();
					break;
				case LoginUIControl.UI_MSG_FromDengluToZhuce:
					dengluCloseFunc();
					showZhuceWindow();
					break;
			}
		}
		/**
		 * 登录数据设置消息
		 */
		private function onDataSet_Res(_str:String):void
		{
			switch(_str)
			{
				case LoginControl.LoginDataSet_Complete:
					onServerChange();
					setAccountShow();
					break;
			}
		}
		/**
		 *  设置帐号信息显示
		 */
		private function setAccountShow():void
		{
			if(LoginControl.getInstance().loginWay!=LoginControl.LoginWay_FastLogin)
			{
				preloadLayer._fnt_jinru_zhanghao.text=LoginControl.getInstance().getOpenId();
			}
		}
		/**
		 * 登录方式改变
		 */
		private function onLoginWayChange(_str:String):void
		{
			switch(_str)
			{
				case LoginControl.LoginWay_FastLogin:
					preloadLayer.showMC(PreloadLayer.McName_Server);
					break;
				case LoginControl.LoginWay_AccountLogin:
					preloadLayer.showMC(PreloadLayer.McName_Account);
					break;
				case LoginControl.LoginWay_Register:
					preloadLayer.showMC(PreloadLayer.McName_Account);
					break;
			}
		}
		private function onLastServerChange():void
		{
			if(GLBaseData.serverList 
				&& GLBaseData.serverList.length
				&& ServerListManager.getInstance().serverDic 
				&& ServerListManager.getInstance().getServerDataById(int(GLBaseData.LastServerId))==null){
				GLBaseData.LastServerId=(GLBaseData.serverList[0] as ServerData).zoneId.toString();
			}
			
			if(int(GLBaseData.LastServerId)!=0)
			{
				GLBaseData.serverId=GLBaseData.LastServerId;
				onServerChange();
			}
		}
		private var xuanquWindow:MC_XuanquWindow;
		public function showXuanqu(evt:Event=null):void
		{
			if(null==xuanquWindow)
			{
				xuanquWindow=new MC_XuanquWindow();
			}
			LayerController.instance.waitLayer.addChild(xuanquWindow);
		}
		private function closeXuanqu(evt:Event=null):void
		{
			if(xuanquWindow&&LayerController.instance.waitLayer.contains(xuanquWindow))
			{
				LayerController.instance.waitLayer.removeChild(xuanquWindow)
			}
			if(xuanquWindow)
			{
				xuanquWindow.destory();
				xuanquWindow=null;
			}
		}
		private function onLoginMessage(_messageType:String):void
		{
			switch(_messageType)
			{
				case AccountControl.Login_Step_Account_Complete:
					dengluCloseFunc();
					break;
				case AccountControl.Login_Step_Account_Error:
					showDengluWindow();
					break;
				case AccountControl.Login_Step_Name_Complete:
//					showChooseCard();				
					break;
				case AccountControl.Login_Step_Name_Error:
//					showYindao1Scene();	
					showPrinter();
					
					break;
				case AccountControl.Login_Step_Role_Complete:
//					closeYindao2Scene();
					TopTip.showBattleWait();
					GuideSelectControl.destory();
					coreDispatcher.dispatchEvent(new PreloadEvent(PreloadEvent.GameStartup));
					break;
				case AccountControl.Login_Step_ChooseServer:
					closeXuanqu();
					onServerChange();
					break;
			}
		}
		
		
		private var printer:SceneCaption;
		private function showPrinter():void{
			trace("开始显示打印机 ");
			if(printer==null){
				printer=new SceneCaption();
				printer.x=GlobalRef.width/2;
				printer.y=GlobalRef.height/2;
				
			}
			LayerController.instance.waitLayer.addChild(printer);
			printer.captionCom_SN.addOnce(onPrinterCom);
			printer.startShow();
		}
		
		private function onPrinterCom():void{
			trace("打印机 显示完成");
			removePrinter();
			
			GuideSelectControl.init();
		}
		
		
		
		private function removePrinter():void{
			if(printer){
				if(printer.parent){
					printer.parent.removeChild(printer);
				}
				printer.captionCom_SN.remove(onPrinterCom);
				printer.destory();
				printer=null;
			}
		}
		
		
		/**
		 * 命名成功之后的操作
		 */
		private function showChooseCard():void
		{
			closeYindao1Scene();
			showYindao2Scene();
		}
		private var zhuceWindow:MC_Zhuce;
		/**
		 *  显示注册帐号界面
		 */
		public function showZhuceWindow(evt:Event=null):void
		{
			if(null==zhuceWindow)
			{
				zhuceWindow=new MC_Zhuce();
			}
			LayerController.instance.waitLayer.addChild(zhuceWindow);
		}
		/**
		 *  关闭注册帐号界面
		 */
		public function closeZhuceWindow(evt:Event=null):void
		{
			if(zhuceWindow&&LayerController.instance.waitLayer.contains(zhuceWindow))
			{
				LayerController.instance.waitLayer.removeChild(zhuceWindow)
			}
			if(zhuceWindow)
			{
				zhuceWindow.destory();
				zhuceWindow=null;
			}
		}
		//  denglu
		private var dengluWindow:MC_Denglu;
		/**
		 *  显示输入帐号界面
		 */
		public function showDengluWindow(evt:Event=null):void
		{
//			if(null==dengluWindow)
//			{
//				dengluWindow=new MC_Denglu();
//			}
//			LayerController.instance.waitLayer.addChild(dengluWindow);
			if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.UseFastLogin)){
				preloadLayer.showMC(PreloadLayer.MCName_PreLogin);
				(PlatformManager.getInstance().platformObj as Object).showLoginPage();
			}
		}
		/**
		 * 关闭输入帐号界面
		 */
		public function dengluCloseFunc(evt:Event=null):void
		{
			if(dengluWindow&&LayerController.instance.waitLayer.contains(dengluWindow))
			{
				LayerController.instance.waitLayer.removeChild(dengluWindow)
			}
			if(dengluWindow)
			{
				dengluWindow.destory();
				dengluWindow=null;
			}
		}
		private function playMusic():void
		{
			/*Music.stop(Music.MC_Loading);
			Music.play(Music.MC_Xuanren_Background);*/
		}
		// denglu
		private var yindao1Scene:MC_Name_Login;
		/**
		 * 显示起名界面
		 */
		public function showYindao1Scene():void
		{
			if(null==yindao1Scene)
			{
				yindao1Scene=new MC_Name_Login();
			}
			LayerController.instance.waitLayer.addChild(yindao1Scene);
			playMusic();
		}
		/**
		 * 关闭起名界面
		 */
		private function closeYindao1Scene():void
		{
			if(yindao1Scene&&LayerController.instance.waitLayer.contains(yindao1Scene))
			{
				LayerController.instance.waitLayer.removeChild(yindao1Scene);
			}
			if(yindao1Scene)
			{
				yindao1Scene.destory();
				yindao1Scene=null;
			}
		}
		
		//		private var yindao2Scene:MC_ChooseKapai_Login;
		private var yindao2Scene:Mc_ChooseKapai_Login_New2;
		/**
		 * 显示选择角色界面
		 */
		public function showYindao2Scene():void
		{
			if(null==yindao2Scene)
			{
				//				yindao2Scene=new MC_ChooseKapai_Login();
				yindao2Scene=new Mc_ChooseKapai_Login_New2();
			}
			LayerController.instance.waitLayer.addChild(yindao2Scene);
			playMusic();
		}
		/**
		 * 关闭选择角色界面
		 */
		private function closeYindao2Scene():void
		{
			if(yindao2Scene&&LayerController.instance.waitLayer.contains(yindao2Scene))
			{
				LayerController.instance.waitLayer.removeChild(yindao2Scene)
			}
			if(yindao2Scene)
			{
				yindao2Scene.destory();
				yindao2Scene=null;
			}
		}
		private function startEnterGame(evt:Event=null):void
		{
//			if(!SwitchConfig.ST_FastLogin)
			if(!PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.UseFastLogin))
			{
				if(!LoginControl.getInstance().checkIfHasAccount())
				{
					Util.flow("请登录您的帐号");
					AccountControl.getInstance().loginStep_SN.dispatch(AccountControl.Login_Step_Account_Error);
					return;
				}
			}
			checkServerUsable();
			
			
			//先请求一下 服务器 动态地址
			//			requestWebAddress();
			
			//			showAlert(true,14400,78846);
		}
		private function checkServerUsable():void
		{
			//			showWebTongzhi();
			UrlConfig.requstWebResult.addOnce(requestWebAddress);
			UrlConfig.ShowAlert_SN.addOnce(showAlert);
			UrlConfig.resetRepeateCount();
			UrlConfig.checkServerUsable();
		}
		private function showAlert(_isShow:Boolean,_startTime:Number,_endTime:Number):void
		{
			showWebTongzhi();
			//			var alert:MC_Alert=new MC_Alert();
			//			alert.setData(_startTime,_endTime);
			//			var confirmFunc:Function=function(evt:Event=null):void
			//			{
			//				alert._btn_queding.removeEventListener(MouseEvent.CLICK,confirmFunc);
			//				preloadLayer.scLoader.removeChild(alert);
			//				alert.destory();
			//			};
			//			alert._btn_queding.addEventListener(MouseEvent.CLICK,confirmFunc);
			//			preloadLayer.scLoader.addChild(alert);
		}
		
		public function showWebTongzhi():void{
			//			var tifu:TingfuPage=new TingfuPage();
			//			if(_tingfuPage==null){
			//				_tingfuPage=new TingfuPage();
			//				GlobalRef.root.addChild(_tingfuPage);
			//				_tingfuPage.setShow();
			//			}
			TingfuPage.getInstance().setShow(GlobalRef.root,"维护公告");
		}
		
		
		private var _enterCode:int;
		private function proccessEnterCode():void{
			
//			coreDispatcher.dispatchEvent(new PreloadEvent(PreloadEvent.GameStartup));
//			return ;
			
			if(_enterCode==1){
				AccountControl.getInstance().loginStep_SN.dispatch(AccountControl.Login_Step_Name_Error);
			}
			if(_enterCode==2){
				AccountControl.getInstance().loginStep_SN.dispatch(AccountControl.Login_Step_Name_Complete);	
			}
			if(_enterCode==3){
				coreDispatcher.dispatchEvent(new PreloadEvent(PreloadEvent.GameStartup));
			}
		}
		
		private var isEntering:Boolean=false;
		
		private function goEnterGame():void
		{
			if(isEntering){
				trace("newenter 正在进行中 ");
				return ;
			}
			isEntering=true;
			//			trace(Util.getLanguage("服务器在维护",0,1));
			//请求进入游戏\
			trace("点击startEnterGame");
			var arg:Object={};
			//			arg.op="enter";
			arg.op="newenter";
			
			//			arg.platname=AccountControl.getInstance().currentAccount.platname;
			arg.aid=GLBaseData.accountId;
			//			arg.aid="5362946350986193你好好"
			arg.sid=GLBaseData.serverId;
			arg.deviceToken=LoginControl.getInstance().getMac();
			trace(Util.transArgToUrl(UrlConfig.accountServerUrl,arg));
			
			HttpRequest.getInstance().realyPostRequest(UrlConfig.accountServerUrl,arg,function (data:String):void
			{
				isEntering=false;
				trace(data);
				var json:Object=JSON.parse(data);
				
				
				
				if(json.hasOwnProperty("avaliable")){
					if(json.avaliable<0){
						/*TopTip.showExitTip(Util.getLanguage("您的账号信息出错，请与客服MM联系。"),function():void{
							Util.exitGame();
						},function():void{
							Util.exitGame();
						});*/
						return ;
					}
				}
				
				if(json.result==-10001){
					//排队系统激活
					//					PaiduiControl.getInstance().forceEnter_SN.add(goForceEnter);
//					PaiduiControl.getInstance().fresh_SN.add(goEnterGame);
//					PaiduiControl.getInstance().setTimeAndNum(ServerListManager.getInstance().getServerDataById(int(GLBaseData.serverId)).zoneName
//						,int(json.olwt),int(json.olwn));
					
				}
				
				if(json.result==1)
				{
					//激活游戏 帐号
					PlatformManager.getInstance().activeGameAccount();
					
					if(json.hasOwnProperty("account_bind"))
					{
						GLBaseData.hasBindAccount=(json.account_bind>0);
					}
					if(json.ue==0)
					{
						_enterCode=1;
						showLoadXmlPage();
						//						AccountControl.getInstance().loginStep_SN.dispatch(AccountControl.Login_Step_Name_Error);
					}
					else
					{
						if(1==json.step)
						{
							GLBaseData.userId=json.id;
							GLBaseData.author=json.ak;
							GLBaseData.userName=json.un;
							_enterCode=2;
							showLoadXmlPage();
							//							AccountControl.getInstance().loginStep_SN.dispatch(AccountControl.Login_Step_Name_Complete);		
						}
						else
						{
							GLBaseData.userId=json.id;
							GLBaseData.author=json.ak;
							GLBaseData.userName=json.un;
							_enterCode=3;
							showLoadXmlPage();
							//							coreDispatcher.dispatchEvent(new PreloadEvent(PreloadEvent.GameStartup));
						}
					}
					
					//					PaymentControl.getInstance().init();
				}
				
			},60000,false,"text",true);
		}
		
		
		private var requestTick:int=3;
		
		
		private function requestForServerList():void
		{
			//请求加载 服务器 list
			Util.showWebWait();
			ServerListManager.getInstance().loadServerList(onServerListCom,onServerListFail);
		}
		
		private function onServerListFail():void
		{
			Util.hideWebWait();
			TopTip.showExitTip("加载服务器列表错误，是否重新加载？",requestForServerList,Util.exitGame);
		}
		
		private function onServerListCom():void
		{
			//设置 服务器list
			Util.hideWebWait();
			GLBaseData.serverList=ServerListManager.getInstance().serverDataList;
			GLBaseData.LastServerChange_SN.add(onLastServerChange);
			onLastServerChange();
			
			showServerPage();
			
//			showWebGongaoPage();
			
			/*GLBaseData.serverList=ServerListManager.getInstance().serverDataList;
			GLBaseData.LastServerChange_SN.add(onLastServerChange);
			onLastServerChange();
			setProgress();*/
		}
		
		private var _gonggaoWeb:GongaoPreloadPage; 
		//  显示公告页面
		private function showWebGongaoPage():void{
			
			CONFIG::AppstoreLaohu{
				if(AppstoreVerify.inVerify){
					// 如果正在验证中 ，关闭公告
					return ;
				}
			}
				
			if(_gonggaoWeb==null){
				_gonggaoWeb=new GongaoPreloadPage();
				_gonggaoWeb.setShow(GlobalRef.root);
			}
		}
		
		// 显示 选服页面
		private function showServerPage():void{
			GLBaseData.LastServerChange_SN.add(onLastServerChange);
			preloadLayer.showMC(PreloadLayer.McName_Account);
		}
		
		private function startRequest():void
		{
			requestForServerList();
			
			setProgress();
		}
		
		private function onStateChange(state:String):void
		{
			if(state=="account")
			{
				onServerChange();
			}
		}
		/**
		 * 设置选择的服务器信息
		 */
		private function onServerChange():void
		{
			if(null!=GLBaseData.serverId)
			{
				var index:int;
				var serverList:Array=GLBaseData.serverList;
				for(index=0;index<serverList.length;index++)
				{
					var serverInfo:Object=serverList[index];
					if(serverInfo.zoneId==GLBaseData.serverId)
					{
//						preloadLayer._fnt_jinru_xuanqu.text=serverInfo.zoneName;
						preloadLayer._btn_jinru_xuanqu.setText(serverInfo.zoneName);
						preloadLayer._fnt_denglu_xuanqu.text=serverInfo.zoneName;
						break;
					}
				}
			}
			else
			{
				var first:Object=GLBaseData.serverList[0];
//				preloadLayer._fnt_jinru_xuanqu.text=first.zoneName;
				preloadLayer._btn_jinru_xuanqu.setText(first.zoneName);
				preloadLayer._fnt_denglu_xuanqu.text=first.zoneName;
				GLBaseData.serverId=first.zoneId;
			}
		}
		
		private function progressComplete():void
		{
			GameConstConfig.configFormConst();
			stopShowTip();
//			preloadLayer._mc_anim.visible=true;
			//			coreDispatcher.dispatchEvent(new PreloadEvent(PreloadEvent.StartLogin));
			ExitGameControl.setExitQuite(false);
			
			//			goEnterGame();
			proccessEnterCode();
			//			//xml 加载完毕  显示 平台账号登陆页面
			//			// 添加服务器数据变化 监听
			//			GLBaseData.LastServerChange_SN.add(onLastServerChange);
			//			
			////			onLoginWayChange(PreloadLayer.McName_Account);
			//			preloadLayer.showMC(PreloadLayer.McName_Account);
			
		}
		
		private function setProgress():void
		{
			preloadLayer._prg_loading.devider=xmlLoader.totalXmls+2+langMD.deviver;
			//			var ot:int=(GLBaseData.serverList==null)?0:1;
			var ot:int=1;
			preloadLayer._prg_loading.progress=xmlLoader.hasLoadXmls+ot+langMD.progress;
			trace(preloadLayer._prg_loading.devider+" / "+(xmlLoader.hasLoadXmls+ot));
			if(preloadLayer._prg_loading.devider==preloadLayer._prg_loading.progress+1)
			{
				TweenLite.delayedCall(0.5,progressComplete);
			}
		}
		
		public override function destroy():void
		{
//			C2SEmitter.connectCom_SN.remove(onSocketCom);
//			C2SEmitter.connectError_SN.remove(onSocketError);
			if(_gonggaoWeb) {_gonggaoWeb.destory();_gonggaoWeb=null;}
//			PaiduiControl.getInstance().destory();
			if(TingfuPage._instance){
				TingfuPage.getInstance().close();
			}
			stopShowTip();
			LoginControl.getInstance().union_plataccount_com_SN.remove(onUnionLoginCom);
			TweenLite.killDelayedCallsTo(requestForServerList);
			TweenLite.killDelayedCallsTo(progressComplete);
			xmlLoader.mainXmlCom_SN.remove(onMainXmlCom);
			xmlLoader.childXmlCom_SN.remove(setProgress);
			langMD.complete_SN.remove(setProgress);
			LoginControl.getInstance().loginWayChange_SN.remove(onLoginWayChange);
			LoginControl.getInstance().loginDataSet_SN.remove(onDataSet_Res);
			
			LoginUIControl.getInstance().uiMessage_SN.remove(onUIControl);
			AccountControl.getInstance().loginStep_SN.remove(onLoginMessage);
			
			preloadLayer.changState_SN.remove(onStateChange);								
			GLBaseData.LastServerChange_SN.remove(onLastServerChange);
			
			closeXuanqu();
			closeYindao1Scene();
			closeYindao2Scene();
			closeZhuceWindow();
			dengluCloseFunc();
			
			removePrinter();
			GuideSelectControl.destory();
			
			super.destroy();
		}
		
		
	}
}

