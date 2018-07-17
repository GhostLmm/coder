package view.viewData
{
	import com.fish.modules.core.gameVO.HongbaoVO;
	import com.fish.modules.core.models.GonghuiModel;

	public class BanghuiHongbaoData
	{
		public var vo:HongbaoVO;
		public function BanghuiHongbaoData()
		{
		}
		public function get userName():String
		{
			return vo.userName;
		}
		public function get leftHongbaoNum():int
		{
			return vo.leftCount;
		}
		public function get HongbaoCashRange():String
		{
			return GonghuiModel.getHongbaoRewardMinMaxDesc(vo.chongzhiCash);
		}
	}
}