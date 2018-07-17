package Tool
{
	
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.system.ApplicationDomain;
	import flash.text.TextField;
	
	import myDisplay.WindowManager;
	

	public class SpecialFunction
	{
		public function SpecialFunction()
		{
		}
		
		/**   本机确认取消代码
		 *    设置 预编译 CONFIG::AlertAne true 时调用 对应设备的原生窗口
		 *    否则 弹出 confirmwindow，效果等同
		 * */
		public static function showAlert(title:String,message:String,button1:String="Ok",callback1:Function=null,button2:String=null,callback2:Function=null):void{
			CONFIG::AlertAne{
				try{
					import com.freshplanet.ane.AirAlert.AirAlert;
					AirAlert.getInstance().showAlert(title,message,button1,callback1,button2,callback2);
				}catch(e:Error){
					
				}
				return ;
			}
//			GLOBAL.sh
			var arg:Object={};
			arg.title=title;
			arg.body=message;
			arg.confirmFn=callback1;
			arg.cancelFn=callback2;
			WindowManager.getInstance().openWindow(WindowManager.ConfirmWindow,arg);
		}
		
		/**   创建随机openId
		 *   设置预编译 CONFIG::UseMac 时，请用设备mac地址作为绑定账号
		 *   否则生成随机账号
		 * */
		public static function createOpenId():String{
			CONFIG::UseMac{
				import net.NetWorkInfoManager;
				var macAddress:String = NetWorkInfoManager.getInstance().getMac();
				if(macAddress==null || macAddress=="" || !macAddressCheck(macAddress)){
					trace("mac地址非法，使用快速注册");
					var date:Date=new Date();
					return (date.monthUTC+""+date.dateUTC+""+date.hoursUTC+""+date.minutesUTC+""+date.secondsUTC+""+date.millisecondsUTC+""+Math.ceil(Math.random()*1000000000));
				}
				return macAddress;
			}
			
			var date:Date=new Date();
			return (date.monthUTC+""+date.dateUTC+""+date.hoursUTC+""+date.minutesUTC+""+date.secondsUTC+""+date.millisecondsUTC+""+Math.ceil(Math.random()*1000000000));
		}
		
		
		public static function macAddressCheck(address:String):Boolean{
			
			if(address.indexOf( "02:00:00:00:00:00")!=-1){
				return false;
			}
			return true;
			
		}
		
		
		public static function hasClass(className:String):Boolean{
			return ApplicationDomain.currentDomain.hasDefinition(className);
		}
		
		public static function sendEmail(emailAddress:String,title:String=null,body:String=null):void{
			
			var url:String="mailto:"+emailAddress+"?";
			if(title){
				url+="subject="+title+"&";
			}
			if(body){
				url+="body="+body+"&";
			}
			url=url.substr(0,url.length-1);
			trace("发送邮件： "+url);
//			navigateToURL((new URLRequest(url),"_blank");
			navigateToURL(new URLRequest(url),"_blank");
		}
		
		/**   打开卡牌使用界面
		 * */
		public static function openUseCardWindow(obj:Object):void{
			if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.UseOneCard)){
				if(obj.max==1){
					obj.callBack(1,obj.isTemp);
					return ;
				}
			}
				
			WindowManager.getInstance().openWindow(WindowManager.UseCardWindow,obj);
			
		}
		
		public static function setTextInputFont(txt:TextField,fontArray:Array,	displayAsPassword:Boolean=false):void{
//			txt.
		}
		
	}
}