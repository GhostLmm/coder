package ui.gun
{
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.tempData.EquipGridData;
	import com.fish.modules.core.models.tempData.WuqiData;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	
	import snake.ui.Mc_Gun;
	
	import ui.equip.EquipOpenWindow;
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	
	import view.Base_Item;
	
	public class Item_Gun_Suo extends Base_Item implements IGridItemMax
	{
		private var _pos_item:Position;
		private var _mc_suo:MovieClip;
		private var _fnt_qianghua:FontField;
		private var _fnt_star:FontField;
		private var _mc_star:MovieClip;
		public function Item_Gun_Suo($mc:MovieClip=null)
		{
			super($mc);
		}
		
		protected override function get itemClassName():Class{
			return McSuoGun;
		}
		
		protected override function initModule():void{
			_pos_item=new Position(m_mc.pos_item);
			_mc_suo=m_mc.mc_suo;
			_fnt_qianghua=new FontField(m_mc.fnt_qianghua);
			_fnt_star=new FontField(m_mc.fnt_star);
			_mc_star=m_mc.mc_star;
			addTargetEvent(m_mc as MovieClip,TQTTouchEvent.TOUCH_TAP,onClick);
		}
		
		private function onClick(evt:Event):void{
			var wuqi:WuqiData=m_data as WuqiData;
			if(wuqi.hasOwn()){
				WindowManager.openOnlyWinodw(EquipOpenWindow,wuqi);
			}else{
				
			}
		}
		
		protected override function setShow():void{
			var wuqi:WuqiData=m_data as WuqiData;
			_pos_item.fillWithObject(new Mc_Gun().loadData(wuqi.node_gun));
			if(wuqi.hasOwn()){
				_mc_suo.visible=false;
			}else{
				_mc_suo.visible=true;
			}
			
			_fnt_star.text="";
			_mc_star.visible=false;
			_fnt_qianghua.visible=false;
			
			if(wuqi.hasOwn()){
				var gridData:EquipGridData=(Context.getInjectInstance(BagModel) as BagModel).getEquipGridById(wuqi.node.type);
				if(gridData){
					if(gridData.lv_xing>0){
						_fnt_star.text=gridData.lv_xing+"";
						_mc_star.visible=true;
					}else{
						_fnt_star.text="";
						_mc_star.visible=false;
					}
					if(gridData.lv_bianqiang>0){
						_fnt_qianghua.text="+"+gridData.lv_bianqiang;
						_fnt_qianghua.visible=true;
					}else{
						_fnt_qianghua.visible=false;
					}
				}
			}
			
			
		}
		
		public override function destory():void{
			if(_pos_item){_pos_item.destory();_pos_item=null;};
			_mc_suo=null;
			if(_fnt_qianghua) {_fnt_qianghua.destory(); _fnt_qianghua=null;}
			if(_fnt_star) {_fnt_star.destory(); _fnt_star=null;}
			_mc_star=null;
			super.destory();
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
			_index=value;
		}
		
		private var _index:int;
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