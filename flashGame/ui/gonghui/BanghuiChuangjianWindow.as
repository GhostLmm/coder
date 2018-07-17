package ui.gonghui
{
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.InputField;
	import ui.widget.Position;
	import ui.window._WindowBase;
	
import flash.display.MovieClip
	public class BanghuiChuangjianWindow extends _WindowBase
	{
		public static const MaxNameNum:int=7;
		public var _fnt_iconxuanze:FontField;
		public var _fnt_banghuiqiming:FontField;
		public var _fnt_shuru_banghuiming:InputField;
		public var _fnt_tiaojianxuqiu:FontField;
		public var _fnt_xuqiu1:FontField;
		public var _fnt_xuqiu2:FontField;
		public var _fnt_xuqiu3:FontField;
		
		public var _btn_chuangjian:Button;
		
		public var _mc_queren1:MovieClip;
		public var _mc_queren2:MovieClip;
		public var _mc_queren3:MovieClip;
		public var _mc_icon_1:MovieClip;
		public var _mc_icon_2:MovieClip;
		public var _mc_icon_3:MovieClip;
		public var _mc_icon_4:MovieClip;
		
		public var _pos_banghui1:Position;
		public var _pos_banghui2:Position;
		public var _pos_banghui3:Position;
		public var _pos_banghui4:Position;
		
		public var _btn_close:Button;
		
		public function BanghuiChuangjianWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowBanghuiChuangjian);
			initModule();
		}
		private function initModule():void
		{
			_fnt_iconxuanze=new FontField(windowMaterial.fnt_iconxuanze);
			_fnt_banghuiqiming=new FontField(windowMaterial.fnt_banghuiqiming);
			_fnt_shuru_banghuiming=new InputField(windowMaterial.fnt_shuru_banghuiming,MaxNameNum);
			_fnt_tiaojianxuqiu=new FontField(windowMaterial.fnt_tiaojianxuqiu);
			_fnt_xuqiu1=new FontField(windowMaterial.fnt_xuqiu1);
			_fnt_xuqiu2=new FontField(windowMaterial.fnt_xuqiu2);
			_fnt_xuqiu3=new FontField(windowMaterial.fnt_xuqiu3);
			
			_btn_chuangjian=new Button(windowMaterial.btn_chuangjian);
			
			_mc_queren1=windowMaterial.mc_queren1;
			_mc_queren2=windowMaterial.mc_queren2;
			_mc_queren3=windowMaterial.mc_queren3;
			
			_mc_icon_1=windowMaterial.mc_icon_1;
			_mc_icon_2=windowMaterial.mc_icon_2;
			_mc_icon_3=windowMaterial.mc_icon_3;
			_mc_icon_4=windowMaterial.mc_icon_4;
			
			_mc_icon_1.mouseChildren=false;
			_mc_icon_2.mouseChildren=false;
			_mc_icon_3.mouseChildren=false;
			_mc_icon_4.mouseChildren=false;
			
			_pos_banghui1=new Position(windowMaterial.pos_banghui1);
			_pos_banghui2=new Position(windowMaterial.pos_banghui2);
			_pos_banghui3=new Position(windowMaterial.pos_banghui3);
			_pos_banghui4=new Position(windowMaterial.pos_banghui4);
			
			_pos_banghui1.mouseChildren=false;
			_pos_banghui1.mouseEnabled=false;
			_pos_banghui2.mouseChildren=false;
			_pos_banghui2.mouseEnabled=false;
			_pos_banghui3.mouseChildren=false;
			_pos_banghui3.mouseEnabled=false;
			_pos_banghui4.mouseChildren=false;
			_pos_banghui4.mouseEnabled=false;
			
			_btn_close=new Button(windowMaterial.btn_close);
		}
		private function destoryMc():void
		{
			if(_fnt_iconxuanze){_fnt_iconxuanze.destory();_fnt_iconxuanze=null;};
			if(_fnt_banghuiqiming){_fnt_banghuiqiming.destory();_fnt_banghuiqiming=null;};
			if(_fnt_shuru_banghuiming){_fnt_shuru_banghuiming.destory();_fnt_shuru_banghuiming=null;};
			if(_fnt_tiaojianxuqiu){_fnt_tiaojianxuqiu.destory();_fnt_tiaojianxuqiu=null;};
			if(_fnt_xuqiu1){_fnt_xuqiu1.destory();_fnt_xuqiu1=null;};
			if(_fnt_xuqiu2){_fnt_xuqiu2.destory();_fnt_xuqiu2=null;};
			if(_fnt_xuqiu3){_fnt_xuqiu3.destory();_fnt_xuqiu3=null;};
			
			if(_btn_chuangjian){_btn_chuangjian.destory();_btn_chuangjian=null;};
			
			_mc_queren1=null;
			_mc_queren2=null;
			_mc_queren3=null;
			
			_mc_icon_1=null;
			_mc_icon_2=null;
			_mc_icon_3=null;
			_mc_icon_4=null;
			
			if(_pos_banghui1){_pos_banghui1.destory();_pos_banghui1=null;};
			if(_pos_banghui2){_pos_banghui2.destory();_pos_banghui2=null;};
			if(_pos_banghui3){_pos_banghui3.destory();_pos_banghui3=null;};
			if(_pos_banghui4){_pos_banghui4.destory();_pos_banghui4=null;};
			
			if(_btn_close){_btn_close.destory();_btn_close=null;};
		}
		private function get windowMaterial():WindowBanghuiChuangjian 
		{
			return _scene as WindowBanghuiChuangjian; 
		}
	}
}
