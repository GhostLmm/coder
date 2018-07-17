package net
{
	
	import com.freshplanet.nativeExtensions.AirNetworkInfo;
	import com.freshplanet.nativeExtensions.NativeNetworkInterface;

	public class IosNetInfoNew implements INetworkInfo
	{
		public function IosNetInfoNew()
		{
		}
		
		public function getMac():String
		{
			for each(var netwo:NativeNetworkInterface in AirNetworkInfo.networkInfo.findInterfaces()){
				trace("Mac: "+netwo.hardwareAddress);
				if(netwo.hardwareAddress && netwo.hardwareAddress.length>3 && macAddressCheck(netwo.hardwareAddress)){
					return netwo.hardwareAddress;
				}
			}
			return null;
		}
		
		public static function macAddressCheck(address:String):Boolean{
			
			if(address.indexOf( "02:00:00:00:00:00")!=-1){
				return false;
			}
			return true;
			
		}
		
		public function getActive():Boolean
		{
			return true;
		}
		
		public function getMacByName($name:String):String
		{
			for each(var netwo:NativeNetworkInterface in AirNetworkInfo.networkInfo.findInterfaces()){
				if(netwo.name==$name){
					return netwo.hardwareAddress;
				}
			}
			return null;
		}
	}
}