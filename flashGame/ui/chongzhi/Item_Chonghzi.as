package ui.chongzhi
{
	import com.fish.modules.core.models.ChongzhiModel;
	import com.fish.modules.core.models.tempData.ChongzhiData;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import Tool.platform.PlatformManager;
	
	import core.event.TQTTouchEvent;
	
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	
	public class Item_Chonghzi extends Base_Item implements IGridItemMax
	{
		public static var yueka:Item_ChongzhiYueka;
		public function Item_Chonghzi($mc:MovieClip=null)
		{
			super($mc);
		}
		
		private var _pos_image:Position;
		private var _fnt_num:FontField;
		private var _fnt_cash:FontField;
		private var _fnt_name:FontField;
		
		protected override function initModule():void{
			var mc:ItemChongzhi=m_mc as ItemChongzhi;
			_pos_image=new Position(mc.pos_image);
			_fnt_num=new FontField(mc.fnt_num);
			_fnt_cash=new FontField(mc.fnt_cash);
			_fnt_name=new FontField(mc.fnt_name);
			
			addTargetEvent(this,TQTTouchEvent.TOUCH_TAP,onClick);
//			Util.setDiaplayButtonEffect(this,false);
		}
		
		private function onClick(evt:Event):void{
			PlatformManager.getInstance().pay((m_data as ChongzhiData).node.id);
		}
		
		public override function destory():void{
			if(_pos_image) {_pos_image.destory(); _pos_image=null;}
			if(_fnt_num) {_fnt_num.destory(); _fnt_num=null;}
			if(_fnt_cash) {_fnt_cash.destory(); _fnt_cash=null;}
			if(_fnt_name) {_fnt_name.destory(); _fnt_name=null;}
			if(yueka) {yueka.destory(); yueka=null;}
//			Util.killDiaplayButtonEffect(this);
			super.destory();
		}
		private function initYueka(chongzhiData:ChongzhiData):void{
			if(yueka==null){
				yueka=new Item_ChongzhiYueka();
				yueka.loadData(chongzhiData);
			}
		}
		protected override function setShow():void{
			var chongzhiData:ChongzhiData=m_data as ChongzhiData;
			
			var chongzhiModel:ChongzhiModel=Context.getInjectInstance(ChongzhiModel);
			if(chongzhiModel.yuekaId==chongzhiData.node.id){
				initYueka(chongzhiData);
				this.addChild(yueka);
				m_mc.visible=false;
			}else{
				if(yueka && this.contains(yueka)){
					this.removeChild(yueka);
				}
				m_mc.visible=true;
				_pos_image.fillWithBitmapByClassName(chongzhiData.node.icon);
				_fnt_cash.text="￥"+chongzhiData.node.rmb;
				_fnt_num.text="x"+chongzhiData.node.cash;
				_fnt_name.text=chongzhiData.node.name;
			}
			
			
		}
		
		protected override function get itemClassName():Class{
			return ItemChongzhi;
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