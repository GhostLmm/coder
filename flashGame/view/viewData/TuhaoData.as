package view.viewData
{
	import com.fish.modules.core.gameVO.TuhaorankVO;
	
	import snake.GameUtil;

	public class TuhaoData
	{
		private var m_Vo:TuhaorankVO;
		
		public function TuhaoData()
		{
		}
		public function setData(_data:Object):void
		{
			m_Vo=_data as TuhaorankVO;
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
		public function get bishiCount():int
		{
			return m_Vo.bishiCount;
		}
		public function get vipLevel():int
		{
			return m_Vo.vipLevel;
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