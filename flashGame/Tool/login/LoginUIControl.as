package Tool.login
{
	import org.osflash.signals.Signal;

	public class LoginUIControl
	{
		public static const UI_MSG_CloseZhuce:String="UI_MSG_CloseZhuce";
		public static const UI_MSG_CloseDenglu:String="UI_MSG_CloseDenglu";
		public static const UI_MSG_CloseXuanqu:String="UI_MSG_CloseXuanqu";
		public static const UI_MSG_FromDengluToZhuce:String="UI_MSG_FromDengluToZhuce";
		
		public var uiMessage_SN:Signal;
		
		public function LoginUIControl()
		{
			uiMessage_SN=new Signal(String);
		}
		private static var m_instance:LoginUIControl;
		public static function getInstance():LoginUIControl
		{
			if(null==m_instance)
			{
				m_instance=new LoginUIControl();
			}
			return m_instance;
		}
	}
}