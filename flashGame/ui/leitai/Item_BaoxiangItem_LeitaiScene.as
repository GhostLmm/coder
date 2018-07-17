package ui.leitai
{
	import com.ghostlmm.xmldata.Node_leitai;
	
	import ui.widget.FontField;
	import ui.widget.IGridItem;
	import ui.widget.Position;
	
	import view.Base_Item;
	
	public class Item_BaoxiangItem_LeitaiScene extends Base_Item implements IGridItem
	{
		private var _fnt_money:FontField;
		private var _fnt_name:FontField;
		private var _fnt_paiming:FontField;
		private var _pos_box:Position;
		private var _fnt_shengwang:FontField;
		private var _fnt_cash:FontField;
		
		public function Item_BaoxiangItem_LeitaiScene()
		{
			super();
		}
		protected override function initModule():void
		{
			_fnt_money= new FontField(itemMaterial.fnt_money);
			_fnt_name = new FontField(itemMaterial.fnt_name);
			_fnt_paiming = new FontField(itemMaterial.fnt_paiming);
			_pos_box = new Position(itemMaterial.pos_box);
			_fnt_shengwang=new FontField(itemMaterial.fnt_shengwang);
			_fnt_cash=new FontField(itemMaterial.fnt_cash);
		}
		private function destoryMc():void
		{
			if(_fnt_money){_fnt_money.destory();_fnt_money=null};
			if(_fnt_name){_fnt_name.destory();_fnt_name=null};
			if(_fnt_paiming){_fnt_paiming.destory();_fnt_paiming=null};
			if(_pos_box){_pos_box.destory();_pos_box=null};
			if(_fnt_shengwang){_fnt_shengwang.destory();_fnt_shengwang=null};
			if(_fnt_cash){_fnt_cash.destory();_fnt_cash=null;};
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		protected override function registerEvent():void
		{
			
		}
		protected override function setShow():void
		{
			_fnt_money.text = rankBoxData.box_money.toString();
			_fnt_name.text = rankBoxData.name;
			_fnt_name.textColor = parseInt(rankBoxData.box_font_color.toString());
			_fnt_paiming.text = rankBoxData.desc;
			_pos_box.fillWithBitmapByClassName(rankBoxData.box_image);
			_fnt_shengwang.text=rankBoxData.box_rongyu.toString();
			_fnt_cash.text=rankBoxData.box_cash.toString();
		}
		protected override function get itemClassName():Class
		{
			return ItemLeitaiBaoxiang; 
		}
		private function get rankBoxData():Node_leitai
		{
			return m_data as Node_leitai;
		}
		private function get itemMaterial():ItemLeitaiBaoxiang		{
			return m_mc as ItemLeitaiBaoxiang;		}
	}
}
