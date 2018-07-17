package snake.guns
{
	import flash.display.BitmapData;
	import flash.display.Sprite;

	public class GunAsset
	{
		public function GunAsset()
		{			
			gun_right=new Vector.<Sprite>();
			gun_left=new Vector.<Sprite>();
		}
		public var gun_right:Vector.<Sprite>;
		public var gun_left:Vector.<Sprite>;
		
		public var gun_reload_right:BitmapData;
		public var gun_reload_left:BitmapData;
		
		public function destory():void{
			if(gun_reload_right) {gun_reload_right.dispose();gun_reload_right=null;}
			if(gun_reload_left) {gun_reload_left.dispose();gun_reload_left=null;}
			gun_right=null;
			gun_left=null;
		}
	}
}