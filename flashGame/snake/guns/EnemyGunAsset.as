package snake.guns
{
	import flash.display.Sprite;

	public class EnemyGunAsset
	{
		public function EnemyGunAsset()
		{
			gun_right=new Vector.<Sprite>();
			gun_left=new Vector.<Sprite>();
		}
		
		public var gun_right:Vector.<Sprite>;
		public var gun_left:Vector.<Sprite>;
	}
}