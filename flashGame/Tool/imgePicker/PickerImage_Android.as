package Tool.imgePicker
{
	import flash.display.BitmapData;
	import flash.events.Event;

	public class PickerImage_Android implements Ipicker
	{
		private var browse:ImagBrowse;
		private var pickCompleteFn:Function;
		public function PickerImage_Android()
		{
			browse=new ImagBrowse();
			browse.addEventListener(ImagBrowse.Cancle,onCancle);
			browse.addEventListener(ImagBrowse.Complete,onComplete);
			browse.addEventListener(ImagBrowse.ErrorStats,onError);

		}
		
		private function onCancle(evt:Event):void
		{
			
		}
		private function onComplete(evt:Event):void
		{
			var bitdata:BitmapData=PickerManager.cropBitdata(browse.bitData);
			
			if(pickCompleteFn!=null)
			{
				pickCompleteFn(bitdata);
			}
			
			browse.clear();
			bitdata.dispose();
			bitdata=null;
		}
		private function onError(evt:Event):void
		{
			
		}
		public function pickerImage():void
		{
			browse.startBrowse();
		}
		
		public function setPickerCompleteFn(pickFn:Function):void
		{
			pickCompleteFn=pickFn;
		}
	}
}