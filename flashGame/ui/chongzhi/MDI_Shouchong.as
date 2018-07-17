package ui.chongzhi
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.ChongzhiModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.mc.JiangliMc;
	import ui.window.CommonRewardWindow;
	
	import util.Util;
	
	public class MDI_Shouchong extends Mediator
	{
		[Inject]
		public var wm:ShouchongWindow;
		[Inject]
		public var chongzhiModel:ChongzhiModel;
		
		
		private var shouchongState:int;
		
		public function MDI_Shouchong()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			wm._scr_jiangli.initClass(JiangliMc);
			wm._scr_jiangli.setData(chongzhiModel.getShouchongJiangliArray());
			shouchongState=chongzhiModel.getShouchongState();
			
			if(shouchongState==ChongzhiModel.ST_Active){
				wm._btn_chongzhi.setText(Util.getLanguage("btn领取"));
			}
			if(shouchongState==ChongzhiModel.ST_UnActive){
				wm._btn_chongzhi.setText(Util.getLanguage("btn充值"));
			}
			
			addViewListener(wm._btn_chongzhi,TqtEvent.BUTTON_CLICK,onClick);
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(msType==C2SEmitter.REQ_ItemUseHandelr && code>0){
				if(c2s.item.xid==chongzhiModel.shouchongLibaoId){
					WindowManager.openOnlyWinodw(CommonRewardWindow,chongzhiModel.getShouchongJiangliArray());
					wm.close();
				}
			}
		}
		
		private function onClick(evt:Event):void{
			if(shouchongState==ChongzhiModel.ST_Active){
				var re:JudgeResult=chongzhiModel.couldLingquShouchongLibao();
				if(re.success){
					C2SEmitter.useItem(chongzhiModel.shouchongLibaoId);
					
				}
			}
			if(shouchongState==ChongzhiModel.ST_UnActive){
				wm.close();
				if(!WindowManager.getCurrentOpenedWindowByClass(ChongzhiWindow)){
					WindowManager.openOnlyWinodw(ChongzhiWindow);
				}
			}
			if(shouchongState==ChongzhiModel.ST_Complete){
				wm.close();
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