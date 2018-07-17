package ui.mc
{

	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import core.AnimateManager;
	
	import ui.widget.Position;
	
	import util.Util;

	public class JiantouMc extends _McBase
	{
		public var _mcJiantou:McJiantou;
		
		private var yuanQuanSize:Number;
		
		public function JiantouMc(data:*=null)
		{
			super();
			_scene=new Sprite();
			_mcJiantou = new McJiantou();//			_yuanquan=new YuanquanMc();
//			yuanQuanSize=_yuanquan.width;
			yuanQuanSize=50;
//			this.addChild(_yuanquan);
			this.addChild(_mcJiantou);
			this.rotation = 0;
//			this.x = GlobalRef.width/2;
//			this.y = GlobalRef.height/2;
			this.mouseChildren=false;
			this.mouseEnabled=false;
			
//			_yuanquan.mouseChildren=false;
//			_yuanquan.mouseEnabled=false;
			
		}
		
			
		public function pointToPos(px:Number,py:Number):void{
			var center:Point = new Point(px,py);
			var to_x:Number;
			var to_y:Number;
			var from_rotation:Number = _mcJiantou.rotation;
			var to_rotation:Number;
			to_x = px-yuanQuanSize/2;
			to_y = py-yuanQuanSize/2;
			
			if(center.x < GlobalRef.width/2) {
				to_x += yuanQuanSize;
				if(center.y < GlobalRef.height/2) {
					to_y += yuanQuanSize;
					to_rotation = 0;
				} else {
					to_rotation = -90;
				}
			} else {
				if(center.y < GlobalRef.height/2) {
					to_y += yuanQuanSize;
					to_rotation = 90;
				} else {
					to_rotation = 180;
				}
			}
			if(Math.abs(from_rotation) == 180) {
				if(to_rotation > 0) {
					from_rotation = 180;
				} else {
					from_rotation = -180;
				}
			}
			if(Math.abs(to_rotation) == 180) {
				if(from_rotation > 0) {
					to_rotation = 180;
				} else {
					to_rotation = -180;
				}
			}
			AnimateManager.run(_mcJiantou,300,{
				"from":{
					"rotation":from_rotation
				},
				"to":{
					"x":to_x,
					"y":to_y,
					"rotation":to_rotation
				}
			});
		}
		
		public function pointToCenter(obj:DisplayObject,offsetX:Number,offsetY:Number):void{
			
			var center:Point=Util.getRelativePostion(obj,GlobalRef.root);
			var to_x:Number;
			var to_y:Number;
			var from_rotation:Number = _mcJiantou.rotation;
			var to_rotation:Number;
			to_x = center.x;
			to_y = center.y;
			if(center.x < GlobalRef.width/2) {
				to_x += yuanQuanSize/2;
				if(center.y < GlobalRef.height/2) {
					to_y += yuanQuanSize/2;
					to_rotation = 0;
				} else {
					to_rotation = -90;
				}
			} else {
				if(center.y < GlobalRef.height/2) {
					to_y += yuanQuanSize/2;
					to_rotation = 90;
				} else {
					to_rotation = 180;
				}
			}
			if(Math.abs(from_rotation) == 180) {
				if(to_rotation > 0) {
					from_rotation = 180;
				} else {
					from_rotation = -180;
				}
			}
			if(Math.abs(to_rotation) == 180) {
				if(from_rotation > 0) {
					to_rotation = 180;
				} else {
					to_rotation = -180;
				}
			}
			to_x+=offsetX;
			to_y+=offsetY;
			AnimateManager.run(_mcJiantou,300,{
				"from":{
					"rotation":from_rotation
				},
				"to":{
					"x":to_x,
					"y":to_y,
					"rotation":to_rotation
				}
			});
		}
		
		public function pointTo(obj:DisplayObject):void
		{
			var objRect:Rectangle = obj.getRect(GlobalRef.root);
			var rect:Rectangle=new Rectangle();
			rect.x=objRect.x+objRect.width/2-yuanQuanSize/2;
			rect.y=objRect.y+objRect.height/2-yuanQuanSize/2;
			rect.width=yuanQuanSize;
			rect.height=yuanQuanSize;
			var to_x:Number;
			var to_y:Number;
			var from_rotation:Number = _mcJiantou.rotation;
			var to_rotation:Number;
			to_x = rect.x;
			to_y = rect.y;
			var center:Point = new Point(rect.x+rect.width/2,rect.y+rect.height/2);
			if(center.x < GlobalRef.width/2) {
				to_x += rect.width;
				if(center.y < GlobalRef.height/2) {
					to_y += rect.height;
					to_rotation = 0;
				} else {
					to_rotation = -90;
				}
			} else {
				if(center.y < GlobalRef.height/2) {
					to_y += rect.height;
					to_rotation = 90;
				} else {
					to_rotation = 180;
				}
			}
			if(Math.abs(from_rotation) == 180) {
				if(to_rotation > 0) {
					from_rotation = 180;
				} else {
					from_rotation = -180;
				}
			}
			if(Math.abs(to_rotation) == 180) {
				if(from_rotation > 0) {
					to_rotation = 180;
				} else {
					to_rotation = -180;
				}
			}
			AnimateManager.run(_mcJiantou,300,{
				"from":{
					"rotation":from_rotation
				},
				"to":{
					"x":to_x,
					"y":to_y,
					"rotation":to_rotation
				}
			});
//			_yuanquan.x=objRect.x+objRect.width/2;
//			_yuanquan.y=objRect.y+objRect.height/2;
//			_yuanquan.focus(objRect.x+objRect.width/2,objRect.y+objRect.height/2);
			
			
//			visible=false;
//			Util.drawline(center,new Point(rect.x,rect.y));
//			Util.drawline(center,new Point(this.x,this.y));
		}
	}
}
