package ui.equip
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.fish.modules.core.models.tempData.WuqiData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.bag.BagWindow;
	import ui.bag.HeroDetailWidow;
	import ui.widget.FontField;
	
	import util.Util;
	
	public class MDI_EquipOpen extends Mediator
	{
		[Inject]
		public var wm:EquipOpenWindow;
		[Inject]
		public var equipModel:EquipModel;
		[Inject]
		public var heroModel:HeroModel;
		
		private var equipData:EquipData;
		public function MDI_EquipOpen()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			
			equipData=wm._params as EquipData;
			
			wm._itemEquip.loadData(equipData);
			
			wm.equipNbMc.loadData(equipData);
			wm.equipNbMc.onClick_SN.add(onClickNb);
			
			if(wm.equipNbMc.needShow){
				wm.showRight();
			}
			
			if(equipData is WuqiData){
				wm._btn_xiexia.visible=false;
			}
			
//			wm..text=equipData.node.lv.toString();
			
			if(heroModel.heroVo.level>=equipData.node.lv){
				Util.setSuccessText(wm._fnt_dengjixianzhi,equipData.node.lv.toString());
			}else{
				Util.setFailText(wm._fnt_dengjixianzhi,equipData.node.lv.toString());
			}
			
			var attrMap:Object=equipData.calcProperty_NONB().toAttrMap();
			var index:int=0;
			for (var key:String in attrMap){
				if(index<wm._equipShuxinBars.length){
					(wm._equipShuxinBars[index] as EquipShuxingBar).loadData(key,attrMap[key]);
					(wm._equipShuxinBars[index] as EquipShuxingBar).setVisible(true);
					index++;
				}
			}
			while(index<wm._equipShuxinBars.length){
				(wm._equipShuxinBars[index] as EquipShuxingBar).setVisible(false);
				index++;
			}
			
			
			
			addViewListener(wm._btn_close, TqtEvent.BUTTON_CLICK,wm.close);
			addViewListener(wm._btn_qianghua,TqtEvent.BUTTON_CLICK,onClickQianghua);
//			addViewListener(wm._btn_nb,TqtEvent.BUTTON_CLICK,onClickNb);
			addViewListener(wm._btn_shengxing,TqtEvent.BUTTON_CLICK,onClickShengxin);
			addViewListener(wm._btn_xiangqian,TqtEvent.BUTTON_CLICK,onClickXiangqian);
			addViewListener(wm._btn_xiexia,TqtEvent.BUTTON_CLICK,onClickXiexia);
			
			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(msType==C2SEmitter.REQ_EquipArmhandler){
				if(code>0 && c2s.heroInfo && c2s.heroInfo.heroId==0){
//					Util.flow("装备卸载成功提示");
					wm.close();
				}
			}
		}
		
		
		/*private function onClickTunshi(evt:Event):void{
			WindowManager.openOnlyWinodw(ShenzhuangTunshiWindow,equipData);
			closeSelfAndBagWindow();
		}*/
		
		private function onClickQianghua(evt:Event):void{
			WindowManager.openOnlyWinodw(EquipCaozuoWindow,{eid:equipData.id,label:EquipCaozuoWindow.LB_Bianqiang});
			closeSelfAndBagWindow();
		}
		
		private function closeSelfAndBagWindow():void{
			wm.close();
			WindowManager.closeWindowByClass(BagWindow);
			WindowManager.closeWindowByClass(HeroDetailWidow);
		}
		
		private function onClickNb():void{
			closeSelfAndBagWindow();
		}
		private function onClickShengxin(evt:Event):void{
			WindowManager.openOnlyWinodw(EquipCaozuoWindow,{eid:equipData.id,label:EquipCaozuoWindow.LB_Shengxin});
			
			closeSelfAndBagWindow();
		}
		private function onClickXiangqian(evt:Event):void{
			WindowManager.openOnlyWinodw(EquipCaozuoWindow,{eid:equipData.id,label:EquipCaozuoWindow.LB_Xiangqian});
			closeSelfAndBagWindow();
		}
		private function onClickXiexia(evt:Event):void{
			var re:JudgeResult=equipModel.couldUnloadEquip(equipData);
			if(re.success){
				C2SEmitter.armyEquip(equipData.id,0);
			}else{
				Util.flow(re.desc);
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