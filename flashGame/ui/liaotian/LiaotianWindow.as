package ui.liaotian
{
	import com.ghostlmm.lightMVC.impl.ViewAssemble;
	
	import flash.events.Event;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.window._WindowBase;
	
	public class LiaotianWindow extends _WindowBase
	{
	
//		public var _btn_close:Button;
		
		public var _btn_shijie:Button;
		public var _btn_banghui:Button;
		
		public var _pos_item:Position;
		
		public var _fnt_num:FontField;
		
		private var __width:Number;
		public function LiaotianWindow(params:Object=null)
		{
			super(params);
			this.removeChildren();
			_scene=AssetManager.createMCForText(WindowLiaotian);
			__width=_scene.width;			initModule();
		}
		public override function get width():Number{
			return __width;
		}
		
		public override function close(evt:Event=null):void{
			ViewAssemble.unBindMediator(this);
		}
		public override function open(evt:Event=null):void{
			ViewAssemble.bindMediator(this);
		}
		
		/*protected override function beforeOpen():void
		{
			super.beforeOpen();
			var mdi:MDI_UiLayer=Context.getInjectInstance(MDI_UiLayer);
			if(mdi)
			{
				mdi.uilayer.liaotianBtn.visible=false;
			}
		}
		protected override function afterClose():void
		{
			super.afterClose();
			var mdi:MDI_UiLayer=Context.getInjectInstance(MDI_UiLayer);
			if(mdi)
			{
				mdi.uilayer.liaotianBtn.visible=true;
			}
		}
		protected override function initTweenPostion():void{
			startX=-_scene.width-GlobalRef.width/2;
			endX=0-GlobalRef.width/2;			
		}*/
		private function initModule():void
		{
//			_btn_close=new Button(windowMaterial.btn_close);
			
			_btn_shijie=new Button(windowMaterial.btn_shijieliaotian);
			_btn_banghui=new Button(windowMaterial.btn_gonghuiliaotian);
			
			_pos_item=new Position(windowMaterial.pos_item);
			
			_fnt_num=new FontField(windowMaterial.fnt_num);
		}
		private function destoryMc():void
		{
//			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_shijie){_btn_shijie.destory();_btn_shijie=null;};
			if(_btn_banghui){_btn_banghui.destory();_btn_banghui=null;};
			if(_pos_item){_pos_item.destory();_pos_item=null;};
			if(_fnt_num){_fnt_num.destory();_fnt_num=null;};
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get windowMaterial():WindowLiaotian 
		{
			return _scene as WindowLiaotian; 
		}
	}
}
