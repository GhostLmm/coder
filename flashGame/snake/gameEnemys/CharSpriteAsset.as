package snake.gameEnemys
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Matrix;

	public class CharSpriteAsset
	{
		public function CharSpriteAsset()
		{
			char_head=new Sprite();
			
			char_body=new Sprite();
			char_foot=new Sprite();
			char_ankle=new Sprite();
			char_hand1=new Sprite();
			char_hand2=new Sprite();
		}
		
		public function resetTransform():void{
			char_head.transform.matrix=new Matrix();
			char_body.transform.matrix=new Matrix();
			char_foot.transform.matrix=new Matrix();
			char_ankle.transform.matrix=new Matrix();
			char_hand1.transform.matrix=new Matrix();
			char_hand2.transform.matrix=new Matrix();
		}
		
		public var char_head:Sprite;
		public var char_head_bm:BitmapData;
		public var char_body:Sprite;
		public var char_body_bm:BitmapData;
		public var char_foot:Sprite;
		public var char_foot_bm:BitmapData;
		public var char_ankle:Sprite;
		public var char_ankle_bm:BitmapData;
		public var char_hand1:Sprite;
		public var char_hand1_bm:BitmapData;
		public var char_hand2:Sprite;
		public var char_hand2_bm:BitmapData;
		public var character_appearance:Array;
		public var character_colors:Array;
		
		/*public function destory():void{
			char_head=null;
			
			char_body=null;
			char_foot=null;
			char_ankle=null;
			char_hand1=null;
			char_hand2=null;
			
			if(char_head_bm) {char_head_bm.dispose(); char_head_bm=null;}
			if(char_body_bm) {char_body_bm.dispose(); char_body_bm=null;}
			if(char_foot_bm) {char_foot_bm.dispose(); char_foot_bm=null;}
			if(char_ankle_bm) {char_ankle_bm.dispose(); char_ankle_bm=null;}
			if(char_hand1_bm) {char_hand1_bm.dispose(); char_hand1_bm=null;}
			if(char_hand2_bm) {char_hand2_bm.dispose(); char_hand2_bm=null;}
			
		}*/
	}
}