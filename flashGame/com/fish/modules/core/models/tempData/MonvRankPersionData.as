package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.gameVO.MonvpersionVO;
	import com.fish.modules.core.models.ChuzhenModel;

	public class MonvRankPersionData
	{
		public static const ShowCardMaxNum:int=5;
		public function MonvRankPersionData()
		{
		}
		
		private var _vo:MonvpersionVO;
		private var _cardArray:Array;
		
		public function get cardXidArray():Array
		{
			return _cardArray;
		}
		
		public function setVo($vo:MonvpersionVO):MonvRankPersionData
		{
			_vo=$vo;
			_cardArray=[];
			try{
				var cardObj:Object=JSON.parse(_vo.kapais);
				var maxNum:int=ChuzhenModel.MaxChuzhenNum;
				var index:int;
				var count:int=0;
				for(index=1;index<=maxNum;index++)
				{
					if(null!=cardObj[index])
					{
						_cardArray.push(cardObj[index]);
						count++;
						if(count>=ShowCardMaxNum)
						{
							break;
						}
					}
				}
			}catch(e:Error){
				
			}
			return this;
		}
		
		public function get guanka():int
		{
			return _vo.monvGuanka;
		}
		
		public function get rank():int
		{
			return _vo.userRank;
		}
		
		public function get level():int
		{
			return _vo.userLevel;
		}
		public function get name():String
		{
			return _vo.userName;
		}
		public function get userId():int
		{
			return _vo.uid;
		}
	}
}