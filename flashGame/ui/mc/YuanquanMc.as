package ui.mc
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import util.Util;
	
	public class YuanquanMc extends Sprite
	{
		private var mc:McZhiyinYuan;
		private var yuan:DisplayObject;
		private var fx:Number;
		private var fy:Number;
		private var size:Number;
		private var timeCount:int=0;
		private static const ZhenNum:int=48;
		private static const MinAlpha:Number=0.3;
		private static const MaxAlpha:Number=1;
		public function YuanquanMc()
		{
			super();
			mc=new McZhiyinYuan();
			this.addChild(mc);
			yuan=mc.mc_yuan;
			size=mc.width/2-1;
			addEventListener(Event.ENTER_FRAME,onFrame);
		}
		
		private function onFrame(evt:Event):void{
			timeCount++;
			if(timeCount>=ZhenNum)
			{
				timeCount%=ZhenNum;
			}	
			setXiaoguoSpriteAlpha();
		}
		private function setXiaoguoSpriteAlpha():void{
			if(visible==false || parent==null) return ;
			var alpha:Number;
			if(timeCount>=ZhenNum/2)
			{
				alpha=MinAlpha+(ZhenNum-timeCount)*2/ZhenNum*(MaxAlpha-MinAlpha);
			}
			else
			{
				alpha=MinAlpha+timeCount*2/ZhenNum*(MaxAlpha-MinAlpha);
			}
			//				trace("当前alpha值："+alpha);
			yuan.alpha=alpha;
		}
		
		public function pointToPos($fx:Number,$fy:Number):void{
			if(fx==$fx && fy==$fy) return ;
			fx=$fx;
			fy=$fy;
			this.graphics.clear();
			this.graphics.beginFill(0,0.5);
			this.graphics.drawRect(0,0,GlobalRef.width,GlobalRef.height);
			this.graphics.drawRect(fx-size,fy-size,size*2,size*2);
			this.graphics.endFill();
			mc.x=fx;
			mc.y=fy;
		}
		
		public function pointToCenter(obj:DisplayObject,offsetX:Number,offsetY:Number):void{
			var center:Point=Util.getRelativePostion(obj,GlobalRef.root);
			var $fx:Number=center.x+offsetX;
			var $fy:Number=center.y+offsetY;
			if(fx==$fx && fy==$fy) return ;
			fx=$fx;
			fy=$fy;
			this.graphics.clear();
			this.graphics.beginFill(0,0.5);
			this.graphics.drawRect(0,0,GlobalRef.width,GlobalRef.height);
			this.graphics.drawRect(fx-size,fy-size,size*2,size*2);
			this.graphics.endFill();
			mc.x=fx;
			mc.y=fy;
		}
		
		public function pointTo(obj:DisplayObject):void{
			var rect:Rectangle=obj.getRect(GlobalRef.root);
			var $fx:Number=rect.x+rect.width/2;
			var $fy:Number=rect.y+rect.height/2;
			if(fx==$fx && fy==$fy) return ;
			fx=$fx;
			fy=$fy;
			this.graphics.clear();
			this.graphics.beginFill(0,0.5);
			this.graphics.drawRect(0,0,GlobalRef.width,GlobalRef.height);
			this.graphics.drawRect(fx-size,fy-size,size*2,size*2);
			this.graphics.endFill();
			mc.x=fx;
			mc.y=fy;
		}
		
		public function destory():void{
			removeEventListener(Event.ENTER_FRAME,onFrame);
			this.removeChildren();
		}
		
	}
}