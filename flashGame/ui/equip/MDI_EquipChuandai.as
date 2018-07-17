package ui.equip
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.tempData.EquipAttrAttach;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import snake.viewdata.PropertyData;
	
	import util.Util;
	
	public class MDI_EquipChuandai extends Mediator
	{
		[Inject]
		public var wm:EquipChuandaiWindow;
		[Inject]
		public var equipModel:EquipModel;
		[Inject]
		public var heroModel:HeroModel;
		[Inject]
		public var bagModel:BagModel;
		
		private var equipData:EquipData;
		public function MDI_EquipChuandai()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			equipData=wm._params as EquipData;
			
			wm._equipItem.loadData(equipData);
			
			
			if(heroModel.heroVo.level>=equipData.node.lv){
				Util.setSuccessText(wm._fnt_dengjixianzhi,equipData.node.lv.toString());
			}else{
				Util.setFailText(wm._fnt_dengjixianzhi,equipData.node.lv.toString());
			}
			
			wm._equipNbMc.loadData(equipData);
			wm._equipNbMc.onClick_SN.add(onClickNb);
			
			if(wm._equipNbMc.needShow){
				wm.showRight();
			}
			
			/*var attrAttachs:Array=equipModel.calcChuandaiAttrDef(equipData);
			
			for (var index:int=0 ; index<wm._equipAttrBars.length; index++){
				if(attrAttachs.length>index){
					(wm._equipAttrBars[index] as EquipShuxingBar).loadData(attrAttachs[index]);
				}else{
					(wm._equipAttrBars[index] as EquipShuxingBar).setVisible(false);
				}
			}*/
//			var contrastPer:PropertyData;
//			if(equipData.hasArmy() || equipData.isGun()){
//				// 只需要显示正常
//				contrastPer=null;
//			}else{
//				bag
//			}
			
			
			showAttrBar();
			
			addViewListener(wm._btn_chuandai,TqtEvent.BUTTON_CLICK,onChuandai);
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			
			S2CHanlder.instance.message_SN.add(onMessage);
			
			
			
		}
		
		private function showAttrBar():void{
			var source:PropertyData=equipData.calcProperty_Base();
			var contrast:PropertyData;
			var gridEquip:EquipData=equipModel.getEquipByArmyType(equipData.node.type);
			var index:int=0;
			var attr:String;
			if(gridEquip!=null){
				contrast=gridEquip.calcProperty_Base();
				var attrArray:Array=[];
				for each (attr in EquipAttrAttach.AttrNames){
					if(source[attr]>0 || contrast[attr]>0){
						attrArray.push(attr);
					}
				}
				for each (attr in attrArray){
					(wm._equipAttrBars[index] as EquipShuxingBar).loadData(attr,source[attr],source[attr]-contrast[attr]);
					(wm._equipAttrBars[index] as EquipShuxingBar).setVisible(true);
					index++;
				}
			}else{
				var map:Object=source.toAttrMap();
				for(attr in  map){
					(wm._equipAttrBars[index] as EquipShuxingBar).loadData(attr,map[attr],map[attr]);
					(wm._equipAttrBars[index] as EquipShuxingBar).setVisible(true);
					index++;
				}
					
			}
			
			while(index<wm._equipAttrBars.length){
				(wm._equipAttrBars[index] as EquipShuxingBar).setVisible(false);
				index++;
			}
			
			
		}
			
		
		
		private function onClickNb():void{
			wm.close();
		}
		
		private function onMessage(msType:String):void{
			if(msType==C2SEmitter.REQ_EquipArmhandler){
//				Util.flow("武器装备成功");
				Music.playFX(Music.FX_equip);
				wm.close();
			}
		}
		
		private function onChuandai(evt:Event):void{
			var re:JudgeResult=equipModel.couldArayEquip(equipData);
			if(re.success){
				C2SEmitter.armyEquip(equipData.id,heroModel.heroId);
			}else{
				Util.flow(re.desc);
			}
		}
		
		
		
		public override function destroy():void
		{
			S2CHanlder.instance.message_SN.remove(onMessage);
			// todo
			super.destroy();
		}
	}
}