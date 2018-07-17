package ui.digWindow
{
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import core.event.TqtEvent;
	
	public class MDI_Renwu extends Mediator
	{
		[Inject]
		public var wm:RenwuWindow;
		public function MDI_Renwu()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
		}
		
		
		
		public override function destroy():void
		{
			// todo
			super.destroy();
		}
	}
}