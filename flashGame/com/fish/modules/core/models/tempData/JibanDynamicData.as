package com.fish.modules.core.models.tempData
{
	import com.ghostlmm.xmldata.Node_jiban;
	
	import flash.utils.Dictionary;

	public class JibanDynamicData
	{
		
		public static const FC_Qiquan:uint=0x31ff1c;
		public static const FC_Buquan:uint=0xc2c2c2;
		
		public function JibanDynamicData()
		{
		}
		
		private var _structDic:Dictionary;
		
		private var _node:Node_jiban;
		
		public var jibanId:int;
		
		public var kapaiXids:Array;
		public var effects:Array;
		
		/**
		 *   是否对此卡牌有效
		 */
		public function hasEffectToCard(baseId:int):Boolean{
			var struct:JibanStruct=_structDic[baseId];
			return struct.effect;
		}
		
		public function get name():String
		{
			return _node.name;
		}
		public function get desc():String
		{
			return _node.desc;
		}
		
		public function get jibanNode():Node_jiban
		{
			return _node;
		}
		
		/**  重置
		 * */
		public function reset($node:Node_jiban):void{
			_structDic=new Dictionary();
			_node=$node;
			jibanId=$node.id;
			kapaiXids=JSON.parse(_node.kapai_id) as Array;
			effects=JSON.parse(_node.kapai_effect) as Array;
			for(var index:int=0; index< kapaiXids.length;index++)
			{
				var kid:int=kapaiXids[index];
				var struct:JibanStruct=new JibanStruct();
				struct.kapaiXid=kid;
				struct.hasOwn=false;
				struct.effect=effects[index]>0;
				_structDic[kid]=struct;
			}
		}
		
		/**   是否收集完毕
		 * */
		public function hasCollect():Boolean
		{
			for each(var struct:JibanStruct in _structDic){
				if(struct.hasOwn==false){
					return false;
				}
			}
			return true;
		}
		
		/**   是否收集到一个卡牌
		 * */
		public function hasCollectByKapaiXid(xid:int):Boolean
		{
			var struct:JibanStruct=_structDic[xid];
			if(struct){
				return struct.hasOwn;
			}
			return false;
		}
		
		/**  添加卡牌
		 * */
		public function putKapai(kid:int):void
		{
			if(_structDic[kid]){
				(_structDic[kid] as JibanStruct).hasOwn=true;
			}
		}
		
		
		
	}
	
}

class JibanStruct{
	public var kapaiXid:int=0;
	public var hasOwn:Boolean=false;
	public var effect:Boolean;
}