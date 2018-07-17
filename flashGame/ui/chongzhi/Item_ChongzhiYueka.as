package ui.chongzhi
{
	import com.fish.modules.core.models.tempData.ChongzhiData;
	
	import flash.display.MovieClip;
	
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	
	import view.Base_Item;
	
	public class Item_ChongzhiYueka extends Base_Item implements IGridItemMax
	{
		private var _pos_image:Position;
		private var _fnt_name:FontField;
		private var _fnt_cash:FontField;
		private var _fnt_desc:FontField;
		public function Item_ChongzhiYueka($mc:MovieClip=null)
		{
			super($mc);
		}
		
		
		protected override function initModule():void{
			var mc:ItemChongzhiYueka=m_mc as ItemChongzhiYueka;
			_pos_image=new Position(mc.pos_image);
			_fnt_name=new FontField(mc.fnt_name);
			_fnt_cash=new FontField(mc.fnt_cash);
			_fnt_desc=new FontField(mc.fnt_desc);
		}
		
		protected override function setShow():void{
			var chongzhiData:ChongzhiData=m_data as ChongzhiData;
			_pos_image.fillWithBitmapByClassName(chongzhiData.node.icon);
			_fnt_cash.text="￥"+chongzhiData.node.rmb;
//			_fnt_num.text="x"+chongzhiData.node.cash;
			_fnt_desc.text=chongzhiData.node.desc;
			_fnt_name.text=chongzhiData.node.name;
		}
		public override function destory():void{
			if(_pos_image) {_pos_image.destory(); _pos_image=null;}
			if(_fnt_name) {_fnt_name.destory(); _fnt_name=null;}
			if(_fnt_cash) {_fnt_cash.destory(); _fnt_cash=null;}
			if(_fnt_desc) {_fnt_desc.destory(); _fnt_desc=null;}
			super.destory();
		}
		
		
		
		
		
		
		
		
		protected override function get itemClassName():Class{
			return ItemChongzhiYueka;
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
		private var _index:int;
		public function set index(value:int):void
		{
			_index=value;
		}
		
		public function get index():int
		{
			return _index;
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