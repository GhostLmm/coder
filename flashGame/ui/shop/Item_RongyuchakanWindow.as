package ui.shop
{
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	
	import view.Base_Item;
	
	public class Item_RongyuchakanWindow extends Base_Item implements IGridItemMax
	{
		private var _fnt_fuben_name:FontField;
		
		public function Item_RongyuchakanWindow($mc:MovieClip=null)
		{
			super($mc);
		}
		protected override function get itemClassName():Class{
			return ItemHuodeTujing2;
		}
		protected override function initModule():void{
			var mc:ItemHuodeTujing2 = m_mc as ItemHuodeTujing2;
			_fnt_fuben_name=new FontField(mc.fnt_fuben_name);
			mc.mc_bg.gotoAndStop(1);
		}
		public override function destory():void{
			if(_fnt_fuben_name) {_fnt_fuben_name.destory();_fnt_fuben_name=null;};
			super.destory();
		}
		protected override function registerEvent():void
		{
			
		}
		protected override function setShow():void
		{
			var desc:String=XMLDataManager.getConstById("rongyu_huodetujing"+m_data).desc;
			_fnt_fuben_name.text=desc;
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