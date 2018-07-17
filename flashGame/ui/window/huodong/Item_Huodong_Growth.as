package  ui.window.huodong
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.GrowthModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollController;
	import ui.window.huodong.items.IHuodongItem;
	import ui.window.huodong.items.Item_GrowthPlanWindow;
	
	import util.Util;
	
	import view.Base_Item;
	import view.CommonControlFun;

	public class Item_Huodong_Growth extends Base_Item implements IHuodongItem
	{
//		public var _btn_close:Button;
//		public var _btn_chongzhi:Button;
		public var _btn_goumai:Button;
		
		public var _fnt_cash:FontField;
		
		public var _pos_scroll_jihua:Position;
		public var _scrollController:ScrollController;
		
		public var _fnt_fanhuan_cash:FontField;
		
		private var growthModel:GrowthModel;
		
		public function Item_Huodong_Growth()
		{
			super();
		}
		private var _type:String;
		public function get type():String
		{
			return _type;
		}
		
		public function set type(value:String):void
		{
			_type=value;
		}
		
		protected override function initModule():void{
			
			growthModel=Context.getInjectInstance(GrowthModel);
			
			var windowMaterial:flash.display.MovieClip=material; 
//			_btn_chongzhi=new Button(windowMaterial.btn_chongzhi);
//			_btn_close=new Button(windowMaterial.btn_close);
			_btn_goumai=new Button(windowMaterial.btn_goumai);
			
			_fnt_cash=new FontField(windowMaterial.fnt_cash);
			
			_pos_scroll_jihua=new Position(windowMaterial.pos_scroll_jihua);
			_scrollController=new ScrollController(_pos_scroll_jihua);
			_pos_scroll_jihua.removeChildren();
			_pos_scroll_jihua.addChild(_scrollController);
			
			_fnt_fanhuan_cash=new FontField(windowMaterial.fnt_fanhuan_cash);
			
			this._scrollController.initItemClass(Item_GrowthPlanWindow);
			
			this._fnt_fanhuan_cash.text=GrowthModel.getTotalRewardCash()+Util.getLanguage("cash");
		}
		
		protected override function registerEvent():void{
			
			S2CHanlder.instance.Opt_Message_SN.add(onMessage);
			growthModel.modelUpdata_SN.add(onUpdate);
			
			
//			addTargetEvent(this._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
//			addTargetEvent(this._btn_chongzhi,TqtEvent.BUTTON_CLICK,onChongzhiClicked);
			addTargetEvent(this._btn_goumai,TqtEvent.BUTTON_CLICK,onGoumaiClicked);
			addTargetEvent(this._btn_goumai,TqtEvent.BUTTON_CLICK_DISABLE,onGoumaiClicked);
			
		}
		
		private function onUpdate():void{
			setShow();
			MDI_HuodongNew.updateIcon();
		}
		
		private function onMessage(_mesType:String,_code:int):void
		{
			if(_mesType==C2SEmitter.REQ_BuyChengzhangJihuaHandler)
			{
				if(_code==1)
				{
					Util.flow("购买成长计划成功");
					setShow();
					MDI_HuodongNew.updateIcon();
				}
			}
		}
		private function onCloseClicked(evt:Event):void
		{
//			this.close();
		}
		private function onChongzhiClicked(evt:Event):void
		{
//			this.close();
			Util.openChongzhiWinodow();
		}
		private function onGoumaiClicked(evt:Event):void
		{
			if(growthModel.isAreadyBuy())
			{
				Util.flow("已经购买过成长计划");
				return;
			}
			if(!growthModel.isVipLevelCanAfford())
			{
				Util.flow("需要vip等级购买成长计划",growthModel.jihuaNeedVipLevel);
				return;
			}
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(!userModel.cashCouldAfford(growthModel.jihuaNeedCash))
			{
				CommonControlFun.cashNotEnoughDo();
				return;
			}
			growthModel.buyGrowthPlan();
		}
		
		protected override function setShow():void{
			this._fnt_cash.text=growthModel.jihuaNeedCash.toString();
			this._scrollController.setData(growthModel.rewardsArray);
			if(growthModel.growthVo.hasGoumai>0)
			{
				this._btn_goumai.isEnabled=false;
			}
			else
			{
				this._btn_goumai.isEnabled=true;;
			}
		}
		
		public override function destory():void{
			
			growthModel.modelUpdata_SN.remove(onUpdate);
			S2CHanlder.instance.Opt_Message_SN.remove(onMessage);
			
//			if(_btn_chongzhi){_btn_chongzhi.destory();_btn_chongzhi=null;};
//			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_goumai){_btn_goumai.destory();_btn_goumai=null;};
			
			if(_fnt_cash){_fnt_cash.destory();_fnt_cash=null;};
			
			if(_pos_scroll_jihua){_pos_scroll_jihua.destory();_pos_scroll_jihua=null;};
			if(_scrollController){_scrollController.destory();_scrollController=null;};
			if(_fnt_fanhuan_cash){_fnt_fanhuan_cash.destory();_fnt_fanhuan_cash=null;};
			
			super.destory();
		}
		
		private function get material():flash.display.MovieClip{
			return m_mc as flash.display.MovieClip; 
			
		}
		protected override function get itemClassName():Class
		{
			return Scene_Huodong_Jihua;
			
		}
	}
}
