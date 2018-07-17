package com.ghostlmm.story
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextLineMetrics;
	import flash.utils.getTimer;
	
	import model.Global;
	
	public class MoveShowText extends BaseText
	{
		public static const ShowComplete:String="showComplete";
		/**   每秒钟移动的像素值
		 * */
		private var m_PixelPerSecond:int=30;
		private var m_mask:Sprite;
		private var m_maskShapeArray:Array=[];
		private var m_lineMatricsArray:Array=[];
		private var m_startTime:int;
		private var m_totalWidth:Number;
		private var m_moveFlag:Boolean=false;
		public function MoveShowText(text:TextField, _par:DisplayObjectContainer=null)
		{
			super(text, _par);
			m_mask=new Sprite();
//			this.addChild(m_mask);
//			this.mask=m_mask;
			
		}
		public function setPixelPerSecond(pixelPerSecond:int):void
		{
			m_PixelPerSecond=pixelPerSecond;
		}
		private function resetMaskShape():void
		{
			while(m_mask.numChildren)
			{
				m_mask.removeChildAt(0);
			}
			
			m_maskShapeArray=[];
			m_lineMatricsArray=[];
			m_totalWidth=0;
			var ty:Number=0;
			for(var line:int=0; line<_txt.numLines; line++)
			{
				var tlm:TextLineMetrics=_txt.getLineMetrics(line);
				m_lineMatricsArray.push(tlm);
				m_totalWidth+=tlm.width;
				var shape:Shape=new Shape();
				shape.graphics.beginFill(0xff00ff);
				shape.graphics.drawRect(tlm.x-tlm.width,ty,tlm.width,tlm.height);
				shape.graphics.endFill();
				ty+=tlm.height;
				m_mask.addChild(shape);
				m_maskShapeArray.push(shape);
			}
		}
		public function showMoveText():void
		{
			this.addChild(m_mask);
			this.mask=m_mask;
			m_startTime=getTimer();
			setShowPixWidth(0);
			m_moveFlag=true;
			Global.stage.addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}
		private function onEnterFrame(evt:Event):void
		{
			var lWidth:Number=(getTimer()-m_startTime)*m_PixelPerSecond/1000;
			setShowPixWidth(lWidth);
			if(lWidth>=m_totalWidth)
			{
				stopMoveText();
			}
		}
		public function stopMoveText():void
		{
			if(!m_moveFlag) return ;
			Global.stage.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
			this.mask=null;
			this.removeChild(m_mask);
			dispatchEvent(new Event(ShowComplete));
		}
		private function setShowPixWidth(pWidth:Number):void
		{
			var leaveWidth:Number=pWidth;
			for(var index:int=0; index<m_lineMatricsArray.length; index++)
			{
				
				var stl:TextLineMetrics=m_lineMatricsArray[index];
				var shape:Shape=m_maskShapeArray[index];
				if(leaveWidth>stl.width)
				{
					shape.x=stl.width;
				}
				else
				{
					shape.x=Math.max(leaveWidth,0);
				}
				leaveWidth-=stl.width;
			}
		}
		public override function fillTextString(s:String):void
		{
			super.fillTextString(s);
			resetMaskShape();
		}
		public override function fillHtmlString(s:String):void
		{
			super.fillHtmlString(s);
			resetMaskShape();
		}
		
	}
}