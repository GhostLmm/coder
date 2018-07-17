package snake
{
	public class KFC
	{
		public function KFC()
		{
		}
		
		/** 子弹撞击 敌人  应该传入一个子弹的 类 **/
		public static function bulletCollisions():void{
			
		}
		/** 子弹撞击主角  应该传入一个子弹的 类 **/
		public static function bulletCollisions_enemy():void{
			
		}
		
		
		
		public static var character_x:Number=600;
		public static var character_y:Number=600;
		public static var character_health:Number=100;
		public static var character_invincibleTime:int=6;
		public static var messageTime:int;
		public static var messageText:String;
		public static var messageTime2:int;
		public static var messageText2:String;
		public static var scoreTally:int
		
		public static var character_gunDX:int;
		public static var character_gunDY:int;
		
		public static var character_velX:Number;
		public static var jump:Boolean;
		public static var character_hurtTime:int=3;
		
		public static var hasDroppedMag:Boolean;
		
		public static var anim:int;
	}
}