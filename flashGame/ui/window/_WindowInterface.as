package ui.window
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	public interface _WindowInterface extends IEventDispatcher
	{
		function updateData(data:*):void;
		function open(evt:Event=null):void;
		function close(evt:Event=null):void;
	}
}