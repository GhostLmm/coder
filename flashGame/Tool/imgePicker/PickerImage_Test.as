package Tool.imgePicker
{
	import flash.display.BitmapData;

	public class PickerImage_Test implements Ipicker
	{
		public function PickerImage_Test()
		{
		}
		
		private var _comFn:Function;
		
		
		public function pickerImage():void
		{
			var bitdata:BitmapData=new BitmapData(100,100,true,0);
			var color:uint=0xff000000+int(0xffffff*Math.random());
			bitdata.fillRect(bitdata.rect,color);
			if(_comFn!=null)
			{
				_comFn(bitdata);
			}
		}
		
		public function setPickerCompleteFn(pickFn:Function):void
		{
			_comFn=pickFn;
		}
	}
}