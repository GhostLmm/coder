package ui.widget
{
	import com.fish.modules.core.models.TimerModel;
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import org.osflash.signals.Signal;

	public class TwoMoveMc
	{
		private var container:Sprite;
		private var pos:int;
		private var btn:Button;
		private var btnMovie:MovieClip;
		private var btnWidth:Number;
		private var mcWidth:Number;
		
		private var mc:DisplayObject;
		
		private var rect:Rectangle;
		
		private var state:int;
		public static const ST_close:int=0;
		public static const ST_close2open:int=1;
		public static const ST_open:int=2;
		public static const ST_open2close:int=3;
		
		public static const DIR_Left:int=1;
		public static const DIR_Right:int=2;
		
		
		public static const TweenTime:Number=0.75;
		private static const WaitTime:Number=4;
		
		private var _waitTime:int;
		
		public var changeState_SN:Signal=new Signal(int);
		public var needChangeState_SN:Signal=new Signal(int);
		
		private var _showAllFlag:Boolean=false;
		public function TwoMoveMc(btnCls:Class)
		{
			container=new Sprite();
//			btnMovie=new BtnLiaotianClose();
			btnMovie=new btnCls();
			btnMovie.stop();
			
		}
		
		public function setShowAll(value:Boolean,$mc:DisplayObject):void{
			_showAllFlag=value;
			if(_showAllFlag){
				mc=$mc;
				mcWidth=$mc.width;
				container.addChildAt(mc,0);
				state=ST_close2open;
				showOpen();
			}
		}
		
		public function setVisible(value:Boolean):void{
			container.visible=value;
		}
		
		public function init($pos:int):void{
			pos=$pos;
			var btnSp:MovieClip=new MovieClip();
			btnSp.addChild(btnMovie);
			btnWidth=btnMovie.width;
			
			if($pos==DIR_Right){
				btnSp.x=-btnSp.width;
				btnSp.y=-btnSp.height/2;
			}
			if($pos==DIR_Left){
				btnSp.x=0;
				btnSp.y=-btnSp.height/2;
			}
			
			container.y=GlobalRef.height/2;
			container.addChild(btnSp);
			btn=new Button(btnSp);
			state=ST_open2close;
			btn.addEventListener(TqtEvent.BUTTON_CLICK,onclickBtn);
			showClose();
		}
		
		private function registerEvt():void{
//			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_BEGIN,onTouchStage);
//			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_END,onTouchStage);
//			if(TimerModel.instance) TimerModel.instance.secondTimer_SN.add(onTick);
		}
		private function removeEvt():void{
//			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_BEGIN,onTouchStage);
//			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_END,onTouchStage);
//			if(TimerModel.instance) TimerModel.instance.secondTimer_SN.remove(onTick);
		}
		
		private function onTick():void{
			if(_showAllFlag) return;
			if(state==ST_open){
				_waitTime--;
				if(_waitTime<=0){
					showOpenToClose();
				}
			}
		}
		
		private function onTouchStage(evt:Event):void{
			if(_showAllFlag) return;
			if(ST_open==state){
				if(!rect.contains(container.mouseX,container.mouseY)){
					showOpenToClose();
				}else{
					_waitTime=WaitTime;
				}
			}
		}
		
		public function get display():DisplayObject{
			return container;
		}
		
		private function onclickBtn(evt:Event):void{
			if(ST_close==state){
				needChangeState_SN.dispatch(ST_close2open);
				return ;
			}
			if(ST_open==state){
				needChangeState_SN.dispatch(ST_open2close);
				return ;
			}
			
		}
		
		public function foceShowClose():void{
			state=ST_open2close;
			showClose();
		}
		
		private function showClose():void{
			if(state!=ST_open2close) return ;
			state=ST_close;
			
			TweenLite.killTweensOf(container);
			if(pos==DIR_Left){
				container.x=0;
				btnMovie.gotoAndPlay(DIR_Left);
			}
			if(pos==DIR_Right){
				container.x=GlobalRef.width;
				btnMovie.gotoAndPlay(DIR_Right);
			}
			if(mc){
				if(mc.parent){
					mc.parent.removeChild(mc);
				}
				mc=null;
			}
//			btnMovie.alpha=1;
//			btnMovie.visible=true;
			showBtn();
			removeEvt();
		}
		
		private function showBtn():void{
			
			if(state==ST_close || state==ST_open2close){
				if(pos==DIR_Left){
					btnMovie.gotoAndStop(1);
				}else{
					btnMovie.gotoAndStop(2);
				}
			}else{
				if(pos==DIR_Left){
					btnMovie.gotoAndStop(2);
				}else{
					btnMovie.gotoAndStop(1);
				}
			}
			changeState_SN.dispatch(state);
		}
		
		public function showCloseToOpen($mc:DisplayObject):void{
			if(state!=ST_close) return ;
			state=ST_close2open;
			
			TweenLite.killTweensOf(container);
			mc=$mc;
			container.addChildAt(mc,0);
			mcWidth=mc.width;
			rect=mc.getBounds(container);
			var targetX:Number;
			if(pos==DIR_Left){
				targetX=mcWidth;
			}
			if(pos==DIR_Right){
				targetX=GlobalRef.width-mcWidth;
			}
//			btnMovie.alpha=1;
//			btnMovie.visible=true;
			TweenLite.to(container,TweenTime,{x:targetX,onComplete:showOpen});
//			TweenLite.to(btnMovie,TweenTime,{alpha:0});
			showBtn();
		}
		
		public function showOpen():void{
			if(state!=ST_close2open) return ;
			state=ST_open;
			
			TweenLite.killTweensOf(container);
			/*mc=$mc;
			container.addChild(mc);
			mcWidth=mc.width;*/
			var targetX:Number;
			if(pos==DIR_Left){
				targetX=mcWidth;
			}
			if(pos==DIR_Right){
				targetX=GlobalRef.width-mcWidth;
			}
			
			container.x=targetX;
//			btnMovie.alpha=0;
//			btnMovie.visible=false;
			_waitTime=WaitTime;
			registerEvt();
			showBtn();
		}
		
		public function showOpenToClose():void{
			if(state!=ST_open) return ;
			state=ST_open2close;
			
			TweenLite.killTweensOf(container);
			var target:Number;
			if(pos==DIR_Left){
				target=0;
			}
			if(pos==DIR_Right){
				target=GlobalRef.width;
			}
//			btnMovie.alpha=0;
//			btnMovie.visible=true;
			TweenLite.to(container,TweenTime,{x:target,onComplete:showClose});
//			TweenLite.to(btnMovie,TweenTime,{alpha:1});
			showBtn();
		}
		
		public function destory():void{
			removeEvt();
			if(container){
				container.removeChildren();
				TweenLite.killTweensOf(container);
				container=null;
			}
			if(btn){
				btn.removeEventListener(TqtEvent.BUTTON_CLICK,onclickBtn);
				btn.destory();
				btn=null;
			}
			if(mc){
				if(mc.parent) mc.parent.removeChild(mc);
				mc=null;
			}
			changeState_SN.removeAll();
			needChangeState_SN.removeAll();
		}
	}
}