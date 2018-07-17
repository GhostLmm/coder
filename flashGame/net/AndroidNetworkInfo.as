package net
{
	import flash.net.NetworkInfo;
	import flash.net.NetworkInterface;

	public class AndroidNetworkInfo implements INetworkInfo
	{
		public function AndroidNetworkInfo()
		{
		}
		
		public function getMac():String
		{
			var _netInterface:Vector.<NetworkInterface> = NetworkInfo.networkInfo.findInterfaces();
			for(var i:int = 0;i<_netInterface.length;i++)
			{
				if(_netInterface[i].hardwareAddress.length)
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
			return null;
		}
	}
}