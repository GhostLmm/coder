package ui.baoshi
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.BaoshiModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.tempData.BaoshiData;
	import com.fish.modules.core.models.tempData.EquipAttrAttach;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_baoshi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.mc.ItemMc;
	import ui.mc.JiangliMc;
	import ui.widget.FontField;
	
	import util.Util;
	
	public class MDI_BaoshiShengji extends Mediator
	{
		[Inject]
		public var wm:BaoshiShengjiWindow;
		[Inject]
		public var baoshiModel:BaoshiModel;
		
//		private var baoshiData:BaoshiData;
		private var node:Node_baoshi;
		private var eid:Number=0;
		private var gid:int=0;
		private var pos:int=0;
		private var hasEquip:Boolean=false;
//		{node:baoshiNode,op:BaoshiTishiWindow.OP_Xiexia,eid:equipId,gid:gridId,pos:posId})
		public function MDI_BaoshiShengji()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			
			node=wm._params.node;
			if(wm._params.hasOwnProperty("eid")){
				eid=wm._params.eid;
				gid=wm._params.gid;
				pos=wm._params.pos;
				hasEquip=true;
			}
			
//			baoshiData=baoshiModel.getBaoshiDataByXid(node.id);
			
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			addViewListener(wm._btn_add,TqtEvent.BUTTON_CLICK,onClickAdd);
			addViewListener(wm._btn_shengji,TqtEvent.BUTTON_CLICK,onClickShengji);
			
			S2CHanlder.instance.messageMax_SN.add(onMessage);
			
			setShow();
		}
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(msType==C2SEmitter.REQ_EquipBaoshiJinhuaHandler){
				var oldXid:int=c2s.equipInfo.baoshiXid;
				var oldNode:Node_baoshi=XMLDataManager.getBaoshiById(oldXid);
				node=XMLDataManager.getBaoshiById(oldNode.jinhua_id);
//				baoshiData=baoshiModel.getBaoshiDataByXid(node.id);
				setShow();
				if(node.jinhua_id!=0){
					Util.flow("宝石升级成功提示");
				}else{
					Util.flow("宝石升级到最高级成功提示");
				}
			}
		}
		private function onClickAdd(evt:Event):void{
			
		}
		private function onClickShengji(evt:Event):void{
			var re:JudgeResult=baoshiModel.couldUpdateBaoshi(node.id,hasEquip);
			if(re.success){
				C2SEmitter.baoshiUpdate(node.id,eid,gid,pos);
			}else{
				Util.flow(re.desc);
			}
		}
		
		private function setShow():void{
			wm._pos_item.fillWithObject(new ItemMc().loadData(node));
			Util.setItemName(wm._fnt_name,ResourceConst.R_baoshi,node.id);
			
			var attrArray:Array=EquipAttrAttach.getAttrArray(ResourceConst.R_baoshi,node.id);
			
			var nextNode:Node_baoshi=node;
			var needNode:Node_baoshi=node;
			if(node.jinhua_id!=0){
				nextNode=XMLDataManager.getBaoshiById(node.jinhua_id);
				needNode=XMLDataManager.getBaoshiById(node.jinhua_need_id);
			}
			
			wm._fnt_desc.text=node.name;
			wm._fnt_desc_up.text=nextNode.name;
			for(var index:int=0; index<2; index++){
				var ft1:FontField=wm["_fnt_shuxing"+(index+1)];
				var ft2:FontField=wm["_fnt_shuxing"+(index+1)+"_up"];
				var mcUp:MovieClip=wm["_mc_up"+(index+1)];
				if(attrArray.length>index){
					var attr:String=attrArray[index];
					ft1.visible=true;
					ft2.visible=true;
					mcUp.visible=true;
					
					ft1.text=Util.getLanguageAttrAdd(attr,node[attr]);
					ft2.text=Util.getLanguageAttrAdd(attr,nextNode[attr]);
				}else{
					ft1.visible=false;
					ft2.visible=false;
					mcUp.visible=false;
				}
			}
			
			wm._pos_cailiao.fillWithObject(new JiangliMc().loadData({key:ResourceConst.R_baoshi,xid:needNode.id}));
//			wm._pos_cailiao.fillWithObject(new ItemMc().loadData(needNode));
			wm._prg_suipian.devider=node.jinhua_base_num;
			wm._prg_suipian.progress=baoshiModel.hasJinghuaNum(node.id,hasEquip);
			
		}
		
		
		public override function destroy():void
		{
			// todo
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			super.destroy();
		}
	}
}