package view.viewData
{
	import com.fish.modules.core.gameVO.LingqujiluVO;

	public class BanghuiHongbaoLingquLog
	{
		public var vo:LingqujiluVO;
		public function BanghuiHongbaoLingquLog()
		{
		}
		public function get lingquUserName():String
		{
			return vo.lingquName;
		}
		public function get chongzhiUserName():String
		{
			return vo.chongzhiName;
		}
		public function get lingquCashNum():int
		{
			return vo.lingquCount;
		}
	}
}