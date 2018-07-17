package ui.shop
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.ShenmiShangdianModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_heidian;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.event.TQTTouchEvent;
	
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	import view.CommonControlFun;
	
	public class Item_ShenmiShangdian extends Base_Item implements IGridItemMax
	{
		public var _pos_touxiang:Position;
		public var _pos_huobi:Position;
		
		public var _fnt_name:FontField;
		public var _fnt_shanghaizhi:FontField;
		
		public var _mc_bg:MovieClip;
		public var _fnt_goumai:FontField;
		
		public var _fnt_vip_desc:FontField;

		public function Item_ShenmiShangdian()
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
			
			_fnt_vip_desc=new FontField(itemMaterial.mc_vip.fnt_vip_desc);
			
			this.mouseChildren=false;
			this.mouseEnabled=true;
		}
		private function destoryMc():void
		{
			Util.killDiaplayButtonEffect(this);
			if(_pos_touxiang){_pos_touxiang.destory();_pos_touxiang=null;};
			if(_pos_huobi){_pos_huobi.destory();_pos_huobi=null;};
			
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			if(_fnt_shanghaizhi){_fnt_shanghaizhi.destory();_fnt_shanghaizhi=null;};
			
			if(_fnt_goumai){_fnt_goumai.destory();_fnt_goumai=null;};
			if(_mc_bg){_mc_bg=null;};
			
			if(_fnt_vip_desc){_fnt_vip_desc.destory();_fnt_vip_desc=null;};
		}
		protected override function registerEvent():void
		{
			addTargetEvent(this,TQTTouchEvent.TOUCH_TAP,onGoumaiClick);
		}
		private function onGoumaiOK(evt:Event=null):void
		{
			if(m_data){
				
				C2SEmitter.buyShenmiShangdianItem(m_data.node.id);
			}
		}
		private function onGoumaiClick(evt:Event):void
		{
			if(null==m_data.node)
			{
				Util.flow("vip等级解锁",viewData.needVipLevel);
				return;
			}
			var shenmiModel:ShenmiShangdianModel=Context.getInjectInstance(ShenmiShangdianModel);
			var re:JudgeResult=shenmiModel.couldBuyShimiItem(viewData.node.id);
			var node:Node_heidian=viewData.node as Node_heidian;
			if(re.success){
				Panel_Shenmishangdian.gridNotEngouhTip=(re.code==JudgeResult.CD_BagGridNotEnough);
				onGoumaiOK();
			}else{
				CommonControlFun.proccessJudgeResult(re);
			}
		}
		protected override function setShow():void
		{
			Util.setDiaplayButtonEffect(this,false);
			if(null==viewData.node)
			{
				setVipShow();
			}
			else
			{
				setBuyItemShow();
			}
		}
		private function setBuyItemShow():void
		{
			var node:Node_heidian=viewData.node;
			Util.createJiangliIcon(_pos_touxiang,node.type,node.item_id);
			
			_fnt_name.text=Util.createJiangliDesc(node.type,node.item_num,node.item_id);
			_fnt_shanghaizhi.text=node.price.toString();
			
			_pos_huobi.fillWithBitmapByClassName("icon_"+node.price_type);
			if((Context.getInjectInstance(ShenmiShangdianModel) as ShenmiShangdianModel).hasBuyItem(node.id))
			{
				_fnt_goumai.text=Util.getLanguage("已购买");
				_mc_bg.gotoAndStop(3);
			}
			else
			{
				_fnt_goumai.text=Util.getLanguage("点击购买");
				_mc_bg.gotoAndStop(1);
			}
			
			setVisible(true);
		}
		private function setVisible(_value:Boolean):void
		{
			_pos_huobi.visible=_value;
			_fnt_name.visible=_value;
			_fnt_shanghaizhi.visible=_value;
			_fnt_goumai.visible=_value;
			itemMaterial.mc_fnt_bg.visible=_value;
			
			itemMaterial.mc_vip.visible=!_value;
			_fnt_vip_desc.visible=!_value;
		}
		private function setVipShow():void
		{
			_fnt_vip_desc.text=Util.getLanguage("vip等级解锁",viewData.needVipLevel);
			_pos_touxiang.fillWithBitmapByClassName(Util.getVipIcon(viewData.needVipLevel));
			_mc_bg.gotoAndStop(3);
			setVisible(false);
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
		
		public override function loadData($data:Object):*
		{
			super.loadData($data);
		}
		
		public function get data():Object
		{
			return m_data;
		}		
		public function enterMovie():*
		{
			return null;
		}
		public function get viewData():ViewData_Shenmishangdian
		{
			return m_data as ViewData_Shenmishangdian;
		}
	}
}