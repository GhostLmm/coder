package ui.paihangbang
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	public class MDI_Persondetail extends Mediator
	{
		[Inject]
		public var window:PersondetailWindow;
		
		private var otherUid:int;
		
		public function MDI_Persondetail()
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
			otherUid=int(window._params);
		}
		private function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
		}
		private function onOptMessage(_optMessage:String,_code:int):void
		{
			if(_optMessage==C2SEmitter.REQ_OtherPersonInfoGetHandler)
			{
				if(_code==1)
				{
					setUserInfo();
				}
			}
		}
		private function setUserInfo():void
		{
			window._otherHeroModule.loadData(GameVOManager.getInstance().persondetail);
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void
		{
			C2SEmitter.getOtherPersonInfo(otherUid);
		}
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			super.destroy();
		}
	}
}