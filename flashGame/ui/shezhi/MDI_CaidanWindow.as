package ui.shezhi
{
	import com.fish.GLBaseData;
	import com.fish.modules.preloadMD.models.SystemMD;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import Tool.login.LoginControl;
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.ButtonMax;
	import ui.window.Wnd_Announcement;
	
	import util.SwitchManager;
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_CaidanWindow extends Mediator
	{
		[Inject]
		public var candanWindow:CaidanWindow;
		[Inject]
		public var systemMD:SystemMD;
		
		
	
		private var accountState:BtnState;
		private var gameCenterState:BtnState;
		private var libaoState:BtnState;
		private var gonggaoState:BtnState;
		private var friendState:BtnState;
		private var chenghaoState:BtnState;
		
		private var stateArray:Array;
		

		public function MDI_CaidanWindow()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			addViewListener(candanWindow._btn_close,TqtEvent.BUTTON_CLICK,candanWindow.close,false,0,true);
			addViewListener(candanWindow._btn_yinyue,TqtEvent.BUTTON_CLICK,onYinyueClicked,false,0,true);
			addViewListener(candanWindow._btn_yinxiao,TqtEvent.BUTTON_CLICK,onYinxiaoClicked,false,0,true);
			addViewListener(candanWindow._btn_tuisong,TqtEvent.BUTTON_CLICK,onTuisongClicked,false,0,true);
			gonggaoState=new BtnState("gonggao","公告",true,onGonggaoClicked);
			libaoState=new BtnState("libao","礼包",true,onLibaoDuihuanClicked);
			
			chenghaoState=new BtnState("chenghao","称号",true,onChenghaoClicked);
			friendState=new BtnState("friend","好友",true,onFriendClick);
			gameCenterState=new BtnState("gameCenter","账号中心",true,onZhanghaozhongxinClicked);
			accountState=new BtnState("account","注销账号",true,onQiehuanZhanghaoClicked);
			
			stateArray=[gonggaoState,libaoState,chenghaoState,friendState,gameCenterState,accountState];

			chenghaoState.active=false;
			if(PlatformManager.getInstance().supportGamecenter()){
				gameCenterState.active=true;
			}else{
				gameCenterState.active=false;
			}
			
			if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.UseFastLogin)){
				if((PlatformManager.getInstance().platformObj as Object).needBindAccount()){
					accountState.setInfo("绑定账号",true,onBindAccountClick);
				}
			}
			
//			if(AppstoreVerify.inVerify){
//				gonggaoState.active=false;
//				libaoState.active=false;
//			}
			if(!SwitchManager.getInstance().Switch_Gonggao){
				gonggaoState.active=false;
			}
			if(!SwitchManager.getInstance().Switch_CDKey){
				libaoState.active=false;
			}
			
			systemMD._YinyueSigal.add(setYinyueShow);
			systemMD._YinxiaoSigal.add(setYinxiaoShow);
			systemMD._PushSignal.add(setPushShow);
			
			setShow();
			
			
		}
		
		private function onChenghaoClicked(evt:Event=null):void{
			if(!chenghaoState.active){
				Util.flow("该功能尚未开放");
			}
		}
		
		private function onFriendClick(evt:Event=null):void{
			candanWindow.close();
			CommonControlFun.gotoFriend();
		}
		
		/**
		 * 点击公告按钮
		 */
		private function onGonggaoClicked(evt:Event=null):void
		{
			candanWindow.close();
			WindowManager.openOnlyWinodw(Wnd_Announcement);
		}
		
		private function onBindAccountClick(evt:Event):void{
			candanWindow.close();
			(PlatformManager.getInstance().platformObj as Object).bindAccountInGame();
			
		}
		
		private function onQiehuanZhanghaoClicked(evt:Event=null):void
		{
//			Util.flow("功能尚未开发");
//			TopTip.showExitTip(Util.getLanguage("tip_注销账号"),zhuxiao);
			
			if(PlatformManager.getInstance().supportSwitchAccount()){
				PlatformManager.getInstance().switchAccount();
			}else if(PlatformManager.getInstance().supportLogout()){
				TopTip.showExitTip(Util.getLanguage("tip_注销账号"),zhuxiao);
			}else{
				if(PlatformManager.getInstance().supportPlatExit()){
					PlatformManager.getInstance().platExit();
				}else{
					Util.exitGame();
				}
				
			}
			
		}
		
		private function zhuxiao():void
		{
			if(PlatformManager.getInstance().supportPlatAccount()){
				if(PlatformManager.getInstance().supportLogout()){
					PlatformManager.getInstance().logout();
				}
			}else{
				LoginControl.getInstance().clearCache();
				Util.exitGame();
				PlatformManager.getInstance().showWaitAfterLogout();
			}
			
		}
		
		private function onZhanghaozhongxinClicked(evt:Event=null):void
		{
			
			if(PlatformManager.getInstance().supportGamecenter()){
				PlatformManager.getInstance().openGamecenter();
			}else{
				Util.flow("功能尚未开发");
			}
		}

		
		private function onBangdingZhanghaoDisableClicked(evt:Event):void
		{
			if(!PlatformManager.getInstance().supportPlatAccount()){
				Util.flow("账号已经绑定过");
			}else{
				Util.flow("功能尚未开发");
			}
		}
		
		/**  cdKey礼包领取功能
		 * */
		private function onLibaoDuihuanClicked(evt:Event=null):void
		{
			candanWindow.close();
			WindowManager.openOnlyWinodw(CdKeyWindow);
		}
		
		/**
		 * 打开帮助窗口
		 */
		private function onHelpClicked(evt:Event):void
		{
			candanWindow.close();
			CommonControlFun.showHelpWebpage();
			
			
		}
		
		private function setPlatInfo():void{
			candanWindow._fnt_id.text=GLBaseData.userId;
			candanWindow._fnt_pingtaihao.text=GLBaseData.serverId;
		}
		
		private function setBtnState():void{
			
		}
		private function setBtnShow():void{
			var tempState:Array=[];
			for each(var state:BtnState in stateArray){
				if(!SwitchManager.getInstance().Switch_ShowNotCompleteFn){
					if(state.active){
						tempState.push(state);
					}
				}else{
					tempState.push(state);
				}
				
			}
			for (var index:int=0; index<candanWindow.btnArray.length; index++){
				var btn:ButtonMax=candanWindow.btnArray[index];
				if(index<tempState.length){
					btn.visible=true;
					var state:BtnState=(tempState[index] as BtnState);
					btn.setText(state.desc);
					btn.isEnabled=state.enable;
					
				}else{
					btn.visible=false;
				}
				addViewListener(btn,TqtEvent.BUTTON_CLICK,state.callFn);
				
//				if(!AppstoreVerify.inVerify){
//					btn.visible=true;
//				}
			}
			
		}
		private function setKefuShow():void{
			if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.UserKefu)){
				candanWindow._mc_kefu.visible=true;
				candanWindow._fnt_kefu.visible=true;
				candanWindow._fnt_kefu.text=Util.getLanguage("客服信息");
			}else{
				candanWindow._mc_kefu.visible=false;
				candanWindow._fnt_kefu.visible=false;
			}
		}
		private function setShow():void
		{
			setYinxiaoShow();
			setYinyueShow();
			setPushShow();
			setPlatInfo();
			setBtnState();
			setBtnShow();
			setKefuShow();

			/*if(SwitchManager.getInstance().Switch_CDKey)
			{
//				candanWindow._btn_libaoduihuan.visible=true;
				libaoState.enable=true;
			}
			else
			{
				libaoState.enable=false;
			}

			if(SwitchManager.getInstance().Switch_Gonggao)
			{
				gonggaoState.enable=true;
			}
			else
			{
				gonggaoState.enable=false;
			}

			
			if(PlatformManager.getInstance().supportSwitchAccount()){
				accountState.desc=("切换账号");
			}else if(PlatformManager.getInstance().supportLogout()){
				accountState.desc=("注销账号");
			}else{
				accountState.desc=("退出游戏");
			}
			
			if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.HideExitGameFn)){
				accountState.enable=false;
			}
			
			gameCenterState.enable=PlatformManager.getInstance().supportGamecenter();*/
			
//			candanWindow._fnt_kefuqun.text=PlatformManager.getInstance().getFuliQQ();
			
		}
		public override function destroy():void
		{
			systemMD._YinyueSigal.remove(setYinyueShow);
			systemMD._YinxiaoSigal.remove(setYinxiaoShow);
			systemMD._PushSignal.remove(setPushShow);
			if(accountState) {accountState.destory();accountState=null;}
			if(gameCenterState) {gameCenterState.destory();gameCenterState=null;}
			if(libaoState) {libaoState.destory();libaoState=null;}
			if(gonggaoState) {gonggaoState.destory();gonggaoState=null;}
			super.destroy();
				
		}
		private function setYinyueShow(_param:int=0):void
		{
			candanWindow._btn_yinyue.isSelected=Boolean(systemMD.yinyueSwitch);
		}
		private function setYinxiaoShow(_param:int=0):void
		{
			candanWindow._btn_yinxiao.isSelected=Boolean(systemMD.yinxiaoSwitch);
		}
		private function setPushShow(_param:int=0):void
		{
			candanWindow._btn_tuisong.isSelected=Boolean(systemMD.pushSwitch);
		}
		/**
		 * 音乐按钮点击事件
		 */
		private function onYinyueClicked(evt:TqtEvent):void
		{
			systemMD.changeYinyue();
		}
		/**
		 * 音效按钮点击事件
		 */
		private function onYinxiaoClicked(evt:TqtEvent):void
		{
			systemMD.changeYinxiao();
		}
		private function onTuisongClicked(evt:Event):void
		{
			systemMD.changePushNotification();
		}
	}
}
import ui.widget.Button;

class BtnState
{
	public var type:String;
	public var desc:String;
	public var enable:Boolean;
	public var callFn:Function;
	public var active:Boolean=true;
	
	public function BtnState($type:String,$desc:String,$enable:Boolean,$callFn:Function){
		type=$type;
		desc=$desc;
		enable=$enable;
		callFn=$callFn;
	}
	
	public function setInfo($desc:String,$enable:Boolean,$callFn:Function):void{
		desc=$desc;
		enable=$enable;
		callFn=$callFn;
	}
	
	
	public function destory():void{
		callFn=null;
	}
}