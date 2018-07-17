package ui.equip
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.BaoshiModel;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.tempData.BaoshiData;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.fish.modules.core.models.tempData.EquipGridData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_equip_baoshi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import core.event.TqtEvent;
	
	import ui.mc.JiangliMc;
	
	public class MDI_BaoshiSaixuan extends Mediator
	{
		[Inject]
		public var wm:BaoshiSaixuanWindow;
		[Inject]
		public var baoshiModel:BaoshiModel;
		[Inject]
		public var bagModel:BagModel;
		
//		private var pos:int;
		
		public function MDI_BaoshiSaixuan()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			var pos:int=int(wm._params.pos);
			var node:Node_equip_baoshi=XMLDataManager.getEquip_baoshiById(pos);
			var baoshiType:int=node.type;
			
			var baoshiArray:Array=baoshiModel.getBaoshiDataArray();
			
			var slectBaoshiArray:Array=[];
			for each(var baoshiData:BaoshiData in baoshiArray){
				if(baoshiData.node.type==baoshiType){
					slectBaoshiArray.push({key:ResourceConst.R_baoshi,xid:baoshiData.node.id,num:baoshiData.num});
				}
			}
			
			wm._scr_baoshi.initClass(JiangliMc);
			wm._scr_baoshi.setData(slectBaoshiArray);
			
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			addViewListener(wm._scr_baoshi,TqtEvent.SCROLL_SELECTED,onSelectBaoshi);
			
		}
		
		private function onSelectBaoshi(evt:TqtEvent):void{
			
			
			var pos:int=int(wm._params.pos);
			var xid:int=evt.data.data.xid;
			var equipId:Number=wm._params.eid;
			var gid:int=wm._params.gid;
			var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
			
			var gridData:EquipGridData=bagModel.getEquipGridById(gid);
			
			var baoshiObj:Object=gridData.getBaoshiStateObj();
//			trace("选择了 宝石："+xid);
			baoshiObj[pos]=xid;
			C2SEmitter.baoshiArmy(1,equipId,gid,baoshiObj,heroModel.heroId);
			wm.close();
		}
		
		public override function destroy():void
		{
			// todo
			super.destroy();
		}
	}
}