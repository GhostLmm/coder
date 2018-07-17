package ui.shop
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.models.BuyItemModel;
	import com.fish.modules.core.models.ItemModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.RewardsPackData;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_item;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import ui.mc.ItemMc;
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	import view.CommonControlFun;
	
	public class Item_LibaoPanel extends Base_Item implements IGridItemMax
	{
		public var _pos_touxiang:Position;
		public var _pos_huobi:Position;
		
		public var _fnt_name:FontField;
		public var _fnt_shanghaizhi:FontField;
		
		
		public var _mc_bg:MovieClip;
		public var _fnt_goumai:FontField;
		
		public function Item_LibaoPanel()
		{
			super();
		}
		protected override function initModule():void
		{
			_pos_touxiang=new Position(itemMaterial.pos_touxiang);
			_pos_huobi=new Position(itemMaterial.pos_huobi);
			
			_fnt_name=new FontField(itemMaterial.fnt_name);
			_fnt_shanghaizhi=new FontField(itemMaterial.fnt_shanghaizhi);
			
			_mc_bg=itemMaterial.mc_bg;
			_mc_bg.stop();
			
			_fnt_goumai=new FontField(itemMaterial.fnt_goumai);
			
			itemMaterial.mc_vip.visible=false;
			
			this.mouseChildren=false;
			this.mouseEnabled=true;
		}
		protected override function registerEvent():void
		{
			addTargetEvent(this,TQTTouchEvent.TOUCH_TAP,onGoumaiClicked);
		}
		protected function onGoumaiClicked(evt:Event):void
		{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(node.vip_limit>userModel.userVo.vipLevel)
			{
				Util.flow("需要vip等级购买",node.vip_limit);	
				return;
			}
			var buyModel:BuyItemModel=Context.getInjectInstance(BuyItemModel);
			var re:JudgeResult=buyModel.couldBuyItem(node);
			if(re.success){
				var str:String=Util.getLanguage("购买道具",node.buy_price,Util.getLanguage(node.buy_type),node.name);
				CommonControlFun.confirmDoSth(str,onGoumaiOK);
			}else{
				CommonControlFun.proccessJudgeResult(re);
			}
		}
		private function onGoumaiOK(evt:Event=null):void
		{
			C2SEmitter.buyItemAndUse(node.id);			
		}
		protected override function setShow():void
		{
			_pos_touxiang.fillWithObject(new ItemMc().loadData(node));
			_fnt_name.text=node.name;
			_fnt_shanghaizhi.text=node.buy_price.toString();
			
			_pos_huobi.fillWithBitmapByClassName("icon_"+node.buy_type);
			
			_mc_bg.gotoAndStop(1);
		}
		private function destoryMc():void
		{
			if(_pos_touxiang){_pos_touxiang.destory();_pos_touxiang=null;};
			if(_pos_huobi){_pos_huobi.destory();_pos_huobi=null;};
			
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			if(_fnt_shanghaizhi){_fnt_shanghaizhi.destory();_fnt_shanghaizhi=null;};
			
			if(_fnt_goumai){_fnt_goumai.destory();_fnt_goumai=null;};
			if(_mc_bg){_mc_bg=null;};
		}
		protected override function get itemClassName():Class
		{
			return ItemShop;
		}
		private function get itemMaterial():ItemShop
		{
			return m_mc as ItemShop;
		}
		public override function destory():void
		{
			destoryMc();
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
		
		public function get data():Object
		{
			return null;
		}
		
		public function enterMovie():*
		{
			return null;
		}
		public function get node():Node_item
		{
			return m_data as Node_item;
		}
	}
}