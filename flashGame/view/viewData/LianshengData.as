package view.viewData
{
	import com.fish.modules.core.gameVO.ZhanlirankVO;
	
	import snake.GameUtil;

	public class LianshengData
	{
		private var m_Vo:ZhanlirankVO;
		
		public function LianshengData()
		{
		}
		public function setData(_data:Object):void
		{
			m_Vo=_data as ZhanlirankVO;
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
		public function get zhandouli():int
		{
			return m_Vo.zhandouli;
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