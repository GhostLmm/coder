package Tool.imgePicker
{
	public class PickerAdapt
	{
		public function PickerAdapt()
		{
		}
		public static function createPicker():Ipicker
		{
//			return new PickerImage_Test();
//			return new PickerImage_IOS();
			return new PickerImage_Android();

		}
	}
}
