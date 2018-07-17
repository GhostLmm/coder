package ui.mc
{
	import ui.widget.Position;
	
	import view.Base_Item;
	
	public class EquipMC extends Base_Item
	{
		private var _pos_bg:Position;
		private var _pos_item:Position;
		public function EquipMC()
		{
			super();
		}
		protected override function get itemClassName():Class{
			return McEquip;
		}
		protected override function initModule():void
		{
			var mc:McEquip=m_mc as McEquip;
			_pos_bg=new Position(mc.pos_bg);
			_pos_item=new Position(mc.pos_item);
		}
		public override function destory():void{
			if(_pos_bg) {_pos_bg.destory();_pos_bg=null;}
			if(_pos_item) {_pos_item.destory();_pos_item=null;}
		}
		protected override function setShow():void{
			_pos_item.fillWithBitmapByClassName(m_data.icon);
		}
	}
}