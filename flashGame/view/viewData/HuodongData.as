package view.viewData
{
	import com.fish.modules.core.gameVO.HuodongswitchVO;
	import com.fish.modules.core.models.GrowthModel;
	import com.fish.modules.core.models.HuoDongModel;
	import com.fish.modules.core.models.HuodongControlModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.ShoujiModel;
	import com.fish.modules.core.models.tempData.ShoujiItemData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_huodong;
	import com.ghostlmm.xmldata.Node_huodong_chongzhi;
	import com.ghostlmm.xmldata.Node_huodong_lv;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	public class HuodongData
	{
		public var huodongSwitchVo:HuodongswitchVO;
		public var xml:Node_huodong;
		public var couldHarvest:Boolean;
		
		
		public function HuodongData()
		{
		}
		
		public function resetHarvestState():void{
			couldHarvest=false;
			switch(xml.type){
				case HuodongControlModel.HuodongType_Tili:
					setHarvest_Tili();
					break;
				case HuodongControlModel.HuodongType_Canbai:
					setHarvest_Canbai();
					break;
				case HuodongControlModel.HuodongType_Chongji:
					setHarvest_Chongji();
					break;
				case HuodongControlModel.HuodongType_Chongzhi:
					setHarvest_Chongzhi();
					break;
				case HuodongControlModel.HuodongType_Laba:
					setHarvest_Laba();
					break;
				case HuodongControlModel.HuodongType_Guaguale:
					setHarvest_Guaguale();
					break;
				case HuodongControlModel.HuodongType_Shouji:
					setHarvest_Shouji();
					break;
				case HuodongControlModel.HuodongType_Growth:
					setHarvest_Growth();
					break;
			}
		}
		
		public function initFromVo($vo:HuodongswitchVO):void{
			huodongSwitchVo=$vo;
			xml=XMLDataManager.Node_huodongDic[huodongSwitchVo.id];
			resetHarvestState();
		}
		
		private function setHarvest_Tili():void{
			var huodongModel:HuoDongModel=Context.getInjectInstance(HuoDongModel);
			if(huodongModel.couldLingqu(1).success || huodongModel.couldLingqu(1).success){
				couldHarvest=true;
			}
		}
		
		private function setHarvest_Canbai():void{
			var huodongModel:HuoDongModel=Context.getInjectInstance(HuoDongModel);
			if(huodongModel.couldCanbai()){
				couldHarvest=true;
			}
		}
		private function setHarvest_Chongji():void{
			var huodongControlModel:HuodongControlModel=Context.getInjectInstance(HuodongControlModel);
			for each(var node:Node_huodong_lv in XMLDataManager.Node_huodong_lvArray){
				if(huodongControlModel.couldLinquChongjiLVJiangli(node).success){
					couldHarvest=true;
					break;
				}
			}
		}
		private function setHarvest_Chongzhi():void{
			var huodongControlModel:HuodongControlModel=Context.getInjectInstance(HuodongControlModel);
			for each(var node:Node_huodong_chongzhi in XMLDataManager.Node_huodong_chongzhiArray){
				if(huodongControlModel.couldLinquChongzhiJiangli(node).success){
					couldHarvest=true;
					break ;
				}
			}
		}
		
		private function setHarvest_Laba():void{
			var huodongControlModel:HuodongControlModel=Context.getInjectInstance(HuodongControlModel);
			var re:JudgeResult=huodongControlModel.couldLaba();
			if(re.success || re.code==JudgeResult.CD_CashNotEnough){
				couldHarvest=true;
			}
		}
		private function setHarvest_Guaguale():void{
			var huodongControlModel:HuodongControlModel=Context.getInjectInstance(HuodongControlModel);
			if(huodongControlModel.couldGuaguale().success){
				couldHarvest=true;
			}
		}
		private function setHarvest_Shouji():void{
//			var huodongControlModel:HuodongControlModel=Context.getInjectInstance(HuodongControlModel);
			var shoujiModel:ShoujiModel=Context.getInjectInstance(ShoujiModel);
			var itemArray:Array=shoujiModel.getShoujiItemData();
			for each(var data:ShoujiItemData in itemArray){
				if(shoujiModel.couldDuihuan(data).success){
					couldHarvest=true;
					break;
				}
			}
		}
		
		private function setHarvest_Growth():void{
			// 可以购买， vip 等级足够
			var growthModel:GrowthModel=Context.getInjectInstance(GrowthModel);
			if( !growthModel.isAreadyBuy() && growthModel.isVipLevelCanAfford() ){
				couldHarvest=true;
				return ;
			}
			
			for each(var data:GrowthPlanData in growthModel.rewardsArray){
				if(growthModel.couldLinqu(data).success){
					couldHarvest=true;
					return ;
				}
			}
			
			
		}
		
		public function get priority():int
		{
			return xml.priority;
		}
		
		public function toString():String{
			return "活动\t"+xml.name+"\t"+xml.id;
		}
	}
}

