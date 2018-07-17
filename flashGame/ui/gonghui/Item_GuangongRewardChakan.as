package ui.gonghui
{
	import com.fish.modules.core.ResourceConst;
	import com.ghostlmm.xmldata.Node_banghui_guangong_reward;
	
	import flash.display.MovieClip;
	
	import ui.mc.JiangliMc;
	import ui.widget.FontField;
	import ui.widget.IGridItem;
	import ui.widget.Position;
	
	import view.Base_Item;

	public class Item_GuangongRewardChakan extends Base_Item implements IGridItem
	{
		public var _fnt_lv_jiangli:FontField;
		public var _fnt_tili:FontField;
		public var _pos_item1:Position;
		public var _pos_item2:Position;
		
		public function Item_GuangongRewardChakan()
		{
			super();
		}
		protected override function initModule():void
		{
			_fnt_lv_jiangli=new FontField(itemMaterial.fnt_lv_jiangli);
			_fnt_tili=new FontField(itemMaterial.fnt_tili);
			
			_pos_item1=new Position(itemMaterial.pos_item1);
			_pos_item2=new Position(itemMaterial.pos_item2);
		}
		private function destoryMc():void
		{
			if(_fnt_lv_jiangli){_fnt_lv_jiangli.destory();_fnt_lv_jiangli=null;};
			if(_fnt_tili){_fnt_tili.destory();_fnt_tili=null;};
			
			if(_pos_item1){_pos_item1.destory();_pos_item1=null;};
			if(_pos_item2){_pos_item2.destory();_pos_item2=null;};
		}
		protected override function registerEvent():void
		{
			
		}
		protected override function setShow():void
		{
			_fnt_lv_jiangli.text=data.title_desc;
			_fnt_tili.text=data.reward_tili.toString();
			_pos_item1.fillWithObject(new JiangliMc().loadData({"key":"money","num":data.reward_tongqian}));
			_pos_item2.fillWithObject(new JiangliMc().loadData({"key":ResourceConst.R_rongyu,"num":data.reward_shengwang}));
		}
		public override function loadData($data:Object):*
		{
			super.loadData($data);
		}
		protected override function get itemClassName():Class
		{
			return item_guangong_reward; 
		}
		private function get itemMaterial():item_guangong_reward 
		{
			return m_mc as item_guangong_reward; 
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get data():Node_banghui_guangong_reward
		{
			return m_data as Node_banghui_guangong_reward;
		}
	}
}
