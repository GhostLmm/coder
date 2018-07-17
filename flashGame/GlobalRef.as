package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	
	import org.osflash.signals.Signal;

	public class GlobalRef
	{
		//maomingnimei
		public function GlobalRef()
		{
		}
		
		public static const GreenColor:uint=0x00ff00;
		
		public static const TileScale:Number=1.2;
		
		public static var root:Sprite;
		private static var _stage:Stage;
		
		public static var topLayer:Sprite;
		
		public static const FPS:Number=24;
		
		public static var activateState:Boolean=true;
		
		
		public static var scr_color:uint=0;
		public static var scr_aphla:Number=0.3;
		
		public static function get stage():Stage
		{
			return _stage;
		}
		public static function set stage(value:Stage):void
		{
			_stage=value;
			activateState=true;
			_stage.addEventListener(Event.DEACTIVATE,onDeactivate);
			_stage.addEventListener(Event.ACTIVATE,onActivate);
		}
		
		private static function onDeactivate(et:Event):void
		{
			trace("舞台失去焦点");
			activateState=false;
			APP_Deactivate_SN.dispatch();
		}
		private static function onActivate(evt:Event):void
		{
			trace("舞台激活");
			activateState=true;
			App_Activate_SN.dispatch();
		}
		
		public static var App_Activate_SN:Signal=new Signal();
		public static var APP_Deactivate_SN:Signal=new Signal();
		
		public static var width:Number;
		public static var height:Number;
		
		public static var scale:Number;
		
		public static var stageWidth:Number;
		public static var stageHeight:Number;
		
		public static const Sucai_Width:int=960;
		public static const Sucai_Height:int=640;
		
		public static var mainEnterance:GunZombie;
		public static function scaleEnterance():void{
			mainEnterance.scaleX=scale;
			mainEnterance.scaleY=scale;
		}
	}
}