package
{
	import flash.system.ApplicationDomain;

	public class GameArgRefelect
	{
		public function GameArgRefelect()
		{
		}
		
		public static function getArgByKey(key:String):*{ 
			if(ApplicationDomain.currentDomain.hasDefinition("GlobalDataStorage")){
				var cls:Class=ApplicationDomain.currentDomain.getDefinition("GlobalDataStorage") as Class;
				var re:*=cls[key];
				trace("动态参数： \t"+key+"\t/\t"+re);
				return re;
			}
			return null;
		}
		/**
		 *   主服务器
		 */
		public static function get logicalServerUrl():String{
			return getArgByKey("logicalServerUrl");
		}
		
		/**
		 *   审核服 地址
		 */
		public static function get logicalServer_Check():String{
			return getArgByKey("logicalServer_Check");
		}
		
		/**
		 *   账号服务器
		 */
		public static function get accountServerUrl():String{
			return getArgByKey("accountServerUrl");
		}
		
		
		
		
		/**
		 *   平台标识符
		 */
		public static function get PlatName():String{
			return getArgByKey("PlatName");
		}
		
		public static function get extrData():Object{
			return getArgByKey("extrData");
		}
	}
}