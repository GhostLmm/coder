package ui.friend
{
	import com.fish.modules.core.gameVO.FriendVO;

	public class FriendItemData
	{
		public var m_friendVo:FriendVO;
		
		public function FriendItemData()
		{
		}
		public function setData(_data:Object):void
		{
			m_friendVo=_data as FriendVO;	
		}
		public function get level():int
		{
			return m_friendVo.userLevel
		}
		public function get userName():String
		{
			return m_friendVo.userName;
		}
		public function get userRank():int
		{
			return m_friendVo.userRank;
		}
	}
}