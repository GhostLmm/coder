package ui.animate
{
	public interface _AnimateInterface
	{
		function run():void;
		function stop():void;
		function get relatedObjects():Array;
		function get running():Boolean;
		function get done():Boolean;
		function destory():void;
	}
}