package ui.bag
{
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.ItemModel;
	import com.fish.modules.core.models.tempData.BagData;
	import com.fish.modules.core.models.tempData.BaoshiData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_baoshi;
	import com.ghostlmm.xmldata.Node_item;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	
	import ui.baoshi.BaoshiTishiWindow;
	import ui.equip.EquipCaozuoWindow;
	import ui.mc.ItemMc;
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.ImageBitmap;
	import ui.widget.Position;
	
	import view.Base_Item;
	
	public class BagItem extends Base_Item implements IGridItemMax
	{
		private var _pos_item:Position;
//		private var _pos_item_bg:Position;
		private var _fnt_num:FontField;
		
		public function BagItem()
		{
			super();
		}
		
		protected override function initModule():void{
			var mc:McBagItem=m_mc as McBagItem;
			_pos_item=new Position(mc.pos_item);
//			_pos_item_bg=new Position(mc.pos_item_bg);
			_fnt_num=new FontField(mc.fnt_num);
			
			addTargetEvent(mc,TQTTouchEvent.TOUCH_TAP,onClick);
		}
		
		private function onClick(evt:Event):void{
			var bagData:BagData=m_data as BagData;
			if(bagData.data==null) return ;
			
			if(bagData.data is Node_baoshi){
				WindowManager.openOnlyWinodw(BaoshiTishiWindow,{node:bagData.data,op:BaoshiTishiWindow.OP_Zhuanbei});
			}
			if(bagData.data is Node_item){
				var itemNode:Node_item = bagData.data as Node_item;
				if(itemNode.tag==ItemModel.TAG_suipian){
					var bagModel:BagModel=Context.getInjectInstance(BagModel);
					WindowManager.closeWindowByClass(BagWindow);
					WindowManager.openOnlyWinodw(EquipCaozuoWindow,{label:EquipCaozuoWindow.LB_Shengxin,gid:bagModel.getSuipianToUpGrid(itemNode.id)});
					
				}else{
					WindowManager.openOnlyWinodw(UseItemWindow,itemNode.id);
				}
				
				
			}
		}
		
		protected  override function setShow():void{
			var bagData:BagData=m_data as BagData;
			if(bagData.data){
				_pos_item.fillWithObject(new ItemMc().loadData(bagData.data));
			}else{
				_pos_item.destory();
			}
			
//			_pos_item_bg.fillWithObject(new ImageBitmap("bg_zhuangbei_"+bagData.data.star));
			if(bagData.num>0){
				_fnt_num.text="X"+bagData.num;
			}else{
				_fnt_num.text="";
			}
			
		}
		
		public override function destory():void{
			if(_pos_item) {_pos_item.destory();_pos_item=null;}
//			if(_pos_item_bg) {_pos_item_bg.destory();_pos_item_bg=null;}
			if(_fnt_num) {_fnt_num.destory();_fnt_num=null;}
			
			super.destory();
		}
		
		public function set enable(value:Boolean):void
		{
		}
		protected override function get itemClassName():Class
		{
			return McBagItem;
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
			return m_data;
		}
		
		public function enterMovie():*
		{
			return null;
		}
	}
}