package Tool.platform.meijiPlat.unionRegisterSdk
{
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.ViewDispatcher;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import Tool.login.LoginControl;
	import Tool.login.LoginUIControl;
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.InputField;
	
	import util.Util;
	
	import view.Base_Mc;

	public class UnionDenglu extends Base_Mc
	{
		private var _btn_close:Button;
		private var _btn_queding:Button;
		private var _btn_zhuce:Button;		
		private var _fnt_shuru_zhanghao:InputField;
		private var _fnt_shuru_mima:InputField;
		public function UnionDenglu()
		{
			super();
		}
		
		
		protected override function initModule():void
		{
			_btn_close=new Button(mcMaterial.btn_close);
			_btn_queding=new Button(mcMaterial.btn_queding);
			_btn_zhuce=new Button(mcMaterial.btn_zhuce);
			
			_fnt_shuru_zhanghao=new InputField(mcMaterial.fnt_shuru_zhanghao);
			_fnt_shuru_mima=new InputField(mcMaterial.fnt_shuru_mima);
//			_btn_close.visible=false;
			_btn_close.visible=PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.UseFastLogin);
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null};
			if(_btn_queding){_btn_queding.destory();_btn_queding=null};
			if(_btn_zhuce){_btn_zhuce.destory();_btn_zhuce=null};
			if(_fnt_shuru_zhanghao){_fnt_shuru_zhanghao.destory();_fnt_shuru_zhanghao=null};
			if(_fnt_shuru_mima){_fnt_shuru_mima.destory();_fnt_shuru_mima=null};
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addTargetEvent(_btn_queding,TqtEvent.BUTTON_CLICK,onQuedingClicked);
			addTargetEvent(_btn_zhuce,TqtEvent.BUTTON_CLICK,onZhuceClicked);
		}
		private function onZhuceClicked(evt:Event):void
		{
//			LoginUIControl.getInstance().uiMessage_SN.dispatch(LoginUIControl.UI_MSG_FromDengluToZhuce);
//			ViewDispatcher
			var viewDispatcher:ViewDispatcher=Context.getInjectInstance(ViewDispatcher);
			var uet:UnionSdkEvent=new UnionSdkEvent(UnionSdkEvent.UnionGoPage);
			uet.targetPage=UnionZhuce;
			viewDispatcher.dispatchEvent(uet);
		}
		
		public function setAccount(uid:String,token:String):void{
			if(uid!=null && uid!=""){
				_fnt_shuru_zhanghao.text=uid;
			}
			if(token!=null && token!=""){
				_fnt_shuru_mima.text=token;
			}
			
		}
		
		private function onQuedingClicked(evt:Event):void
		{
			var zhanghao:String=_fnt_shuru_zhanghao.text;
			var mima:String=_fnt_shuru_mima.text;
			if(!_fnt_shuru_zhanghao.isInputed())
			{
				Util.flow("请输入帐号");
				return;
			}
			if(!_fnt_shuru_mima.isInputed())
			{
				Util.flow("请输入密码");
				return;
			}
//			LoginControl.getInstance().denglu(zhanghao,mima);
			var zhanghao:String=_fnt_shuru_zhanghao.text;
			var mima:String=_fnt_shuru_mima.text;
			var viewDispatcher:ViewDispatcher=Context.getInjectInstance(ViewDispatcher);
			var uet:UnionSdkEvent=new UnionSdkEvent(UnionSdkEvent.UnionDengluOk);
			uet.uid=zhanghao;
			uet.token=mima;
			
			viewDispatcher.dispatchEvent(uet);
			
		}
		private function onCloseClicked(evt:Event):void
		{
			var viewDis:ViewDispatcher=Context.getInjectInstance(ViewDispatcher);
			var uet:UnionSdkEvent=new UnionSdkEvent(UnionSdkEvent.UnionClosePage);
			
			viewDis.dispatchEvent(uet);
//			LoginUIControl.getInstance().uiMessage_SN.dispatch(LoginUIControl.UI_MSG_CloseDenglu);
		}
		protected override function setShow():void
		{
			
		}
		protected override function get mcClassName():Class
		{
			return (AssetManager.getAssetClass("SceneDenglu") as Class); 
		}
		private function get mcMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
		public function setData(_data:Object):void
		{
			m_data=_data;
		}
		protected override function isNeedBlock():Boolean
		{
			return true;
		}
		protected override function isBlockMiddle():Boolean{
			return true;
		}
		
	}
}


