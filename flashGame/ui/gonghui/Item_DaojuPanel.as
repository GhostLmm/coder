package ui.gonghui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.models.GonghuiModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_banghui_shangcheng;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItem;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	import view.CommonControlFun;
	public class Item_DaojuPanel extends Base_Item implements IGridItem
	{
		public var _btn_duihuan:Button;
		
		public var _fnt_name:FontField;
		public var _fnt_cost_type:FontField;
		public var _fnt_cost_value:FontField;
		public var _fnt_limit:FontField;
		public var _fnt_need_shangdianlv:FontField;
		
		public var _pos_item:Position;
		
		public function Item_DaojuPanel()
		{
			super();
		}
		protected override function initModule():void
		{
			_btn_duihuan=new Button(itemMaterial.btn_duihuan);
			
			_fnt_name=new FontField(itemMaterial.fnt_name);
			_fnt_cost_type=new FontField(itemMaterial.fnt_cost_type);
			_fnt_cost_value=new FontField(itemMaterial.fnt_cost_value);
			_fnt_limit=new FontField(itemMaterial.fnt_limit);
			_fnt_need_shangdianlv=new FontField(itemMaterial.fnt_need_shangdianlv);
			
			_pos_item=new Position(itemMaterial.pos_item);
		}
		private function destoryMc():void
		{
			if(_btn_duihuan){_btn_duihuan.destory();_btn_duihuan=null;};
			
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			if(_fnt_cost_type){_fnt_cost_type.destory();_fnt_cost_type=null;};
			if(_fnt_cost_value){_fnt_cost_value.destory();_fnt_cost_value=null;};
			if(_fnt_limit){_fnt_limit.destory();_fnt_limit=null;};
			if(_fnt_need_shangdianlv){_fnt_need_shangdianlv.destory();_fnt_need_shangdianlv=null;};
			
			if(_pos_item){_pos_item.destory();_pos_item=null;};
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_duihuan,TqtEvent.BUTTON_CLICK,onDuihuanClicked);
			addTargetEvent(_btn_duihuan,TqtEvent.BUTTON_CLICK_DISABLE,onDuihuanClicked);
		}
		private function onDuihuanClicked(evt:Event):void
		{
			var re:JudgeResult=GonghuiModel.couldDuihuanDaoju(banghuiDaojuData);
			if(re.success)
			{
				C2SEmitter.buyBanghuishangcheng_daoju(banghuiDaojuData.id);
			}
			else if(re.success==JudgeResult.CD_CashNotEnough)
			{
				CommonControlFun.cashNotEnoughDo();
			}
			else
			{
				Util.flow(re.desc);
			}
		}
		protected override function setShow():void
		{
			var showName:String="";
			showName=Util.createJiangliName(banghuiDaojuData.item_type,banghuiDaojuData.item_id);
			_pos_item.fillWithObject(Util.createIcon(banghuiDaojuData.item_type,banghuiDaojuData.item_id));
			_fnt_name.text=Util.getLanguage("商品名称数量",showName,banghuiDaojuData.item_num);
			_fnt_cost_value.text=banghuiDaojuData.price.toString();
			_fnt_need_shangdianlv.text=Util.getLanguage("需要帮会商城等级",banghuiDaojuData.shangchen_lv);
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			if(gonghuiModel.gonghuiVo.shangchengLevel>=banghuiDaojuData.shangchen_lv)
			{
				_fnt_need_shangdianlv.visible=false;
			}
			else
			{
				_fnt_need_shangdianlv.visible=true;
			}
			var costResName:String=Util.getLanguage(banghuiDaojuData.price_type);
			_fnt_cost_type.text=Util.getLanguage("帮会商城消耗",costResName);
			var couldDuihuanNum:int=GonghuiModel.computeDaojuCouldBuyNum(banghuiDaojuData);
			_fnt_limit.text=Util.getLanguage("个人今日可兑换个数",couldDuihuanNum);
			if(couldDuihuanNum>0)
			{
				_btn_duihuan.isEnabled=true;
			}
			else
			{
				_btn_duihuan.isEnabled=false;
			}
		}
		public override function loadData($data:Object):*
		{
			super.loadData($data);
		}
		protected override function get itemClassName():Class
		{
			return Banghui_shengchengItem; 
		}
		private function get itemMaterial():Banghui_shengchengItem 
		{
			return m_mc as Banghui_shengchengItem; 
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get banghuiDaojuData():Node_banghui_shangcheng
		{
			return m_data as Node_banghui_shangcheng;
		}
	}
}
