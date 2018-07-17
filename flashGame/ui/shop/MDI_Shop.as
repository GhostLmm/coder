package ui.shop
{
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import view.module.LabelSwitch;
	
	public class MDI_Shop extends Mediator
	{
		[Inject]
		public var window:ShopWindow;
		
		[Inject]
		public var userModel:UserModel;
		
		private var labelSwitch:LabelSwitch;
		
		public function MDI_Shop()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			initModule();
			registerEvent();
			setShow();
		}
		private function initModule():void
		{
			userModel.userVo.update_SN.add(onFresh);
			labelSwitch=new LabelSwitch(window._pos_shop,[window._btn_tag1,window._btn_tag2,window._btn_tag3],[Panel_Shenmishangdian,Panel_Libao_ShopWindow,Panel_ShengwangDuihuan]);
		}
		private function onFresh():void
		{
			window._scn_cash.num=userModel.userVo.userCash;
			window._scn_money.num=userModel.userVo.userMoney;
		}
		private function registerEvent():void
		{
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void
		{
			if((null!=window._params)&&((window._params==Panel_Shenmishangdian)||(window._params==Panel_Libao_ShopWindow)||(window._params==Panel_Tuangou_ShopWindow)))
			{
				labelSwitch.changeShowPanel(window._params as Class);
			}
			else
			{
				labelSwitch.changeShowPanel(Panel_Shenmishangdian);
			}
			onFresh();
		}
		public override function destroy():void
		{
			userModel.userVo.update_SN.remove(onFresh);
			labelSwitch.destory();
			labelSwitch=null;
			super.destroy();
		}
	}
}