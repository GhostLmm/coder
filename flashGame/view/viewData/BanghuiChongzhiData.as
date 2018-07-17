package view.viewData
{
	import com.fish.modules.core.gameVO.ChongzhijiluVO;
	import com.fish.modules.core.models.GonghuiModel;

	public class BanghuiChongzhiData
	{
		public var vo:ChongzhijiluVO;
		public function BanghuiChongzhiData()
		{
		}
		public function get userName():String
		{
			return vo.userChongzhi;
		}
		public function get chongzhiNum():int
		{
			return vo.chonghziCash;
		}
		public function get fanhuanNum():int
		{
			return Math.floor(chongzhiNum*GonghuiModel.HongbaoTotalPercent);
		}
	}
}