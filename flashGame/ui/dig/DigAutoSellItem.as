package ui.dig
{
	import com.fish.modules.core.models.tempData.EquipPingzhi;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import org.osflash.signals.Signal;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	
	import view.Base_Item;
	
	public class DigAutoSellItem extends Base_Item implements IGridItemMax
	{
		public function DigAutoSellItem($mc:MovieClip=null)
		{
			super($mc);
		}
		
		private var _fnt_color1:FontField;
		private var _btn_1:Button;
		
		public var select_SN:Signal=new Signal(DigAutoSellItem);
		
		protected override function initModule():void{
			_fnt_color1=new FontField(m_mc.fnt_color1);
			_btn_1=new Button(m_mc.btn_1);
			addTargetEvent(_btn_1,TqtEvent.BUTTON_CLICK,onSetClick);
		}
		
		protected override function setShow():void{
			var color:int=m_data.color;
			selected=m_data.select;
			var pingzhi:EquipPingzhi=EquipPingzhi.getEquipPingzhiByStar(color);
			_fnt_color1.textColor=pingzhi.color;
			_fnt_color1.text=pingzhi.name;
			
			
		}
		
		private function onSetClick(evt:Event):void{
			select_SN.dispatch(this);
		}
		
		public function set enable(value:Boolean):void{
			
		}
		public function get enable():Boolean{
			return true;
		}
		
		private var _selected:Boolean;
		public function set selected(value:Boolean):void{
			_selected=value;
			_btn_1.isSelected=_selected;
		}
		public function get selected():Boolean{
			return _selected;
		}
		
		public function set index(value:int):void{
			
		}
		public function get index():int{
			return 0;
		}
		
		//		function loadData($data:Object):*;
		public function get data():Object{
			return m_data;
		}
		
		public function get colorType():int{
			return m_data.color;
		}
		
		public function enterMovie():*{
			
		}
		
		public override function destory():void{
			if(select_SN) {select_SN.removeAll();select_SN=null;}
			if(_fnt_color1) {_fnt_color1.destory();_fnt_color1=null;}
			if(_btn_1) {_btn_1.destory();_btn_1=null;}
			super.destory();
		}
		
	}
}