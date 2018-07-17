package ui.equip
{
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.BaoshiModel;
	import com.fish.modules.core.models.UserModel;
	import com.fish.modules.core.models.tempData.BaoshiData;
	import com.fish.modules.core.models.tempData.EquipGridData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_baoshi;
	import com.ghostlmm.xmldata.Node_equip_baoshi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	
	import ui.baoshi.BaoshiTishiWindow;
	import ui.mc.ItemMc;
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	
	public class EquipBaoshiItem extends Base_Item implements IGridItemMax
	{
		private var _pos_item:Position;
//		private var _fnt_name:FontField;
		private var _mc_suo:MovieClip;
		
		private var _mc_add:MovieClip;
		
		private var _pos_item_bg:MovieClip;
		private var _pos_item_bg_type2:MovieClip;
		
		private var _fnt_num:FontField;
		
		public function EquipBaoshiItem($mc:MovieClip=null)
		{
			super($mc);
		}
		
		protected override function get itemClassName():Class{
			return McBaoshi;
		}
		protected override function initModule():void{
			var mc:McBaoshi=m_mc as McBaoshi;
			_pos_item=new Position(mc.pos_item);
//			_fnt_name=new FontField(mc.fnt_name);
			_mc_suo=mc.mc_jiesuo;
			_mc_add=mc.mc_add;
			
			_pos_item_bg=mc.pos_item_bg;
			_pos_item_bg_type2=mc.pos_item_bg_type2;
			
			_fnt_num=new FontField(_mc_suo.fnt_num);
			
		}
		public override function destory():void{
			if(m_mc){
//				Util.killDiaplayButtonEffect(m_mc as Sprite);
			}
			if(_pos_item) {_pos_item.destory(); _pos_item=null;}
			if(_fnt_num) {_fnt_num.destory();_fnt_num=null;}
//			if(_fnt_name) {_fnt_name.destory(); _pos_item=null;}
			_mc_suo=null;
			super.destory();
		}
		protected override function registerEvent():void{
			addTargetEvent(m_mc as MovieClip,TQTTouchEvent.TOUCH_TAP,onClick);
		}
		private function onClick(evt:Event):void{
			var baoshiNode:Node_baoshi=m_data.baoshiNode;
			var posId:int=m_data.pos;
			var gridId:int=m_data.gridId;
			var isLock:Boolean=m_data.isLock;
			var needLevel:int=m_data.needLevel;
			var equipId:Number=m_data.eid;
			
			if(isLock){
				Util.flow("宝石槽位等级解锁提示",needLevel);
			}else{
//				trace("打开宝石选择窗口");
				if(baoshiNode==null){
					var node:Node_equip_baoshi=XMLDataManager.getEquip_baoshiById(posId);
					var baoshiType:int=node.type;
					
					var baoshiModel:BaoshiModel=Context.getInjectInstance(BaoshiModel);
					var baoshiArray:Array=baoshiModel.getBaoshiDataArray();
					
					var slectBaoshiArray:Array=[];
					for each(var baoshiData:BaoshiData in baoshiArray){
						if(baoshiData.node.type==baoshiType){
							slectBaoshiArray.push({key:ResourceConst.R_baoshi,xid:baoshiData.node.id,num:baoshiData.num});
						}
					}
					if(slectBaoshiArray.length>=1)
					{
						var arg:Object={pos:posId,gid:gridId,eid:equipId};
						WindowManager.openOnlyWinodw(BaoshiSaixuanWindow,arg);
					}
					else
					{
						Util.flow("没有可用于装备的宝石");
					}
				}else{
					WindowManager.openOnlyWinodw(BaoshiTishiWindow,{node:baoshiNode,op:BaoshiTishiWindow.OP_Xiexia,eid:equipId,gid:gridId,pos:posId});
				}
				
			}
			
		}
		protected override function setShow():void{
//			var baoshiData:BaoshiData=m_data.baoshi;
			var baoshiNode:Node_baoshi=m_data.baoshiNode;
			var posId:int=m_data.pos;
			var gridId:int=m_data.gridId;
			var isLock:Boolean=m_data.isLock;
			var needLevel:int=m_data.needLevel;
			
			var node_equipbaoshi:Node_equip_baoshi=XMLDataManager.getEquip_baoshiById(posId);
			if(node_equipbaoshi.type==2){
				_pos_item_bg_type2.visible=true;
				_pos_item_bg.visible=false;
			}else{
				_pos_item_bg_type2.visible=false;
				_pos_item_bg.visible=true;
			}
			
			if(isLock){
				_pos_item.destory();
				_mc_suo.visible=true;
				
				_fnt_num.text=needLevel.toString();
				_mc_add.visible=false;
				
				
			}else{
				if(baoshiNode){
					_pos_item.fillWithObject(new ItemMc().loadData(baoshiNode));
					_mc_suo.visible=false;
					_mc_add.visible=false;
//					Util.setItemName(_fnt_name,ResourceConst.R_baoshi,baoshiNode.id);
				}else{
					_pos_item.destory();
					_mc_suo.visible=false;
					_mc_add.visible=true;
					
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