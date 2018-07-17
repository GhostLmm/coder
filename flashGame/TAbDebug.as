package
{
	import com.adobe.images.PNGEncoder;
	import com.adobe.utils.StringUtil;
	import com.fish.modules.core.gameVO.GameVOManager;
	
	import flash.display.BitmapData;
	import flash.display.SimpleButton;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.system.ApplicationDomain;
	import flash.ui.Keyboard;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	
	import Tool.ApplicationInfoDesc;
	
	import org.osflash.signals.Signal;
	
	import r1.deval.rt.Util;

	public class TAbDebug
	{
		public function TAbDebug()
		{
		}
		
		public static var _Debug:Boolean=true;
		
		private static var _stage:Stage;
		private static var _flag:Boolean=false;
		private static var _mc:debugMc=new debugMc();
		
		public static var debug_SN:Signal=new Signal(String,Array);
		
		public static var btnSN:Signal=new Signal(int);
		
		public static function get Debug():Boolean
		{
			if(ApplicationInfoDesc.NativeInfo.packageId.indexOf("debug")!=-1){
				return _Debug;
			}
			return false;
		}
		public static function log(tag:String,text:String=""):void
		{
			//			AndroidToolHelper.instance.logcat(tag,text);
			if(!Debug){
				return ;
			}
			var date:Date=new Date();
			var time:String=date.fullYear+"-"+date.month+"-"+date.day+" "+date.hours+":"+date.minutes+":"+date.seconds;
			var logString:String=time+" ["+tag+"] "+text+" \r\n";
			try{
				var file:File=File.documentsDirectory.resolvePath("redwarLog.txt");
				var writeStream:FileStream = new FileStream();
				writeStream.open(file,FileMode.APPEND);
				writeStream.writeUTFBytes(logString);
				writeStream.close();
				writeStream=null;
				logString="";
			}catch(e:Error)
			{
				
			}
		}
		
		public static function debugLog():void{
			
		}
		
		public static function setStage($stage:Stage):void
		{
			_stage=$stage;
			if(Debug){
				_stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
				_mc.debugInput.addEventListener(KeyboardEvent.KEY_DOWN,onInputKeyDown);
			}
		}
		
		private static function onInputKeyDown(keyEvt:KeyboardEvent):void
		{
			if(keyEvt.keyCode==Keyboard.ENTER){
				var context:String=StringUtil.trim(_mc.debugInput.text);
				var t:Array=context.split(" ");
				var a:Array=[];
				var type:String;
				for(var index:int=0;index<t.length; index++)
				{
					var s:String=StringUtil.trim(t[index]);
					if(index==0){
						type=s;
					}else{
						a.push(s);
					}
				}
				process(type,a);
				updateShow();
			}
		}
		
		private static function process(type:String,args:Array):void
		{
			if(type=="trace")
			{
				if(args.length==1)
				{
					if(GameVOManager.getInstance().hasOwnProperty(args[0]))
					{
						trace(args);
						trace(GameVOManager.getInstance()[args[0]]);
					}
				}
			}else
			{
				debug_SN.dispatch(type,args);
			}
		}
		
		
		private static function objectIsOneClass(obj:*,className:String):Boolean
		{
			var cls:Class;
			try{
				cls=ApplicationDomain.currentDomain.getDefinition(className) as Class;
			}catch(e:Error){}
			if(obj["constructor"]==cls){
				return true;
			}
			return false;
		}
		
		
		
		private static function onKeyDown(keyEvt:KeyboardEvent):void
		{
			if(keyEvt.keyCode==Keyboard.TAB){
				updateShow();
			}
			if(keyEvt.keyCode==Keyboard.UP){
//				showTestLayer();
			}
			if(keyEvt.keyCode==Keyboard.DOWN){
//				hideTestLayer();
			}
			if(keyEvt.keyCode==Keyboard.P){
				saveScreen();
			}
		}
		
		private static function saveScreen():void{
			var bitData:BitmapData=new BitmapData(GlobalRef.stage.stageWidth,GlobalRef.stage.stageHeight,true,0);
			bitData.draw(GlobalRef.stage,null,null,null,null,true);
			var byte:ByteArray=PNGEncoder.encode(bitData);
			var filePath:String="D:\\DIG\\doc\\gameScreen\\"+GlobalRef.stage.fullScreenWidth+"x"+GlobalRef.stage.fullScreenHeight+"\\zimbieScreen";
			var date:Date=new Date();
			filePath+=date.day+"_"+date.hours+"_"+date.minutes+"_"+date.seconds+".png";
			FileSave.save(filePath,byte);
		}
		
		
		/*private static var testLayer:TestLayer;
		private static function showTestLayer():void
		{
			if(testLayer==null){
				testLayer=new TestLayer();
				
				for(var index:int=1; index<=6; index++)
				{
					var btn:SimpleButton=testLayer["btn_"+index];
					btn.addEventListener(MouseEvent.CLICK,onClick);
				}
			}
			_stage.addChild(testLayer);
		}*/
		private static function onClick(evt:Event):void
		{
			var name:String=evt.currentTarget.name;
			var index:int=int(name.charAt(name.length-1));
			btnSN.dispatch(index);
		}
		
		/*private static function hideTestLayer():void
		{
			if(testLayer && _stage.contains(testLayer))
			{
				_stage.removeChild(testLayer);
			}
		}*/
		
		private static function updateShow():void
		{
			_flag=!_flag;
			if(_flag)
			{
				_stage.addChild(_mc);
				_mc.debugInput.text="";
				_stage.focus=_mc.debugInput;
			}else{
				if(_stage.contains(_mc)){
					_stage.removeChild(_mc);
				}
			}
		}
	}
}