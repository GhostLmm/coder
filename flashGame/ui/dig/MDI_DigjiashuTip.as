package ui.dig
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.GuankaModel;
	import com.fish.modules.core.models.GuideModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.VipModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_DigjiashuTip extends Mediator
	{
		[Inject]
		public var wm:DigJiashuTipWindow;
		[Inject]
		public var guankaModel:GuankaModel;
		[Inject]
		public var vipModel:VipModel;
		[Inject]
		public var guideModel:GuideModel;
		public function MDI_DigjiashuTip()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			
			setShow();
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			addViewListener(wm._btn_jiasu,TqtEvent.BUTTON_CLICK,onClickJiashu);
			
			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		
		private function setShow():void{
			wm._fnt_cishu.text=guankaModel.getCouldJiashuCount()+"/"+(guankaModel.MaxDigJiashu+vipModel.addCount_wakuangJiashu);
			wm._fnt_time_desc.text=Util.getLanguage("挖矿加速时间提示",int(guankaModel.DigJiashuTime/60/60));
			wm._fnt_num_cash.text=guankaModel.getDigJiashuCost().toString();
		}
		
		private function onClickJiashu(evt:Event):void{
			var re:JudgeResult=guankaModel.couldDigJiashu();
			if(re.success){
				C2SEmitter.jaishuWakang();
			}else{
				CommonControlFun.proccessJudgeResult(re);
			}
		}
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(code>=0){
				if(msType==C2SEmitter.REQ_DigFastGuajiHandler){
					var digData:AutoDigInfoData=new AutoDigInfoData();
					digData.initFromVo(guankaModel.vo);
					WindowManager.openOnlyWinodw(DigRewardWindow,digData);
					setShow();
					if(!guideModel.isComplete){
						wm.close();
					}
				}
			}
		}
		
		
		
		public override function destroy():void
		{
			// todo
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			super.destroy();
		}
	}
}