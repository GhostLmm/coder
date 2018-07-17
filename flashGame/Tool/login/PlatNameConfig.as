package Tool.login
{
	public class PlatNameConfig
	{
		/**
		 *  酷派
		 */
		public static const Plat_CoolPad:String="CoolPad";
		
		public static const Plat_Yidong:String="yidong";
		public function PlatNameConfig()
		{
		}
		public static function get platName():String
		{
			return Plat_CoolPad;
		}
	}
}