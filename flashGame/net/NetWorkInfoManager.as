package net
{
	import flash.events.EventDispatcher;
	import flash.system.Capabilities;
	
	import Tool.PersistentObj;
	
	public class NetWorkInfoManager extends EventDispatcher
	{
		private static var _instance:NetWorkInfoManager;
		private var networkInfoObj:INetworkInfo;
		
		public function NetWorkInfoManager()
		{
//			networkInfoObj = new AndroidNetworkInfo();
//			CONFIG::UseIosMac{
//				networkInfoObj = new IosNetInfoNew();
//				return ;
//			}
			networkInfoObj = new AndroidNetworkInfo();
		}
		
		public static function getInstance():NetWorkInfoManager
		{
			if(!_instance)
			{
				_instance = new NetWorkInfoManager();
			}
			return _instance;
		}
		
		public function getMac():String
		{
//			return "1120";
//			return networkInfoObj.getMac();
//			return "";
			return getLocalData();
		}
		
		
		
		private function getLocalData():String
		{
			var p:PersistentObj=new PersistentObj("deviceUdid");
			if(p.getValueByKey("udid")==null){
				p.setVaule("udid",createRandom());
			}
			return p.getValueByKey("udid") as String;
		}
		private function createRandom():String
		{
			var data:Date=new Date();
			return data.time+""+int(Math.random()*int.MAX_VALUE);
		}
		
	}
}