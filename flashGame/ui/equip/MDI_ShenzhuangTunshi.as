package ui.equip
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_equip_nb;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TimelineMax;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.mc.ItemMc;
	
	import util.Util;
	
	public class MDI_ShenzhuangTunshi extends Mediator
	{
		[Inject]
		public var equipModel:EquipModel;
		[Inject]
		public var wm:ShenzhuangTunshiWindow;
		
		private var sourceEquip:EquipData;
		
		private var equipArray:Array;
		
		private var timeLine:TimelineMax;
		
		public function MDI_ShenzhuangTunshi()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			
			sourceEquip=wm._params as EquipData;
			
			
			for each(var addItem:EquipAddItemMc in wm._equipAddItemArray){
				addItem.onClick_SN.add(onClickItem);
				addItem.loadData(null);
			}
			var xid:int=int(sourceEquip.node_shenzhuang.id/100)*100+1;
			var lv:int=1;
			while(true){
				var node:Node_equip_nb=XMLDataManager.getEquip_nbById(xid);
				wm._prg_exp.push(lv.toString(),node.need_exp);
				if(node.next_id!=0){
					xid=node.next_id;
					lv++;
				}else{
					break;
				}
			}
			
			
			wm._scr_equip.initClass(EquipSelectItem);
			
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			addViewListener(wm._btn_tunshi,TqtEvent.BUTTON_CLICK,onTunshiClick);
			addViewListener(wm._btn_yijianxuanze,TqtEvent.BUTTON_CLICK,onClickXuanzhe);
			
			
			setShowDescAndExp();
			
			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(msType==C2SEmitter.REQ_EquipNbLvupHandler){
				if(code>0){
					showTunshiMovie();
				}
			}
		}
		
		private function showTunshiMovie():void{
			
			wm.mouseChildren=false;
			wm.mouseEnabled=false;
			timeLine=new TimelineMax({onComplete:showComplete});
			var tweens:Array=[];
			/*for each(var item:RonglianSelectItem in selectItems){
				if(item.getItemMC()!=null){
					tweens.push(Util.tweenFly(item.getItemMC(),wm._scn_ronglian));
				}
			}*/
			
			for each(var addItem:EquipAddItemMc in wm._equipAddItemArray){
				if(addItem.getItemMC()!=null){
					tweens.push(Util.tweenFly(addItem.getItemMC(),wm._mainAddItem.display,null,0.5));
				}
			}
			
			
			timeLine.appendMultiple(tweens,0,"normal",0.1);
		}
		
		private function showComplete():void{
			wm.mouseChildren=true;
			wm.mouseEnabled=true;
			sourceEquip.resetShenzhuang();
			loadLeftData();
			setShowDescAndExp();
			for each(var addItem:EquipAddItemMc in wm._equipAddItemArray){
				addItem.loadData(null);
			}
			
			Util.flow("吞噬成功提示",sourceEquip.shenzhuangLv);
		}
		
		
		public function setShowDescAndExp():void{
			wm._mainAddItem.loadData(sourceEquip);
			for(var index:int=0; index<2; index++){
				if(sourceEquip.shenzhuangAddAttrs.length>index){
					wm._descFntArray[index].visible=true;
					wm._descFntArray[index].text=Util.getLanguage("战斗属性增加提示_"+sourceEquip.shenzhuangAddAttrs[index],
						Math.round(sourceEquip.shenzhuanAddValues[index]*100) );
				}else{
					wm._descFntArray[index].visible=false;
				}
			}
			wm._prg_exp.tweenSet(sourceEquip.shenzhuangLv.toString(),sourceEquip.shenzhuangExp);
//			wm._prg_exp.devider=sourceEquip.node_shenzhuang.need_exp;
//			wm._prg_exp.progress=sourceEquip.shenzhuangExp;
			wm._fnt_lv.text=sourceEquip.shenzhuangLv.toString();
		}
		
		
		private function loadLeftData():void{
			equipArray=[];
			for each(var data:EquipData in equipModel.getEquipShenzhuang()){
				if(!data.hasArmy()){
					if(data.id!=sourceEquip.id){
						equipArray.push(data);
					}
				}
			}
			
			equipArray.sort(compare);
			for(var index:int=0; index<equipArray.length; index++){
				var data:EquipData = equipArray[index];
				data.tempIndex=index;
				data.tempSelected=false;
			}
			
			wm._scr_equip.setData(equipArray);
		}
		private function compare(A:EquipData,B:EquipData):int{
//			return 0;
			var va:int;
			var vb:int;
			
			va+=1000*A.shenzhuangAddAttrs.length;
			vb+=1000*B.shenzhuangAddAttrs.length;
			
			if(A.shenzhuangLv>B.shenzhuangLv){
				va+=100;
			}
			if(A.shenzhuangLv<B.shenzhuangLv){
				vb+=100;
			}
			return va-vb;
			
		}
		
		private function onClickItem(item:EquipAddItemMc):void{
			if(item.data==null){
				// 显示left
				if(!wm.hasShowLeft){
					wm.showLeft();
					loadLeftData();
				}
				
				
			}else{
				item.data.tempSelected=false;
				item.loadData(null);
				setShow_Left();
			}
		}
		
		public function onScrSelected(index:int):void{
			var equipData:EquipData=equipArray[index];
			if(equipData.tempSelected){
				equipData.tempSelected=false;
				setShow_Right();
				setShow_Left();
			}else{
				var idleAddItems:Array=getNeedAddEquipItems();
				if(idleAddItems.length>0){
					equipData.tempSelected=true;
					(idleAddItems[0] as EquipAddItemMc).loadData(equipData);
					setShow_Left();
				}else{
					Util.flow("吞噬装备填满提示");
				}
			}
		}
		
		private function getNeedAddEquipItems():Array{
			var re:Array=[];
			for each(var item:EquipAddItemMc in wm._equipAddItemArray){
				if(item.data==null || item.data.tempSelected==false){
					re.push(item);
				}
			}
			return re;
		}
		
		private function setShow_Left():void{
			wm._scr_equip.setData(equipArray);
		}
		
		private function setShow_Right():void{
			for each(var addItem:EquipAddItemMc in wm._equipAddItemArray){
				if(addItem.data && addItem.data.tempSelected==false){
					addItem.loadData(null);
				}
			}
		}
		
		private function onClickXuanzhe(evt:Event):void{
			var idleAddItems:Array=getNeedAddEquipItems();
			
			if(idleAddItems.length==0){
				Util.flow("吞噬装备填满提示");
				return ;
			}
			
			if(!wm.hasShowLeft){
				wm.showLeft();
				loadLeftData();
			}
			
			var idleIndex:int=0;
			for each(var data:EquipData in equipArray){
				if(idleIndex>=idleAddItems.length) break;
				if(data.tempSelected==false){
					data.tempSelected=true;
					(idleAddItems[idleIndex] as EquipAddItemMc).loadData(data);
					idleIndex++;
				}
			}
			setShow_Left();
		}
		private function onTunshiClick(evt:Event):void{
			var tunshiDatas:Array=[];
			for each(var addItem:EquipAddItemMc in wm._equipAddItemArray){
				if(addItem.data){
					tunshiDatas.push(addItem.data);
				}
			}
			if(tunshiDatas.length==0){
				Util.flow("请先选择吞噬装备提示");
				return ;
			}
//			showTunshiMovie();
//			return;
			
			var re:JudgeResult=equipModel.couldTunshi(sourceEquip,tunshiDatas);
			if(re.success){
				var list:Array=[];
				for each(var tunshiData:EquipData in tunshiDatas){
					list.push(tunshiData.id);
				}
				C2SEmitter.shenzhuangTunshi(sourceEquip.id,list);
			}else{
				Util.flow(re.desc);
			}
		}
		
		
		
		
		public override function destroy():void
		{
			// todo
			if(timeLine){
				timeLine.clear();
				timeLine=null;
			}
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			super.destroy();
		}
	}
}