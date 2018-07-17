package ui.choujiang
{
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.window._WindowBase;
	
	public class JingxuanWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _mc_chouyici:MovieClip;
		public var _mc_choushici:MovieClip;
		
		
		public var _fnt_cishu:FontField;
		public var _fnt_cash1:FontField;
		public var _fnt_cash2:FontField;
		public function JingxuanWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowXuanxiu2);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_mc_chouyici=windowMaterial.mc_chouyici;
			_mc_choushici=windowMaterial.mc_choushici;
			_mc_chouyici.mouseChildren=false;
			_mc_choushici.mouseChildren=false;
			
			_fnt_cash1=new FontField(windowMaterial.mc_chouyici.fnt_cash1);
			_fnt_cash2=new FontField(windowMaterial.mc_choushici.fnt_cash2);
			_fnt_cishu=new FontField(windowMaterial.fnt_cishu);
		}
		public override function destory():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_mc_chouyici){_mc_chouyici=null;};
			if(_mc_choushici){_mc_choushici=null;};
			
			if(_fnt_cash1){_fnt_cash1.destory();_fnt_cash1=null;};
			if(_fnt_cash2){_fnt_cash2.destory();_fnt_cash2=null;};
			if(_fnt_cishu){_fnt_cishu.destory();_fnt_cishu=null;};
			
			super.destory();
		}
		private function get windowMaterial():WindowXuanxiu2
		{
			return _scene as WindowXuanxiu2;
		}
	}
}
