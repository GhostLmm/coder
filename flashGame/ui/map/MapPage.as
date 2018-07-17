package ui.map
{
	import com.fish.modules.core.models.tempData.FubenMapData;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	import core.event.TQTTouchEvent;
	
	import org.gestouch.core.GestureState;
	import org.gestouch.events.GestureEvent;
	import org.gestouch.gestures.TransformGesture;
	import org.gestouch.utils.GestureUtils;

	public class MapPage
	{
		private var minScale:Number;
		private var maxScale:Number;
		public function MapPage()
		{
		}
		
		private var _mc:MovieClip;
		
		public var mapData:FubenMapData;
		private var datas:Array;
		private var mapItems:Array;
		
		private var curScale:Number;
		
		private var freeTransform:TransformGesture;
		
		public function get display():DisplayObject{
			return _mc;
		}
		
		private var guideMc:MovieClip;
		private var guideFuben:int=-1;
		private var guideItem:MapItem;
		
		public function getPosMc(mcName:String):DisplayObject{
			return _mc[mcName];
		}
		
		public function init($mapData:FubenMapData,$datas:Array,guideFuben:int):void{
			mapData=$mapData;
			datas=$datas;
			
//			McMap1;
			
//			_mc=AssetManager.createDisplay("McMap"+mapData.node.id) as MovieClip;
			
			_mc=AssetManager.createDisplay(mapData.node.mc) as MovieClip;
			
			
//			_mc=new SceneMap();
			mapItems=[];
			for(var index:int=0; index<datas.length; index++){
				var mapItem:MapItem=new MapItem(_mc["pos_"+(index+1)],_mc["mc_arrow_"+(index+1)]);
				mapItem.initMapItemData(datas[index]);
				mapItems.push(mapItem);
			}
			
			minScale=Math.max(GlobalRef.width/_mc.width,GlobalRef.height/_mc.height);
			maxScale=2.5*minScale;
			
			curScale=minScale;
			_mc.scaleX=curScale;
			_mc.scaleY=curScale;
			
			freeTransform = new TransformGesture(_mc);
			freeTransform.addEventListener(GestureEvent.GESTURE_BEGAN, onFreeTransform);
			freeTransform.addEventListener(GestureEvent.GESTURE_CHANGED, onFreeTransform);
			
				
			adjustScale();
			
			if(guideFuben>0){
				this.guideFuben=guideFuben;
				showGuideFuben();
			}
		}
		
		private function showGuideFuben():void{
			if(guideMc==null){
				guideMc=new McDianji();
				guideMc.mouseChildren=false;
				guideMc.mouseEnabled=false;
				_mc.addChild(guideMc);
			}
			if(guideItem==null){
				for each(var item:MapItem in mapItems){
					if(item.data.node.id==guideFuben){
						guideItem=item;
						guideMc.x=guideItem.mc.x;
						guideMc.y=guideItem.mc.y;
//						trace("引导手位置："+guideMc.x+","+guideMc.y+","+guideFuben);
						break;
					}
				}
			}
//			item.mc.lo
			
			
		}
		
		private function onFreeTransform(event:GestureEvent):void
		{
			// move, rotate, scale — all at once for better performance!
//			trace(freeTransform.offsetX, freeTransform.offsetY, freeTransform.rotation, freeTransform.scale);
			
			var gesture:TransformGesture = freeTransform;
			var target:DisplayObject = gesture.target as DisplayObject;
			var offsetX:Number = gesture.offsetX;
			var offsetY:Number = gesture.offsetY;
			
			/*if (event.newState == GestureState.BEGAN)
			{
				innerActiveTransformGesturesCounter++;
			}
			else if (event.newState == GestureState.ENDED || event.newState == GestureState.CANCELLED)
			{
				innerActiveTransformGesturesCounter--;
			}*/
			
			// Recalculate offsets in case some parent is transformed
			var offset:Point = target.parent.globalToLocal(new Point(offsetX, offsetY)).subtract(target.parent.globalToLocal(GestureUtils.GLOBAL_ZERO));
			offsetX = offset.x;
			offsetY = offset.y;
			
			
			// Panning
			target.x += offsetX;
			target.y += offsetY;
//			trace(gesture.offsetX,gesture.offsetY,gesture.scale);
			if (gesture.scale != 1 || gesture.rotation != 0)
			{
//				var m:Matrix = target.getTransformationMatrix(target.parent);
				var m:Matrix = target.transform.matrix;
				// Scale and rotation.
				var transformPoint:Point = m.transformPoint(target.globalToLocal(gesture.location));
				m.translate(-transformPoint.x, -transformPoint.y);
				m.rotate(gesture.rotation);
				m.scale(gesture.scale, gesture.scale);
				m.translate(transformPoint.x, transformPoint.y);
				
				target.x = m.tx;
				target.y = m.ty;
				target.rotation = Math.atan2(m.b, m.a);
				target.scaleX = target.scaleY = Math.sqrt(m.a*m.a + m.b*m.b);
			}
			adjustScale();
		}
		
	/*	private function onTouchBengin(evt:Event):void{
			_mc.addEventListener(TQTTouchEvent.TOUCH_END,onTouchEnd);
			_mc.addEventListener(Event.ENTER_FRAME,adjustScale);
			_mc.removeEventListener(TQTTouchEvent.TOUCH_BEGIN,onTouchBengin);
			_mc.startDrag();
			adjustScale();
		}
		private function onTouchEnd(evt:Event):void{
			_mc.stopDrag();
			adjustScale();
			_mc.removeEventListener(Event.ENTER_FRAME,adjustScale);
			_mc.removeEventListener(TQTTouchEvent.TOUCH_END,onTouchEnd);
			_mc.addEventListener(TQTTouchEvent.TOUCH_BEGIN,onTouchBengin);
			
		}*/
		
		/*private function onZoom(event:TransformGestureEvent):void {
			
			var s:Number=(event.scaleX+event.scaleY)/2;
			curScale*=s;
			if(curScale>maxScale) curScale=maxScale;
			if(curScale<minScale) curScale=minScale;
			
			adjustScale();
			
		}*/
		
		private function adjustScale(evt:Event=null):void{
			if(_mc){
				curScale=_mc.scaleX;
				if(curScale>maxScale) curScale=maxScale;
				if(curScale<minScale) curScale=minScale;
				_mc.scaleX=curScale;
				_mc.scaleY=curScale;
				
//				trace("[before]:",_mc.x,_mc.y,_mc.x+_mc.width,_mc.y+_mc.height);
				
				if(_mc.x>0){
					_mc.x=0;
				}
				if(_mc.y>0){
					_mc.y=0;
				}
				
				if(_mc.x+_mc.width<GlobalRef.width){ 
					_mc.x=GlobalRef.width-_mc.width;
				}
					
				if(_mc.y+_mc.height<GlobalRef.height){
					_mc.y=GlobalRef.height-_mc.height;
				}
				
				
//				if(guideFuben>0){
//					showGuideFuben();
//				}
				
//				trace("[after]:",_mc.x,_mc.y,_mc.x+_mc.width,_mc.y+_mc.height);
				
//				if(_mc.x-_mc.width/2<0){
//					_mc.x=_mc.width/2;
//				}
//				if(_mc.y-_mc.height/2<0){
//					_mc.y=_mc.height/2
//				}
//				if(_mc.x+_mc.width/2>GlobalRef.width){
//					_mc.x=GlobalRef.width-_mc.width/2;
//				}
//				if(_mc.y+_mc.height/2>GlobalRef.height){
//					_mc.y=GlobalRef.height-_mc.height/2;
//				}
			}
		}
		
		public function loadFunbenNames(nameDic:Object):void{
			if(nameDic){
				for each(var mapItem:MapItem in mapItems){
					var mapName:String=nameDic[mapItem.data.node.id];
					if(mapName!=null && mapName!=""){
						mapItem.setMapName(mapName);
					}
				}
			}
		}
		
		public function refreshData($datas:Array,guideFuben:int):void{
			datas=$datas;
			for(var index:int=0; index<datas.length; index++){
				var mapItem:MapItem=mapItems[index];
				mapItem.initMapItemData(datas[index]);
			}
		}
		
		public function destory():void{
			if(mapItems){
				for each(var item:MapItem in mapItems){
					item.destory();
				}
				mapItems=null;
			}
			if(freeTransform){
				freeTransform.dispose();
				freeTransform=null;
			}
			
			if(_mc){
				
				if(_mc.parent){
					_mc.parent.removeChild(_mc);
				}
			}
		}
		
	}
}