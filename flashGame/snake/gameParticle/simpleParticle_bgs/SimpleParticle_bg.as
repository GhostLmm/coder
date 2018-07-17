package snake.gameParticle.simpleParticle_bgs
{
	import com.fish.modules.core.models.BattleModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import snake.BattleAssetPreload;
	import snake.GameCanvas;
	import snake.GameLevel;
	import snake.GameManager;
	import snake.GameObjective;
	import snake.GameSoundSFX;
	import snake.GameTileSet;

	public class SimpleParticle_bg
	{
		public function SimpleParticle_bg()
		{
		}
		/*
		
		public override function excuteLogic():void{
		
		}
		
		public override function excuteRender():void{
		
		}
		
		*/
		
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
		
		
		public var simpleParticle_bg_type:int;
		public var simpleParticle_bg_x:Number;
		public var simpleParticle_bg_y:Number;
		public var simpleParticle_bg_r:Number;
		public var simpleParticle_bg_p1:Number;
		public var simpleParticle_bg_p2:Number;
		
		
		public static function destory():void{
			assetConfig=null;
			level=null;
			tileSet=null;
			canvas=null;
			
			particleVect=new Vector.<SimpleParticle_bg>();
			
		}
		public static var particleVect:Vector.<SimpleParticle_bg>=new Vector.<SimpleParticle_bg>();
		public static function addSimpleParticle_bg(type:int, x:Number, y:Number, r:Number, p1:Number, p2:Number):void
		{
			var p:SimpleParticle_bg;
			
//			if(type==0){
//				p=new SimpleParticle_bg_0();
//			}
//			if(type==1){
//				p=new SimpleParticle_bg_1();
//			}
//			if(type==2){
//				p=new SimpleParticle_bg_2();
//			}
//			if(type==3){
//				p=new SimpleParticle_bg_3();
//			}
//			if(type==4){
//				p=new SimpleParticle_bg_4();
//			}
			if(type==5){
				if(GameManager.getManagerType()==GameManager.MG_Fuben){
					var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
					if(battleModel.hasNextMinorGuanka()){
						p=new SimpleParticle_bg_portal();
					}
				}
				
			}
			if(p==null){
				trace("简单 效果背景 没有配置：\t"+type);
				return ;
			}
			
			p.simpleParticle_bg_type=type;
			p.simpleParticle_bg_x=x;
			p.simpleParticle_bg_y=y;
			p.simpleParticle_bg_r=r;
			p.simpleParticle_bg_p1=p1;
			p.simpleParticle_bg_p2=p2;
			particleVect.push(p);
			return;
		}// end function
		
		public static function removeSimpleParticle_bg(index:int=0):void
		{
//			simpleParticle_bg_type.splice(param1, 1);
//			simpleParticle_bg_x.splice(param1, 1);
//			simpleParticle_bg_y.splice(param1, 1);
//			simpleParticle_bg_r.splice(param1, 1);
//			simpleParticle_bg_p1.splice(param1, 1);
//			simpleParticle_bg_p2.splice(param1, 1);
			particleVect.splice(a,1);
			a  -- ;
			
			return;
		}
		
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