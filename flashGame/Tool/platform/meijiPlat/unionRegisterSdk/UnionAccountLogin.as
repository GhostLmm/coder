package Tool.platform.meijiPlat.unionRegisterSdk
{
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.ViewDispatcher;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.ButtonMax;
	import ui.widget.FontField;
	
	import util.Util;
	
	import view.Base_Mc;
	
	public class UnionAccountLogin extends Base_Mc
	{
		private var _btn_account:Button;
		private var _fnt_account:FontField;
		private var _btn_login:ButtonMax;
		
		private var _account:String;
		private var _token:String;
		private var _timer:Timer;
		private var _tick:int;
		public function UnionAccountLogin($mc:Object=null)
		{
			super($mc);
		}
		
		protected override function get mcClassName():Class{
			return SceneAutoLogin;
		}
		protected override function initModule():void{
			var mc:SceneAutoLogin=m_mc as SceneAutoLogin;
			_btn_account=new Button(mc.mc_zhanghao);
			_fnt_account=new FontField(mc.mc_zhanghao.fnt_shuru_zhanghao);
			_btn_login=new ButtonMax(mc.btn_login);
			_timer=new Timer(1000);
		}
		
		protected override function registerEvent():void{
			addTargetEvent(_btn_account,TqtEvent.BUTTON_CLICK,onQiehuanZhanghao);
			addTargetEvent(_btn_login,TqtEvent.BUTTON_CLICK,onLoginClick);
			addTargetEvent(_timer,TimerEvent.TIMER,onTimer);
		}
		
		private function onTimer(evt:Event):void{
			_tick--;
			if(_tick<=0){
				onLoginClick();
			}
			showLoginBtn();
		}
		
		private function showLoginBtn():void{
			if(_tick>=0){
				_btn_login.setText("登录 ("+_tick+")");
			}else{
				_btn_login.setText("登录");
			}
			
		}
		public function start($account:String,$token:String,$autoLogin:Boolean):void{
			_account=$account;
			_token=$token;
			
			_fnt_account.text=$account;
			if($autoLogin){
				_tick=3;
				_timer.start();
				showLoginBtn();
			}else{
				_tick=-1;
				_timer.stop();
				showLoginBtn();
			}
			
		}
		
		private function onQiehuanZhanghao(evt:Event):void{
			_timer.stop();
			var viewDispatcher:ViewDispatcher=Context.getInjectInstance(ViewDispatcher);
			var uet:UnionSdkEvent=new UnionSdkEvent(UnionSdkEvent.UnionGoPage);
			
			uet.targetPage=UnionDenglu;
			viewDispatcher.dispatchEvent(uet);
			
		}
		private function onLoginClick(evt:Event=null):void{
			_timer.stop();
			var zhanghao:String=_account;
			var mima:String=_token;
			var viewDispatcher:ViewDispatcher=Context.getInjectInstance(ViewDispatcher);
			var uet:UnionSdkEvent=new UnionSdkEvent(UnionSdkEvent.UnionDengluOk);
			uet.uid=zhanghao;
			uet.token=mima;
			viewDispatcher.dispatchEvent(uet);
		}
		
		public override function destory():void{
			if(_btn_account) {_btn_account.destory(); _btn_account=null;}
			if(_fnt_account) {_fnt_account.destory(); _fnt_account=null;}
			if(_btn_login) {_btn_login.destory(); _btn_login=null;}
			if(_timer) {_timer.stop(); _timer=null;}
			super.destory();
		}
		
	}
}