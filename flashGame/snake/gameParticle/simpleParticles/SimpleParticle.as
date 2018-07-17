package snake.gameParticle.simpleParticles
{
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	

	import snake.BattleAssetPreload;
	import snake.GameCanvas;
	import snake.GameLevel;
	import snake.GameObjective;
	import snake.GameSoundSFX;
	import snake.GameTileSet;

	public class SimpleParticle
	{
		/*
		
		public override function excuteLogic():void{
		
		}
		
		public override function excuteRender():void{
			
		}
		
		*/
		
		
		public function SimpleParticle()
		{
		}
		
		//  中间值
		public static var a:int;
		public static var b:int;
		public static var c:int;
		public static var d:int;
		public static var e:int;
		public static var tempMc:MovieClip;
		public static var trans:Matrix=new Matrix();
		public static var rect:Rectangle=new Rectangle();
		public static var tempPoint:Point=new Point();
		public static var tileOn:int;
		
		
		public static var level:GameLevel;
		public static var tileSet:GameTileSet;
		public static var canvas:GameCanvas;
//		public static var assetConfig:AssetConfig;
		public static var assetConfig:BattleAssetPreload;
		
		public static var sound:GameSoundSFX;
		public static var objective:GameObjective;
		
		
		public var simpleParticle_type:int;
		public var simpleParticle_x:Number;
		public var simpleParticle_y:Number;
		public var simpleParticle_r:Number;
		public var simpleParticle_p1:Number;
		public var simpleParticle_p2:Number;
		
		
		public static function destory():void{
//			player=null;
			assetConfig=null;
			level=null;
			tileSet=null;
			canvas=null;
			
			particleVect=new Vector.<SimpleParticle>();
		}
		
		private static var particleVect:Vector.<SimpleParticle>=new Vector.<SimpleParticle>();
		public static function addSimpleParticle(type:int, x:Number, y:Number, r:Number, p1:*, p2:*):void
		{
//			trace("simParticle "+type);
			var simParticle:SimpleParticle;
			
			if(type==0){
				simParticle=new SimpleParticle_0();
			}
			if(type==1){
				simParticle=new SimpleParticle_1();
			}
			if(type==2){
				simParticle=new SimpleParticle_2();
			}
			if(type==3){
				simParticle=new SimpleParticle_3();
			}
			if(type==4){
				simParticle=new SimpleParticle_4();
			}
			if(type==5){
				simParticle=new SimpleParticle_5();
			}
			if(type==6){
				simParticle=new SimpleParticle_6();
			}
			if(type==7){
				simParticle=new SimpleParticle_7();
			}
			if(type==8){
				simParticle=new SimpleParticle_8();
			}
			if(type==9){
				simParticle=new SimpleParticle_9();
			}
			if(type==10){
				simParticle=new SimpleParticle_10();
			}
			if(type==11){
				simParticle=new SimpleParticle_11();
			}
			if(simParticle==null){
				trace("简单效果没有定义：\t"+type);
				return ;
			}
			simParticle.simpleParticle_type=type;
			simParticle.simpleParticle_x=x;
			simParticle.simpleParticle_y=y;
			simParticle.simpleParticle_r=r;
			simParticle.simpleParticle_p1=p1;
			simParticle.simpleParticle_p2=p2;
			particleVect.push(simParticle);
			return;
		}// end function
		
		public static function removeSimpleParticle(param1:int=0):void
		{
//			this.simpleParticle_type.splice(param1, 1);
//			this.simpleParticle_x.splice(param1, 1);
//			this.simpleParticle_y.splice(param1, 1);
//			this.simpleParticle_r.splice(param1, 1);
//			this.simpleParticle_p1.splice(param1, 1);
//			this.simpleParticle_p2.splice(param1, 1);
//			
//			this.a  -- ;
			particleVect.splice(a,1);
			a--;
			return;
		}// end function
		
		public function excuteLogic():void{
			
		}
		
		public function excuteRender():void{
			
		}
		
		public static function logic():void{
			a=0;
			while(a<particleVect.length){
				particleVect[a].excuteLogic();
				a++;
			}
		}
		
		public static function render():void{
			a=0;
			while(a<particleVect.length){
				particleVect[a].excuteRender();
				a++;
			}
		}
	}
}