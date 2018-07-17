package Tool.platform.meijiPlat
{
	
	import org.osflash.signals.Signal;

	public interface IMJPlatform
	{
		/**  登录 平台名称
		 * */
		function get loginPlatName():String;
		
		/**  支付 平台名称
		 * */
		function get payPlatName():String;
		
		/**  唯一 平台名称
		 * */
		function get onlyPlatName():String;
		
		/**   附加的标志量，用于扩展,  
		 * */
		function get ExtrFlagObj():Object;
		
		/**  是否支持绑定账号
		 * */
		function get supportBindAccount():Boolean;
		
		function get supportPlatAccount():Boolean;
		
		/**  是否支持注销
		 * */
		function get supportLogout():Boolean;
		function logout():void;
		
		/**   是否支持游戏账号中心
		 * */
		function get supportGamecenter():Boolean;
		function openGamecenter():void;
		
		/**  注销完毕
		 * */
		function get logout_SN():Signal;
		/**  登陆完毕后的通知
		 * */
		function get login_SN():Signal;
		
		/**
		 *   账号切换 通知
		 */
		function get accountSwitch_SN():Signal;
		
		/**
		 *   是否支持账号切换
		 */
		function get supportSwitchAccount():Boolean;
		/**
		 *   切换账号
		 */
		function switchAccount():void;
		
		
		function setLoginFn(_comFn:Function,_failFn:Function):void;
		
		function login():void;
		
		/**  pid 为 goodsid  
		 *   bid 为 后台服务器返回的订单id
		 * */
		function pay(pid:String,bid:String):void;
		/**  支付完成的消息通知
		 * */
		function get payBackSingal():Signal;
		
		function init():void;
		
		function get supportGameconfig():Boolean;
		
		/**   获取平台的 openid
		 * */
		function get openId():String;
		
		/**   获取平台 token  或者 是 session
		 * */ 
		function get token():String;
		
		/**  获取用户的 nickName 用户账号显示
		 * */
		function get nickName():String;
		
		/**  
		 *   获取设备系统类型
		 * */
		function get osType():String;
		
		/**   是否支持需要平台闪屏
		 * */
		function get supportPlatSplash():Boolean;
		/**
		 *  平台闪屏图片
		 */
		function get platSplashPicClass():Class;
		
		/**
		 *   闪屏其他的参数
		 */
		function get platSplashArg():Object;
		
		/**
		 *  是否支持论坛入口
		 */
		function get supportLuntan():Boolean;
		
		/**
		 *   进入论坛
		 */
		function enterLuntan():void;
		
		/**
		 *   支持平台退出功能
		 */
		function get supportPlatExit():Boolean;
		/**
		 *   平台退出
		 */
		function platExit():void;

		/**
		 *  是否支持分享
		 */
		function get supportShare():Boolean;
	}
}