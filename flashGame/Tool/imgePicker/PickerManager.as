package Tool.imgePicker
{
	import Tool.platform.PlatformManager;
	
	import flash.display.BitmapData;
	import flash.geom.Matrix;

	public class PickerManager
	{
		private static var _instance:PickerManager;
		public static function getInstance():PickerManager
		{
			if(_instance==null) _instance=new PickerManager();
			return _instance;
		}
		
		private var _picker:Ipicker;
		private function get picker():Ipicker
		{
			if(_picker==null) _picker=PickerAdapt.createPicker();
			return _picker;
		}
		private var _bitdata:BitmapData;
		
//		public function setCallBack(selectCom:Function,selectCancle:Function):void
//		{
//			picker.setPickerCompleteFn(selectCom);
//		}
		private function selectCom(bit:BitmapData):void
		{
			PlatformManager.getInstance().uploadHeadPic(bit);
		}
		public function pickerImage():void
		{
			picker.setPickerCompleteFn(selectCom);
			picker.pickerImage();
		}
		
		
		private static const Size:int=100;
		public static function cropBitdata(source:BitmapData):BitmapData
		{
			if(source==null) return null;
			var bitdata:BitmapData;
			if(source.width==Size && source.height==Size)
			{
				bitdata=source;
			}
			else
			{
				bitdata=new BitmapData(Size,Size,true,0);
				var mt:Matrix=new Matrix();
				mt.scale(Size/source.width,Size/source.height);
				bitdata.draw(source,mt);
				source.dispose();
			}
			return bitdata;
		}
	}
}