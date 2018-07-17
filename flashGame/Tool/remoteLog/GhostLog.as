package Tool.remoteLog
{
	public class GhostLog
	{
		public function GhostLog()
		{
		}
		
		public static var serverHost:String="192.168.0.89";
		public static var serverPort:uint=8989;
		public static var logger:Object=null;
//		public static var logger:Object=new RLogger();
		
		public static function log(text:String):void{
			if(logger!=null){
				logger.log(text);
			}
		}
		
	}
}