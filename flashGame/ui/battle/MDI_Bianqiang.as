package ui.battle
{
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import view.CommonControlFun;
	
	public class MDI_Bianqiang extends Mediator
	{
		[Inject]
		public var wm:BianqiangWindow;
		
		public function MDI_Bianqiang()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			addViewListener(wm._btn_chaonengli,TqtEvent.BUTTON_CLICK,onClickChaonengli);
			addViewListener(wm._btn_choujiang,TqtEvent.BUTTON_CLICK,onClickChoujiang);
			addViewListener(wm._btn_qianghua,TqtEvent.BUTTON_CLICK,onClickQianghua);
			addViewListener(wm._btn_shengxing,TqtEvent.BUTTON_CLICK,onClickShengxing);
			addViewListener(wm._btn_xiangqian,TqtEvent.BUTTON_CLICK,onClickXianqian);
		}
		
		private function onClickChaonengli(evt:Event):void{
			CommonControlFun.openChaonengliWindow();
			wm.close();
		}
		private function onClickChoujiang(evt:Event):void{
			CommonControlFun.gotoQiyuanta();
			wm.close();
		}
		private function onClickQianghua(evt:Event):void{
			CommonControlFun.gotoQianghua();
			wm.close();
		}
		private function onClickShengxing(evt:Event):void{
			CommonControlFun.gotoShengxing();
			wm.close();
		}
		private function onClickXianqian(evt:Event):void{
			CommonControlFun.gotoXiangqian();
			wm.close();
		}
		
		
		
		public override function destroy():void
		{
			// todo
			super.destroy();
		}
		
	}
}