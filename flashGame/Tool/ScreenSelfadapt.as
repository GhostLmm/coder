package Tool
{
	public class ScreenSelfadapt
	{
//		private static const ScreenList:Object={
//			"80000480":{w:800,h:480},
//			"96000640":{w:960,h:640},
//			"102400768":{w:1024,h:768},
//			"85400480":{w:854,h:480},
//			"113600640":{w:960,h:640},
//			"default":{w:800,h:480}
//		};
		
		public static function getAdaptScreen(width:int,height:int):Object
		{
			var ScreenList:Object=EnvironmentParameter.ScreenList;
			var screenString:String=(width*100000+height).toString();
			if(ScreenList.hasOwnProperty(screenString))
			{
				return ScreenList[screenString];
			}
			else
			{
				return ScreenList["default"];
			}
		}
		
		
//		public function ScreenSelfadapt()
//		{
//		}
	}
}