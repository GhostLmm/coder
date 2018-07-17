package ui
{
	import com.fish.modules.core.models.tempData.EquipData;
	
	import flash.display.MovieClip;
	
	import ui.widget.IGridItemMax;
	import ui.widget.ImageBitmap;
	import ui.widget.Position;
	
	import view.Base_Item;
	
	public class GunEquipItem extends Base_Item implements IGridItemMax
	{
		private var _pos_item:Position;
		private var _pos_item_bg:Position;
		
		public function GunEquipItem($mc:MovieClip=null)
		{
			super($mc);
		}
		
		protected override function initModule():void{
			_pos_item = new Position(m_mc.pos_item);
			_pos_item_bg= new Position(m_mc.pos_item_bg);
		}
		protected override function get itemClassName():Class{
			return McItem;
		}
		public override function destory():void
		{
			if(_pos_item){_pos_item.destory();_pos_item=null;};
			if(_pos_item_bg){_pos_item_bg.destory();_pos_item_bg=null;};
			super.destory();
		}
		protected override function setShow():void{
			var equipData:EquipData=m_data as EquipData;
			_pos_item.fillWithObject(new ImageBitmap(equipData.node.icon));
			_pos_item_bg.fillWithObject(new ImageBitmap("bg_zhuangbei_"+equipData.node.star));
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
			return m_data;
		}
		
		public function enterMovie():*
		{
			return null;
		}
	}
}