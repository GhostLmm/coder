package Tool.Googlplay
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.text.TextField;
	
	import myDisplay.tips.TextTipManager;

	public class GoogPlayContest
	{
		public function GoogPlayContest()
		{
		}
		
		/**    日本版本的publickey
		 * */
//		public static const GooglePlay_JP_Publickey:String="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlFLxn+AEzxx2TrDjTm7bsfq2yHKZMb45aYyaZMRrl+ZSo1gDwtA9fWYPXCJlHHYyq/RFy2TWSYeLDJjLwf3SNzD5huvuIjBX07d4sm+kXeNdOc1bH0mMy7uH4w0Md7eVai86WDe6W67W7a7sB6/bcJJPmYowbhQOR1T8q7rySgITQxoiy+z1S9ADDKR/ASVqRz5rXFfdkTuhk+IJhavxcQ8DP1WdW05G+a3yeA/MHWiZVWDkkbrmGtpCYUdCzGCCmAG5jt8GOeGmEasXWMwOuCed9qV+Oi4shtigr1V3IS5aDyBwAwWxhrN5v3ST4k/v5UNquCw7rCBLTiWm6H7cSQIDAQAB";
		public static const GooglePlay_JP_Publickey:String="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArB+9vFSCOVqNsJqp6k+c7Qi4l6NWwyY75UgjvOsmAA0aCZS5lGJYnrY04GDmmUMGjzE38l8DVnF2l3B02Yp+1X06vTcKmHwMShshJdt6vuXhHY/czPrN8FbAWCG7lIEtrgLMyOk8rn5a0c+sPqbzDvsAkyJkM7d7rZE0+wzC+5vatO7EoF2V9IFPFRmkzxLqcvLEgKdjs7oclDueuIQh0nqT1tDpa44ivQZrhluhc7W/4NY3DwFWKB2XiqYHGGyrZZgBZve3BRPpj267pMYhvvPgGsjIoEVju/pH+FKI9/U5aQws70bAova4PsI411Zf0WHEaSOAL+YpxWrkmgwUjwIDAQAB";
		
		/**   英文版本 facebook googleplay  版本的 publickey
		 * */
		public static const GooglePlay_Facebook_En_key:String="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArB+9vFSCOVqNsJqp6k+c7Qi4l6NWwyY75UgjvOsmAA0aCZS5lGJYnrY04GDmmUMGjzE38l8DVnF2l3B02Yp+1X06vTcKmHwMShshJdt6vuXhHY/czPrN8FbAWCG7lIEtrgLMyOk8rn5a0c+sPqbzDvsAkyJkM7d7rZE0+wzC+5vatO7EoF2V9IFPFRmkzxLqcvLEgKdjs7oclDueuIQh0nqT1tDpa44ivQZrhluhc7W/4NY3DwFWKB2XiqYHGGyrZZgBZve3BRPpj267pMYhvvPgGsjIoEVju/pH+FKI9/U5aQws70bAova4PsI411Zf0WHEaSOAL+YpxWrkmgwUjwIDAQAB";
		
		/**  中东 英文版 facebook 
		 * */
		public static const PKey_FbGp_MidEast_En:String="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn8sJv16xqX7nEo8oD1GM8xu3cmEyszZQ3c8GaODQOSZCSelXHOuSM/8jRi8GDwS+GzDKID0vJ5DO3E/WnYFQOWuGrAWhJRHe+pURiktGOeZueMsG+d0zijminiJ1NfK8Pswfra5pJcDEh5SrbqK8ARd6rp2VNoUsmlZwP+voAHMek6/eE6LGBcgED+jYitdqkorDB69XTW/ljJ63hc25kW9iLSBCJJD4c/NqI8oPtp2m0ad/BIAPTts9FFQpOqJx5umylNac++YyBqrH9li0H7s679lS33xZgpSRaS4p56EZjexkvIZVFOlYq7P3PVA2ZDjv1YR46dR9EzPX+h63zQIDAQAB";
		/**   日本 支付 后台地址
		 * */
		public static const BackUrl_Jp:String="pay_google_verify.php";
		
		/**   英文 facebook googleplay 后台地址
		 * */
		public static const BackUrl_Facebook_En:String="pay_google_verify.php";
		
		private static var backurl:String;
		internal static var publicKey:String="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlFLxn+AEzxx2TrDjTm7bsfq2yHKZMb45aYyaZMRrl+ZSo1gDwtA9fWYPXCJlHHYyq/RFy2TWSYeLDJjLwf3SNzD5huvuIjBX07d4sm+kXeNdOc1bH0mMy7uH4w0Md7eVai86WDe6W67W7a7sB6/bcJJPmYowbhQOR1T8q7rySgITQxoiy+z1S9ADDKR/ASVqRz5rXFfdkTuhk+IJhavxcQ8DP1WdW05G+a3yeA/MHWiZVWDkkbrmGtpCYUdCzGCCmAG5jt8GOeGmEasXWMwOuCed9qV+Oi4shtigr1V3IS5aDyBwAwWxhrN5v3ST4k/v5UNquCw7rCBLTiWm6H7cSQIDAQAB";

		public static function get postBackUrl():String
		{
			return EnvironmentParameter.gamePreUrl+backurl;
		}
		
		public static var isSupport:Boolean=false;
		
		internal static var debugText:TextField;
		internal static var sharePath:String="redwar.buyitem";
		internal static var isDebug:Boolean=false;
		
		
		public static function initGooglay(_publicKey:String,_backurl:String,_isDebug:Boolean=false,container:DisplayObjectContainer=null):void
		{
			publicKey=_publicKey;
			backurl=_backurl;
			isDebug=_isDebug;
			if(isDebug && container)
			{
//				debugText=new TextField();
//				debugText.text="输出";
////				debugText.width=container.stage.width;
////				debugText.height=container.stage.height;
//				debugText.wordWrap=true;
//				debugText.multiline=true;
//				debugText.defaultTextFormat.size=14;
				
				debugText=new TextField();
				debugText.defaultTextFormat=new flash.text.TextFormat("Arial",14);
				debugText.width=container.stage.stageWidth;
				debugText.y=container.stage.stageHeight/2;
				debugText.multiline=true;
				debugText.wordWrap=true;
//				debugText.text="Ready";
//				addChild(debugText);
				container.addChild(debugText);
				debugText.mouseEnabled=false;
				debugText.alpha=0.9;
			}
			GooglePlayPlatform.getInstance().init();
		}
		
		internal static function traceInfo(message:String,add:Boolean=false):void
		{
			
//			TextTipManager.getInstance().addTip(message);
			if(isDebug)
			{
//				trace(message);
//				if(debugText!=null)
//				{
//					if(add)
//					{
//						debugText.mouseEnabled=true;
//						debugText.text+="\n"+message;
//						debugText.height=debugText.textHeight+10;
//						
//						
//					}
//					
//					
//				}
			}
		}
			
	}
}