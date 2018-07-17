package view.login
{
	import flash.events.Event;
	
	import Tool.login.LoginControl;
	import Tool.login.LoginUIControl;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.InputField;
	
	import util.Util;
	
	import view.Base_Mc;
	
import flash.display.MovieClip
	public class MC_Denglu extends Base_Mc
	{
		private var _btn_close:Button;
		private var _btn_queding:Button;
		private var _btn_zhuce:Button;		
		private var _fnt_shuru_zhanghao:InputField;
		private var _fnt_shuru_mima:InputField;
		
		public function MC_Denglu()
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
			LoginUIControl.getInstance().uiMessage_SN.dispatch(LoginUIControl.UI_MSG_FromDengluToZhuce);
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
			LoginControl.getInstance().denglu(zhanghao,mima);
		}
		private function onCloseClicked(evt:Event):void
		{
			LoginUIControl.getInstance().uiMessage_SN.dispatch(LoginUIControl.UI_MSG_CloseDenglu);
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
