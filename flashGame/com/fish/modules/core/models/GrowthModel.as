package com.fish.modules.core.models
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.gameVO.BaseVo;
	import com.fish.modules.core.gameVO.ChengzhangVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.UserVO;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_jihua;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import util.Util;
	
	import view.viewData.GrowthPlanData;

	public class GrowthModel extends BaseModel
	{
		public var cacheXmlId:int;
		public var growthVo:ChengzhangVO;
		public function GrowthModel()
		{
			super();
		}
		protected override function onGameInitComplete():void
		{
			growthVo=GameVOManager.getInstance().chengzhang;
			growthVo.changAttr_SN.add(onAttrChange);
		}
		private function onAttrChange(attr:String,newValue:*,oldValue:*,vo:BaseVo):void
		{
			switch(attr)
			{
				case "lingquMsg":
					needFresh=true;
					break;			
			}
			modelUpdata_SN.dispatch();
		}
		private var needFresh:Boolean=false;
		private var _rewardsArray:Array;
		public function get rewardsArray():Array
		{
			if((null==_rewardsArray)||(needFresh))
			{
				update();
			}
			return _rewardsArray;
		}
		private function update():void
		{
			if(_rewardsArray==null) _rewardsArray=[];
			_rewardsArray.length=0;
			var areadyLinquArray:Array=[];
			try{
				areadyLinquArray=JSON.parse(growthVo.lingquMsg) as Array;
			}catch(e:Error){}
			var xmllist:Array=XMLDataManager.Node_jihuaArray;
			var index:int;
			for(index=0;index<xmllist.length;index++)
			{
				var xml:Node_jihua=xmllist[index] as Node_jihua;
				var growthData:GrowthPlanData=new GrowthPlanData();
				growthData.xml=xml;
				if(areadyLinquArray.indexOf(xml.id)==-1)
				{
					growthData.isLingqu=false;
				}
				else
				{
					growthData.isLingqu=true;
				}
				_rewardsArray.push(growthData);
			}
			needFresh=false;
		}
		public function get jihuaNeedVipLevel():int
		{
			return XMLDataManager.getConstById("chengzhangjihua_vip").value;
		}
		public function get jihuaNeedCash():int
		{
			return XMLDataManager.getConstById("chengzhangjihua_cash").value;
		}
		public function isAreadyBuy():Boolean
		{
			if(growthVo.hasGoumai>0)
			{
				return true;
			}
			return false;
		}
		public function isVipLevelCanAfford():Boolean
		{
			var userVo:UserVO=(Context.getInjectInstance(UserModel) as UserModel).userVo;
			if(userVo.vipLevel>=jihuaNeedVipLevel)
			{
				return true;
			}
			return false;
		}
		public function buyGrowthPlan():void
		{
			C2SEmitter.buyChengzhangjihua();
		}
		public function lingqu(_id:int):void
		{
			C2SEmitter.lingquChengzhangReward(_id);
		}
		public static function getTotalRewardCash():int
		{
			var result:int=0;
			var index:int;
			var xmlList:Array=XMLDataManager.Node_jihuaArray;
			for(index=0;index<xmlList.length;index++)
			{
				var node:Node_jihua=xmlList[index] as Node_jihua;
				result+=node.cash;
			}
			return result;
		}
		
		public function couldLinqu(data:GrowthPlanData):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			
			if(!isAreadyBuy())
			{
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc=("尚未购买成长计划，不能领取");
				return re;	
			}
			if(data.isLingqu)
			{
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc=("已经领取过，不能再次领取");
				return re;	
			}
			if(!data.levelCouldLingqu())
			{
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc=Util.getLanguage("达到等级才能领取成长计划",data.xml.lv_limit);
				return re;	
			}
			re.success=true;
			return re;
		}
		
	}
}