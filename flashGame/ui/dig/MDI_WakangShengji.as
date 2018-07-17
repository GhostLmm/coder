package ui.dig
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.GuankaModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.MapModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_dig_lv;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.mc.ItemMc;
	
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_WakangShengji extends Mediator
	{
		[Inject]
		public var wm:WakuangShengjiWindow;
		[Inject]
		public var guankaModel:GuankaModel;
		[Inject]
		public var mapModel:MapModel;
		
		public function MDI_WakangShengji()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			setShow();
			
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			addViewListener(wm._btn_shengji,TqtEvent.BUTTON_CLICK,onClickShengji);
			
//			S2CHanlder.instance.messageMax_SN.add(onMessage);
			guankaModel.wakuangShengji_SN.add(onShengji);
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(msType==C2SEmitter.REQ_DigUpgradeHandler){
				if(code>0){
					Util.flow("挖矿升级成功提示");
					setShow();
				}
			}
		}
		
		private function onShengji():void{
			Util.flow("挖矿升级成功提示");
			setShow();
		}
		
		private function onClickShengji(evt:Event):void{
			var re:JudgeResult=guankaModel.couldShengjiWakuang();
			if(re.success){
				C2SEmitter.wakuangShengji();
			}else{
				CommonControlFun.proccessJudgeResult(re);
			}
		}
		
		private function setShow():void{
			var curNode:Node_dig_lv=XMLDataManager.getDig_lvById(guankaModel.curDigLevel);
			var nextNode:Node_dig_lv=curNode;
			if(guankaModel.hasNextLevel()){
				nextNode=XMLDataManager.getDig_lvById(guankaModel.curDigLevel+1);
			}
			wm._shouyiMC1.loadData(curNode);
			wm._shouyiMC2.loadData(nextNode);
			
			wm._fnt_money_num.text=curNode.need_money.toString();
			
			var needItemArray:Array=JSON.parse(curNode.need_item) as Array;
			var needItemNumArray:Array=JSON.parse(curNode.need_item_num) as Array;
			
			if(needItemArray.length>0 && needItemArray[0]>0){
				wm._mc_item.visible=true;
				wm._fnt_item_num.text=needItemNumArray[0];
				wm._pos_item.fillWithObject(new ItemMc().loadData(XMLDataManager.getItemById(needItemArray[0])));
			}else{
				wm._mc_item.visible=false;
			}
			
			var desc:String=Util.getLanguage("挖矿升级副本提示",XMLDataManager.getFubenById(curNode.need_fuben).name);
			if(mapModel.hasPassFuben(curNode.need_fuben)){
				Util.setSuccessText(wm._fnt_shengji_desc,desc);
				wm._fnt_shengji_desc.visible=false;
			}else{
				Util.setFailText(wm._fnt_shengji_desc,desc);
				wm._fnt_shengji_desc.visible=true;
			}
			
			
		}
		
		public override function destroy():void
		{
			// todo
			guankaModel.wakuangShengji_SN.remove(onShengji);
			super.destroy();
		}
	}
}