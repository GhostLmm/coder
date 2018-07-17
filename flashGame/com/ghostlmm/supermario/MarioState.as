package com.ghostlmm.supermario
{
	import com.ghostlmm.supermario.gameobject.Mario;
	
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	
	import citrus.core.State;
	import citrus.math.MathVector;
	import citrus.objects.platformer.box2d.Coin;
	import citrus.objects.platformer.box2d.Hero;
	import citrus.objects.platformer.box2d.Platform;
	import citrus.physics.box2d.Box2D;
	import citrus.utils.objectmakers.ObjectMaker2D;
	
	public class MarioState extends State
	{
		[Embed(source="/../Assest/Level/map.tmx",mimeType="application/octet-stream")]
		private const _map:Class;
		
		[Embed(source="/../Assest/Level/Genetica-tiles.png"]
		private const _ImgTiles:Class;
		
		private var _mario:Mario;
		public function MarioState()
		{
			super();
			Hero;Coin,Mario;Platform;
		}
		
		override public function initialize() : void
		{
			super.initialize();
			MarioUtil.addKeyAction();
			initLvelMap();
			initHero();
			setViewFocus();
		}
		private function initHero():void{
			_mario=getObjectByName("mario");
		}
		
		private function setViewFocus():void{
			view.camera.setUp(_mario, new MathVector(GlobalRef.width / 2, 240),
				new Rectangle(0, 0, 1280, 640),new MathVector(.25,.25));
		}
		
		private function initLvelMap():void{
			var box2D:Box2D=new Box2D("box2d");
			box2D.visible=true;
			add(box2D);
			
			var bmp:Bitmap=new _ImgTiles();
			//添加name，使我们知道哪张图片呗选择了
			bmp.name="Genetica-tiles.png";
			
			ObjectMaker2D.FromTiledMap(XML(new _map()),[bmp]);
		}
		
	}
}