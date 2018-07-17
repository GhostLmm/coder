package ui.map
{
	import com.fish.modules.core.models.MapModel;
	import com.fish.modules.core.models.tempData.FubenMapData;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.LayerController;
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	
	public class SectionItem extends Base_Item implements IGridItemMax
	{
		private var _fnt_name:FontField;
		private var _btn:Button;
		private var _pos:Position;
		public function SectionItem()
		{
			super();
		}
		protected override function get itemClassName():Class
		{
			return McMapImage;
		}
		
		protected override function initModule():void{
			_btn=new Button(m_mc as MovieClip);
			_fnt_name=new FontField(m_mc.fnt_name);
			_pos=new Position(m_mc.pos_image);
			
			addTargetEvent(_btn,TqtEvent.BUTTON_CLICK,onClick);
			addTargetEvent(_btn,TqtEvent.BUTTON_CLICK_DISABLE,onDisableClick);
			
		}
		
		private function onClick(evt:Event):void{
			var sectionData:FubenMapData=m_data as FubenMapData;
//			var mapModel:MapModel=Context.getInjectInstance(MapModel);
//			if(mapModel.isMapActive(sectionData)){
//				
//			}else{
//				
//			}
			
			if(LayerController.instance.sceneLayer.curScene is MapScene){
				(LayerController.instance.sceneLayer.curScene as MapScene).onMapChoose(sectionData);
			}
			
		}
		private function onDisableClick(evt:Event):void{
			var sectionData:FubenMapData=m_data as FubenMapData;
			Util.flow("副本等级限制",sectionData.node.need_lv);
		}
		
		public override function destory():void{
			if(_btn) {_btn.destory(); _btn=null;}
			if(_fnt_name) {_fnt_name.destory(); _fnt_name=null;}
			if(_pos) {_pos.destory(); _pos=null;}
			super.destory();
		}
		
		protected override function setShow():void{
			var sectionData:FubenMapData=m_data as FubenMapData;
			_fnt_name.text=sectionData.node.name;
			enable=sectionData.levelActive;
			trace(enable+"/"+sectionData.levelActive);
			_pos.fillWithBitmapByClassName(sectionData.node.image);
//			_enable=sectionData.levelActive;
//			updateStatus();
		}
		
//		private function updateStatus():void{
//			if(_enable){
//				if(_select){
//					(m_mc as MovieClip).gotoAndStop(2);
//				}else{
//					(m_mc as MovieClip).gotoAndStop(1);
//				}
//			}else{
//				(m_mc as MovieClip).gotoAndStop(3);
//			}
//		}
		
//		private var _enable:Boolean=false;
		public function set enable(value:Boolean):void
		{
//			_enable=value;
//			updateStatus();
			_btn.isEnabled=value;
		}
		
		public function get enable():Boolean
		{
			return _btn.isEnabled;
		}
		
//		private var _select:Boolean;
		public function set selected(value:Boolean):void
		{
			_btn.isSelected=value;
		}
		
		public function get selected():Boolean
		{
			return _btn.isSelected;
		}
		
		private var _index:int=0;
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