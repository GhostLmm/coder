package Tool
{
//	import com.ghostlmm.androidToolAne.AndroidToolHelper;
	
	import flash.events.TimerEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.Timer;

	/**   打log到文本上， 适用于不能联机调试的情况
	 *    1. debug 是 log的开关
	 *    2. 文本保存到   windows 的 文档目录 下的 redwarLog.txt ， 或者是 android 的 sdcard下的redwarLog.txt，  android如果连接电脑使用了大容量连接模式会导致无法写入。
	 *    3. ios 系统没有测试过。
	 * */
	public class FileLog
	{
		public static var debug:Boolean=false;
		private static var logString:String="";
		public function FileLog()
		{
		}
		private static var timer:Timer;
		public static function log(tag:String,text:String=""):void
		{
//			AndroidToolHelper.instance.logcat(tag,text);
			if(!debug)
			{
				return ;
			}
			if(timer==null)
			{
				timer=new Timer(10000);
				timer.addEventListener(TimerEvent.TIMER,writeToFile);
				timer.start();
			}
			var date:Date=new Date();
			var time:String=date.fullYear+"-"+date.month+"-"+date.day+" "+date.hours+":"+date.minutes+":"+date.seconds;
			logString+=time+" ["+tag+"] "+text+" \r\n";
		}
		
		private static function writeToFile(evt:TimerEvent):void
		{
			try{
				var file:File=File.documentsDirectory.resolvePath("redwarLog.txt");
				
				var writeStream:FileStream = new FileStream();
				writeStream.open(file,FileMode.APPEND);
				writeStream.writeUTFBytes(logString);
				writeStream.close();
				writeStream=null;
				logString="";
			}catch(e:Error)
			{
				
			}
			
		}
		
	}
}