package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.gameVO.BosspaimingpersionVO;
	import com.fish.modules.core.models.ChuzhenModel;

	public class BossRankPersionData
	{
		public static const ShowCardMaxNum:int=5;
		public function BossRankPersionData()
		{
		}
		
		private var _vo:BosspaimingpersionVO;
		private var _cardArray:Array;
		
		public function get cardXidArray():Array
		{
			return _cardArray;
		}
		
		public function setVo($vo:BosspaimingpersionVO):void
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
		}
		
		public function get atkXueliang():int
		{
			return _vo.atkXueliang;
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