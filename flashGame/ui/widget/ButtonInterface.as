package ui.widget
{
	import flash.events.IEventDispatcher;

	public interface ButtonInterface extends IEventDispatcher
	{
		function get isPressed():Boolean;
		function set isPressed(isPressed:Boolean):void;
		function get isSelected():Boolean;
		function set isSelected(isSelected:Boolean):void;
		function get isEnabled():Boolean;
		function set isEnabled(isEnabled:Boolean):void;
	}
}