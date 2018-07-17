package view.module
{
	import com.ghostlmm.tool.ListenerAddProxy;
	import com.greensock.TweenLite;
	import com.greensock.easing.Cubic;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	
	import core.event.TQTTouchEvent;
	
	import ui.widget.IComponent;
	
	import view.Base_Item;
	
	public class CircleScroller extends Sprite implements IComponent
	{
		public static const MaxScal:int=2;
		public static const MinScal:int=1;
		protected var _listenerProxy:ListenerAddProxy;
		public static const TotalAngle:Number=2*Math.PI;
		private var _mc:MovieClip;
		private var _radius:Number;
		private var _dataArray:Array;
		private var _itemClass:Class;
		private var _itemArray:Array;
		private var _derAngle:Number;
		
		private var currentShowIndex:int;
		
		private var _isShowInLeft:Boolean;
		
		public function CircleScroller($mc:MovieClip,$isShowInLeft:Boolean=false)
		{
			super();
			
			_mc=$mc;	
			_isShowInLeft=$isShowInLeft;
			_radius=Math.min(_mc.width,_mc.height)/2;
			registerEvent();
		}
		public function initItemClass($cls:Class):void
		{
			_itemClass=$cls;
		}
		private function registerEvent():void
		{
			addTargetEvent(_mc,TQTTouchEvent.TOUCH_BEGIN,onTouchBegin);
		}
		private var posOld:Number;
		private var posNew:Number;
		private var startX:Number;
		private var endX:Number;
		
		private var semicircle:String;
		private var scrollDirection:String;
		
		private function onTouchBegin(evt:Event):void
		{
			trace("点击开始");
			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_END,onTouchEnd);
			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_MOVE,onTouchMove);
			startX=GlobalRef.stage.mouseY;
			posOld=posNew=GlobalRef.stage.mouseY;
			semicircle=checkLeftOrRight();
		}
		public static const Left_Semicircle:String="left";
		public static const Right_Semicircle:String="right";
		private function checkLeftOrRight():String
		{
			var point:Point=_mc.mc_yuan_pos.globalToLocal(new Point(GlobalRef.stage.mouseX,GlobalRef.stage.mouseY));
			if(point.x<=0)
			{
				return Left_Semicircle;
			}
			return Right_Semicircle;
		}
		public static const Up:String="up";
		public static const Down:String="down";
		private function checkUpOrDown():String
		{
			if(posNew-posOld>0)
			{
				return Down;
			}
			return Up;
		}
		private function onTouchEnd(evt:Event=null):void
		{
			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_END,onTouchEnd);	
			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_MOVE,onTouchMove);
			endX=GlobalRef.stage.mouseY;
		}
		private static const TweenStartDerX:Number=10;
		private function onTouchMove(evt:Event):void
		{
			var delta:Number = GlobalRef.stage.mouseY-posNew;
			posOld = posNew;
			posNew = GlobalRef.stage.mouseY;
			var totalX:Number=GlobalRef.stage.mouseY-startX;
			if(Math.abs(totalX)>=TweenStartDerX)
			{
				onTouchEnd();
				scrollDirection=checkUpOrDown();
				scroll();
			}
		}
		private function scroll():void
		{
			if(Left_Semicircle==semicircle)
			{
				if(Up==scrollDirection)
				{
					moveToRight();
				}
				else
				{
					moveToLeft();
				}
			}
			else
			{
				if(Down==scrollDirection)
				{
					moveToRight();
				}
				else
				{
					moveToLeft();
				}
			}
		}
		private function moveToLeft():void
		{
			currentShowIndex--;
			currentShowIndex=(currentShowIndex+MaxItemNum)%MaxItemNum;
			move(true);
		}
		private var completeIndex:int;
		private function move(_isLeft:Boolean=true):void
		{
			trace(currentShowIndex);
			if(_mc.mouseEnabled==false)
			{
				return;
			}
			completeIndex=0;
			_mc.mouseChildren=false;
			_mc.mouseEnabled=false;
			killTween();
			var imgRotation:int;
			if(_isLeft)
			{
				imgRotation=_mc.mc_yuan_image.rotation-_derAngle*180/Math.PI;
			}
			else
			{
				imgRotation=_mc.mc_yuan_image.rotation+_derAngle*180/Math.PI;
			}
			TweenLite.to(_mc.mc_yuan_image,0.5,{rotation:imgRotation,ease:Cubic.easeIn});
			
			var index:int;
			for(index=0;index<MaxItemNum;index++)
			{
				var targetIndex:int=(index+currentShowIndex+MaxItemNum)%MaxItemNum;
				var item:Object=_itemArray[index];
				var targetAngle:Number;
				if(_isLeft)
				{
					targetAngle=item.angle-_derAngle;
				}
				else
				{
					targetAngle=item.angle+_derAngle;
				}
				var targetScal:int=MinScal;
				if(index==computeBigIndex())
				{
					targetScal=MaxScal;
				}
				TweenLite.to(item,0.5,{scaleX:targetScal,scaleY:targetScal,angle:targetAngle,onComplete:CompleteFunc,ease:Cubic.easeIn});
			}
		}
		private function moveToRight():void
		{
			currentShowIndex++;
			currentShowIndex=(currentShowIndex+MaxItemNum)%MaxItemNum;
			move(false);
		}
		private function computeBigIndex():int
		{
			return (MaxItemNum-currentShowIndex)%MaxItemNum;
		}
		private function CompleteFunc():void
		{
			completeIndex++;
			if(completeIndex>=MaxItemNum)
			{
				trace("完成的个数"+completeIndex);
				_mc.mouseChildren=true;
				_mc.mouseEnabled=true;
			}
		}
		private function killTween():void
		{
			var index:int;
			for(index=0;index<MaxItemNum;index++)
			{
				var item:Object=_itemArray[index];
				TweenLite.killTweensOf(item,true);
			}
		}
		private var MaxItemNum:int;
		public function setData($dataArray:Array):void
		{
			_dataArray=$dataArray;
			_derAngle=TotalAngle/_dataArray.length;
			MaxItemNum=_dataArray.length;
			initItemArray();
		}
		private function initItemArray():void
		{
			var index:int;
			_itemArray=[];
			_mc.mc_yuan_pos.removeChildren();
			for(index=0;index<_dataArray.length;index++)
			{
				var item:Object=new _itemClass();
				var angle:Number;
				if(_isShowInLeft)
				{
					angle=_derAngle*index;
				}
				else
				{
					angle=_derAngle*index+Math.PI;
				}
				if(index==computeBigIndex())
				{
					item.scaleX=MaxScal;
					item.scaleY=MaxScal;
				}
				else
				{
					item.scaleX=MinScal;
					item.scaleY=MinScal;
				}
				item.radius=_radius;
				item.angle=angle;				
				_mc.mc_yuan_pos.addChild(item as DisplayObject);
				_itemArray.push(item);
			}
		}
		private function destoryItemArray():void
		{
			var index:int;
			for(index=0;index<_dataArray.length;index++)
			{
				var item:Base_Item=_itemArray[index] as Base_Item;
				if(_mc.mc_yuan_pos.contains(item))
				{
					_mc.mc_yuan_pos.removeChild(item);
				}
				item.destory();
				item=null;
			}
			_dataArray=null;
		}
		public function destory():void
		{
			killTween();
			clearEvent();
			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_END,onTouchEnd);	
			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_MOVE,onTouchMove);
			destoryItemArray();
			_mc.removeChildren();
			_mc=null;
		}
		private var _listenerArray:Array;
		
		/**   添加注册事件，关闭窗口会自动回收
		 * */
		protected function addTargetEvent(target:EventDispatcher,type:String,listener:Function,useCapture:Boolean=false):void
		{
			if(_listenerArray==null) _listenerArray=[];
			
			target.addEventListener(type,listener,useCapture);
			
			_listenerArray.push({target:target,type:type,listener:listener,useCapture:useCapture});
		}
		
		private function clearEvent():void
		{
			if(_listenerArray==null) return ;
			for each(var obj:Object in _listenerArray)
			{
				obj.target.removeEventListener(obj.type,obj.listener,obj.useCapture);
				delete obj["target"];
				delete obj["listener"];
			}
			_listenerArray=null;
		}
	}
}