package Tool.account
{
	import org.osflash.signals.Signal;

	public interface IAccount 
	{
		function get openId():String;
		function get token():String;
		function get platname():String;
		/**  平台账号登陆，异步过程，完成后抛出 成功和 失败事件
		 * */
		function startPlatLogin():void;
		
		function get loginComplete_SN():Signal;
		function get loginFail_SN():Signal;
		
		function suportLogout():Boolean;
		function logout():void;
		
		function get accountState():String;
	}
}