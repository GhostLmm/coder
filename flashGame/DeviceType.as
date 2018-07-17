package
{
	import flash.system.Capabilities;

	public class DeviceType
	{
		
		public static const Type_IOS:int=1;
		public static const Type_ANDROID:int=2;
		public static const Type_PC:int=3;
		
		public static function get type():int{
			if(isOnAndroid){
				return Type_ANDROID;
			}
			if(isOnIOS){
				return  Type_IOS;
			}
			return Type_PC;
		}
		
		public function DeviceType()
		{
		}
		
		public static function get isOnIOS():Boolean
		{
			var value:Boolean = Capabilities.manufacturer.indexOf('iOS') > -1;
			return value;
		}
		
		public static function get isOnAndroid():Boolean
		{
			var value:Boolean = Capabilities.manufacturer.indexOf('Android') > -1;
			return value;
		}
		
		public static function get isOnPC():Boolean
		{
			var value:Boolean = isOnIOS || isOnAndroid;
			return !value;
		}
	}
}