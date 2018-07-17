package snake.ui
{
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.models.GuideModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.tool.JoyStick;
	import com.ghostlmm.tool.WheelControl;
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	import core.LayerController;
	import core.PlayerGuideManager;
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import snake.GameManager;
	import snake.gameobj.Player;
	import snake.viewdata.battle.GunChangeManager;
	
	import util.Util;
	
	import view.Base_Mc;
	import view.CommonControlFun;

	public class Game_Gui extends Base_Gui
	{
//		private var leftBtn:MovieClip;
//		private var rightBtn:MovieClip;
		private var jumpBtn:MovieClip;
		private var fireBtn:MovieClip;
		
		private var playerHpMc:Mc_Battle_PlayerHp;
		public var timeMc:Mc_Battle_Time;
		private var buttleMc:Mc_Battle_Bullet;
		private var monsterLeft:Mc_Battle_MonsterLeft;
		
		public var joystick:JoyStick;
		
		private var orders:Array;
		
		private var _exitBtn:MovieClip;
		
		public function getRightBtn():MovieClip{
			return null;
		}
		public function getLeftBtn():MovieClip{
			return null;
		}
		public function getShotBtn():MovieClip{
			return fireBtn;
		}
		public function getJumpBtn():MovieClip{
			return jumpBtn;
		}
		private var useUI:Boolean;
		public function Game_Gui($useUi:Boolean=false)
		{
			useUI=$useUi;
//			useUI=false;
//			GameSwitchSceneController.btType=CoreSwitchEvent.BT_Copy
			super();
		}
		protected override function initModule():void
		{
			initPoints();
			initOptBtns();
			initMcs();	
			initGunRelated();
		}
		private var _btnChangeGun:Mc_Battle_GunChange;
		private var _mcGunChoose:Mc_Battle_GunChoose;
		
		public static function getChangGunX():Number{
			return GlobalRef.width-500;
		}
		
		private function initGunRelated():void
		{
			if(!useUI)
			{
				_btnChangeGun=new Mc_Battle_GunChange();
				_btnChangeGun.y=GlobalRef.height-140;
				_btnChangeGun.x=getChangGunX();
				addChild(_btnChangeGun);
				addTargetEvent(_btnChangeGun,TQTTouchEvent.TOUCH_TAP,onChangeGunClicked);	
				
				_exitBtn=new BtnZanting();
				addChild(_exitBtn);
				addTargetEvent(_exitBtn,TQTTouchEvent.TOUCH_TAP,onExitClicked);
				Util.setDiaplayButtonEffect(_exitBtn,false);
				if(Util.guideIsCompelete()){
					_exitBtn.visible=true;
				}else{
					_exitBtn.visible=false;
				}
			}
		}
		private function onExitClicked(evt:Event):void
		{
			CommonControlFun.confirmExitBattle();
		}
		private function initGunChoose():void
		{			
			_mcGunChoose=new Mc_Battle_GunChoose();
			_mcGunChoose.x=_btnChangeGun.x+_btnChangeGun.width/2-_mcGunChoose.width/2;
			_mcGunChoose.y=GlobalRef.height+100;
			addChild(_mcGunChoose);
		}
		private function destroyMc():void
		{
			if(joystick){
				joystick.destory();
				joystick=null;
			}
//			Util.killDiaplayButtonEffect(leftBtn);
//			Util.killDiaplayButtonEffect(rightBtn);
			Util.killDiaplayButtonEffect(jumpBtn);
			Util.killDiaplayButtonEffect(fireBtn);
			if(_exitBtn)
			{
				removeChild(_exitBtn);
				Util.killDiaplayButtonEffect(_exitBtn);
				_exitBtn=null;
			}
			destroyGunRelated();
		}
		private function destroyGunRelated():void
		{
			if(_btnChangeGun){removeChild(_btnChangeGun);_btnChangeGun.destory();_btnChangeGun=null;};
			if(_mcGunChoose){TweenLite.killTweensOf(_mcGunChoose);removeChild(_mcGunChoose);_mcGunChoose.destory();_mcGunChoose=null;};
		}
		private function showGunChoose():void
		{
			if(null==_mcGunChoose)
			{
				initGunChoose();
			}
			TweenLite.to(_mcGunChoose,0.5,{y:GlobalRef.height-240});
		}
		private function hideGunChoose():void
		{
			if(null!=_mcGunChoose)
			{
				removeChild(_mcGunChoose);
				_mcGunChoose.destory();
				_mcGunChoose=null;
			}
		}
		private function onChangeGunClicked(evt:Event):void
		{
			if(null==_mcGunChoose)
			{
				showGunChoose();
			}
			else
			{
				hideGunChoose();
			}
		}
		private var initPoint:Point;
		private var turnPoint:Point;
		private var targetPoint_Hp:Point;
		private var targetPoint_Bullet:Point;
		private var targetPoint_MonsterLeft:Point;
		private var targetPoint_Time:Point;
		private var targetPointArray:Array;
		private function initPoints():void
		{
			initPoint=new Point(GlobalRef.width/2,-77);
			turnPoint=new Point(GlobalRef.width/2,38);
			targetPoint_Hp=new Point(GlobalRef.width/2-210,38);
			targetPoint_Bullet=new Point(GlobalRef.width/2+210,38);
			targetPoint_MonsterLeft=new Point(GlobalRef.width/2,38+50);
			targetPoint_Time=new Point(GlobalRef.width/2,38);
			
			if(!useUI)
			{
				targetPointArray=[];			
				if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Copy)
				{
					targetPointArray.push(targetPoint_MonsterLeft);
				}
				targetPointArray.push(targetPoint_Hp);
				targetPointArray.push(targetPoint_Bullet);
				targetPointArray.push(targetPoint_Time);
			}
		}
		private function initMcs():void
		{
			if(!useUI)
			{
				orders=[];
				if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Copy)
				{
					monsterLeft=new Mc_Battle_MonsterLeft();
					orders.push(monsterLeft);
				}
				playerHpMc=new Mc_Battle_PlayerHp();
				orders.push(playerHpMc);
				buttleMc=new Mc_Battle_Bullet();
				orders.push(buttleMc);
				timeMc=new Mc_Battle_Time();
				orders.push(timeMc);
				
				var index:int;
				for(index=0;index<orders.length;index++)
				{
					var mc:Base_Mc=orders[index];
					if(mc)
					{
						mc.x=initPoint.x;
						mc.y=initPoint.y;
						addChild(mc);
					}
				}
			}
		}
		private function playAnimate():void
		{
			if(timeline)
			{
				timeline.clear();
				timeline=null;
			}
			var index:int;
			for(index=0;index<orders.length;index++)
			{
				addAnimate(orders[index],targetPointArray[index]);
			}
		}
		private static const FirstStepDuration:Number=0.3;
		private static const secondStepDuration:Number=0.4;
		private var timeline:TimelineLite;
		private function addAnimate(_mc:Base_Mc,_targetPoint:Point):void
		{
			timeline=new TimelineLite();
			timeline.append(new TweenLite(_mc,FirstStepDuration,{x:turnPoint.x,y:turnPoint.y}));
			if(_mc is Mc_Battle_MonsterLeft)
			{
				timeline.append(new TweenLite(_mc,secondStepDuration/2,{delay:secondStepDuration+0.2,x:_targetPoint.x,y:_targetPoint.y}));
			}
			else
			{
				timeline.append(new TweenLite(_mc,secondStepDuration,{x:_targetPoint.x,y:_targetPoint.y}));
			}
		}
		private function removeAnimate():void
		{
			if(timeline)
			{
				timeline.clear();
				timeline=null;
			}
			if(null==orders)
			{
				return;
			}
			var index:int;
			for(index=0;index<orders.length;index++)
			{
				TweenLite.killTweensOf(orders[index]);
			}
		}
		private function destroyMcs():void
		{
			if(null==orders)
			{
				return;
			}
			var index:int;
			for(index=0;index<orders.length;index++)
			{
				var mc:Base_Mc=orders[index];
				if(mc)
				{
					if(contains(mc))
					{
						removeChild(mc);
					}
					mc.destory();
					mc=null;
				}
			}
			orders=null;
		}
		protected override function destroyModule():void
		{
			removeAnimate();
			destroyMcs();
		}
		private function initOptBtns():void
		{
			
			if(!useUI){
				/*leftBtn=new btn_leftarrow();
				leftBtn.type=WheelControl.Type_Ignore;
				leftBtn.x=40;
				leftBtn.y=GlobalRef.height-140;
				leftBtn.keyCode=Keyboard.A;
				addChild(leftBtn);
				
				rightBtn=new btn_rightarrow();
				rightBtn.name="rightBtn";
				rightBtn.y=GlobalRef.height-140;
				
				rightBtn.type=WheelControl.Type_Ignore;
				rightBtn.x=leftBtn.x+leftBtn.width+20;
				rightBtn.y=GlobalRef.height-140;
				rightBtn.keyCode=Keyboard.D;
				addChild(rightBtn);*/
				
				
				
				jumpBtn=new btn_jump();
				
				jumpBtn.type=WheelControl.Type_Ignore;
				jumpBtn.x=GlobalRef.width-jumpBtn.width;
				jumpBtn.y=GlobalRef.height-jumpBtn.height;
				jumpBtn.keyCode=Keyboard.W;
				jumpBtn.name="jumpBtn";
				
				
				fireBtn=new btn_shoot();
				fireBtn.name="fireBtn";
				fireBtn.type=WheelControl.Type_Ignore;
				fireBtn.x=GlobalRef.width-fireBtn.width;
				fireBtn.y=jumpBtn.y-fireBtn.height;
				addChild(fireBtn);
				
				if(Util.guideIsCompelete()){
					jumpBtn.mc_changan.visible=false;
				}else{
					jumpBtn.mc_changan.visible=true;
				}
				
				addChild(jumpBtn);
				if(!Util.guideIsCompelete() && Context.getInjectInstance(GuideModel) 
					&&  !(Context.getInjectInstance(GuideModel) as GuideModel).hasPassFubenIndex(0) ){
					joystick=new JoyStick();
				}else{
					joystick=new JoyStick(true);
				}
				addChild(joystick.display);
			}else{
//				LayerController.instance.uiLayer.lb.leftBtn.visible=false;
//				LayerController.instance.uiLayer.lb.rightBtn.visible=false;
//				leftBtn=LayerController.instance.uiLayer.lb.leftBtn;
//				leftBtn.keyCode=Keyboard.A;
//				rightBtn=LayerController.instance.uiLayer.lb.rightBtn;
//				rightBtn.keyCode=Keyboard.D;
				jumpBtn=LayerController.instance.uiLayer.rb.jumpBtn;
				jumpBtn.keyCode=Keyboard.W;
//				leftBtn.type=WheelControl.Type_Ignore;
//				rightBtn.type=WheelControl.Type_Ignore;
				jumpBtn.type=WheelControl.Type_Ignore;
				fireBtn=new MovieClip();
				joystick=new JoyStick();
				addChild(joystick.display);
			}
			
			/*addTargetEvent(GlobalRef.stage,TQTTouchEvent.TOUCH_END,onStageTouchout);
			addTargetEvent(leftBtn,TQTTouchEvent.TOUCH_BEGIN,showEffct);
			addTargetEvent(leftBtn,TQTTouchEvent.TOUCH_END,endEffect);
			addTargetEvent(leftBtn,TQTTouchEvent.TOUCH_OUT,endEffect);
			
			addTargetEvent(rightBtn,TQTTouchEvent.TOUCH_BEGIN,showEffct);
			addTargetEvent(rightBtn,TQTTouchEvent.TOUCH_END,endEffect);
			addTargetEvent(rightBtn,TQTTouchEvent.TOUCH_OUT,endEffect);
			
			addTargetEvent(jumpBtn,TQTTouchEvent.TOUCH_BEGIN,showEffct);
			addTargetEvent(jumpBtn,TQTTouchEvent.TOUCH_END,endEffect);
			addTargetEvent(jumpBtn,TQTTouchEvent.TOUCH_OUT,endEffect);*/
			
//			Util.setDiaplayButtonEffect(leftBtn,false);
//			Util.setDiaplayButtonEffect(rightBtn,false);
			if(!useUI){
				Util.setDiaplayButtonEffect(jumpBtn,false);
				Util.setDiaplayButtonEffect(fireBtn,false);
			}
			setBtnVisible();
		}
		private function onStageTouchout(evt:Event):void{
//			if(leftBtn) {leftBtn.scaleX=1; leftBtn.scaleY=1;}
//			if(rightBtn) {rightBtn.scaleX=1; rightBtn.scaleY=1;}
			if(jumpBtn) {jumpBtn.scaleX=1; jumpBtn.scaleY=1;}
			if(fireBtn) {fireBtn.scaleX=1; fireBtn.scaleY=1;}
		}
		private function showEffct(evt:Event):void{
			var target:Sprite=evt.currentTarget as Sprite;
			target.scaleX=1.2;
			target.scaleY=1.2;
		}
		private function endEffect(evt:Event):void{
			var target:Sprite=evt.currentTarget as Sprite;
			target.scaleX=1;
			target.scaleY=1;
		}
		/**
		 * 设置射击按钮可见
		 */
		public function setCouldShoot(_value:Boolean):void
		{
			fireBtn.visible=_value;
		}
		protected override function registerEvent():void
		{
			joystick.changeDir_SN.add(onChangeDir);
//			addTargetEvent(GlobalRef.stage,TouchEvent.TOUCH_END,onMouseUp);
			addTargetEvent(fireBtn,TouchEvent.TOUCH_BEGIN,onFireMouseDown);
			addTargetEvent(fireBtn,TouchEvent.TOUCH_OUT,onFireMouseOut);
			addTargetEvent(fireBtn,TouchEvent.TOUCH_END,onFireMouseUp);
			
//			addTargetEvent(GlobalRef.stage,MouseEvent.MOUSE_UP,onMouseUp);
			addTargetEvent(fireBtn,MouseEvent.MOUSE_DOWN,onFireMouseDown);
			addTargetEvent(fireBtn,MouseEvent.MOUSE_OUT,onFireMouseOut);
			addTargetEvent(fireBtn,MouseEvent.MOUSE_UP,onFireMouseUp);
			
//			addBtnEvent(leftBtn);
//			addBtnEvent(rightBtn);
			addBtnEvent(jumpBtn);
			
			(Context.getInjectInstance(GuideModel) as GuideModel).changeStep_SN.add(onStepChange);
			
			GunChangeManager.getInstance().GunChange_SN.add(hideGunChoose);
		}
		
		private function onStepChange(step:int):void{
			setBtnVisible();
		}
		
		private function setBtnVisible():void{
			if(!Util.guideIsCompelete()){
				var guideMode:GuideModel=Context.getInjectInstance(GuideModel);
				if(GameManager.getManagerType()==GameManager.MG_Fuben){
					fireBtn.visible=guideMode.curGuideStep>=guideMode.showFireBtnStep;
					jumpBtn.visible=guideMode.curGuideStep>=guideMode.showJumpBtnStep;
				}
			}
		}
		
		private function onChangeDir():void{
			sendEvent(Keyboard.A,false);
			sendEvent(Keyboard.D,false);
			if(joystick.dir==JoyStick.DIR_Left){
				sendEvent(Keyboard.A,true);
			}
			if(joystick.dir==JoyStick.DIR_Right){
				sendEvent(Keyboard.D,true);
			}
		}
		
		private function onFireMouseOut(evt:Event):void
		{
			onMouseUp();
		}
		private function onFireMouseUp(evt:Event):void
		{
			onMouseUp();
		}
		public function addBtnEvent(_mc:DisplayObject):void
		{
			addTargetEvent(_mc,MouseEvent.MOUSE_DOWN,onBtnMouseDown);
			addTargetEvent(_mc,MouseEvent.MOUSE_OUT,onBtnMouseOut);
			addTargetEvent(_mc,MouseEvent.MOUSE_UP,onBtnMouseUp);
			
			addTargetEvent(_mc,TouchEvent.TOUCH_BEGIN,onBtnMouseDown);
			addTargetEvent(_mc,TouchEvent.TOUCH_OUT,onBtnMouseOut);
			addTargetEvent(_mc,TouchEvent.TOUCH_END,onBtnMouseUp);			
		}
		private function onBtnMouseDown(evt:Event):void
		{
			var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
			if(!guideModel.isComplete){
				PlayerGuideManager.getInstance().createFadeButtonClick(evt.target.name);
			}
			sendEvent(evt.currentTarget.keyCode,true);
		}
		private function onBtnMouseOut(evt:Event):void
		{
			var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
			if(!guideModel.isComplete){
				PlayerGuideManager.getInstance().createFadeButtonClick(evt.target.name);
			}
			sendEvent(evt.currentTarget.keyCode,false);
		}
		private function onBtnMouseUp(evt:Event):void
		{
			var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
			if(!guideModel.isComplete){
				PlayerGuideManager.getInstance().createFadeButtonClick(evt.target.name);
			}
			sendEvent(evt.currentTarget.keyCode,false);
		}
		public static function sendEvent(_code:uint,_value:Boolean):void
		{
//			trace("点击按键"+_code);
			Player.KD[_code]=_value;
		}
		private function testMovie():void
		{
			var index:int;
			for(index=0;index<orders.length;index++)
			{
				var mc:Base_Mc=orders[index];
				if(mc)
				{
					mc.x=initPoint.x;
					mc.y=initPoint.y;
				}
			}
			playAnimate();
		}
		private function onMouseUp(evt:Event=null):void
		{
//			testMovie()
			var player:Player=GameManager.manager.player;
			if(null==player)
			{
				return;
			}
			player.mouseDown=false;	
			player.character_burstLength=0;
		}
		private function onFireMouseDown(evt:Event):void
		{
			if(!GameSwitchSceneController.isInBattle) return ;
			var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
			if(!guideModel.isComplete){
				PlayerGuideManager.getInstance().createFadeButtonClick(evt.target.name);
			}
			var player:Player=GameManager.manager.player;
			if(null==player)
			{
				return;
			}
			player.mouseDown=true;			
		}
		private function onJumpClicked(evt:Event):void
		{
			GameOptControl.sendKeyBoardClicked(Keyboard.W,0.5);
		}
		protected override function setShow():void
		{
			if(!useUI)
			{
				playAnimate();
			}
		}
		public override function destroy():void
		{
			(Context.getInjectInstance(GuideModel) as GuideModel).changeStep_SN.remove(onStepChange);
			GunChangeManager.getInstance().GunChange_SN.remove(hideGunChoose);
			destroyMc();
			super.destroy();
		}
	}
}