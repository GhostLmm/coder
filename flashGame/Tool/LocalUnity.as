package Tool
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.utils.Dictionary;

	public class LocalUnity
	{
		public static var instance:LocalUnity=new LocalUnity();
		
		public var localType:String="en_US";
		
		
		public function getLocalGameLogo():DisplayObject{
			return imagDic["logo"];
		}
		private function onLogoComplete(evt:Event):void{
			var t:DisplayObject=(evt.target as LoaderInfo).content;
			t.x=(width-t.width)/2;
			t.y=(height-t.height)*1/6;
		}
		
		private function onLogoBackGroundComplete(evt:Event):void{
			var t:DisplayObject=(evt.target as LoaderInfo).content;
			t.width=width;
			t.height=height;
			
		}
		
		private var logoBack:Loader;
		public function getGameLogoBackground():DisplayObject{
			return imagDic["logoBG"];
		}
		
		private var imagDic:Dictionary=new Dictionary();
		public function perLoadImag():void{
			
			var loader:Loader=new Loader();
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onError);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLogoComplete);
			loader.load(new URLRequest("assets/unityFile/gamelogo/logo"+localType+".png"));
			imagDic["logo"]=loader;
			
			var p:Point=getAdaptBg();
			var mid:String=p.x+"x"+p.y;
			var pic:String="assets/unityFile/gamelogo/logoBG_"+mid+".png";
			if(logoBack==null){
				logoBack=new Loader();
				
				logoBack.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onError);
				logoBack.contentLoaderInfo.addEventListener(Event.COMPLETE,onLogoBackGroundComplete);
				logoBack.load(new URLRequest(pic));
				
			}
			imagDic["logoBG"]=logoBack;
		}
		public function clearPerloadImag():void{
			
		}
		
		private function getAdaptBg():Point{
			var p:Point=new Point();
			if(width==960 && height==640){
				p.x=960;
				p.y=640;
			}else{
				p.x=1024;
				p.y=768;
			}
			return p;
		}
		private function onError(e:IOErrorEvent):void{
			trace(e.text);
		}
		
		public var height:int;
		public var width:int;
		
		public function setSize(root:DisplayObject,_width:Number,_height:Number):void{
			height=_height;
			width=_width;
			
			
			
			scaleX=width/AssetsRect.width;
			scaleY=height/AssetsRect.height;
			minScale=Math.min(scaleX,scaleY);
			
//			root.scaleX=width/AssetsRect.width;
//			root.scaleY=height/AssetsRect.height;
			
		}
		
		
		public function setStageMid(display:DisplayObject):void{
			display.x=(width-display.width)/2;
			display.y=(width-display.height)/2;
		}
		
		public static function get AssetsRect():Rectangle{
			CONFIG::BigSize{
				return new Rectangle(0,0,1024,768);
			}
			return new Rectangle(0,0,960,640);
		}
		
		public var scaleX:Number;
		public var scaleY:Number;
		
		public var minScale:Number;
		
		
		public function scaleDisplay(display:DisplayObject):void{
//			display.scaleX=minScale;
//			display.scaleY=minScale;
		}
		
//		public var UIScale:Number;
//		public var UIAdapt
		
//		public function get scaleX():Number{
//			return AssetsRect.width/width;
////			return width/AssetsRect.width;
//		}
//		public function get scaleY():Number{
//			return AssetsRect.height/height;
////			return height/AssetsRect.height0;
//		}
		
		
		public function getStageRectToTarget(display:DisplayObject):Rectangle{
			var tl:Point=display.globalToLocal(new Point());
			var br:Point=display.globalToLocal(new Point(width,height));
			var result:Rectangle=new Rectangle(tl.x,tl.y,br.x-tl.x,br.y-tl.y);
			return result;
		}
		
		public function getDisplayToDisplayPosition(source:DisplayObject,target:DisplayObject,sourcePoint:Point):Point{
			var global:Point=source.localToGlobal(sourcePoint);
			var targetPoint:Point=target.globalToLocal(global);
			return targetPoint;
		}
		
//		public function getDisplayScaleToStage(display:DisplayObject):Point{
//			
//		}
		
	}
}