package ui.layer
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import ui.TestWindow;
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	
	import view.Base_Item;

	public class MenuItem extends Base_Item implements IGridItemMax
	{
		private static var ___Height:Number=0;
		private static var ___Width:Number=0;
		
		
		public static function get HEIGHT():Number{
			if(___Height==0){
				var mc:MovieClip= new mc_huodong_item();
				___Width=mc.width;
				___Height=mc.height;
			}
			return ___Height;
		}
		public static function get WIDTH():Number{
			if(___Width==0){
				var mc:MovieClip= new mc_huodong_item();
				___Width=mc.width;
				___Height=mc.height;
			}
			return ___Width;
		}
		
		
		private var _fnt_name:FontField;
		public function MenuItem()
		{
		}
		public override function loadData($data:Object):*{
			super.loadData($data);
			return this;
		}
		
		protected override function get itemClassName():Class{
			return mc_huodong_item;
		}
		
		protected override function initModule():void{
			_fnt_name=new FontField(m_mc.fnt_name);
			
			addTargetEvent(m_mc as MovieClip,TQTTouchEvent.TOUCH_TAP,onClick);
		}
		private function onClick(evt:Event):void{
			WindowManager.openOnlyWinodw(TestWindow,{cls:m_data.cls});
		}
		
		public function get display():DisplayObject{
			return null;
		}
		
		protected override function setShow():void{
			_fnt_name.text=m_data.name;
		}
		
		private var _enable:Boolean;
		public function set enable(value:Boolean):void{
			_enable=value;
		}
		public function get enable():Boolean{
			return _enable;
		}
		private var _select:Boolean;
		public function set selected(value:Boolean):void{
			_select=value;
		}
		public function get selected():Boolean{
			return _select;
		}
		private var _index:int;
		public function set index(value:int):void{
			_index=value;
		}
		public function get index():int{
			return _index;
		}
		
		//		function loadData($data:Object):*;
		public function get data():Object{
			return m_data;
		}
		
		public function enterMovie():*{
			
		}
		public override function destory():void{
			if(_fnt_name) {_fnt_name.destory();_fnt_name=null;}
			super.destory();
		}
	}
}