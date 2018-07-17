package ui.baoshi
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.BaoshiModel;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.tempData.BaoshiData;
	import com.fish.modules.core.models.tempData.EquipAttrAttach;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.fish.modules.core.models.tempData.EquipGridData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_baoshi;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.bag.BagWindow;
	import ui.equip.EquipCaozuoWindow;
	import ui.equip.MDI_EquipCaozuo;
	import ui.mc.ItemMc;
	import ui.widget.FontField;
	
	import util.Util;
	
	public class MDI_BaoshiTishi extends Mediator
	{
		[Inject]
		public var wm:BaoshiTishiWindow;
		[Inject]
		public var baoshiModel:BaoshiModel;
		[Inject]
		public var bagModel:BagModel;
		private var node:Node_baoshi;
		
		public function MDI_BaoshiTishi()
		{
			super();
		}
		private var op:String;
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			node=wm._params.node as Node_baoshi;
			
			
			op=wm._params.op;
			
			if(op==BaoshiTishiWindow.OP_Xiexia){
				wm._btn_xiangqian.setText(Util.getLanguage("宝石卸下"));
			}
			if(op==BaoshiTishiWindow.OP_Zhuanbei){
				wm._btn_xiangqian.setText(Util.getLanguage("宝石装备"));
			}
			
			wm._pos_item.fillWithObject(new ItemMc().loadData(node));
//			wm._fnt_name.text=node.name;
			Util.setItemName(wm._fnt_name,ResourceConst.R_baoshi,node.id);
			
			var attrArray:Array=EquipAttrAttach.getAttrArray(ResourceConst.R_baoshi,node.id);
			for(var index:int=0; index<2; index++){
				var fnt:FontField=wm._shuxingFntArray[index];
				
				if(attrArray.length>index){
					fnt.visible=true;
					var attr:String=attrArray[index];
					fnt.text=Util.getLanguageAttrAdd(attr,node[attr]);
				}else{
					fnt.visible=false;
				}
			}
			
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			addViewListener(wm._btn_update,TqtEvent.BUTTON_CLICK,onCLickUpdate);
			addViewListener(wm._btn_xiangqian,TqtEvent.BUTTON_CLICK,onCLikcxiangqian);
		}
		
		private function onCLickUpdate(evt:Event):void{
//			var baoshiData:BaoshiData=baoshiModel.getBaoshiDataByXid(node.id);
//			if(baoshiData && baoshiData.hasNextLevel()){
			if(node.jinhua_id!=0){
				WindowManager.openOnlyWinodw(BaoshiShengjiWindow,wm._params);
				wm.close();
				
			}else{
				Util.flow("宝石无法升级等级提示");
			}
		}
		private function onCLikcxiangqian(evt:Event):void{
			
			if(op==BaoshiTishiWindow.OP_Xiexia){
				var pos:int=int(wm._params.pos);
				var equipId:Number=wm._params.eid;
				var gid:int=wm._params.gid;
				var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
				
				var gridData:EquipGridData=bagModel.getEquipGridById(gid);
				
				var baoshiObj:Object=gridData.getBaoshiStateObj();
				//			trace("选择了 宝石："+xid);
				delete baoshiObj[pos];
				C2SEmitter.baoshiArmy(0,equipId,gid,baoshiObj,heroModel.heroId);
				wm.close();
			}
			if(op==BaoshiTishiWindow.OP_Zhuanbei){
				WindowManager.openOnlyWinodw(EquipCaozuoWindow,{label:EquipCaozuoWindow.LB_Xiangqian});
				wm.close();
				WindowManager.closeWindowByClass(BagWindow);
			}
			
			
		}
		
		
		public override function destroy():void
		{
			// todo
			super.destroy();
		}
		
	}
}