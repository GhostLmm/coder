package ui.fuben
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.models.MapModel;
	import com.fish.modules.core.models.tempData.GuangmingData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_fuben;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	
	import view.Base_Item;
	
	public class Item_FubenGuanming extends Base_Item implements IGridItemMax
	{
		private var _fnt_mingci:FontField;
		private var _fnt_name:FontField;
		private var _fnt_time:FontField;
		private var _mc_wangguan:MovieClip;
		public function Item_FubenGuanming($mc:MovieClip=null)
		{
			super($mc);
		}
		
		protected override function get itemClassName():Class{
			return ItemGuanmingName;
		}
		protected override function initModule():void{
			
			
			
			_fnt_mingci=new FontField(m_mc.fnt_mingci);
			_fnt_name=new FontField(m_mc.fnt_name);
			_fnt_time=new FontField(m_mc.fnt_time);
			_mc_wangguan=m_mc.mc_wangguan;
			
			addTargetEvent(m_mc as MovieClip,TQTTouchEvent.TOUCH_TAP,onTap);
		}
		
		private function onTap(evt:Event):void{
			var node:Node_fuben=XMLDataManager.getFubenById((m_data as GuangmingData).funbenId);
			WindowManager.openOnlyWinodw(GuanmingRewardWindow,node);
		}
		
		public override function destory():void{
			if(_fnt_mingci) {_fnt_mingci.destory();_fnt_mingci=null;}
			if(_fnt_name) {_fnt_name.destory();_fnt_name=null;}
			if(_fnt_time) {_fnt_time.destory();_fnt_time=null;}
			_mc_wangguan=null;
			super.destory();
		}
		
		protected override function setShow():void{
			var guanmingData:GuangmingData=m_data as GuangmingData;
			var mapModel:MapModel=Context.getInjectInstance(MapModel);
			var green:uint=uint(XMLDataManager.getConstById("color_self_paiming").desc);
			if(guanmingData.name==GLBaseData.userName){
				_fnt_mingci.textColor=green;
				_fnt_time.textColor=green;
				_fnt_name.textColor=green;
			}else{
				_fnt_mingci.textColor=_fnt_mingci.defaultColor;
				_fnt_time.textColor=_fnt_time.defaultColor;
				_fnt_name.textColor=_fnt_name.defaultColor;
			}
			_fnt_mingci.text=guanmingData.paiming.toString();
			_fnt_time.text=(guanmingData.passTime/1000).toFixed(2)+"s";
			_fnt_name.text=guanmingData.name;
			var frame:int=guanmingData.paiming;
			if(guanmingData.paiming>4){
				frame=4;
			}
			
			
			
			_mc_wangguan.gotoAndStop(frame);
			if(frame==1){
				if(mapModel.hasLingquGuanmingReward(guanmingData.funbenId)){
					_mc_wangguan.box_1.gotoAndStop(2);
				}else{
					_mc_wangguan.box_1.gotoAndStop(1);
				}
				
			}
			
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