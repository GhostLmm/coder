package
{
	import flash.display.Stage;

	public class GameGlobalRef
	{
		public function GameGlobalRef()
		{
		}
		public static var stage:Stage;
		public static var scaleX:Number;
		public static var scaleY:Number;
		
		public static const Base_Width:Number=960;
		public static const Base_Height:Number=640;
		
		public static var diggame:DigGame;
		
		public static const TileSize:int=50;
	}
}