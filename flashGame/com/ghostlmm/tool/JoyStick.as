package com.ghostlmm.tool
{
	import com.fish.modules.core.models.GuideModel;
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TouchEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import core.PlayerGuideManager;
	import core.event.TQTTouchEvent;
	
	import org.osflash.signals.Signal;
	
	import snake.ui.Game_Gui;
	
	import util.Util;

	public class JoyStick
	{
		
		private var back:MovieClip;
		private var font:MovieClip;
		private var container:Sprite;
		public static var JoyCicle:Number=100;
		
		private var _grabbed:Boolean=false;
		private var _touchId:int;
		
		private var _dir:int;
		
		public var changeDir_SN:Signal=new Signal();
		
		private var mc:McYaogan;
		
		private var arrow:MovieClip;
		
		public function get grabbed():Boolean{
			return _grabbed;
		}
		
		public function get dir():int{
			return _dir;
		}
		
		private function setDir(value:int):void{
			if(_dir!=value){
				_dir=value;
				changeDir_SN.dispatch();
//				trace("摇杆方向改变： "+_dir);
			}
		}
		public static const DIR_Left:int=-1;
		public static const DIR_None:int=0;
		public static const DIR_Right:int=1;
		
		
		private var freeClickFlag:Boolean;
		
		private var defaultSize:Point;
		private var rect:Rectangle;
		public function setDefaultPos():void{
			if(defaultSize==null){
				defaultSize=new Point();
				defaultSize.x=container.width/2;
				defaultSize.y=container.height/2;
				rect=new Rectangle();
				rect.x=0;
				rect.y=GlobalRef.height/2;
				rect.width=Math.min(GlobalRef.width/2,Game_Gui.getChangGunX());
				rect.height=GlobalRef.height/2;
			}
			container.x=defaultSize.x;
			container.y=GlobalRef.height-defaultSize.y+20;
		}
		
		public function JoyStick($freeClick:Boolean=false)
		{
			freeClickFlag=$freeClick;
			freeClickFlag=false;
			draw();
			register();
		}
		
		public function get display():DisplayObject{
			return container;
		}
		
		private function draw():void{
			container=new Sprite();
			container.mouseChildren=false;
			container.name="joyStick";
			mc=new McYaogan();
			container.addChild(mc);
			mc.removeChild(mc.pos_1);
			mc.removeChild(mc.pos_2);
			JoyCicle=mc.pos_1.width/2;
			back=mc.mc_bg;
			font=mc.mc_yaogan;
			arrow=back.mc_jiantou;
			arrow.visible=false;
			setDefaultPos();
			/*back=new Sprite();
			font=new Sprite();
			back.graphics.beginFill(0x123456,0.5);
			back.graphics.drawCircle(0,0,JoyCicle);
			back.graphics.endFill();
			font.graphics.beginFill(0xff00ff,1);
			font.graphics.drawCircle(0,0,30);
			font.graphics.endFill();
			container.addChild(back);
			container.addChild(font);*/
		}
		
		private function register():void{
			if(freeClickFlag){
				GlobalRef.stage.addEventListener(TouchEvent.TOUCH_BEGIN,onBegin);
			}else{
				container.addEventListener(TouchEvent.TOUCH_BEGIN,onBegin);
			}
			
			
			GlobalRef.APP_Deactivate_SN.add(onDeactive);
			(Context.getInjectInstance(GuideModel) as GuideModel).changeStep_SN.add(onChangeGuideStep);
		}
		private function onChangeGuideStep(step:int):void{
			var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
			if(guideModel.showFireBtnStep==step){
				unActive();
			}
		}
		
		private function active($touchId:int):void{
			_grabbed=true;
			_touchId=$touchId;
			back.scaleX=1.2;
			back.scaleY=1.2;
			arrow.visible=true;
			GlobalRef.stage.addEventListener(TouchEvent.TOUCH_MOVE,onMove);
//			TimerModel.instance.frame_SN.add(onFrame);
			
			GlobalRef.stage.addEventListener(TouchEvent.TOUCH_END,onTouchOut,true,int.MAX_VALUE);
//			GlobalRef.stage.addEventListener(TouchEvent.TOUCH_OUT,onTouchOut,true,int.MAX_VALUE);
			GlobalRef.stage.removeEventListener(TouchEvent.TOUCH_BEGIN,onBegin);
			container.removeEventListener(TouchEvent.TOUCH_BEGIN,onBegin);
			if(!Util.guideIsCompelete()){
				PlayerGuideManager.getInstance().createFadeButtonClick("joyStick");
			}
		}
		
		private function onFrame($t:Number):void{
//			GlobalRef.stage.
//			GlobalRef.stage.
		}
		
		private function unActive():void{
			setDefaultPos();
			_grabbed=false;
			_touchId=0;
			arrow.visible=false;
			back.scaleX=1;
			back.scaleY=1;
			GlobalRef.stage.removeEventListener(TouchEvent.TOUCH_MOVE,onMove);
			GlobalRef.stage.removeEventListener(TouchEvent.TOUCH_END,onTouchOut,true);
			GlobalRef.stage.removeEventListener(TouchEvent.TOUCH_OUT,onTouchOut,true);
			if(freeClickFlag){
				GlobalRef.stage.addEventListener(TouchEvent.TOUCH_BEGIN,onBegin);
			}else{
				container.addEventListener(TouchEvent.TOUCH_BEGIN,onBegin);
			}
			font.x=0;
			font.y=0;
			setDir(DIR_None);
		}
		
		private function onBegin(evt:TouchEvent):void{
			if(_grabbed==false){
				var tmp:Point;
				if(freeClickFlag){
					tmp=GlobalRef.root.globalToLocal(new Point(evt.stageX,evt.stageY));
					if(rect.containsPoint(tmp)){
						active(evt.touchPointID);
						if(tmp.x<=rect.left+defaultSize.x){
							container.x=rect.left+defaultSize.x;
						}else if(tmp.x<=rect.right-defaultSize.x){
							container.x=tmp.x;
						}else{
							container.x=rect.right-defaultSize.x;
						}
						if(tmp.y<=rect.top+defaultSize.y){
							container.y=rect.top+defaultSize.y;
						}else if(tmp.y<=rect.bottom-defaultSize.y){
							container.y=tmp.y;
						}else{
							container.y=rect.bottom-defaultSize.y;
						}
						update(evt.stageX,evt.stageY);
					}
				}else{
					tmp=container.globalToLocal(new Point(evt.stageX,evt.stageY));
					if(tmp.x*tmp.x+tmp.y*tmp.y<=JoyCicle*JoyCicle){
						active(evt.touchPointID);
						update(evt.stageX,evt.stageY);
					}
				}
				
				
			}
		}
		
		private function update(stageX:Number,stageY:Number):void{
			var p:Point=container.globalToLocal(new Point(stageX,stageY));
			if(p.length>JoyCicle){
				var k:Number=Math.sqrt(JoyCicle*JoyCicle/(p.x*p.x+p.y*p.y));
				font.x=k*p.x;
				font.y=k*p.y;
			}else{
				font.x=p.x;
				font.y=p.y;
			}
			
			arrow.rotation=MathHelper.calcRotation(p.x,p.y);
			
			if(font.x<0){
				setDir(DIR_Left);
			}else if(font.x>0){
				setDir(DIR_Right);
			}else{
				setDir(DIR_None);
			}
		}
		
		private function onMove(evt:TouchEvent):void{
			if(_grabbed){
				if(evt.touchPointID==_touchId){
					update(evt.stageX,evt.stageY);
				}
			}
		}
		private function onTouchOut(evt:TouchEvent):void{
//			trace("touch end ："+evt.touchPointID+"/"+_touchId);
			if(_grabbed){
				if(evt.touchPointID==_touchId){
					unActive();
					evt.stopImmediatePropagation();
					evt.stopPropagation();
				}
			}
		}
		private function onDeactive():void{
			unActive();
		}
		
		public function destory():void{
			(Context.getInjectInstance(GuideModel) as GuideModel).changeStep_SN.remove(onChangeGuideStep);
			changeDir_SN.removeAll();
			GlobalRef.stage.removeEventListener(TouchEvent.TOUCH_MOVE,onMove);
			GlobalRef.stage.removeEventListener(TouchEvent.TOUCH_END,onTouchOut,true);
			GlobalRef.stage.removeEventListener(TouchEvent.TOUCH_OUT,onTouchOut,true);
			GlobalRef.stage.removeEventListener(TouchEvent.TOUCH_BEGIN,onBegin);
			container.removeEventListener(TouchEvent.TOUCH_BEGIN,onBegin);
			container.removeChildren();
		}
		
	}
}