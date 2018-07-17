package ui.window.huodong.items
{
	import ui.window.huodong.Item_Huodong_CanbaiWindow;

	public class Item_New_Canbai extends Item_Huodong_CanbaiWindow implements IHuodongItem
	{
		
		public function Item_New_Canbai()
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