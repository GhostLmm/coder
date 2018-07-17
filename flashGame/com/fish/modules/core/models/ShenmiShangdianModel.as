package com.fish.modules.core.models
{
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.ShenmishangdianVO;
	import com.fish.modules.core.gameVO.UserVO;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_heidian;
	import com.ghostlmm.xmldata.Node_vip;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.utils.Dictionary;
	
	import r1.deval.D;
	
	import ui.shop.ViewData_Shenmishangdian;
	
	import util.SwitchManager;

	public class ShenmiShangdianModel extends BaseModel
	{
		public var shenmiVo:ShenmishangdianVO;
		private var hasBuyDic:Dictionary;
		public var cacheBuyArray:Array;
		public function ShenmiShangdianModel()
		{
			super();
		}
		
		public override function destory():void
		{
			super.destory();
		}
		
		private function createHasBuyDic():void
		{
			hasBuyDic=new Dictionary();
			try{
				var ids:Array=JSON.parse(shenmiVo.buyItems) as Array;
				for each(var id:int in ids){
					hasBuyDic[id]=true;
				}
			}catch(e:Error){
				
			}
		}
		/**  是否已经购买过一次了
		 * */
		public function hasBuyItem(id:int):Boolean{
			return hasBuyDic[id];
		}
		
		protected override function onGameInitComplete():void
		{
			shenmiVo=GameVOManager.getInstance().shenmishangdian;
			shenmiVo.changAttr_SN.add(onAttrChange);
			createHasBuyDic();
		}
		
		private function onAttrChange(attrName:String,newValue:*,oldValue:*,vo:*):void
		{
			if(attrName=="buyItems"){
				createHasBuyDic();
			}
		}
		
		/** 是否有可以购买的商品  **/
		public function hasCouldBuy():Boolean{
			var result:Boolean=false;
			try{
				var ids:Array = JSON.parse(shenmiVo.goumaiItems) as Array;
				for each(var id:int in ids){
					if(!hasBuyItem(id)){
						result=true;
						break;
					}
				}
			}catch(e:Error){}
			return result;
		}
		
		public function getShangdianItemArray():Array
		{
			var items:Array=[];
			try{
				
				var ids:Array = JSON.parse(shenmiVo.goumaiItems) as Array;
				var viewData:ViewData_Shenmishangdian;
				for each(var id:int in ids){
					var node:Node_heidian=XMLDataManager.getHeidianById(id);
					viewData=new ViewData_Shenmishangdian();
					viewData.node=node;
					items.push(viewData);
				}
				
				if(SwitchManager.getInstance().Switch_VIP_Icon){
					var userModel:UserModel=Context.getInjectInstance(UserModel);
					var vipLevel:int=userModel.vipLevel;
					var vipList:Array=XMLDataManager.Node_vipArray;
					var index:int;
					for(index=0;index<vipList.length;index++)
					{
						var vipNode:Node_vip=vipList[index];
						if(vipNode.id>vipLevel)
						{
							var num:int;
							var m:int;
							for(m=0;m<vipNode.desc5_num;m++)
							{
								viewData=new ViewData_Shenmishangdian();
								viewData.needVipLevel=vipNode.id;
								items.push(viewData);
							}
						}
					}
				}
				
				
			}catch(e:Error){
				
			}
			return items;
		}
		private var refreshBaseCost:int=0;
		private function getBaseRefreshCost():int
		{
			if(refreshBaseCost==0)
			{
				refreshBaseCost=int(XMLDataManager.getConstById("heidian_shuaxin_cost").value);
			}
			return refreshBaseCost;
		}
		private var refreshExpression:String;
		public function getRfreshExpression():String
		{
			if(null==refreshExpression)
			{
				refreshExpression=XMLDataManager.getExpressionById("heidian_cost").expression;
			}
			return refreshExpression;
		}
		public function getRfreshCashCost():int
		{
			var computeObj:Object={"heidian_shuaxin_cost":getBaseRefreshCost(),"shuaxin_count":(shenmiVo.shuaxinCount+1)};
			var compStr:String=getRfreshExpression();
			return D.evalToInt(compStr,computeObj);
		}
		/** 是否可以购买item
		 * */
		public function couldBuyShimiItem(id:int):JudgeResult
		{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			var node:Node_heidian=XMLDataManager.getHeidianById(id);
			var re:JudgeResult=new JudgeResult();			
			if(hasBuyItem(id)){
				re.success=false;
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc="已经购买过，下次更新在购买";
				return re;
			}			
			if(node.type==ResourceConst.R_equip){
				var bagModel:BagModel=Context.getInjectInstance(BagModel);
				if(bagModel.getIdleEquipGridNum()<1){
					re.code=JudgeResult.CD_BagGridNotEnough;
				}
				
//				re.desc="装备格子不够";
//				return re;
			}
			
			if(node.price_type==ResourceConst.R_cash){
				
				if(userModel.userVo.userCash<node.price){
					re.success=false;
					re.code=JudgeResult.CD_CashNotEnough;
					return re;
				}
			}
			if(node.price_type==ResourceConst.R_money)
			{
				if(userModel.userVo.userMoney<node.price){
					re.success=false;
					re.code=JudgeResult.CD_UserMoneyNotEnough;
					return re;
				}
			}
			re.success=true;
			return re;
		}

		public function couldRefreshShangdian():JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			var userVo:UserVO=GameVOManager.getInstance().user;
			if(getRfreshCashCost()>userVo.userCash)
			{
				re.success=false;
				re.code=JudgeResult.CD_CashNotEnough;
				return re;
			}
			re.success=true;
			return re;
		}
		public function getBuyAllItemNodeArray():Array
		{
			var resultArray:Array=[];
			var itemArray:Array=getShangdianItemArray();
			var index:int;
			for(index=0;index<itemArray.length;index++)
			{
				var data:ViewData_Shenmishangdian=itemArray[index] as ViewData_Shenmishangdian;
				if(null==data.node)
				{
					continue;
				}
				if(hasBuyItem(data.node.id))
				{
					continue;
				}
				resultArray.push(data);
			}
			return resultArray;
		}
		public function couldBuyAllItem():JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			var userVo:UserVO=GameVOManager.getInstance().user; 
			var itemArray:Array=getShangdianItemArray();
			var needMoney:int=0;
			var needCash:int=0;
			var index:int;
			
			var equipNum:int=0;
			for(index=0;index<itemArray.length;index++)
			{
				var data:ViewData_Shenmishangdian=itemArray[index] as ViewData_Shenmishangdian;
				var node:Node_heidian=data.node;
				if(null==node)
				{
					continue;
				}
				if(hasBuyItem(node.id))
				{
					continue;
				}
				if(node.type==ResourceConst.R_equip){
					equipNum++;
				}
				if(node.price_type==ResourceConst.R_money)
				{
					needMoney+=node.price;
				}
				else if(node.price_type==ResourceConst.R_cash)
				{
					needCash+=node.price;
				}
			}
			
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			if(equipNum>bagModel.getIdleEquipGridNum()){
				re.code=JudgeResult.CD_BagGridNotEnough;
//				re.desc="装备格子不够";
//				return re;
			}
			
			if(userVo.userCash<needCash)
			{
				re.success=false;
				re.code=JudgeResult.CD_CashNotEnough;
				return re;
			}
			if(userVo.userMoney<needMoney){
				re.success=false;
				re.code=JudgeResult.CD_UserMoneyNotEnough;
				re.desc="铜币不足";
				return re;
			}
			re.success=true;
			return re;
		}
	}
}