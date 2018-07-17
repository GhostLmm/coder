package core
{
	import com.fish.modules.core.events.CoreViewEvent;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.ViewDispatcher;
	import com.ghostlmm.xmldata.Node_xinshouyindao;
	import com.ghostlmm.xmldata.Node_xinshouyindao_lv;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	
	import core.event.TqtEvent;
	
	import ui.layer.MDI_UiLayer;
	import ui.mc.GuideMc;
	import ui.mc.JiantouMc;
	
	
	public class LevelGuideManager
	{
		private var mainStep:int=-1;
		
		private var minorStep:int=-1;
		
		private var timer:Timer;
		public var isGuiding:Boolean=false;
		
		
		
		public function get currentStep():int{
			if(minorStep>0){
				return minorStep;
			}
			return mainStep;
		}
		private function setNextStep():void{
			if(minorStep>0){
				minorStep=-1;
			}			
			mainStep++;
		}
		
		public function LevelGuideManager()
		{
		}
		private static var m_instance:LevelGuideManager;
		public static function getInstance():LevelGuideManager
		{
			if(null==m_instance)
			{
				m_instance=new LevelGuideManager;
			}
			return m_instance;
		}
		public function startGuide():void
		{
			if(!hasLevelGuide())
			{
				return;
			}
			doBeginFunc();
			initMoudle();
			registerEvent();
			showStep();
			moveStep();
		}
		public function startUpgradeGuide():void{
			doBeginFunc();
			initMoudle();
			registerEvent();
			showStep();
			moveStep();
		}
		
		public function startGuideDebug(level:int):void{
			
			mainStep=computeFirstStep(level);
			var xml:Node_xinshouyindao_lv=getCurrentXml();
			if(null==xml)
			{
				return ;
			}
			doBeginFunc();
			initMoudle();
			registerEvent();
			showStep();
			moveStep();
		}
		
		private function doBeginFunc():void
		{
			var funName:String=("beginFunc_"+currentStep).toString();
			var func:Function=this[funName] as Function;
			func.apply();
		}
		private function beginFunc_5001():void
		{
			var viewDispact:ViewDispatcher=Context.getInjectInstance(ViewDispatcher);
			viewDispact.dispatchEvent(new CoreViewEvent(CoreViewEvent.JumpScene,{scene:MDI_UiLayer.Label_DongfuScene}));
			mainStep=5002;
		}
		private function beginFunc_10001():void
		{
			var viewDispact:ViewDispatcher=Context.getInjectInstance(ViewDispatcher);
			viewDispact.dispatchEvent(new CoreViewEvent(CoreViewEvent.JumpScene,{scene:MDI_UiLayer.Label_LeitaifuScene}));
			mainStep=10002;
		}		
		public function hasLevelGuide():Boolean
		{
			
			return true;
		}
		
		public function hasUpgradeGuide():Boolean{
			mainStep=1000001;
			var xml:Node_xinshouyindao_lv=getCurrentXml();
			if(null==xml)
			{
				return false;
			}
			return true;
		}
		
		
		public function getShowDesc():String
		{
			if(getCurrentXml())
			{
				return getCurrentXml().desc;
			}
			return "";
		}
		
		private static function computeFirstStep(_level:int):int
		{
			
			
			return 0;
		}
		public function stopGuide():void
		{
			isGuiding=false;
			removeEvent();
			destoryModule();			
		}
		private function destoryModule():void
		{
			if((_arrow)&&(LayerController.instance.guideLayer.contains(_arrow)))
			{
				LayerController.instance.guideLayer.removeChild(_arrow);
				_arrow.destory();
				_arrow=null;
			}
			if((_guideMc)&&(LayerController.instance.guideLayer.contains(_guideMc)))
			{
				LayerController.instance.guideLayer.removeChild(_guideMc);
				_guideMc.destory();
				_guideMc=null;
			}
			timer=null;
		}
		private var _arrow:JiantouMc;
		private var _guideMc:GuideMc;
		private function initMoudle():void
		{
			timer=new Timer(500);
			
			if(null==_arrow)
			{
				_arrow=new JiantouMc();
			}
			if(null==_guideMc)
			{
				_guideMc=new GuideMc();
			}
			_arrow.mouseChildren=false;
			_arrow.mouseEnabled=false;
			LayerController.instance.guideLayer.addChild(_guideMc);
			LayerController.instance.guideLayer.addChild(_arrow);
		}
		private function moveStep(evt:Event=null):void
		{
			trace("move step : "+currentStep);
			
		}
		private var currentObj:DisplayObject;
		
		public function pointTo(obj:DisplayObject):void
		{
			showMc();
			_arrow.pointTo(obj);
			_guideMc.pointTo(obj,currentStep);
			
			currentObj=obj;
		}
		private function showMc():void
		{
			_arrow.visible=true;
			_guideMc.visible=true;
		}
		private function hideMc():void
		{
			_arrow.visible=false;
			_guideMc.visible=false;
		}
		private function registerEvent():void
		{
			timer.addEventListener(TimerEvent.TIMER,moveStep);
			timer.start();
			GlobalRef.stage.addEventListener(TqtEvent.BUTTON_CLICK,onButtonClicked);
			GlobalRef.stage.addEventListener(MouseEvent.CLICK,onMouseClick,true);
			GlobalRef.stage.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown,true);
			GlobalRef.stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp,true);
			(Context.getInjectInstance(ViewDispatcher) as ViewDispatcher).addEventListener(CoreViewEvent.HideZhuanpan,onHideZhuanpan);
			(Context.getInjectInstance(ViewDispatcher) as ViewDispatcher).addEventListener(CoreViewEvent.ZhuanpanJiangli,onZhuanpanJiangli);
		}
		private function onZhuanpanJiangli(evt:Event):void{
			if(! isGuiding) return ;
			if(int(currentStep/1000)==5){
				minorStep=5000001;
				showStep();
			}
		}
		private function onHideZhuanpan(evt:Event):void{
			if(! isGuiding) return ;
			if(currentStep==5005 || currentStep==5007 || currentStep==5009 || currentStep==5011){
				setNextStep();
				showStep();
			}
		}
		
		private function onMouseClick(evt:MouseEvent):void
		{
			if(!getIfClickTarget(evt))
			{
				if(!_warning)
				{
					trace("停止MouseClick传递");
					evt.stopImmediatePropagation();
					showWarning();
				}
				else
				{
					evt.stopImmediatePropagation();
					if(evt.target.parent.name==_guideMc.btn_jixu.name)
					{
						stopWarning();
					}
					else if(evt.target.parent.name==_guideMc.btn_queding.name)
					{
						stopWarning();
						stopGuide();
					}
				}
			}
			createFadeButtonClick("stage");
		}
		private var _warning:Boolean=false;		
		public function showWarning():void
		{
			showMc();
			_warning = true;
			timer.removeEventListener(TimerEvent.TIMER,moveStep);
			var node:Node_xinshouyindao = getTiaoguoXml();
			_guideMc.y = 0;
			_guideMc.desc = node.desc;
//			_guideMc.btn_jixu.visible = true;
//			_guideMc.btn_queding.visible = true;
			_guideMc.setButtonEnable(true);
			
			
			_arrow.pointTo(_guideMc.btn_jixu);
			LayerController.instance.windowLayer.mouseChildren=false;
			LayerController.instance.windowLayer.mouseEnabled=false;
			LayerController.instance.uiLayer.mouseChildren=false;
			LayerController.instance.uiLayer.mouseEnabled=false;
		}
		public function stopWarning():void
		{
			_warning = false;
//			_guideMc.btn_jixu.visible = false;
//			_guideMc.btn_queding.visible = false;
			_guideMc.setButtonEnable(false);
			LayerController.instance.windowLayer.mouseChildren=true;
			LayerController.instance.windowLayer.mouseEnabled=true;
			LayerController.instance.uiLayer.mouseChildren=true;
			LayerController.instance.uiLayer.mouseEnabled=true;
			showStep();
			timer.addEventListener(TimerEvent.TIMER,moveStep);
		}
		private function getTiaoguoXml():Node_xinshouyindao
		{
			return XMLDataManager.getXinshouyindaoById(0);
		}
		private function onMouseDown(evt:MouseEvent):void
		{
			if(TopTip.hasShow){
				return ;
			}
			
			if(!getIfClickTarget(evt))
			{
				trace("停止MouseDown传递");
				evt.stopImmediatePropagation();
			}
		}
		private function getIfClickTarget(evt:MouseEvent):Boolean
		{
			//			 var node:Node_xinshouyindao_lv=XMLDataManager.getXinshouyindao_lvById(currentStep);
			//			 if(node==null){
			//				 return false;
			//			 }
			//			 if(node.target=="noClick"){
			//				 return false;
			//			 }
			
			if(hasWindowNotShield())
			{
				return true;
			}
			if(null==currentObj)
			{
				return true;
			}
			var rect:Rectangle = currentObj.getRect(GlobalRef.stage);
			if((!rect.contains(evt.stageX,evt.stageY))||(_warning))
			{
				return false;
			}
			return true;
		}
		private function hasWindowNotShield():Boolean
		{
			return false;
		}
		private function onMouseUp(evt:MouseEvent):void
		{
			if(TopTip.hasShow){
				return ;
			}
			if(!getIfClickTarget(evt))
			{
				trace("停止MouseUp传递");
				evt.stopImmediatePropagation();
			}
		}
		private function onButtonClicked(evt:TqtEvent):void
		{
			var currentStepName:String=getStepBtnName();
			if(currentStepName==evt.data)
			{
				//				currentStep++;
				setNextStep();
				showStep();
			}
			else
			{
				evt.stopImmediatePropagation();
			}
		}
		private function getStepBtnName():String
		{
			var result:String="";
			var xml:Node_xinshouyindao_lv=getCurrentXml();
			if(xml)
			{
				result=xml.target;
			}
			return result;
		}
		private function getCurrentXml():Node_xinshouyindao_lv
		{
			var xml:Node_xinshouyindao_lv=XMLDataManager.getXinshouyindao_lvById(currentStep);
			return xml;
		}
		private function removeEvent():void
		{
			GlobalRef.stage.removeEventListener(TqtEvent.BUTTON_CLICK,onButtonClicked);
			timer.removeEventListener(TimerEvent.TIMER,moveStep);
			GlobalRef.stage.removeEventListener(MouseEvent.CLICK,onMouseClick,true);
			GlobalRef.stage.removeEventListener(MouseEvent.MOUSE_DOWN,onMouseDown,true);
			GlobalRef.stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp,true);	
			(Context.getInjectInstance(ViewDispatcher) as ViewDispatcher).addEventListener(CoreViewEvent.HideZhuanpan,onHideZhuanpan);
			(Context.getInjectInstance(ViewDispatcher) as ViewDispatcher).addEventListener(CoreViewEvent.ZhuanpanJiangli,onZhuanpanJiangli);
		}
		
		public function updateState(type:String,arg:Object=null):void{
			if(type=="buzhenComplete"){
				if(currentStep==15204){
					setNextStep();
					showStep();
				}
			}
		}
		
		private function showStep():void
		{
			isGuiding=true;
			var currentXml:Node_xinshouyindao_lv=getCurrentXml();
			if(null==currentXml)
			{				
				stopGuide();
				return;
			}
			_guideMc.desc = currentXml.desc;
		}
		
		
		/**
		 *   是否可以开启 卡牌升级提示
		 */
		public function couldStartCardUpgrade():Boolean{
			
			
			return false;
		}
		
		
		public function createFadeButtonClick(_str:String):void
		{
			if(! isGuiding) return ;
			GlobalRef.stage.dispatchEvent(new TqtEvent(TqtEvent.BUTTON_CLICK,_str));
		}
	}
}