package net
{
	import Tool.SpecialFunction;
	
	import com.adobe.nativeExtensions.Networkinfo.NetworkInfo;
	import com.adobe.nativeExtensions.Networkinfo.NetworkInterface;
	

	public class IOSNetworkInfo implements INetworkInfo
	{
		public function IOSNetworkInfo()
		{
		}
		
		public function getMac():String
		{
			var networkInfo:NetworkInfo = NetworkInfo.networkInfo;
			var _netInterface:Vector.<NetworkInterface> = networkInfo.findInterfaces();
			for(var i:int = 0;i<_netInterface.length;i++)
			{
				if(_netInterface[i].hardwareAddress && _netInterface[i].hardwareAddress.length>3 && SpecialFunction.macAddressCheck(_netInterface[i].hardwareAddress) )
				{
					return _netInterface[i].hardwareAddress;
				}
			}
			return null;
		}
		
		public function getActive():Boolean
		{
			var _netInterface:Vector.<NetworkInterface> = NetworkInfo.networkInfo.findInterfaces();
			for each(var interfaceObj:NetworkInterface in _netInterface)
			{
				if(interfaceObj.active)
				{
					return true;
				}
			}
			return false;
		}
		
		public function getMacByName($name:String):String
		{
			var _netInterface:Vector.<NetworkInterface> = NetworkInfo.networkInfo.findInterfaces();
			
			for each(var network:NetworkInterface in _netInterface){
				if(network.name==$name){
					return network.hardwareAddress;
				}
			}
			return null;
		}
	}
}