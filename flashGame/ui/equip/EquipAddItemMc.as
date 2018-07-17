package ui.equip
{
	import com.fish.modules.core.models.tempData.EquipData;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.event.TQTTouchEvent;
	
	import org.osflash.signals.Signal;
	
	import ui.mc.ItemMc;
	import ui.widget.Position;

	public class EquipAddItemMc
	{
		private var mc:MovieClip;
		private var mc_add:MovieClip;
		private var pos_item:Position;
		public var data:EquipData;
		public var index:int;
		public var onClick_SN:Signal;
		
		public function get display():DisplayObject{
			return mc;
		}
		
		public function EquipAddItemMc($mc:MovieClip,$index:int=0)
		{
			onClick_SN=new Signal(EquipAddItemMc);
			index=$index;
			mc=$mc;
			mc_add=mc.mc_add;
			pos_item=new Position(mc.pos_item);
			mc.addEventListener(TQTTouchEvent.TOUCH_TAP,onClick);
		}
		private function onClick(evt:Event):void{
			onClick_SN.dispatch(this);
		}
		
		public function getItemMC():DisplayObject{
			if(pos_item.numChildren){
				return pos_item.getChildAt(0);
			}
			return null;
		}
		
		public function loadData($data:EquipData):void{
			data=$data;
			if(data){
				pos_item.fillWithObject(new ItemMc().loadData(data));
				mc_add.stop();
				mc_add.visible=false;
			}else{
				pos_item.destory();
				mc_add.play();
				mc_add.visible=true;
			}
		}
		public function destory():void{
			if(pos_item) {pos_item.destory();pos_item=null;}
			if(mc) {mc.removeEventListener(TQTTouchEvent.TOUCH_TAP,onClick);mc=null;}
			if(onClick_SN) {onClick_SN.removeAll();onClick_SN=null;}
			mc_add=null;
			data=null;
		}
	}
}