package ui.bag
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.EquipVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.tempData.BagData;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_equip;
	
	import util.Util;
	
	import view.Panel_Base;
	
	public class Bag_Equip_Panel extends BagPanel
	{
		public function Bag_Equip_Panel()
		{
			super();
		}
		
		protected override function initMoulde():void{
			_scroll.initClass(BagEquipItem);
//			GameVOManager.getInstance().arrayVoOP_SN.add(onVoArrayChange);
			(Context.getInjectInstance(EquipModel) as EquipModel).modelUpdata_SN.add(setShow);
			S2CHanlder.instance.message_SN.add(onMessage);
		}
		
		private function onMessage(msType:String):void{
			if(msType==C2SEmitter.REQ_EquipUnlockHandler){
				setShow();
				Util.flow("解锁包裹栏成功提示");
			}
		}
		
		public function getEquipItemByXid(xid:int):BagEquipItem{
			if(_scroll.dataArray){
				for(var index:int=0; index<_scroll.dataArray.length; index++){
					var bagData:BagData=_scroll.dataArray[index];
					if(bagData.data && (bagData.data is EquipData)){
						var node:EquipData=bagData.data as EquipData;
						if(node.node.id==xid){
							var obj:Object= _scroll.getRealyItemByIndex(index);
							if(obj!=null){
								return obj as BagEquipItem;
							}else{
								return null;
							}
						}
					}
				}
				return null;
			}
			return null;
			
		}
		
		protected override function setShow():void{
			_scroll.setData((Context.getInjectInstance(BagModel) as BagModel).createEquipBagDatas(),0 ,true);
		}
//		private function onVoArrayChange(cls:Class,array:Array):void{
//			if(cls==EquipVO){
//				setShow();
//			}
//		}
		public override function clear():void{
//			GameVOManager.getInstance().arrayVoOP_SN.remove(onVoArrayChange);
			(Context.getInjectInstance(EquipModel) as EquipModel).modelUpdata_SN.remove(setShow);
			S2CHanlder.instance.message_SN.remove(onMessage);
			super.clear();
		}
	}
}