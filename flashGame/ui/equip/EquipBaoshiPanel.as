package ui.equip
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.BaoshiModel;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.UserModel;
	import com.fish.modules.core.models.tempData.BaoshiData;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.fish.modules.core.models.tempData.EquipGridData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_baoshi;
	import com.ghostlmm.xmldata.Node_equip_baoshi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Panel_Base;
	
	public class EquipBaoshiPanel extends Panel_Base
	{
		
		private var posArray:Array;
		private var baoshiItemArray:Array;
		private var _btn_xiexia:Button;
		
		private var equipData:EquipData;
		private var gridData:EquipGridData;
		private var bagModel:BagModel;
		private var baoshiModel:BaoshiModel;
		private var userModel:UserModel;
		
		public function EquipBaoshiPanel()
		{
			super();
		}
		
		protected override function get panelClassName():Class{
			return SceneEquipBaoshi;
		}
		
		protected override function initModule():void{
			var mc:SceneEquipBaoshi=material as SceneEquipBaoshi;
			posArray=[];
			baoshiItemArray=[];
			for(var index:int=1; index<=5; index++){
				var pos:Position=new Position(mc["pos_"+index]);
				posArray.push(pos);
				var baoshiItem:EquipBaoshiItem=new EquipBaoshiItem();
				pos.fillWithObject(baoshiItem);
				baoshiItemArray.push(baoshiItem);
			}
			_btn_xiexia=new Button(mc.btn_xiexia);
		}
		public override function clear():void{
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			if(posArray){
				for each(var pos:Position in posArray){
					pos.destory();
				}
				posArray=null;
			}
			if(baoshiItemArray){
				for each(var baoshiItem:EquipBaoshiItem in baoshiItemArray){
					baoshiItem.destory();
				}
				baoshiItemArray=null;
			}
			if(_btn_xiexia) {_btn_xiexia.destory(); _btn_xiexia=null;}
			super.clear();
		}
		
		private function initData():void{
			equipData=(Context.getInjectInstance(MDI_EquipCaozuo) as MDI_EquipCaozuo).curEquipData;
			bagModel=Context.getInjectInstance(BagModel);
			gridData=bagModel.getEquipGridById(equipData.node.type);
			baoshiModel=Context.getInjectInstance(BaoshiModel);
			userModel=Context.getInjectInstance(UserModel);
		}
		
		
		protected override function registerEvent():void{
			addTargetEvent(_btn_xiexia,TqtEvent.BUTTON_CLICK,onXiexia);
			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(msType==C2SEmitter.REQ_EquipBaoshiArmHandler){
				update();
				if(c2s.equipInfo.baoshiXid<=0){
					Util.flow("宝石卸载成功");
				}else{
					Util.flow("宝石镶嵌成功");
					Music.playFX(Music.FX_succsexiangqian);
				}
			}
			if(msType==C2SEmitter.REQ_EquipBaoshiJinhuaHandler){
				update();
			}
		}
		
		public override function update():void{
			setShow();
		}
		
		private function onXiexia(evt:Event):void{
			var hasBaoshi:Boolean=gridData.hasLoadbaoshi();
			if(hasBaoshi){
				var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
				C2SEmitter.baoshiArmy(-1,equipData.id,gridData.id,{},heroModel.heroId);
			}else{
				Util.flow("没有宝石可以卸下提示");
			}
		}
		
		protected override function setShow():void{
			initData();
			
			for(var pos:int=1; pos<=5; pos++){
				var baoshiItem:EquipBaoshiItem=baoshiItemArray[pos-1];
				
				var data:Object=createBaoshiItemData(pos);
				baoshiItem.loadData(data);
				
			}
		}
			
		
		private function createBaoshiItemData(pos:int):Object{
			
//			var baoshiData:BaoshiData=m_data.baoshi;
//			var posId:int=m_data.pos;
//			var gridId:int=m_data.gridId;
//			var isLock:Boolean=m_data.isLock;
//			var needLevel:int=m_data.needLevel;
			
			var baoshiId:int=gridData.getBaoshiInPos(pos);
			var node:Node_equip_baoshi=XMLDataManager.getEquip_baoshiById(pos);
			
//			var baoshiData:BaoshiData=baoshiModel.getBaoshiDataByXid(baoshiId);
			var baoshiNode:Node_baoshi=XMLDataManager.getBaoshiById(baoshiId);
//			if(baoshiId>0){
//				
//			}
			
			var needLevel:int=node.star_limit;
//			var needLevel:int=0;
			
			var isLock:Boolean=(needLevel>gridData.lv_xing);
			
			var obj:Object={};
			obj.baoshiNode=baoshiNode;
			obj.pos=pos;
			obj.gridId=gridData.id;
			obj.isLock=isLock;
			obj.needLevel=needLevel;
			obj.eid=equipData.id;
			return obj;
		}
		
	}
}