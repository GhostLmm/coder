package Tool.imgePicker
{
	import flash.events.IEventDispatcher;
	
	public interface Ipicker
	{
		function pickerImage():void;
		
		function setPickerCompleteFn(pickFn:Function):void;
	}
}