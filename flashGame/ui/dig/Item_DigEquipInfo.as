package ui.dig
{
	import flash.display.MovieClip;
	
	import ui.widget.IGridItemMax;
	
	import view.Base_Item;
	
	public class Item_DigEquipInfo extends Base_Item implements IGridItemMax
	{
		public function Item_DigEquipInfo($mc:MovieClip=null)
		{
			super($mc);
		}
		
		public function set enable(value:Boolean):void
		{
		}
		
		public function get enable():Boolean
		{
			return false;
		}
		
		public function set selected(value:Boolean):void
		{
		}
		
		public function get selected():Boolean
		{
			return false;
		}
		
		public function set index(value:int):void
		{
		}
		
		public function get index():int
		{
			return 0;
		}
		
		public function get data():Object
		{
			return null;
		}
		
		public function enterMovie():*
		{
			return null;
		}
	}
}