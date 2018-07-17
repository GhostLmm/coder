package snake
{
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.ghostlmm.guide.GuideSelectControl;
	import com.ghostlmm.tool.ListenerAddProxy;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	import core.LayerController;

	public class BattleEnterance
	{
		public function BattleEnterance()
		{
		}
		
//		private static var mainLevel:int;
//		private static var minorLevel:int;
		private static const AssetPreUrl:String="assets/Level/";
		
		private static var mapJpg:String;
		private static var mapJson:String;
		
		private static var map_bm:BitmapData;
		private static var map_json:Object;
		
		private static var type:String;
		private static var TP_Texture:String="texture";
		private static var TP_MapPng:String="mapPng";
		
		private static var container:Sprite;
		
		
		private static var _proxy:ListenerAddProxy=new ListenerAddProxy();
		
//		private static var loadStep:int;
		public static function enterBattleUseJsonAndPng($map:String):void{
			TopTip.showBattleWait();
			container=null;
			type=TP_MapPng;
			mapJpg=AssetPreUrl+$map+".jpg";
			mapJson=AssetPreUrl+$map+".json";
			loadAsset();
		}
		public static function enterBattleUserTextureAndJson($map:String,$container:Sprite):void{
			TopTip.showBattleWait();
			container=$container;
			type=TP_Texture;
			mapJpg=AssetPreUrl+$map+".png";
			mapJson=AssetPreUrl+$map+".json";
			loadAsset();
		}
		
		private static function addEvent(target:Object,type:String,listener:Function,useCapture:Boolean=false,priority:int=0,useWeek:Boolean=false):void
		{
			_proxy.addListener(target,type,listener,useCapture,priority,useWeek);
		}
		
		private static function loadAsset():void{
//			loadStep=0;
			map_json=null;
			map_bm=null;
			var pngLoad:Loader=new Loader();
			var context:LoaderContext=new LoaderContext(false,ApplicationDomain.currentDomain);
			context.allowCodeImport=true;
//			pngLoad.contentLoaderInfo.addEventListener(Event.COMPLETE,onPngLoadCom);
//			pngLoad.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onLoadError);
			addEvent(pngLoad.contentLoaderInfo,Event.COMPLETE,onPngLoadCom);
			addEvent(pngLoad.contentLoaderInfo,IOErrorEvent.IO_ERROR,onLoadError);
			pngLoad.load(new URLRequest(mapJpg),context);
			trace("开始加载地图背景："+mapJpg);
			
			var jsonLoad:URLLoader=new URLLoader();
//			jsonLoad.addEventListener(Event.COMPLETE,onJsonLoadCom);
//			jsonLoad.addEventListener(IOErrorEvent.IO_ERROR,onLoadError);
			addEvent(jsonLoad,Event.COMPLETE,onJsonLoadCom);
			addEvent(jsonLoad,IOErrorEvent.IO_ERROR,onLoadError);
			
			jsonLoad.load(new URLRequest(mapJson));
			trace("开始加载地图json："+mapJson);
			
		}
		private static function onLoadError(e:IOErrorEvent):void{
			trace(e.text);
		}
		private static function onJsonLoadCom(evt:Event):void{
			trace("加载地图json完成");
			evt.currentTarget.removeEventListener(Event.COMPLETE,onJsonLoadCom);
			map_json=JSON.parse((evt.currentTarget as URLLoader).data);
//			loadStep++;
			checkComplete();
		}
		private static function onPngLoadCom(evt:Event):void{
			trace("加载地图背景完成");
			evt.currentTarget.removeEventListener(Event.COMPLETE,onPngLoadCom);
			map_bm=((evt.currentTarget as LoaderInfo).content as Bitmap).bitmapData;
//			var tmp:BitmapData=((evt.currentTarget as LoaderInfo).content as Bitmap).bitmapData;
//			map_bm=new BitmapData(tmp.width,tmp.height,false,0);
//			map_bm.copyPixels(tmp,tmp.rect,new Point());
//			loadStep++;
			checkComplete();
		}
		
		public static function clear():void{
			_proxy.clear();
			type=null;
		}
		
		private static function checkComplete():void{
			if(map_json && map_bm){
				_proxy.clear();
				if(type==TP_MapPng)
				{
					switch(GameSwitchSceneController.btType)
					{
						case CoreSwitchEvent.BT_Copy:
							GameManager.startWithMapInfo(map_bm,map_json,GlobalRef.root);
							break;
						case CoreSwitchEvent.BT_Leitai:
							GameManager.startLeitaiWithMapInfo(map_bm,map_json,GlobalRef.root);
							break;
						case CoreSwitchEvent.BT_Select:
							GameManager.startSelectWithMapInfo(map_bm,map_json,GuideSelectControl.battleContainer);
							break;
						case CoreSwitchEvent.BT_JinkuangLveduo:
							GameManager.startLeitaiWithMapInfo(map_bm,map_json,GlobalRef.root);
							break;
						case CoreSwitchEvent.BT_JinkuangQugan:
							GameManager.startLeitaiWithMapInfo(map_bm,map_json,GlobalRef.root);
							break;
					}
				}
				if(type==TP_Texture){
					GameManager.startZhucheng(map_bm,map_json,container);
				}
			}
		}
	}
}