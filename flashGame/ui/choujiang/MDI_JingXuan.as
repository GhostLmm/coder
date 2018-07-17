package ui.choujiang
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.ChoujiangModel;
	import com.fish.modules.core.models.GuideModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.PlayerGuideManager;
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import util.GameTime;
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_JingXuan extends Mediator
	{
		[Inject]
		public var window:JingxuanWindow;
		[Inject]
		public var guideModel:GuideModel;
		
		private var xuanxiuModel:ChoujiangModel;
		
		public function MDI_JingXuan()
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
			xuanxiuModel=Context.getInjectInstance(ChoujiangModel);
		}
		private function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._mc_chouyici,TQTTouchEvent.TOUCH_TAP,onChouyiciClicked);
			addViewListener(window._mc_choushici,TQTTouchEvent.TOUCH_TAP,onChoushiciClicked);
		}
		private function onMessage(_mesType:String,_code:int):void
		{
			if(_code==1)
			{
				if(_mesType==C2SEmitter.REQ_JingxuanBatchChooseHandler)
				{
					window.close();
				}
				else if(_mesType==C2SEmitter.REQ_JingxuanChooseHandler)
				{
					window.close();
				}
			}
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function onChouyiciClicked(evt:Event ):void
		{
			if(!guideModel.isComplete){
				PlayerGuideManager.getInstance().createFadeButtonClick("chouyici");
			}
			if(xuanxiuModel.hasInitVO())
			{
				showXuanxiuWindow();
			}
			else
			{
				xuanxiuModel.initComplete_SN.addOnce(showXuanxiuWindow);
				xuanxiuModel.init();
			}
		}
		private function showXuanxiuWindow():void
		{
			var re:JudgeResult=xuanxiuModel.couldJinxuan();
			if(re.success)
			{
				C2SEmitter.choujiang_jingxuan();
			}
			else if(re.code==JudgeResult.CD_CashNotEnough)
			{
				CommonControlFun.cashNotEnoughDo();
			}
			else
			{
				Util.flow(re.desc);
			}
		}
		private function onChoushiciClicked(evt:Event ):void
		{
			if(xuanxiuModel.hasInitVO())
			{
				showJinxuanShilianchou();
			}
			else
			{
				xuanxiuModel.initComplete_SN.addOnce(showJinxuanShilianchou);
				xuanxiuModel.init();
			}
		}
		private function showJinxuanShilianchou():void
		{
			var re:JudgeResult=xuanxiuModel.couldJingxuanShilian();
			if(re.success){
				C2SEmitter.choujiang_jingxuan_shilian();				
			}else if(re.code==JudgeResult.CD_CashNotEnough){
				CommonControlFun.cashNotEnoughDo();
			}
			else
			{
				Util.flow(re.desc);
			}
		}
		private function setShow():void
		{
			window._fnt_cash1.text=ChoujiangModel.Cash_chouqu.toString();
			window._fnt_cash2.text=ChoujiangModel.Cash_shilianchou.toString();
			if(ChoujiangModel.NeedMaxChouquNum-xuanxiuModel.choujiangVo.jingxuanCount-1>0)
			{
				window._fnt_cishu.text=Util.getLanguage("再抽次数必定获得",int(ChoujiangModel.NeedMaxChouquNum-xuanxiuModel.choujiangVo.jingxuanCount-1));
			}
			else
			{ 
				window._fnt_cishu.text=Util.getLanguage("本次抽取必定中");
			}
			var timeModel:TimerModel=Context.getInjectInstance(TimerModel);
			var time:GameTime=new GameTime(xuanxiuModel.choujiangVo.jingxuanFreshTime-timeModel.serverTime);
			if(time.miliSecond<0)
			{
				window._fnt_cash1.text=Util.getLanguage("本次免费");
			}
		}
		
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onMessage);
			xuanxiuModel=null;
			super.destroy();
		}
	}
}