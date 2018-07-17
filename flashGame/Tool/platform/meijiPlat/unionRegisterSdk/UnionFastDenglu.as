package Tool.platform.meijiPlat.unionRegisterSdk
{
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.ViewDispatcher;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import core.event.TqtEvent;
	
	import ui.widget.ButtonMax;
	
	import view.Base_Mc;
	
	public class UnionFastDenglu extends Base_Mc
	{
		private var _btn_fastLogin:ButtonMax;
		private var _btn_register:ButtonMax;
		private var _btn_login:ButtonMax;
		
		private var timer:Timer;
		private var timeTick:int;
		public function UnionFastDenglu($mc:Object=null)
		{
			super($mc);
		}
		
		protected override function initModule():void{
			var mc:SceneFastLogin=m_mc as SceneFastLogin;
			_btn_fastLogin=new ButtonMax(mc.btn_fastLogin);
			_btn_login=new ButtonMax(mc.btn_login);
			_btn_register=new ButtonMax(mc.btn_register);
			_btn_fastLogin.setText("游客登录");
			_btn_login.setText("登录");
			if(UnionSdk.instance.macResult==UnionSdk.NO_ACCOUNT){
				_btn_register.setText("注册");
			}
			if(UnionSdk.instance.macResult==UnionSdk.QUICK_ACCOUNT){
				_btn_register.setText("绑定注册");
			}
			if(UnionSdk.instance.macResult==UnionSdk.BIND_ACCOUNT){
				_btn_register.setText("重新注册");
			}
			
		}
		
		private function clearTimer():void{
			if(timer){
				timer.stop();
				timer.removeEventListener(TimerEvent.TIMER,onTimer);
				timer=null;
			}
		}
		private function startTimer():void{
			clearTimer();
			timer=new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER,onTimer);
			timer.start();
		}
		
		private function onTimer(evt:Event):void{
			timeTick--;
			if(timeTick>=0){
				showFastLoginTimer();
			}else{
				_btn_fastLogin.setText("游客登录");
				clearTimer();
				onFastLoginClick();
			}
		}
		
		public function setAutoLogin(autoLogin:Boolean):void{
			if(autoLogin){
				timeTick=5;
				showFastLoginTimer();
				startTimer();
			}else{
				_btn_fastLogin.setText("游客登录");
				clearTimer();
			}
		}
		
		private function showFastLoginTimer():void{
			_btn_fastLogin.setText("游客登录 "+timeTick);
		}
		
		
		
		protected override function registerEvent():void{
			addTargetEvent(_btn_fastLogin,TqtEvent.BUTTON_CLICK,onFastLoginClick);
			addTargetEvent(_btn_login,TqtEvent.BUTTON_CLICK,onLoginClick);
			addTargetEvent(_btn_register,TqtEvent.BUTTON_CLICK,onRegisterClick);
		}
		
		private function onFastLoginClick(evt:Event=null):void{
			clearTimer();
			var viewDispatcher:ViewDispatcher=Context.getInjectInstance(ViewDispatcher);
			var uet:UnionSdkEvent=new UnionSdkEvent(UnionSdkEvent.UnionFastLoginOk);
			
			viewDispatcher.dispatchEvent(uet);
		}
		private function onLoginClick(evt:Event):void{
			clearTimer();
			var viewDispatcher:ViewDispatcher=Context.getInjectInstance(ViewDispatcher);
			var uet:UnionSdkEvent=new UnionSdkEvent(UnionSdkEvent.UnionGoPage);

			uet.targetPage=UnionDenglu;
			viewDispatcher.dispatchEvent(uet);
		}
		private function onRegisterClick(evt:Event):void{
			clearTimer();
			var viewDispatcher:ViewDispatcher=Context.getInjectInstance(ViewDispatcher);
			var uet:UnionSdkEvent=new UnionSdkEvent(UnionSdkEvent.UnionGoPage);

			uet.targetPage=UnionZhuce;
			viewDispatcher.dispatchEvent(uet);
		}
		 
		public override function destory():void{
			clearTimer();
			if(_btn_fastLogin) {_btn_fastLogin.destory(); _btn_fastLogin=null;}
			if(_btn_login) {_btn_login.destory(); _btn_login=null;}
			if(_btn_register) {_btn_register.destory(); _btn_register=null;}
			super.destory();
		}
		
		protected override function isBlockMiddle():Boolean{
			return true;
		}
		protected override function isNeedBlock():Boolean{
			return true;
		}
		
		protected override function get mcClassName():Class
		{
			return SceneFastLogin;
		}
		
	}
}