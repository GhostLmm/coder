package ui.window.huodong.items
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.ShoujiModel;
	import com.fish.modules.core.models.tempData.ShoujiItemData;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.mc.ItemMc;
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	import view.CommonControlFun;

	public class Item_shoujiDuihuan extends Base_Item implements IGridItemMax
	{
		private var _btn_buqi:Button;
		private var _fnt_cost_num:FontField;
		private var _fnt_exchange_name:FontField;
		private var _fnt_exchange_num:FontField;
		private var _fnt_inexchange_name:FontField;
		private var _fnt_inexchange_num:FontField;
		private var _mc_cash:MovieClip;
		private var _btn_exchange:Button;
		private var _pos_1:Position;
		private var _pos_2:Position;
		
		public function Item_shoujiDuihuan()
		{
			super();
		}
		protected override  function initModule():void
		{
			_btn_buqi=new Button(itemMaterial.btn_buqi);
			_fnt_cost_num=new FontField(itemMaterial.fnt_cost_num);
			_fnt_exchange_name=new FontField(itemMaterial.fnt_exchange_name);
			_fnt_exchange_num=new FontField(itemMaterial.fnt_exchange_num);
			_fnt_inexchange_name=new FontField(itemMaterial.fnt_inexchange_name);
			_fnt_inexchange_num=new FontField(itemMaterial.fnt_inexchange_num);
			_btn_exchange=new Button(itemMaterial.btn_exchange);
			_pos_1=new Position(itemMaterial.pos_1);
			_pos_2=new Position(itemMaterial.pos_2);
			_mc_cash=itemMaterial.mc_icon;
			
		}
		public override function destory():void{
			if(_btn_buqi) {_btn_buqi.destory();_btn_buqi=null;}
			if(_fnt_exchange_name) {_fnt_exchange_name.destory();_fnt_exchange_name=null;}
			if(_fnt_exchange_num) {_fnt_exchange_num.destory();_fnt_exchange_num=null;}
			if(_fnt_cost_num) {_fnt_cost_num.destory();_fnt_cost_num=null;}
			if(_fnt_inexchange_name) {_fnt_inexchange_name.destory();_fnt_inexchange_name=null;}
			if(_fnt_inexchange_num) {_fnt_inexchange_num.destory();_fnt_inexchange_num=null;}
			if(_btn_exchange) {_btn_exchange.destory();_btn_exchange=null;}
			if(_pos_1) {_pos_1.destory();_pos_1=null;}
			if(_pos_2) {_pos_2.destory();_pos_2=null;}
			_mc_cash=null;
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
		}
		
		public function get index():int
		{
			return 0;
		}
		
/*		public function loadData($data:Object):*
		{
			setData($data);
			return null;
		}*/
		
		public function get data():Object
		{
			return m_data;
		}
		
		public function get shoujiData():ShoujiItemData{
			return m_data as ShoujiItemData;
		}
		
		public function enterMovie():*
		{
			return null;
		}
		
		private function onBuqi(evt:Event):void{
			var shoujiModel:ShoujiModel=Context.getInjectInstance(ShoujiModel);
			var re:JudgeResult=shoujiModel.couldBuqi(shoujiData);
			if(re.success){
				C2SEmitter.shoujiBuqiItem(shoujiData.node.id);
			}else{
//				if(re.code==JudgeResult.CD_CashNotEnough){
//					WindowManager.getWindowByClass(ChongzhiTishiWindow).open();
//				}else{
//					Util.flow(re.desc);
//				}
				CommonControlFun.proccessJudgeResult(re);
			}
			
			
		}
		private function onDuihuan(evt:Event):void{
			var shoujiModel:ShoujiModel=Context.getInjectInstance(ShoujiModel);
			var re:JudgeResult=shoujiModel.couldDuihuan(shoujiData);
			if(re.success){
				C2SEmitter.shoujiDuihuanItem(shoujiData.node.id);
				
				// test
//				(Context.getInjectInstance(MDI_shoujiDuihuan) as MDI_shoujiDuihuan).showDuihuanReward(shoujiData.node.id);
				
			}else{
				Util.flow(re.desc);
			}
			
		}
		
		
		
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_buqi,TqtEvent.BUTTON_CLICK,onBuqi);
			addTargetEvent(_btn_exchange,TqtEvent.BUTTON_CLICK,onDuihuan);
			addTargetEvent(_btn_exchange,TqtEvent.BUTTON_CLICK_DISABLE,onDuihuan);
		}
		protected override function setShow():void
		{
			var shoujiModel:ShoujiModel=Context.getInjectInstance(ShoujiModel);
			_btn_exchange.isEnabled=shoujiModel.couldDuihuan(shoujiData).success;
			_pos_1.fillWithObject(new ItemMc().loadData(shoujiData.sourceItemNode));
			_pos_2.fillWithObject(Util.createIcon(shoujiData.node.duihuan_type,shoujiData.node.duihuan_id));
			_fnt_cost_num.text=shoujiData.calcBuqiUseCash().toString();
			_fnt_exchange_name.text=shoujiData.shouji_name;
			_fnt_exchange_num.text=shoujiData.collect_num+"/"+shoujiData.node.shouji_num;
			_fnt_inexchange_name.text=Util.createJiangliName(shoujiData.node.duihuan_type,shoujiData.node.duihuan_id);				//shoujiData.node.duihuan_name;
			_fnt_inexchange_num.text="x"+shoujiData.node.duihuan_num;
			
			// warning 
			if(shoujiData.collect_num>=shoujiData.node.shouji_num){
				_btn_buqi.visible=false;
				_fnt_cost_num.visible=false;
				_mc_cash.visible=false;
			}else{
				_mc_cash.visible=true;
				_btn_buqi.visible=true;
				_fnt_cost_num.visible=true;
			}
			
//			_fnt_cost_num.text=shoujiData.node.shouji_wupin*
		}
		protected override function get itemClassName():Class
		{
			return ItemGoodsExchange; 
		}
		private function get itemMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
	}
}
