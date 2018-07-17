package ui.widget
{
	import org.osflash.signals.Signal;

	public interface IGridSelectItem implements IGridItem
	{
		function set selected(value:Boolean):void;
		function get selected():Boolean;
		
		function get selectSN():Signal;
	}
}