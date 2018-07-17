package ui.layer
{
	import com.ghostlmm.tool.ListenerAddProxy;
	import com.ghostlmm.tool.ListenerObj;
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.window.huodong.HuodongNewWindow;
	
	import util.Util;

	public class SpringMenu extends ListenerObj
	{
		public static const MAXItemNum:int=4;
		private var mc:mc_TRpart;
		private var btnMc:MovieClip;
		private var bg:MovieClip;
		private var bgDefaultHeight:Number;
		private var bgDefaultY:Number;
		
		private var itemX:Number;
		
		private var itemComtainer:Sprite;
		
		private var maskContainer:Sprite;
//		private var maskShape:Shape;
		private var scroll:ScrollControllerMax;
		
//		private var itemArray:Array;
		private var datas:Array;
		
		private var state:int=1;
		
		
		private static const ST_Close:int=1;
		private static const ST_CloseToOpen:int=2;
		private static const ST_Open:int=3;
		private static const ST_OpenToClose:int=4;
		
		private var _springOffset:Number=0;
		
		public function get display():DisplayObject{
			return mc;
		}
		public function get springOffset():Number{
			return _springOffset;
		}
		public function set springOffset(value:Number):void{
			if(_springOffset!=value){
				_springOffset=value;
				if(bg){
					bg.height=bgDefaultHeight*1.5+_springOffset;
				}
				if(itemComtainer){
					itemComtainer.y=-getShowItemNum()*MenuItem.HEIGHT+_springOffset;
				}
			}
		}
		
		public function SpringMenu()
		{
			initMoudle();
		}
		
		private function initMoudle():void{
			mc=new mc_TRpart();
			btnMc=mc.mc_TRpart_btn;
			bg=mc.mc_TRpart_bg;
			bgDefaultHeight=bg.height;
			bgDefaultY=bg.y;
			
			itemX=mc.huodong_pos.x;
			maskContainer=new Sprite();
			maskContainer.x=itemX;
			maskContainer.y=bgDefaultHeight+bgDefaultY;
//			maskShape=new Shape();
//			maskContainer.addChild(maskShape);
//			maskContainer.mask=maskShape;
			
			itemComtainer=new Sprite();
			itemComtainer.x=0;
			mc.addChild(maskContainer);
			maskContainer.addChild(itemComtainer);
			
			Util.setDiaplayButtonEffect(btnMc);
			
			addListener(btnMc,TQTTouchEvent.TOUCH_TAP,onTapSpring);
			
			state=ST_Close;
			updateState();
		}
		
		private function updateState():void{
			if(state==ST_Close){
				btnMc.gotoAndStop(1);
				bg.height=bgDefaultHeight;
				itemComtainer.y=-MenuItem.HEIGHT*getShowItemNum();
			}
			if(state==ST_Open){
				btnMc.gotoAndStop(2);
				bg.height=bgDefaultHeight*1.5+MenuItem.HEIGHT*getShowItemNum();
			}
		}
		
		private function onTapSpring(evt:Event):void{
			
			WindowManager.openOnlyWinodw(HuodongNewWindow);
			
			if(state==ST_CloseToOpen || state==ST_OpenToClose){
				return ;
			}
			if(state==ST_Close){
				changeToOpen();
			}
			if(state==ST_Open){
				changeToClose();
			}
		}
		private function changeToClose():void{
			state=ST_OpenToClose;
			TweenLite.to(this,0.5,{springOffset:0,onComplete:onCloseComplete});
		}
		private function changeToOpen():void{
			state=ST_CloseToOpen;
			TweenLite.to(this,0.5,{springOffset:MenuItem.HEIGHT*getShowItemNum(),onComplete:onOpenComplete});
		}
		private function onCloseComplete():void{
			state=ST_Close;
			updateState();
		}
		private function onOpenComplete():void{
			state=ST_Open;
			updateState();
		}
		
		public override function destroy():void{
			destoryItems();
			TweenLite.killTweensOf(this);
			super.destroy();
		}
		
		private function getShowItemNum():int{
			if(datas==null) return 0;
			if(datas.length>MAXItemNum) return MAXItemNum;
			return datas.length;
		}
		
		public function setHuodongData($datas:Array):void{
			this.datas=$datas;
			destoryItems();
			var movie:MovieClip=new MovieClip();
			var showNum:int=getShowItemNum();
			movie.graphics.drawRect(0,0,MenuItem.WIDTH,MenuItem.HEIGHT*(showNum));
			itemComtainer.addChild(movie);
			var pos:Position=new Position(movie);
			scroll=new ScrollControllerMax(pos,ScrollControllerMax.VERTICAL);
			scroll.initClass(MenuItem);
			scroll.setData(datas);
			maskContainer.scrollRect=new Rectangle(0,0,MenuItem.WIDTH,MenuItem.HEIGHT*(showNum));
			updateState();
			
		}
		
		
		
		public function updateHuodongData($datas:Array):void{
			this.datas=$datas;
			scroll.setData(datas);
		}
		
		private function destoryItems():void{
			if(scroll){
				scroll.destory();
				scroll=null;
			}
			itemComtainer.removeChildren();
//			if(itemArray){
//				for each(var item:MenuItem in itemArray){
//					item.destory();
//				}
//				itemArray=null;
//			}
		}
		
		
		
		
		
		
	}
}