package ui.gun
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.HeroVO;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.tempData.WuqiData;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import util.Util;
	
	public class MDI_GenghuanQiangzhi extends Mediator
	{
		[Inject]
		public var wm:GenghuanqiangzhiWindow;
		[Inject]
		public var heroModel:HeroModel;
		[Inject]
		public var equipModel:EquipModel;
		
		
		private var equipArray:Array;
		
		public function MDI_GenghuanQiangzhi()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			
			wm._scr_gun.initClass(Item_GenghuanQiangzhi);
//			setDescInfo();
			loadGunData(true);
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
//			addViewListener(wm._btn_quxiao,TqtEvent.BUTTON_CLICK,wm.close);
//			addViewListener(wm._btn_queding,TqtEvent.BUTTON_CLICK,onClickQueding);
			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(msType==C2SEmitter.REQ_EquipGunArmhandler){
				if(code>0){
					Util.flow("枪支武器装备成功");
					wm.close();
//					resetGunData();
				}
			}
		}
		
		public function resetShow():void{
//			setDescInfo();
			loadGunData();
		}
		
		/*private function setDescInfo():void{
			wm._fnt_zhuqiang_num.text=heroModel.currentEquipMainWuqiNum.toString()+"/"+1;
			wm._fnt_fuqiang_num.text=heroModel.currentEquipMinorWuqiNum+"/"+HeroModel.CouldEquipMinorGunNum;
		}*/
		
		private function resetGunData():void{
			var heroVo:HeroVO=GameVOManager.getInstance().hero;
			for each(var wuqiData:WuqiData in equipArray){
				if(wuqiData.hasArmy()){
					if(heroVo.gunId==wuqiData.xid){
						wuqiData.gunState=WuqiData.ST_Main;
					}else{
						wuqiData.gunState=WuqiData.ST_Unload;
					}
				}else{
					wuqiData.gunState=WuqiData.ST_Unload;
				}
			}
			wm._scr_gun.setData(equipArray);
		}
		
		private function loadGunData(initFlag:Boolean=false):void{
			
			if(initFlag){
				equipArray=[];
				for each(var wuqi:WuqiData in heroModel.getWuqiArray()){
					if(wuqi.hasOwn()){
						equipArray.push(wuqi);
					}
				}
				equipArray.sort(compare);
			}
			
			wm._scr_gun.setData(equipArray);
		}
		
		private function compare(A:WuqiData,B:WuqiData):int{
//			var va:int,vb:int;
//			va+=A.gunState;
//			vb+=B.gunState;
			
			return A.gunState-B.gunState;
		}
		
//		private function onClickQueding(evt:Event):void{
//			var re:JudgeResult=heroModel.chouldGenghuaWuqi();
//			if(re.success){
//				var mainId:int;
//				var xids:Array=[];
//				for each(var wuqiData:WuqiData in heroModel.getWuqiArray()){
//					if(wuqiData.isMainGun()){
//						mainId=wuqiData.xid;
//						xids=[mainId].concat(xids);
//					}
//					/*if(wuqiData.isMinorGun()){
//						xids.push(wuqiData.xid);
//					}*/
//				}
//				C2SEmitter.armyWuqi(mainId,xids,heroModel.heroId);
//			}else{
//				Util.flow(re.desc);
//			}
//		}
		
		public override function destroy():void
		{
			// todo
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			heroModel.forceUpdateWuqi();
			super.destroy();
		}
	}
}