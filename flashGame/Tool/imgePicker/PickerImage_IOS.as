package Tool.imgePicker
{
	import com.nativeextensin.nativeiosextension.NativeIosExtension;
	import com.nativeextensin.nativeiosextension.PickImageEvent;
	
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.geom.Matrix;
	
	public class PickerImage_IOS implements Ipicker
	{
		private var comFn:Function;
		public function PickerImage_IOS()
		{
			
			NativeIosExtension.self.addEventListener(PickImageEvent.EVENT_PICK_IMAGE,onPicker);
		}
		
		private static const Size:int=100;
		private function onPicker(evt:PickImageEvent):void
		{
			if(comFn!=null)
			{
				var bitdata:BitmapData;
				if(evt.bitmapData.width==Size && evt.bitmapData.height==Size)
				{
					bitdata=evt.bitmapData;
				}
				else
				{
					bitdata=new BitmapData(Size,Size,true,0);
					var mt:Matrix=new Matrix();
					mt.scale(Size/evt.bitmapData.width,Size/evt.bitmapData.height);
					bitdata.draw(evt.bitmapData,mt);
				}
				comFn(bitdata);
				bitdata.dispose();
			}
		}
//		private function onPicker(evt:PickImageEvent):void
//		{
//			if(comFn!=null)
//			{
//				comFn(evt.bitmapData);
//			}
//			comFn=null;
//		}
		public function pickerImage():void
		{
			NativeIosExtension.self.pickImage(EnvironmentParameter.PickType);
		}
		public function setPickerCompleteFn(pickFn:Function):void
		{
			comFn=pickFn;
		}
	}
}