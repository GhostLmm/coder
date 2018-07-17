package Tool.sns
{
	import org.osflash.signals.Signal;

	public interface ISnsPlat
	{
		function get snsType():String;
		
		/**   优先级，多平台共存时，优先级高的先使用
		 * */
		function get priority():int;
		
		/**   平台openId
		 * */
		function get openId():String;
		/**   平台验证码
		 * */
		function get token():String;
		
		function get loginFailSingal():Signal;
		
		function get loginSuccessSingal():Signal;
		
		function login():void;
		
		function logout():void;
		
		function clearLoginInfo():void;
	}
}