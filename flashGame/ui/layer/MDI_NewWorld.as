package ui.layer
{
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.models.BattleModel;
	import com.fish.modules.core.models.GuideModel;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.tool.JoyStick;
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	import core.LayerController;
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	
	import snake.BattleEnterance;
	import snake.GameItemManager;
	import snake.GameManager;
	import snake.zhucheng.ZhuchengBackground;
	import snake.zhucheng.ZhuchengLayer;
	
	import ui.TestWindow;
	import ui.equip.EquipCaozuoWindow;
	import ui.window.mail.YoujianWindow;
	
	import util.Dict;
	import util.SwitchManager;
	
	import view.CommonControlFun;
	
	public class MDI_NewWorld extends Mediator
	{
		[Inject]
		public var worldLayer:WorldLayer;
		[Inject]
		public var battleModel:BattleModel;
		[Inject]
		public var heroModel:HeroModel;
		[Inject]
		public var guideModel:GuideModel;
		
		private var buildings:Array;
		private var zhuchengBack:ZhuchengBackground;
		
		private var guideMc:MovieClip;
		private var guide_px:Number;
		private var guide_py:Number;
		
		public function MDI_NewWorld()
		{
			super();
		}
		
		public function showLeitaiGuide(px:Number,py:Number):void{
			if(guideMc==null){
				guideMc=new McDianji();
				guide_px=px;
				guide_py=py;
			}
			TweenLite.delayedCall(4,hideLeitaiGuide);
		}
		public function hideLeitaiGuide():void{
			if(guideMc){
				if(guideMc.parent){
					guideMc.parent.removeChild(guideMc);
				}
				guideMc.stop();
				guideMc=null;
			}
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			Music.play(Music.MainMusic);
			buildings=[];
			// todo
			GameManager.battleInitCom_SN.addOnce(onBattleInit);
			GameSwitchSceneController.btType=null;
			GameSwitchSceneController.isInBattle=false;
			BattleEnterance.enterBattleUserTextureAndJson("zhucheng",worldLayer.mapLayer);
			heroModel.wuqiGenghuan_SN.add(onChangeGun);
			WindowManager.windowOp_SN.add(hideLeitaiGuide);
//			new JoyStick(GlobalRef.root);
		}
		
		private function onChangeGun():void{
			if(GameManager.manager.player){
				GameManager.manager.player.initGun(heroModel.mainGunId);
			}
		}
		
		private function onBattleInit():void{
			zhuchengBack=new ZhuchengBackground();
			zhuchengBack.init(worldLayer.buildingLayer);
			worldLayer.buildingLayer.scaleX=GlobalRef.TileScale;
			worldLayer.buildingLayer.scaleY=GlobalRef.TileScale;
			
			
			
			if(GameManager.manager.mapInfo.hasOwnProperty("pos_building")){
				var buildObjs:Object=GameManager.manager.mapInfo.pos_building;
				for each(var buildObj:Object in buildObjs){
					var dis:MovieClip=AssetManager.createDisplay(buildObj.name) as MovieClip;
					buildings.push(dis);
					dis.x=buildObj.x;
					dis.y=buildObj.y;
					dis.name=buildObj.name;
					var layer:ZhuchengLayer=new ZhuchengLayer(dis,1);
					zhuchengBack.addLayer(layer);
					addViewListener(dis,TQTTouchEvent.TOUCH_TAP,onClickBuilding);
					
					
				}
				
			}
			
			LayerController.instance.uiLayer.initShortKey();
			GameItemManager.getInstance().init();
			GameManager.render_SN.add(onCanvasRender);
			
			screamLeft=3962.50;
			screamRigh=3962.50+187.50;
			
			TimerModel.instance.frame_SN.add(judgeScream);
			
			
			/*if(!guideModel.isComplete){
//				liaotianTwoMC.setVisible(false);
				LayerController.instance.liaotianLayer.init(false);
			}else{
				LayerController.instance.liaotianLayer.init(true);
			}*/
			/*if(AppstoreVerify.inVerify){
				LayerController.instance.liaotianLayer.init(false);
			}else{
				LayerController.instance.liaotianLayer.init(true);
			}*/
			
			LayerController.instance.liaotianLayer.init(SwitchManager.getInstance().Switch_Liaotian);
			
//			worldLayer.buildingLayer.addChild(new character_create_model());
		}

		private function onTouch_TAP(evt:Event):void
		{
			trace(worldLayer.mouseX);
			trace(worldLayer.mouseY);
//			var r:Boolean=btn_change_leitaiPlayer.contains()
//			var globalPoint:Point=new Point(GlobalRef.stage.mouseX,GlobalRef.stage.mouseY);
//			var localPoint:Point=zhuchengBack.container.globalToLocal(globalPoint);
		}
		private var stopFlag:Boolean;
		public function stop():void{
			if(!stopFlag){
				stopFlag=true;
				for each(var mc:MovieClip in buildings){
					mc.stop();
				}
			}
			
		}
		public function resume():void{
			if(stopFlag){
				stopFlag=false;
				for each(var mc:MovieClip in buildings){
					mc.play();
				}
			}
			
		}
		
		private function onBuildingFunc(_buildingName:String):void
		{
			switch(_buildingName)
			{
				case "zhucheng_bg_layer1_mark1":
					trace("点击铁匠铺");
//					LayerController.instance.sceneLayer.addScene(SceneLayer.Scene_Map,{});
					WindowManager.openOnlyWinodw(EquipCaozuoWindow);
					break;
				case "zhucheng_bg_layer1_mark3":
					trace("点击副本入口");
//					LayerController.instance.sceneLayer.addScene(SceneLayer.Scene_Map,{});
					CommonControlFun.showFubemMap({});
					break;
				case "zhucheng_bg_layer1_mark4":
					CommonControlFun.gotoChoujiangWindow();
					break;
				case "zhucheng_bg_layer1_mark2":
					trace("点击商店入口");
					CommonControlFun.openShop();					
					break;
				case "zhucheng_bg_layer1_mark7":
//					CommonControlFun.gotoMail();
					WindowManager.openOnlyWinodw(YoujianWindow);
					break;
				case "zhucheng_bg_layer1_mark6":
					CommonControlFun.gotoWakuang();
//					Context.getInsance().coreDispatcher.dispatchEvent(new CoreSwitchEvent(CoreSwitchEvent.SwitchToBattle,{battleType:CoreSwitchEvent.BT_Mining}));
					break;
			}
		}
		private function onClickBuilding(evt:Event):void{
			var building:MovieClip = evt.currentTarget as MovieClip;
			onBuildingFunc(building.name);
//			if(building.name=="zhucheng_bg_layer1_mark3"){
//				trace("点击副本入口");
//				LayerController.instance.sceneLayer.addScene(SceneLayer.Scene_Map,{});
//			}
		}
		
		private function onCanvasRender(cx:Number,cy:Number):void{
			zhuchengBack.render(cx,cy);
			if(guideMc){
				if(guideMc.parent==null){ worldLayer.effectLayer.addChild(guideMc);}
				guideMc.x=-cx+guide_px;
				guideMc.y=-cy+guide_py;
			}
		}
		
		
		
		public override function destroy():void
		{
			// todo
			hideLeitaiGuide();
			WindowManager.windowOp_SN.remove(hideLeitaiGuide);
			heroModel.wuqiGenghuan_SN.remove(onChangeGun);
			TimerModel.instance.frame_SN.remove(judgeScream);
			GameManager.battleInitCom_SN.remove(onBattleInit);
			GameManager.render_SN.remove(onCanvasRender);
			if(zhuchengBack){
				zhuchengBack.destory();
			}
			TweenLite.killDelayedCallsTo(hideLeitaiGuide);
			buildings=null;
			super.destroy();
		}
		
		
		//----------------------------
		//  村口怪叫的树
		
		// 间隔时间
		private var screamSpanTime:int=2000;
		
		private var lastScreamTime:int=0;
		
		private var screamLeft:Number;
		private var screamRigh:Number;
		
		
		private function judgeScream(t:*):void{
			if(GameManager.pauseFlag){
				return ;
			}
			if(GameManager.manager.player.character_velX!=0 
				&& GameManager.manager.player.character_x>=screamLeft && GameManager.manager.player.character_x<=screamRigh)
			{
				if(getTimer()-lastScreamTime>=screamSpanTime){
					lastScreamTime=getTimer();
					
					if(int(Math.random()*int.MAX_VALUE)%5==0){
						Music.playFX(Music.FX_cunkou);
						screamSpanTime=5000;
					}else{
						screamSpanTime=500;
					}
				}
			}
		}
		
		
	}
}