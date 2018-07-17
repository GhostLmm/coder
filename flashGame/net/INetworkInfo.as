package net
{
	public interface INetworkInfo
	{
		function getMac():String;
		function getActive():Boolean;
		
		function getMacByName($name:String):String;
	}
}