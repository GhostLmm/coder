package Tool.account
{
	import org.osflash.signals.Signal;
	
	public class BaseAccount  implements IAccount
	{
		protected var _complete_SN:Signal;
		protected var _fail_SN:Signal;
		protected var _openId:String;
		protected var _token:String;
		
		protected var _state:String;
		
		public function BaseAccount()
		{
			_complete_SN=new Signal(IAccount,Object);
			_fail_SN=new Signal(IAccount,Object);
		}
		
		public function get openId():String
		{
			return _openId;
		}
		
		public function get token():String
		{
			return _token;
		}
		
		public function get platname():String
		{
			throw new Error(this+" platname 没有初始化");
			return null;
		}
		
		public function startPlatLogin():void
		{
			
		}
		
		public function get loginComplete_SN():Signal
		{
			return _complete_SN;
		}
		
		public function get loginFail_SN():Signal
		{
			return _fail_SN;
		}
		
		public function suportLogout():Boolean
		{
			return false;
		}
		
		public function logout():void
		{
		}
		
		public function get accountState():String
		{
			return _state;
		}
	}
}