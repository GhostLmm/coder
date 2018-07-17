package ui.chaonengli
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.ChaonengliModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_chaonengli_main;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import util.Queue;
	import util.Util;
	
	import view.module.Mark_PageScroll;
	
	public class MDI_Chaonengli extends Mediator
	{
		[Inject]
		public var window:ChaonengliWindow;
		[Inject]
		public var chaonengliModel:ChaonengliModel;
		
		private var MaxPageNum:int;
		
		private var mark_pageScroll:Mark_PageScroll;
		
		private var currentIndex:int;
		
		private var itemsQueue:Queue;
		private var showItem:Item_ChaonengliWindow;
		
		public var userModel:UserModel;
		
		public var tempJinhuaNum:int;
		
		public function MDI_Chaonengli()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			initModule();
			registerEvent();
			setShow();
		}
		private function initModule():void
		{
			userModel=Context.getInjectInstance(UserModel);
			MaxPageNum=ChaonengliModel.getChongnengMainliXmlList().length;
			window._mc_huadong_pos.removeChildren();			
			mark_pageScroll=new Mark_PageScroll();
			mark_pageScroll.setBaseData(mc_huadong_biaozhi,MaxPageNum);
			window._mc_huadong_pos.fillWithObject(mark_pageScroll,false);
			initQueue();
			window._scroller.initItems(itemsQueue);
		}
		private function initQueue():void
		{
			itemsQueue=new Queue();
			showItem=new Item_ChaonengliWindow();
			itemsQueue.push(showItem);
		}
		private function destroyMc():void
		{
			itemsQueue=null;
			showItem.destory();
			showItem=null;
		}
		private function registerEvent():void
		{
			userModel.userVo.update_SN.add(onFresh);
			chaonengliModel.modelUpdata_SN.add(onFresh);
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._btn_left,TqtEvent.BUTTON_CLICK,onLeftClicked);
			addViewListener(window._btn_right,TqtEvent.BUTTON_CLICK,onRightClicked);
			addViewListener(window._btn_jinhua,TqtEvent.BUTTON_CLICK,onJinhuaClicked);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_ChaonengUpHandler)
			{
				if(_code==1)
				{
					setShow();
				}
			}
		}
		private function onJinhuaClicked(evt:Event):void
		{
			WindowManager.openOnlyWinodw(ChaonengliJinhuaWindow);
		}
		private function onFresh():void
		{
			window._scn_star.num=userModel.userVo.userStarCurrent;
			window._scn_money.num=userModel.userVo.userMoney;
			window._scn_zhanli.num=chaonengliModel.calcChaonengliZhandouli();
		}
		private function onLeftClicked(evt:Event):void
		{
			if(currentIndex>0)
			{
				currentIndex--;
				onTabSelect();
			}
		}
		private function onRightClicked(evt:Event):void
		{
			if(currentIndex<MaxPageNum-1)
			{
				currentIndex++;
				onTabSelect();
			}
		}
		private function onTabSelect():void
		{
			var xml:Node_chaonengli_main=XMLDataManager.Node_chaonengli_mainArray[currentIndex];
			window._fnt_body_part.text=xml.type;
			window._mc_superskill_bodypart.gotoAndStop(currentIndex+1);
			tempJinhuaNum=chaonengliModel._chaonengliVo.currentType;
			if((chaonengliModel.checkIfAreadyJinhua(xml.id))||(currentIndex>=MaxPageNum-1))
			{
				window._btn_jinhua.visible=false;
			}
			else
			{
				window._btn_jinhua.visible=true;
			}
			setMarkStatus();
			setBtnStatus();
			setItemShow();
		}
		private function setItemShow():void
		{
			var xml:Node_chaonengli_main=XMLDataManager.Node_chaonengli_mainArray[currentIndex];
			showItem.loadData(xml);
			window._scroller.containerDirection=0;
		}
		private function setBtnStatus():void
		{
			if((currentIndex>=MaxPageNum-1)||(currentIndex>=tempJinhuaNum-1))
			{
				window._btn_right.visible=false;
				window._btn_left.visible=true;
				if(tempJinhuaNum==1)
				{
					window._btn_right.visible=false;
					window._btn_left.visible=false;
				}
				return;
			}
//			if(currentIndex>=MaxPageNum-1)
//			{
//				window._btn_right.visible=false;
//				window._btn_left.visible=true;
//				return;
//			}
			if(currentIndex<=0)
			{
				window._btn_right.visible=true;
				window._btn_left.visible=false;
				return;
			}
			window._btn_right.visible=true;
			window._btn_left.visible=true;
		}
		private function setMarkStatus():void
		{
			mark_pageScroll.changeToMark(currentIndex);
		}
		private function setShow():void
		{
			var chaonengliModel:ChaonengliModel=Context.getInjectInstance(ChaonengliModel);
			currentIndex=chaonengliModel._chaonengliVo.currentType-1;
			if(currentIndex>=MaxPageNum-1)
			{
				currentIndex==MaxPageNum-1;
			}
			onTabSelect();
			onFresh();
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			chaonengliModel.modelUpdata_SN.remove(onFresh);
			userModel.userVo.update_SN.remove(onFresh);
			userModel=null;
			destroyMc();
			mark_pageScroll.destory();
			mark_pageScroll=null;
			super.destroy();
		}
	}
}