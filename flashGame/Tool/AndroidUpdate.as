package Tool
{
	import com.update.ane.ANESyncEvent;
	import com.update.ane.XiawuANEHelper;
	
	import util.Util;

	public class AndroidUpdate
	{
		public function AndroidUpdate()
		{
			
		}
		
		public static function showUpdate(apkUrl:String,fileName:String,titleName:String,messageTxt:String,nowVersion:String, newVersion:String):void{
			XiawuANEHelper.getInstance().addEventListener(ANESyncEvent.ANE_SYSC_EVENT,aneHandler);
			
			XiawuANEHelper.getInstance().apkupdateSDK.update(apkUrl,fileName,titleName,messageTxt,nowVersion,newVersion);
		}
		
		private static function aneHandler(event:ANESyncEvent):void
		{
			switch(event.code)
			{
				case "UPDATE_ANE_CANCEL":
					//game.exit();//取消更新，退出游戏
					Util.exitGame();
					
					break;
				case "UPDATE_ANE_SURE":
					//game.exit();//点击更新，退出游戏  或是 其它
//					Util.exitGame();
					break;
				case "ANE_GET_DEVICEID":
					//					DeviceID=event.level;//安卓设备ID
					break;
			}
		}
	}
}