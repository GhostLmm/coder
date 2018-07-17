package ui.dig
{
	import com.fish.modules.core.models.GuankaModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_dig_lv;
	import com.ghostlmm.xmldata.Node_dig_map;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	
	import ui.widget.FontField;
	import ui.widget.ImageBitmap;
	import ui.widget.Position;

	public class MCWakuangShengjiShouyi
	{
		private var mc:MovieClip;
		private var _pos:Position;
		private var _fnt_name:FontField;
		private var _fnt_shouyi_money:FontField;
		private var _fnt_shouyi_exp:FontField;
		private var _fnt_shouyi_equip:FontField;
		private var _fnt_equip_lv:FontField;
		
		public function MCWakuangShengjiShouyi($mc:MovieClip)
		{
			mc=$mc;
			_pos=new Position(mc.pos_1);
			_fnt_name=new FontField(mc.fnt_name);
			_fnt_shouyi_money=new FontField(mc.fnt_shouyi_money);
			_fnt_shouyi_exp=new FontField(mc.fnt_shouyi_exp);
			_fnt_shouyi_equip=new FontField(mc.fnt_shouyi_equip);
			_fnt_equip_lv=new FontField(mc.fnt_equip_lv);
		}
		
		public function loadData(node:Node_dig_lv):void{
			var guankaModel:GuankaModel=Context.getInjectInstance(GuankaModel);
			_fnt_name.text=node.name;
			_fnt_shouyi_money.text=guankaModel.calcHourGetMoney(node.money_add+guankaModel.baseMoneyPrice).toString();
			_fnt_shouyi_exp.text=guankaModel.calcHourGetExp(node.exp_add+guankaModel.baseExpPrice).toString();
			_fnt_shouyi_equip.text=guankaModel.caclHourGetBox().toString();
			_fnt_equip_lv.text=node.id.toString();
			_pos.fillWithObject(new ImageBitmap(node.image));
		}
		
		
		
		public function destory():void{
			if(_pos) {_pos.destory(); _pos=null;}
			if(_fnt_name) {_fnt_name.destory(); _fnt_name=null;}
			if(_fnt_shouyi_money) {_fnt_shouyi_money.destory(); _fnt_shouyi_money=null;}
			if(_fnt_shouyi_exp) {_fnt_shouyi_exp.destory(); _fnt_shouyi_exp=null;}
			if(_fnt_shouyi_equip) {_fnt_shouyi_equip.destory(); _fnt_shouyi_equip=null;}
			if(_fnt_equip_lv) {_fnt_equip_lv.destory();_fnt_equip_lv=null;}
		}
	}
}