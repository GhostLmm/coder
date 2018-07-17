package ui.layer
{
	import com.fish.modules.core.models.GuideModel;
	import com.fish.modules.preloadMD.models.SystemMD;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.ViewAssemble;
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObject;
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import ui.liaotian.LiaotianMC;
	import ui.liaotian.LiaotianWindow;
	import ui.widget.Button;
	import ui.widget.TwoMoveMc;

	public class UiLayer extends _LayerBase
	{

		private var _userInfoBar:UserInfoBar;
		
//		private var _springMenu:SpringMenu;
		
		
//		public var lb:mc_ui_BLpart;
		public var rb:UIBrPart;
		
//		public var liaotianBtn:BtnLiaotianClose;
		public var broadCastUI:UI_BROADCAST;
		
		private var shortKeyTwoMC:TwoMoveMc;
		public var shortKey:BuildingShortkey;
		
		
		/*private var liaotianContainer:Sprite;
		public var liaotianTwoMC:TwoMoveMc;
		private var liaotianWindow:LiaotianMC;*/
		
		private var uiIcon:MainUIIcon;
		
		public var btn_setup:Button;
		private var btn_setup_DefaultY:Number;
		public function UiLayer()
		{
			super();
			_scene = new Sprite;
			_userInfoBar=new UserInfoBar();
//			_springMenu=new SpringMenu();
			_scene.addChild(_userInfoBar.display);
			
//			_scene.addChild(_springMenu.display);
//			
//			lb=new mc_ui_BLpart();
			rb=new UIBrPart();
//			_scene.addChild(lb);
			_scene.addChild(rb.display);
			
//			liaotianBtn=new BtnLiaotianClose();
//			liaotianBtn.gotoAndStop(2);
//			_scene.addChild(liaotianBtn);
			
			broadCastUI=new UI_BROADCAST();
			broadCastUI.mouseChildren=false;
			broadCastUI.mouseEnabled=false;
			_scene.addChild(broadCastUI);
			
			uiIcon=new MainUIIcon();
			_scene.addChild(uiIcon.display);
			
			var setMc:MovieClip=new btn_shezhi();
			setMc.x=GlobalRef.width-setMc.width;
			_scene.addChild(setMc);
			btn_setup=new Button(setMc);
			btn_setup_DefaultY=btn_setup.y;
			shortKey=new BuildingShortkey();
			shortKeyTwoMC=new TwoMoveMc(BtnDituClose);
			shortKeyTwoMC.init(TwoMoveMc.DIR_Right);
			_scene.addChild(shortKeyTwoMC.display);
			
			
			
			/*liaotianContainer=new Sprite();
			_scene.addChild(liaotianContainer);
			liaotianTwoMC=new TwoMoveMc(BtnLiaotianClose);
			liaotianContainer.addChild(liaotianTwoMC.display);*/
			
			adjustPosition();

		}
		/*public function get scene():Sprite{
			return _scene;
		}*/
		
		public function showOnlyUserInfoBar():void{
			var sp:Sprite=_scene;
			var num:int=sp.numChildren;
			for(var index:int=0; index<num; index++){
				var child:DisplayObject=sp.getChildAt(index);
				if(child == _userInfoBar.display){
					child.visible=true;
				}else{
					child.visible=false;
				}
			}
		}
		
		public function showAll():void{
			var sp:Sprite=_scene;
			var num:int=sp.numChildren;
			for(var index:int=0; index<num; index++){
				sp.getChildAt(index).visible=true;
			}
		}
		
//		public function get springMenu():SpringMenu{
//			return _springMenu;
//		}
		private static const BtnSpace:Number=113+20;
		
		public function init():void{
			_userInfoBar.init();
			
			/*var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
			if(!guideModel.isComplete){
				liaotianTwoMC.setVisible(false);
			}
			liaotianTwoMC.init(TwoMoveMc.DIR_Left);
			liaotianTwoMC.changeState_SN.add(onLiaoTwoChange);
			liaotianTwoMC.needChangeState_SN.add(onNeedLiaotianChange);*/
			
			uiIcon.init();
			
			
		}
		
		
		public function showLiaotian():void{
			
		}
		
		/*private function onLiaoTwoChange(state:int):void{
			if(state==TwoMoveMc.ST_close){
				if(liaotianWindow){
					liaotianWindow.close();
					liaotianWindow=null;
					liaotianContainer.graphics.clear();
				}
			}
		}*/
		/*private function onNeedLiaotianChange(state:int):void{
			if(state==TwoMoveMc.ST_close2open){
				if(liaotianWindow) {liaotianWindow.close();}
				liaotianWindow=new LiaotianWindow();
				liaotianWindow.open();
				liaotianTwoMC.showCloseToOpen(liaotianWindow);
				liaotianContainer.graphics.clear();
				var graphics:Graphics = liaotianContainer.graphics;
				graphics.lineStyle(0, 0x000000, 0.5);
				graphics.beginFill(0x000000, 0.7);
				graphics.drawRect(0,0,GlobalRef.width,GlobalRef.height);
				graphics.endFill();
				
				return ;
			}
			if(state==TwoMoveMc.ST_open2close){
				liaotianTwoMC.showOpenToClose();
			}
		}*/
		
		public function initShortKey():void{
			
			shortKey.initBuildKey();
			shortKeyTwoMC.needChangeState_SN.add(onNeedChangeShortkey);
			var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
			if(!guideModel.isComplete){
				shortKeyTwoMC.setShowAll(true,shortKey);
				btn_setup.y=btn_setup_DefaultY-btn_setup.height;
			}else{
				var systemModel:SystemMD=Context.getInjectInstance(SystemMD);
				if(systemModel.getShortkeySwitch()){
					shortKeyTwoMC.setShowAll(true,shortKey);
					btn_setup.y=btn_setup_DefaultY-btn_setup.height;
				}else{
					shortKeyTwoMC.setShowAll(false,shortKey);
					btn_setup.y=btn_setup_DefaultY;
				}
			}
		}
		
		private function onNeedChangeShortkey(state:int):void{
			var sytemMd:SystemMD=Context.getInjectInstance(SystemMD);
			if(state==TwoMoveMc.ST_close2open){
				shortKeyTwoMC.showCloseToOpen(shortKey);
				sytemMd.setShortkeySwitch(1);
				TweenLite.to(btn_setup,TwoMoveMc.TweenTime,{y:btn_setup_DefaultY-btn_setup.height});
				return ;
			}
			if(state==TwoMoveMc.ST_open2close){
				shortKeyTwoMC.showOpenToClose();
				sytemMd.setShortkeySwitch(0);
				TweenLite.to(btn_setup,TwoMoveMc.TweenTime,{y:btn_setup_DefaultY});
				return ;
			}
		}
		
		public function initTMMC():void{
			
			_userInfoBar.init();
			
		}

		private function onClick(evt:MouseEvent):void{
			trace(mouseX,mouseY,evt.stageX,evt.stageY);
		}

		private function onMouseDown(evt:MouseEvent):void{
			evt.currentTarget.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			evt.currentTarget.removeEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			evt.currentTarget.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
			evt.currentTarget.startDrag();
		}
		private function onMouseUp(evt:Event):void{
			evt.currentTarget.stopDrag();
			evt.currentTarget.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			evt.currentTarget.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			evt.currentTarget.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
		}
		private function onMouseMove(evt:Event):void{
			tracePosition();
		}
		
		public function get userInfoBar():UserInfoBar{
			return _userInfoBar;
		}
		
		private function adjustPosition():void{
			_userInfoBar.display.x=0;
			_userInfoBar.display.y=0;
			
//			_springMenu.display.x=GlobalRef.width;
//			_springMenu.display.y=0;
			
//			lb.x=0;
//			lb.y=GlobalRef.height;
			
//			liaotianBtn.x=0;
//			liaotianBtn.y=GlobalRef.height/2;
			
			broadCastUI.x=(GlobalRef.width-broadCastUI.width)/2;
			broadCastUI.y=180;
			uiIcon.display.y=_userInfoBar.display.getBounds(_scene).bottom-20;
		}
		
		private function tracePosition():void{
//			var lt:Point=new Point(_lt.x,_lt.y);
//			var rt:Point=new Point(_rt.x,_rt.y);
//			var lb:Point=new Point(_lb.x,_lb.y);
//			var rb:Point=new Point(_rb.x,_rb.y);
//			
//			trace("lt:"+lt+"\trt:"+rt+"\tlb:"+lb+"\trb:"+rb);
		}
		 
		public override function destory():void
		{
			ViewAssemble.unBindMediator(this);
//			if(_springMenu) {_springMenu.destroy();_springMenu=null;}
			if(_userInfoBar){_userInfoBar.destory();_userInfoBar=null;}
			if(uiIcon) {uiIcon.destory(); uiIcon=null;}
			if(rb) {rb.destory(); rb=null;}
			if(btn_setup) {btn_setup.destory(); btn_setup=null;}
			/*if(liaotianBtn)
			{
				if(_scene.contains(liaotianBtn))
				{
					_scene.removeChild(liaotianBtn);
				}
				liaotianBtn=null;
			}*/
			if(broadCastUI)
			{
				if(_scene.contains(broadCastUI))
				{
					_scene.removeChild(broadCastUI);
				}
				broadCastUI=null;
			}
			if(shortKey) {shortKey.destory(); shortKey=null;}
			if(shortKeyTwoMC) {shortKeyTwoMC.destory(); shortKeyTwoMC=null;}
			
//			if(liaotianTwoMC) {liaotianTwoMC.destory(); liaotianTwoMC=null;}
//			if(liaotianWindow) {liaotianWindow.close(); liaotianWindow=null;}
			super.destory();
		}
	}
}


