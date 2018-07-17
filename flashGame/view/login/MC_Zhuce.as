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
	public class MC_Zhuce extends Base_Mc
	{
		private var _btn_close:Button;
		private var _btn_queding:Button;
		private var _btn_quxiao:Button;		
		private var _fnt_shuru_zhanghao:InputField;
		private var _fnt_shuru_mima1:InputField;
		private var _fnt_shuru_mima2:InputField;
		
		public function MC_Zhuce()
		{
			super();
		}
		protected override function initModule():void
		{
			_btn_close=new Button(mcMaterial.btn_close);
			_btn_queding=new Button(mcMaterial.btn_queding);
			_btn_quxiao=new Button(mcMaterial.btn_quxiao);
			
			_fnt_shuru_zhanghao=new InputField(mcMaterial.fnt_shuru_zhanghao);
			_fnt_shuru_mima1=new InputField(mcMaterial.fnt_shuru_mima1);
			_fnt_shuru_mima2=new InputField(mcMaterial.fnt_shuru_mima2);
			
			_fnt_shuru_zhanghao.setRestrict(InputField.Ristrict_Str_CN);
			_fnt_shuru_mima1.setRestrict(InputField.Ristrict_Str_CN);
			_fnt_shuru_mima2.setRestrict(InputField.Ristrict_Str_CN);
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null};
			if(_btn_queding){_btn_queding.destory();_btn_queding=null};
			if(_btn_quxiao){_btn_quxiao.destory();_btn_quxiao=null};
			if(_fnt_shuru_zhanghao){_fnt_shuru_zhanghao.destory();_fnt_shuru_zhanghao=null};
			if(_fnt_shuru_mima1){_fnt_shuru_mima1.destory();_fnt_shuru_mima1=null};
			if(_fnt_shuru_mima2){_fnt_shuru_mima2.destory();_fnt_shuru_mima2=null};
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addTargetEvent(_btn_queding,TqtEvent.BUTTON_CLICK,onQuedingClicked);
			addTargetEvent(_btn_quxiao,TqtEvent.BUTTON_CLICK,onQuxiaoClicked);
		}
		private function onQuxiaoClicked(evt:Event):void
		{
			closeThisMc();
		}
		private function onCloseClicked(evt:Event):void
		{
			closeThisMc();
		}
		private function onQuedingClicked(evt:Event):void
		{
			var zhanghao:String=_fnt_shuru_zhanghao.text;
			var mima1:String=_fnt_shuru_mima1.text;
			var mima2:String=_fnt_shuru_mima2.text;
			if(!_fnt_shuru_zhanghao.isInputed())
			{
				Util.flow("请输入帐号");
				return;
			}
			if(!_fnt_shuru_mima1.isInputed())
			{
				Util.flow("请输入密码");
				return;
			}
			if(!_fnt_shuru_mima2.isInputed())
			{
				Util.flow("请再次输入密码");
				return;
			}
			if(mima1!=mima2)
			{
				Util.flow("两次输入密码不一致");
				return;
			}
			LoginControl.getInstance().zhuce(zhanghao,mima1);
		}
		private function closeThisMc():void
		{
			LoginUIControl.getInstance().uiMessage_SN.dispatch(LoginUIControl.UI_MSG_CloseZhuce);
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get mcMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
		protected override function get mcClassName():Class
		{
			return (AssetManager.getAssetClass("SceneZhuce") as Class); 
		}
		protected override function isNeedBlock():Boolean
		{
			return true;
		}
	}
}
