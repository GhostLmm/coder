package
{
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemIdleMode;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageOrientation;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.media.AudioPlaybackMode;
	import flash.media.SoundMixer;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	
	[SWF(backgroundColor="#000000")]
	public class GunZombie extends Sprite
	{
		public static var needUpdate:Boolean=false;
		public function GunZombie()
		{
			super();
//			showRedrawRegions( true, 0x0000FF );
			Preload;
			if(DeviceType.isOnIOS){
				SoundMixer.audioPlaybackMode  =  AudioPlaybackMode.AMBIENT;
			}
			TqtEvent.init();
			TQTTouchEvent.init();
			mouseEnabled=false;
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			trace("是否支持touch："+Multitouch.supportsTouchEvents+"\tmode:"+Multitouch.inputMode);
			NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
			if(stage){
				init();
			}else{
				addEventListener(Event.ADDED_TO_STAGE,init);
			}
		}
		private function init(evt:Event=null):void
		{
			trace("开始");
			
			
			GlobalRef.stage=stage;
			if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.PreInit)){
				(PlatformManager.getInstance().platformObj as Object).preInit();
			}
			
			removeEventListener(Event.ADDED_TO_STAGE,init);
			initGameSize();
			
			
			this.addChild(new Game());
			
			var tipLayer:Sprite=new Sprite();
			this.addChild(tipLayer);
			
			GlobalRef.topLayer=tipLayer;
			
			TopTip.setLayer(tipLayer,stage);
			
			ExitGameControl.init();
			
			AppstoreVerify.startVerify();
//			var oj:MovieClip=new character_create_model()
//			this.addChild( oj);
		}
		
		private function initGameSize():void
		{
			var _width:int=Math.max(stage.fullScreenWidth,stage.fullScreenHeight);
			var _height:int=Math.min(stage.fullScreenWidth,stage.fullScreenHeight);
			var _scaleX:Number=_width/GlobalRef.Sucai_Width;
			var _scaleY:Number=_height/GlobalRef.Sucai_Height;
			var min:Number=Math.min(_scaleX,_scaleY);
			
			
			// 支持 autoOrient
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.displayState=StageDisplayState.FULL_SCREEN_INTERACTIVE;
			stage.setOrientation(StageOrientation.ROTATED_RIGHT);
			//			stage.scaleMode = StageScaleMode.NO_SCALE;
//			stage.quality=StageQuality.LOW;
			stage.frameRate=30;
			//			stage.frameRate=30;
			//			GlobalRef.setFrameRate(24);
			
			GlobalRef.width=_width/min;
			GlobalRef.height=_height/min;
			trace("逻辑舞台大小："+GlobalRef.width+"\t"+GlobalRef.height);
			
			
			GlobalRef.stageWidth=_width;
			GlobalRef.stageHeight=_height;
			
			
			GlobalRef.scale=Math.min(_scaleX,_scaleY);
			GlobalRef.mainEnterance=this;
			//			scaleX=GlobalRef.scale;
			//			scaleY=GlobalRef.scale;
			GlobalRef.scaleEnterance();
			
		}
	}
}