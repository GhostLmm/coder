package ui.widget
{
	import flash.events.EventDispatcher;
	
	import core.event.TqtEvent;

	public class TabButtonController extends EventDispatcher  implements IComponent
	{
		private var buttonArray:Array=[];
		
		private var _focus:String;
		
		public function get focus():String{
			return _focus;
		}
		
		public function TabButtonController()
		{
		}
		
		public function registerButton(button:ButtonInterface):void
		{
			if(buttonArray.indexOf(button)==-1){
				buttonArray.push(button);
				button.addEventListener(TqtEvent.BUTTON_CLICK,selectTab);
			}
		}
		private function selectTab(evt:TqtEvent):void
		{
			var r:Boolean=setFuocus(evt.target.name);
			if(r){
				var e:TqtEvent=new TqtEvent(TqtEvent.BUTTON_TA_SELECT,evt.target.name);
				dispatchEvent(e);
			}
		}
		
		public function setFuocus(target:String):Boolean
		{
			if(_focus==target){
				return false;
			}
			_focus=target;
			var re:Boolean=false;
			for each(var button:ButtonInterface in buttonArray)
			{
				if(button.isEnabled){
					button.isSelected=((button as Object).name==target);
					re= true;
				}
			}
			return re;
		}
		
		public function destory():void
		{
			if(buttonArray){
				buttonArray.length=0;
				buttonArray=null;
			}
		}
		
		public function getButtonByName(name:String):Button
		{
			for each(var button:Button in buttonArray){
				if(button.name==name){
					return button;
				}
			}
			return null;
		}
	}
}