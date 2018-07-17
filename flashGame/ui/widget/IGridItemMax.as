package ui.widget
{
	public interface IGridItemMax extends IGridItem
	{
		function set enable(value:Boolean):void;
		function get enable():Boolean;
		
		function set selected(value:Boolean):void;
		function get selected():Boolean;
		
		function set index(value:int):void;
		function get index():int;
		
//		function loadData($data:Object):*;
		function get data():Object;
		
		function enterMovie():*;
		
//		function destory():void;
	}
}