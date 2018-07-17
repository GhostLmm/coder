package ui.window.huodong.items
{
	import ui.window.huodong.Item_HuodongTili_HuodongWindow;
	
	public class Item_New_Tili extends Item_HuodongTili_HuodongWindow implements IHuodongItem
	{
		public function Item_New_Tili()
		{
			super();
		}
		
		private var _type:String;
		public function get type():String{
			return _type;
		}
		public function set type(value:String):void
		{
			_type=value;
		}
	}
}