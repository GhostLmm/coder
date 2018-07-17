package ui.equip
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.ErrorCode;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.fish.modules.core.models.tempData.WuqiData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.bag.BagWindow;
	
	import util.SwitchManager;
	import util.Util;
	
	public class MDI_EquipCaozuo extends Mediator
	{
		[Inject]
		public var wm:EquipCaozuoWindow;
		[Inject]
		public var equipModel:EquipModel;
		[Inject]
		public var heroModel:HeroModel;
		
		[Inject]
		public var bagModel:BagModel;
		
		public var curEquipData:EquipData;
		
		private var hasFirstChange:Boolean=true;
		
		
		private var equipArray:Array;
		
		
		public function MDI_EquipCaozuo()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			wm._scr_equip.initClass(Item_Equip);
			
			addViewListener(wm._scr_equip,TqtEvent.SCROLL_SELECTED,onSelectEquip);
			
			wm.tweenCom_SN.addOnce(onTweenCom);
			
			if(SwitchManager.getInstance().Switch_ShowNotCompleteFn){
				wm._notOpenButton.visible=true;
			}else{
				wm._notOpenButton.visible=false;
			}
			
//			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		
		private function onTweenCom():void{
			loadLeftData();
			
			var targetIndex:int=0;
			if(wm._params && wm._params.hasOwnProperty("eid")){
				for (var index:int=0; index<equipArray.length; index++){
					var data:EquipData=equipArray[index];
					if(data.id==wm._params.eid){
						targetIndex=index;
						break;
					}
				}
			}
			if(wm._params && wm._params.hasOwnProperty("gid")){
				for (var index:int=0; index<equipArray.length; index++){
					var data:EquipData=equipArray[index];
					if(data.node.type==wm._params.gid){
						targetIndex=index;
						break;
					}
				}
			}
			
			
			
			
			
			wm._scr_equip.setSelectIndexOrData(targetIndex);
			
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			addViewListener(wm._notOpenButton,TqtEvent.BUTTON_CLICK,onClickNotOpen);
			bagModel.gridUpdate_SN.add(onGridUpdate);
		}
		
		private function onClickNotOpen(evt:Event):void{
			Util.flow("功能尚未开启，敬请期待");
		}
		
		
		private function onGridUpdate():void{
			loadLeftData();
		}
		
		private function loadLeftData():void{
			equipArray=equipModel.getArmyEquipDatas().concat();
			
			for each(var wuqi:WuqiData in heroModel.getWuqiArray()){
				if(wuqi.hasOwn()){
					equipArray.push(wuqi);
				}
			}
			
			var selectIndex:int=wm._scr_equip.currentSelectedIndex;
			
			equipArray.sort(compare);
			wm._scr_equip.setData(equipArray);
			wm._scr_equip.setSelectIndexOrData(selectIndex);
			
			trace("大小: "+equipArray.length);
		}
		
		private function compare(A:EquipData,B:EquipData):int{
			var va:int;var vb:int;
			if(A.node.type>B.node.type){
				va+=100;
			}
			if(A.node.type<B.node.type){
				vb+=100;
			}
			
			if( (A is WuqiData) && (B is WuqiData) ){
				va+=(A as WuqiData).gunState*1000;
				vb+=(B as WuqiData).gunState*1000;
			}
			
			return va-vb;
		}
		
//		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
//			if(msType==C2SEmitter.REQ_EquipEhanceHandler){
//				wm._labelSwitch.update();
//				if(code==ErrorCode.CaozuoFailError){
//					Util.flow("强化失败");
//				}else{
//					Util.flow("强化成功");
//				}
//			}
//		}
		
		private function onSelectEquip(evt:TqtEvent):void{
			curEquipData=evt.data.data;
			
			if(hasFirstChange){
				var targetLabel:String=EquipCaozuoWindow.LBArray[0];
				if(wm._params && wm._params.hasOwnProperty("label")){
					targetLabel=wm._params.label;
				}
				var index:int=EquipCaozuoWindow.LBArray.indexOf(targetLabel);
				wm._labelSwitch.changeShowPanel(wm._panelClassArray[index]);
				hasFirstChange=false;
			}
			wm._labelSwitch.update();
		}
		
		
		
		public override function destroy():void
		{
			// todo
//			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			wm.tweenCom_SN.remove(onTweenCom);
			bagModel.gridUpdate_SN.remove(onGridUpdate);
			super.destroy();
		}
	}
}