package view.viewData
{
	import com.fish.modules.core.gameVO.CardcountVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.TujianVO;
	import com.ghostlmm.xmldata.Node_kapai;
	import com.ghostlmm.xmldata.Node_tujian;
	import com.ghostlmm.xmldata.XMLDataManager;

	public class TujianData
	{
		public var tujianVo:TujianVO;
		public var tujianXml:Node_tujian;
		public var needCardIdArray:Array;
		public function TujianData(xml:Node_tujian)
		{
			tujianXml=xml;
			tujianVo=GameVOManager.getInstance().getTujianVOByxid(tujianXml.id);
			needCardIdArray=JSON.parse(tujianXml.need_card_ids) as Array;
			needCardIdArray.sort(compare);
		}
		private function compare(A:int,B:int):int
		{
			var weightA:int = 0;
			var weightB:int = 0;
			var countVoA:CardcountVO=GameVOManager.getInstance().getCardcountVOByxid(A);
			if(null!=countVoA)
			{
				weightA+=1000;
			}
			var countVoB:CardcountVO=GameVOManager.getInstance().getCardcountVOByxid(B);
			if(null!=countVoB)
			{
				weightB+=1000;
			}			
			var cardAXml:Node_kapai=XMLDataManager.getKapaiById(A);
			var cardBXml:Node_kapai=XMLDataManager.getKapaiById(B);
			if(cardAXml.star>=cardBXml.star)
			{
				weightA+=100;
			}
			else
			{
				weightB+=100;
			}
			return weightB-weightA;
		}
		public function get needCardTotalKinds():int
		{
			return needCardIdArray.length;
		}
		public function get areadyHadKinds():int
		{
			var result:int=0;
			var index:int;
			for(index=0;index<needCardIdArray.length;index++)
			{
				var cardId:int=needCardIdArray[index];
				var countVo:CardcountVO=GameVOManager.getInstance().getCardcountVOByxid(cardId);
				if(null!=countVo)
				{
					result++;
				}
			}
			return result;
		}
		public function isAreadyLingqu():Boolean
		{
			if(tujianVo)
			{
				return true;
			}
			return false;
		}
		public function destory():void
		{
			
		}
		public function couldLingqu():Boolean
		{
			if(areadyHadKinds<needCardTotalKinds)
			{
				return false;
			}
			return true;
		}
	}
}