package ui.equip
{
	import com.fish.modules.core.models.tempData.EquipData;
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.event.TQTTouchEvent;
	
	import dragonBones.objects.Timeline;
	
	import org.osflash.signals.Signal;
	
	import ui.mc.ItemMc;
	import ui.widget.Position;
	
	import view.Base_Item;
	
	internal class RonglianSelectItem
	{
		public var tapSn:Signal=new Signal(EquipData);
		private var _pos_item:Position;
		public var mc:McRonglianBg;
		public var _data:EquipData;
		
		
		public function RonglianSelectItem($pos:Position)
		{
			mc=new McRonglianBg();
			$pos.fillWithObject(mc);
			_pos_item=new Position(mc.pos_item);
			mc.addEventListener(TQTTouchEvent.TOUCH_TAP,onTap);
		}
		private function onTap(evt:Event):void{
			tapSn.dispatch(_data);
		}
		public function loadData(data:EquipData):void{
			_data=data;
			if(data){
				_pos_item.fillWithObject(new ItemMc().loadData(data));
			}else{
				_pos_item.destory();
			}
		}
		
		public function getItemMC():DisplayObject{
			if(_pos_item.numChildren){
				return _pos_item.getChildAt(0);
			}
			return null;
		}
	
		
		public function destory():void{
			if(mc){
				TweenLite.killTweensOf(mc);
				mc.removeEventListener(TQTTouchEvent.TOUCH_TAP,onTap);
				mc=null;
			}
			tapSn.removeAll();
//			clearTimeLine();
			if(_pos_item) {_pos_item.destory(); _pos_item=null;}
		}
	}
}