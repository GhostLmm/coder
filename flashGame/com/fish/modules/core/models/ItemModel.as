package com.fish.modules.core.models
{
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.ItemVO;
	import com.fish.modules.core.models.tempData.ItemData;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.utils.Dictionary;

	public class ItemModel extends BaseModel
	{
		private var _itemArray:Array;
		private var _itemDic:Dictionary;
		private var _needUpdate:Boolean=true;
		
		public static const TAG_suipian:String="suipian";
		public static const TAG_Yaoji:String="yaoji";
		public static const TAG_Qianghua:String="qianghua";
		public static const TAG_Liaotian:String="liaotian";
		
		
		public function ItemModel()
		{
			super();
		}
		
		protected override function onGameInitComplete():void
		{
			GameVOManager.getInstance().arrayVoOP_SN.add(onVoArrayChange);
			
			
		}
		
		public function updateItems():void{
			if(_needUpdate){
				_itemArray=[];
				_itemDic=new Dictionary();
				var shouchongLibaoid:int=(Context.getInjectInstance(ChongzhiModel) as ChongzhiModel).shouchongLibaoId;
				for each (var vo:ItemVO in GameVOManager.getInstance().items){
					if(vo.num>0){
						if(vo.xid!=shouchongLibaoid){
							var itemData:ItemData=new ItemData();
							itemData.initVo(vo);
							_itemArray.push(itemData);
							_itemDic[itemData.xid]=itemData;
						}
					}
				}
				_needUpdate=false;
			}
		}
		
		private function onVoArrayChange(cls:Class,array:Array):void{
			if(cls==ItemVO){
				_needUpdate=true;
				modelUpdata_SN.dispatch();
			}
		}
		
		public function getItemDataByXid(xid:int):ItemData{
			updateItems();
			return _itemDic[xid];
		}
			
		public function getItemDataArray():Array{
			updateItems();
			return _itemArray;
		}
		
		public function getItemNumById(itemId:int):int{
			var itemData:ItemData=getItemDataByXid(itemId);
			if(itemData==null) return 0;
			return itemData.vo.num;
		}
		
		public function checkVipItemIsAreadyBuy(_xid:int):Boolean
		{
			var itemVo:ItemVO=GameVOManager.getInstance().getItemVOByxid(_xid);
			if(null==itemVo)
			{
				return false;
			}
			return true;
		}
		
		/** 是否可以出售item **/
		public function couldSellItem(itemId:int):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			var itemData:ItemData=getItemDataByXid(itemId);
			if(itemData==null || itemData.num<=0){
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc="没有该物品，无法出售";
				return re;
			}
			if(!itemData.couldSell()){
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc="该物品无法出售";
				return re;
			}
			re.success=true;
			return re;
		}
		
		public override function destory():void
		{
			GameVOManager.getInstance().arrayVoOP_SN.remove(onVoArrayChange);
			super.destory();
		}
	}
}