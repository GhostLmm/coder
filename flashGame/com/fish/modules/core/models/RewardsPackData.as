package com.fish.modules.core.models
{
	import com.fish.modules.core.ResourceConst;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_equip;
	import com.ghostlmm.xmldata.XMLDataManager;

	public class RewardsPackData
	{
		public static const Title_BuySuccess:String="购买成功";
		public static const Desc_BuySuccess:String="恭喜你获得以下物品";
		
		public function RewardsPackData()
		{
		}
		public var desc:String;
		public var tiltle:String;
		public var bonus_money:int;
		public var bouns_cash:int;
		public var bouns_tili:int;
		public var bouns_yongqi:int;
		public var bouns_shengwang:int;
		public var bouns_ronglian:int;
		public var bouns_rongyu:int;
		
		public var bouns_itmes:Object;
		public var bouns_equips:Object;
		public var bouns_baoshis:Object;
		
		public var bouns_exp:int;
		
		public var bouns_star:int;
		
		public var itemObjArray:Array;
		
		
		public function initFromData(data:Object):void{
			bonus_money=data.money;
			bouns_cash=data.cash;
			bouns_yongqi=data.yongqi;
			bouns_shengwang=data.shengwang;
			bouns_tili=data.tili;
			bouns_itmes=data.item;
			bouns_equips=data.equip;
			bouns_baoshis=data.baoshi;
			bouns_ronglian=data[ResourceConst.R_ronglian];
			bouns_rongyu=data[ResourceConst.R_rongyu];
			bouns_exp=data[ResourceConst.R_exp];
			bouns_star=data[ResourceConst.R_exp];
		}
		public static function computeTotalRewards(_rewadsArray:Array):RewardsPackData
		{
			var result:RewardsPackData=new RewardsPackData();
			result.bonus_money=0;
			result.bouns_cash=0;
			result.bouns_yongqi=0;
			result.bouns_shengwang=0;
			result.bouns_tili=0;
			result.bouns_ronglian=0;
			result.bouns_rongyu=0;
			result.bouns_exp=0;
			result.bouns_star=0;
			
			result.bouns_itmes={};
			result.bouns_equips={};
			result.bouns_baoshis={};
			
			var index:int;
			for(index=0;index<_rewadsArray.length;index++)
			{
				var rewards:RewardsPackData=_rewadsArray[index] as RewardsPackData;
				result.bonus_money+=rewards.bonus_money;
				result.bouns_cash+=rewards.bouns_cash;
				result.bouns_yongqi+=rewards.bouns_yongqi;
				result.bouns_shengwang+=rewards.bouns_shengwang;
				result.bouns_tili+=rewards.bouns_tili;
				result.bouns_ronglian+=rewards.bouns_ronglian;
				result.bouns_rongyu+=rewards.bouns_rongyu;
				result.bouns_exp+=rewards.bouns_exp;
				result.bouns_star+=rewards.bouns_star;
				
				var key:String;
				if(null!=rewards.bouns_itmes)
				{
					for (key in rewards.bouns_itmes)
					{
						if(!result.bouns_itmes.hasOwnProperty(key))
						{
							result.bouns_itmes[key]=0;
						}
						result.bouns_itmes[key]+=rewards.bouns_itmes[key];
					}
				}
				if(null!=rewards.bouns_equips)
				{
					for (key in rewards.bouns_equips)
					{
						if(!result.bouns_equips.hasOwnProperty(key))
						{
							result.bouns_equips[key]=0;
						}
						result.bouns_equips[key]+=rewards.bouns_equips[key];
					}
				}
				if(null!=rewards.bouns_baoshis)
				{
					for (key in rewards.bouns_baoshis)
					{
						if(!result.bouns_baoshis.hasOwnProperty(key))
						{
							result.bouns_baoshis[key]=0;
						}
						result.bouns_baoshis[key]+=rewards.bouns_baoshis[key];
					}
				}
			}
			return result;
		}
		public static function couldLingqu(_data:RewardsPackData):JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			var needGrid:int;
			if(_data.bouns_equips){
				for(var key:String in _data.bouns_equips){
					var node:Node_equip=XMLDataManager.getEquipById(int(key));
					if(node){
						if(!EquipModel.isGun(node) && node.type){
							needGrid+=int(_data.bouns_equips[key]);
						}
					}
				}
			}
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			var idleNum:int=bagModel.getIdleEquipGridNum();
			if(needGrid>idleNum){
				re.code=JudgeResult.CD_BagGridNotEnough;
				re.desc="装备格子不够";
				return re;
			}
			re.success=true;
			return re;
		}
		private static function createItem(result:Array,source:Object,type:String):void{
			if(source==null) return ;
//			for(var obj:Object in source){
				
//			}
			var sourceObj:Object=source;
			if(source is String){
				try{
					sourceObj=JSON.parse(source as String);
				}catch(e:Error){trace(e.message)}
			}
			
			
			
			for(var key:String in sourceObj){
				if( int(key)>0 && int(sourceObj[key])>0 ){
					result.push({"key":type,"xid":int(key),"num":int(sourceObj[key])});
				}
			}
		}
		
		public function createItemDatas():Array{
			
			if(itemObjArray!=null){
				return itemObjArray;
			}
			
			var re:Array=[];
			var key:String;
			var obj:Object;
			if(bonus_money>0){
				re.push({"key":"money","num":bonus_money,"xid":0});
			}
			if(bouns_cash>0){
				re.push({"key":"cash","num":bouns_cash,"xid":0});
			}
			if(bouns_exp>0){
				re.push({"key":ResourceConst.R_exp,"num":bouns_exp});
			}
			if(bouns_tili>0){
				re.push({"key":"tili","num":bouns_tili,"xid":0});
			}
			if(bouns_star>0){
				re.push({"key":"star","num":bouns_star,"xid":0});
			}
			if(bouns_yongqi>0){
				re.push({"key":"yongqi","num":bouns_yongqi,"xid":0});
			}
			if(bouns_shengwang>0){
				re.push({"key":"shengwang","num":bouns_shengwang,"xid":0});
			}
			if(bouns_rongyu>0){
				re.push({"key":ResourceConst.R_rongyu,"num":bouns_rongyu,"xid":0});
			}
			createItem(re,bouns_itmes,ResourceConst.R_item);
			createItem(re,bouns_equips,ResourceConst.R_equip);
			createItem(re,bouns_baoshis,ResourceConst.R_baoshi);
			return re;
		}
		
		
	}
}