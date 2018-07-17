package ui.shop
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.RewardsData;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.RewardsPackData;
	import com.fish.modules.core.models.ShengwangModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_rongyu_shangdian;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollerControllerMatrix;
	import ui.window.CommonRewardWindow;
	
	import view.Panel_Base;

	public class Panel_ShengwangDuihuan extends Panel_Base
	{
		public var _pos_shengwang:Position;
		public var _scrollController:ScrollerControllerMatrix;
		public var _fnt_num:FontField;
		
		private var shengwangModel:ShengwangModel;
		private var userModel:UserModel;
		
		private var _btn_chakan:Button;
		
		public function Panel_ShengwangDuihuan()
		{
			super();
		}
		protected override function initModule():void
		{
			_pos_shengwang=new Position(panelMaterial.pos_scroll_shop);
			_scrollController=new ScrollerControllerMatrix(_pos_shengwang);
			_fnt_num=new FontField(panelMaterial.fnt_rongyu);
			
			shengwangModel=Context.getInjectInstance(ShengwangModel);
			userModel=Context.getInjectInstance(UserModel);
			_scrollController.initClass(Item_ShengwangDuihuan);
			
			_btn_chakan=new Button(panelMaterial.btn_add);
		}
		private function destoryMc():void
		{
			if(_pos_shengwang){_pos_shengwang.destory();_pos_shengwang=null;};
			if(_scrollController){_scrollController.destory();_scrollController=null;};
			if(_fnt_num){_fnt_num.destory();_fnt_num=null;};
			if(_btn_chakan){_btn_chakan.destory();_btn_chakan=null;};
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_chakan,TqtEvent.BUTTON_CLICK,onChakanClicked);
			shengwangModel.LimitChange_SN.add(onLimitChange);
			userModel.modelUpdata_SN.add(setShengwangNumShow);
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
		}
		private function onChakanClicked(evt:Event):void
		{
			WindowManager.openOnlyWinodw(RongyuchakanWindow);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_RongyuShangdianBuyHandler)
			{
				if(_code>0)
				{
					var shengwangModel:ShengwangModel=Context.getInjectInstance(ShengwangModel);
					showBuyResult();
				}
			}
		}
		private function showBuyResult():void
		{
			var shengwangModel:ShengwangModel=Context.getInjectInstance(ShengwangModel);
			var shengwangData:Node_rongyu_shangdian=XMLDataManager.getRongyu_shangdianById(shengwangModel.cacheBuyXid);
			var rewardsData:RewardsData=new RewardsData();
			rewardsData.key=shengwangData.item_type;
			rewardsData.xid=shengwangData.item_id;
			rewardsData.num=shengwangData.item_num;
			var rewardPackData:RewardsPackData=new RewardsPackData();
			rewardPackData.tiltle=RewardsPackData.Title_BuySuccess;
			rewardPackData.desc=RewardsPackData.Desc_BuySuccess;
			rewardPackData.itemObjArray=[rewardsData];	
			WindowManager.openOnlyWinodw(CommonRewardWindow,rewardPackData);
		}
		private function onLimitChange():void
		{
			setShow();
		}
		protected override function setShow():void
		{
			_scrollController.setData(shengwangModel.shengwangItemList);
			setShengwangNumShow();
		}
		private function setShengwangNumShow():void
		{
			_fnt_num.text=userModel.userVo.userRongyu.toString();
		}
		protected override function get panelClassName():Class
		{
			return SceneShop3;		}
		private function get panelMaterial():SceneShop3		{
			return material as SceneShop3;		}
		public override function clear():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			shengwangModel.LimitChange_SN.remove(onLimitChange);
			shengwangModel=null;
			userModel.modelUpdata_SN.remove(setShengwangNumShow);
			userModel=null;
			destoryMc();
			super.clear();
		}
	}
}
