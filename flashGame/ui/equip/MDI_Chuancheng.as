package ui.equip
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_Chuancheng extends Mediator
	{
		[Inject]
		public var equipModel:EquipModel;
		[Inject]
		public var wm:ChuanchengWindow;
		
		private var sourceEquip:EquipData;
		private var targetEquip:EquipData;
		
		private var equipArray:Array;
		
		public function MDI_Chuancheng()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			sourceEquip=wm._params as EquipData;
			
			showRightDesc();
			
			wm.sourceAddItem.loadData(sourceEquip);
			wm.targetAddItem.onClick_SN.add(onClickTarget);
			
			wm._scr_equip.initClass(EquipSelectItem);
			
			setShow_Right();
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			addViewListener(wm._btn_chuancheng,TqtEvent.BUTTON_CLICK,onChuancheng);
			
			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(msType==C2SEmitter.REQ_EquipNbExtendHandler){
				if(code>0){
					Util.flow("传承神装成功提示");
					wm.close();
				}
			}
		}
		
		private function showRightDesc():void{
			for(var index:int=0; index<2; index++){
				if(sourceEquip.shenzhuangAddAttrs.length>index){
					wm._chuanchengDescArray[index].visible=true;
					wm._chuanchengDescArray[index].text=Util.getLanguage("战斗属性增加提示_"+sourceEquip.shenzhuangAddAttrs[index],
						Math.round(sourceEquip.shenzhuanAddValues[index]*100) );
				}else{
					wm._chuanchengDescArray[index].visible=false;
				}
			}
			
			wm._fnt_money_num.text=sourceEquip.node_shenzhuang.need_money+"";
		}
		
		private function loadLeftData():void{
			equipArray=[];
			for each(var data:EquipData in equipModel.getEquipDatas() ){
				if(data.id!=sourceEquip.id && data.node.type==sourceEquip.node.type){
					equipArray.push(data);
				}
			}
			equipArray.sort(compare);
			
			for(var index:int=0; index<equipArray.length; index++){
				var euip:EquipData = equipArray[index];
				euip.tempIndex=index;
				euip.tempSelected=false;
			}
			
			wm._scr_equip.setData(equipArray);
		}
		
		private function onChuancheng(evt:Event):void{
			if(targetEquip==null){
				if(!wm.hasShowLeft){
					wm.showLeft();
					loadLeftData();
				}
				Util.flow("请选择传承装备提示");
				return ;
			}
			var re:JudgeResult=equipModel.couldChuancheng(sourceEquip,targetEquip);
			if(re.success){
				if(targetEquip.hasShenzhuang()){
					WindowManager.openAlert(Util.getLanguage("神装之间传承警告提示"),chuancheng);
				}else{
					chuancheng();
				}
			}else{
				CommonControlFun.proccessJudgeResult(re);
			}
			
			
			
			
		}
		
		private function chuancheng():void{
			C2SEmitter.shenzhuangChuancheng(sourceEquip.id,targetEquip.id);
		}
		
		private function setShow_Left():void{
			wm._scr_equip.setData(equipArray);
		}
		private function setShow_Right():void{
			wm.targetAddItem.loadData(targetEquip);
		}
		
		private function compare(A:EquipData,B:EquipData):int{
			var va:int;
			var vb:int;
			if(A.node.star>B.node.star){
				vb+=1000;
			}
			if(A.node.star<B.node.star){
				va+=1000;
			}
			if(A.node.type>B.node.type){
				va+=100;
			}
			if(A.node.type<B.node.type){
				vb+=100;
			}
			if(A.zandouliData.baseZandouli>B.zandouliData.baseZandouli){
				va+=1;
			}
			if(A.zandouliData.baseZandouli<B.zandouliData.baseZandouli){
				vb+=1;
			}
			return va-vb;
			
		}
		
		public function onScrSelected(index:int):void{
			var equipData:EquipData=equipArray[index];
			if(equipData.tempSelected){
				equipData.tempSelected=false;
				targetEquip=null;
				setShow_Right();
				setShow_Left();
			}else{
				if(targetEquip){
					targetEquip.tempSelected=false;
					targetEquip=null;
				}
				equipData.tempSelected=true;
				targetEquip=equipData;
				setShow_Right();
				setShow_Left();
			}
		}
		
		private function onClickTarget(targetAddItem:EquipAddItemMc):void{
			if(targetAddItem.data){
				targetAddItem.data.tempSelected=false;
				targetEquip=null;
				setShow_Right();
				setShow_Left();
			}else{
				if(!wm.hasShowLeft){
					wm.showLeft();
					loadLeftData();
				}
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