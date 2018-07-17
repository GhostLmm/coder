package ui.equip
{
	import com.fish.modules.core.models.tempData.EquipData;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.event.TQTTouchEvent;
	
	import ui.mc.ItemMc;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	
	import view.Base_Item;
	
	public class RonglianLeftItem extends Base_Item implements IGridItemMax
	{
		private var _pos_item:Position;
		private var _mc_dagou:MovieClip;
		public function RonglianLeftItem($mc:MovieClip=null)
		{
			super($mc);
		}
		
		protected override function get itemClassName():Class{
			return McRonglianDagou;
		}
		
		protected override function initModule():void{
			var mc:McRonglianDagou=m_mc as McRonglianDagou;
			_pos_item=new Position(mc.pos_item);
			_mc_dagou=mc.mc_dagou;
		}
		protected override function registerEvent():void{
			addTargetEvent(m_mc as MovieClip, TQTTouchEvent.TOUCH_TAP,onTap);
		}
		private function onTap(evt:Event):void{
			var mdi:MDI_EquipRonglian=Context.getInjectInstance(MDI_EquipRonglian);
			if(mdi){
				mdi.onScrSelected(index);
			}
		}
		protected override function setShow():void{
			var equipData:EquipData=m_data as EquipData;
			_pos_item.fillWithObject(new ItemMc().loadData(equipData));
			_mc_dagou.visible=equipData.tempSelected;
//			if(m_data){
//				_mc_dagou.visible=false;
//				_pos_item.fillWithObject(new ItemMc().loadData(m_data.node));
//			}else{
//				_mc_dagou.visible=true;
//				_pos_item.destory();
//			}
		}
		
		public function set enable(value:Boolean):void
		{
		}
		
		public function get enable():Boolean
		{
			return false;
		}
//		private var _selec
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