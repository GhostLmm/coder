package Tool.platform
{
	import flash.events.IEventDispatcher;

	public interface IPlatform extends IEventDispatcher
	{
		function setLoginFn(_comFn:Function,_failFn:Function):void;
		function login():void;
		 
		/**    平台登陆验证
		 * */
		function get platCode():String;
		
		
		
		/**  是否支持分享
		 * */
		function get suportShare():Boolean;
			
		function share(title:String,comment:String,summary:String):void;
		
		/**  获取 平台商品详细西信息
		 * */
		function getDetailItems():void;
		
		/**   充值页面显示的货币符号   比如  "$" "￥" "91豆"
		 * */
		function get moneyType():String;
		
		/**  购买商品， 需要传入商品id
		 * */
		function buyItem(itemType:String):void;
			
		/**  是否支持的账号切换, 基本为注销功能
		 * */
		function get suportQiehuan():Boolean;
		
		/**   执行账号切换
		 * */
		function zhanghaoQiehuan():void;
			
		
		/**   平台的初始化
		 * */
		function init():void;
		
		/**  平台账号名称
		 * */
		function getPlatUserName():String;
		
		/**  获取客服支持1
		 * */
		function getPlatKefu1():String;
		
		/**  获取客服支持2
		 * */
		function getPlatKefu2():String;
		
		/**  是否支持更多帮助页面跳转
		 * */
		function get suportMoreHelp():Boolean;
		
			
		/**  是否支持平台用户社交信息
		 * */
		function get suportSocialInfo():Boolean;
		
		/**  只有支持平台用户信息的平台才可以获取平台的社交信息
		 * */
		function getPlatformUserInfo():PlatformUserInfo;
		
		/**   附加的标志量，用于扩展,  
		 * */
		function get ExtrFlagObj():Object;
		
		/**   各个平台唯一name
		 * */
		function get platName():String;
		
	}
}