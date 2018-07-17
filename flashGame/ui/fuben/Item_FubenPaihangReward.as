package ui.fuben
{
	import com.fish.modules.core.models.RewardsPackData;
	import com.ghostlmm.xmldata.Node_fuben_paiming;
	
	import flash.display.MovieClip;
	
	import ui.mc.ItemMc;
	import ui.mc.JiangliMc;
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	
	import util.Util;
	
	import view.Base_Item;
	
	public class Item_FubenPaihangReward extends Base_Item implements IGridItemMax
	{
		private var _pos_image:Position;
		private var _fnt_mingci:FontField;
		private var _fnt_desc:FontField;
		private var _pos_item:Position;
		private var _scr_item:ScrollControllerMax;
		
		public function Item_FubenPaihangReward($mc:MovieClip=null)
		{
			super($mc);
		}
		
		protected override function get itemClassName():Class{
			return ItemGuanmingReward;
		}
		protected override function initModule():void{
			var mc:ItemGuanmingReward=m_mc as ItemGuanmingReward;
			_pos_image=new Position(mc.pos_image);
			_fnt_mingci=new FontField(mc.fnt_mingci);
			_fnt_desc=new FontField(mc.fnt_desc);
			_pos_item=new Position(mc.pos_item);
			_scr_item=new ScrollControllerMax(_pos_item,ScrollControllerMax.HORIZONTAL);
			_scr_item.initClass(JiangliMc);
			
		}
		
		public override function destory():void{
			if(_pos_image) {_pos_image.destory(); _pos_image=null;}
			if(_fnt_mingci) {_fnt_mingci.destory(); _fnt_mingci=null;}
			if(_fnt_desc) {_fnt_desc.destory(); _fnt_desc=null;}
			if(_pos_item) {_pos_item.destory(); _pos_item=null;}
			if(_scr_item) {_scr_item.destory(); _scr_item=null;}
			super.destory();
		}
		
		protected override function setShow():void{
			var node:Node_fuben_paiming=m_data as Node_fuben_paiming;
			_pos_image.fillWithBitmapByClassName(node.box_image);
			_fnt_mingci.text=node.name;
			_fnt_desc.text=node.desc;
			
			var rewarData:RewardsPackData=new RewardsPackData();
			rewarData.bonus_money=node.reward_money;
			rewarData.bouns_itmes=Util.createArrayJosnToMap(node.reward_item,node.reward_item_num);
			
			
			_scr_item.setData(rewarData.createItemDatas());
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