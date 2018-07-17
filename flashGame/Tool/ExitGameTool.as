package Tool
{
	import com.thor.utils.ConfigDecoder;
	
	import flash.desktop.NativeApplication;
	import flash.display.DisplayObjectContainer;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;

	public class ExitGameTool
	{
		private static var cfg:ConfigDecoder;
		private static var exitAlert:downLoadAlert;
		private static var container:DisplayObjectContainer;
		private static var needSave:Boolean=false;
		
		public static function startExitControl(_cfg:ConfigDecoder,_container:DisplayObjectContainer):void
		{
			cfg=_cfg;
			container=_container;
			NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_DOWN,handleKeyDown,false,1000);
		}
		public static function setCouldSave():void
		{
			needSave=true;
		}
		/**  退出游戏显示 
		 * */
		private static function handleKeyDown(evt:KeyboardEvent):void
		{
			if(evt.keyCode == Keyboard.BACK)
			{
				if(cfg)
				{
					evt.preventDefault();
					evt.stopImmediatePropagation();
					showExitAlert();		
				}
				else
				{
					NativeApplication.nativeApplication.exit();
				}
			}
		}
		
		private static function showExitAlert():void
		{
			if(!exitAlert)
			{
				exitAlert = new downLoadAlert();
				
				exitAlert.x = (GameSystemData._gameTargetSize.width - exitAlert.width)/2;
				exitAlert.y = (GameSystemData._gameTargetSize.height - exitAlert.height)/2;
				exitAlert.tA.text = getLanguage("exit_info");
				exitAlert.cancelTf.text = getLanguage("btn_quxiao");
				
				exitAlert.cancelTf.mouseEnabled = false;
				exitAlert.actionTf.text = getLanguage("btn_ok");
				exitAlert.actionTf.mouseEnabled = false;
				exitAlert.bAction.addEventListener(MouseEvent.CLICK,exitGame);
				exitAlert.bCancel.addEventListener(MouseEvent.CLICK,closeWindow);
			}
			container.addChild(exitAlert);
		}
		
		private static function closeWindow(evt:MouseEvent=null):void
		{
			if(exitAlert && container && container.contains(exitAlert))
			{
				container.removeChild(exitAlert);
			}
		}
		
		public static function exitGame(evt:MouseEvent):void
		{
			if(needSave)
			{
				BASE.Save();
			}
			NativeApplication.nativeApplication.exit();
		}
		
		public static function stopExitControl():void
		{
			
			
			NativeApplication.nativeApplication.removeEventListener(KeyboardEvent.KEY_DOWN,handleKeyDown);
			
			closeWindow();
			if(exitAlert!=null)
			{
				exitAlert.bAction.removeEventListener(MouseEvent.CLICK,exitGame);
				exitAlert.bCancel.removeEventListener(MouseEvent.CLICK,closeWindow);
				exitAlert=null;
			}
			container=null;
			cfg=null;
		}
		
		private static var _language:Object;
		private static function getLanguage(key:String):String
		{
			if(cfg)
			{
				if(_language==null)
				{
					_language={};
					try
					{
						if(cfg._data.language && cfg._data.language[0].ln)
						{
							for each(var lnXml:XML in cfg._data.language[0].ln)
							{
								_language[String(lnXml.@name)]=String(lnXml.@value);
							}
						}
					}catch(e:Error)
					{
						trace(" xml 解析错误: "+e.message);
					}
				}
				if(_language[key]==null) 
				{
					_language[key]=key;
					trace("configXml 中 "+key+" 没有翻译");
				}
				return _language[key];
			}
			return key;
		}
	}
}