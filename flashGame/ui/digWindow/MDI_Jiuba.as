package ui.digWindow
{
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import core.event.TqtEvent;
	
	public class MDI_Jiuba extends Mediator
	{
		[Inject]
		public var window:JiubaWindow;
		public function MDI_Jiuba()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,window.close);
		}
		
		
		
		public override function destroy():void
		{
			// todo
			super.destroy();
		}
	}
}