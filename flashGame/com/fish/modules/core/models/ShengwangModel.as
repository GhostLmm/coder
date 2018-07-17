package com.fish.modules.core.models
{
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.LimitbuyVO;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_rongyu_shangdian;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.utils.Dictionary;
	
	import org.osflash.signals.Signal;

	public class ShengwangModel extends BaseModel
	{
		public var cacheBuyXid:int;
		public function ShengwangModel()
		{
			super();
		}
		public var LimitChange_SN:Signal=new Signal();
		public var limitBuyVo:LimitbuyVO;
		protected override function onGameInitComplete():void
		{
			limitBuyVo=GameVOManager.getInstance().limitbuy;
			limitBuyVo.update_SN.add(onAttrChange);
		}
		private var needFresh:Boolean=false;
		private var needFreshXmlList:Boolean=false;
		private function onAttrChange():void
		{
			needFresh=true;
			needFreshXmlList=true;
			LimitChange_SN.dispatch();
		}
		private var _areadyBuyInfoDic:Dictionary;
		public function get areadyBuyInfoArray():Dictionary
		{
			if((null==_areadyBuyInfoDic)||(needFresh))
			{
				updateAreadyBuyInfo();
			}
			return _areadyBuyInfoDic;
		}
		private function updateAreadyBuyInfo():void
		{
			if(null==_areadyBuyInfoDic)
			{
				_areadyBuyInfoDic=new Dictionary();
			}
			var infoObj:Object=JSON.parse(limitBuyVo.shengwangBuyItems);
			for(var key:String in infoObj)
			{
				_areadyBuyInfoDic[key]=infoObj[key];
			}
			needFresh=false;
		}
		public function get shengwangDuihuanItemArray():Array
		{
			return XMLDataManager.Node_rongyu_shangdianArray;
		}
		/**
		 * 能否购买声望物品
		 */
		public static function couldGoumai(_shengwangNode:Node_rongyu_shangdian):JudgeResult
		{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			var re:JudgeResult=new JudgeResult();
			if(!userModel.couldRongyuBuy(_shengwangNode.price))
			{
				re.success=false;
				re.desc="声望不足";
				return re;
			}
			re.success=true;
			return re;
		}
		public function getAreadyBuyNum(_xid:int):int
		{
			var areadyBuyDic:Dictionary=areadyBuyInfoArray;
			if(null!=areadyBuyDic[_xid])
			{
				return areadyBuyDic[_xid];
			}
			return 0;
		}
		public function checkIfReachLimit(_shengwangNode:Node_rongyu_shangdian):Boolean
		{
			if(_shengwangNode.limit==0)
			{
				return false;
			}
			if(getAreadyBuyNum(_shengwangNode.id)>=_shengwangNode.limit)
			{
				return true;
			}
			return false;
		}
		private var _shengwangItemslist:Array;
		public function get shengwangItemList():Array
		{
			if((null==_shengwangItemslist)||(needFreshXmlList))
			{
				updateShengwangList();
			}
			return _shengwangItemslist;		
		}
		private function updateShengwangList():void
		{
			var array:Array=XMLDataManager.Node_rongyu_shangdianArray.concat([]);
			array.sort(compare);
			_shengwangItemslist=array;
			needFreshXmlList=false;
		}
		private function compare(A:Node_rongyu_shangdian,B:Node_rongyu_shangdian):int
		{
			var weightA:int=0;
			var weightB:int=0;
			if(!checkIfReachLimit(A))
			{
				weightA+=1000;
			}
			if(!checkIfReachLimit(B))
			{
				weightB+=1000;
			}
			if(A.id<B.id)
			{
				weightA+=10;
			}
			if(B.id<A.id)
			{
				weightB+=10;
			}
			return weightB-weightA;
		}
	}
}