package view.viewData
{
	import com.fish.modules.core.gameVO.XiongbarankVO;
	
	import snake.GameUtil;

	public class XiongbaData
	{
		private var m_Vo:XiongbarankVO;
		
		public function XiongbaData()
		{
		}
		public function setData(_data:Object):void
		{
			m_Vo=_data as XiongbarankVO;
		}
		public function get rank():int
		{
			return m_Vo.rank;
		}
		public function get level():int
		{
			return m_Vo.userLevel;
		}
		public function get name():String
		{
			return m_Vo.userName;
		}
		public function get userId():int
		{
			return m_Vo.uid;
		}	
		public function get chongbaiCount():int
		{
			return m_Vo.chongbaiCount;
		}
		public function get leitaiRank():int
		{
			return m_Vo.leitaiRank;
		}
		public function get moveFrame():Array
		{
			return JSON.parse(m_Vo.userMovieFrame) as Array;
		}
		public function get Colors():Array
		{
			return GameUtil.turnArryStringToUint(m_Vo.userColors) as Array;
		}
		public function get mainGun():int
		{
			return m_Vo.userGunId;
		}
		public function get userImage():int
		{
			return m_Vo.userImage;
		}
	}
}