package snake.gameEnemys
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Matrix;
	
	import snake.GameManager;

	public class ZombieAsset
	{
		public function ZombieAsset(zombieSprite:int)
		{
			head=new Sprite();
			body=new Sprite();
			foot=new Sprite();
			ankle=new Sprite();
			hand1=new Sprite();
			hand2=new Sprite();
			initAsset(zombieSprite);
		}
		
		public function initAsset(a:int):void{
			var tempMc:MovieClip;
			var trans:Matrix;
			
			tempMc = new zombie_head_mc();
			tempMc.gotoAndStop(a);
			head_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
			tempMc.box.visible = false;
			tempMc.filters = [new ColorMatrixFilter(GameManager.manager.tileSet.levelColorFilter.CalculateFinalFlatArray())];
			trans = new Matrix();
			trans.tx = -tempMc.box.x;
			trans.ty = -tempMc.box.y;
			head_bm.draw(tempMc, trans);
			trans.tx = tempMc.box.x;
			trans.ty = tempMc.box.y;
			head.graphics.clear();
			head.graphics.beginBitmapFill(head_bm, trans, false, true);
			
			head.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
			tempMc = new zombie_body_mc();
			tempMc.gotoAndStop(a);
			
			body_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
			tempMc.box.visible = false;
			tempMc.filters = [new ColorMatrixFilter(GameManager.manager.tileSet.levelColorFilter.CalculateFinalFlatArray())];
			trans = new Matrix();
			trans.tx = -tempMc.box.x;
			trans.ty = -tempMc.box.y;
			body_bm.draw(tempMc, trans);
			trans.tx = tempMc.box.x;
			trans.ty = tempMc.box.y;
			body.graphics.clear();
			body.graphics.beginBitmapFill(body_bm, trans, false, true);
			
			body.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
			tempMc = new zombie_foot_mc();
			tempMc.gotoAndStop(a);
			foot_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
			tempMc.box.visible = false;
			tempMc.filters = [new ColorMatrixFilter(GameManager.manager.tileSet.levelColorFilter.CalculateFinalFlatArray())];
			trans = new Matrix();
			trans.tx = -tempMc.box.x;
			trans.ty = -tempMc.box.y;
			foot_bm.draw(tempMc, trans);
			trans.tx = tempMc.box.x;
			trans.ty = tempMc.box.y;
			foot.graphics.clear();
			foot.graphics.beginBitmapFill(foot_bm, trans, false, true);
			
			foot.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
			tempMc = new zombie_ankle_mc();
			tempMc.gotoAndStop(a);
			ankle_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
			tempMc.box.visible = false;
			tempMc.filters = [new ColorMatrixFilter(GameManager.manager.tileSet.levelColorFilter.CalculateFinalFlatArray())];
			trans = new Matrix();
			trans.tx = -tempMc.box.x;
			trans.ty = -tempMc.box.y;
			ankle_bm.draw(tempMc, trans);
			trans.tx = tempMc.box.x;
			trans.ty = tempMc.box.y;
			ankle.graphics.clear();
			ankle.graphics.beginBitmapFill(ankle_bm, trans, false, false);
			ankle.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
			tempMc = new zombie_hand1_mc();
			tempMc.gotoAndStop(a);
			hand1_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
			tempMc.box.visible = false;
			tempMc.filters = [new ColorMatrixFilter(GameManager.manager.tileSet.levelColorFilter.CalculateFinalFlatArray())];
			trans = new Matrix();
			trans.tx = -tempMc.box.x;
			trans.ty = -tempMc.box.y;
			hand1_bm.draw(tempMc, trans);
			trans.tx = tempMc.box.x;
			trans.ty = tempMc.box.y;
			hand1.graphics.clear();
			hand1.graphics.beginBitmapFill(hand1_bm, trans, false, true);
			//				if (smoothEnemies == true)
			//				{
			//					hand1.graphics.beginBitmapFill(hand1_bm, trans, false, true);
			//				}
			//				else
			//				{
			//					hand1.graphics.beginBitmapFill(hand1_bm, trans, false, false);
			//				}
			hand1.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
			tempMc = new zombie_hand2_mc();
			tempMc.gotoAndStop(a);
			hand2_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
			tempMc.box.visible = false;
			tempMc.filters = [new ColorMatrixFilter(GameManager.manager.tileSet.levelColorFilter.CalculateFinalFlatArray())];
			trans = new Matrix();
			trans.tx = -tempMc.box.x;
			trans.ty = -tempMc.box.y;
			hand2_bm.draw(tempMc, trans);
			trans.tx = tempMc.box.x;
			trans.ty = tempMc.box.y;
			hand2.graphics.clear();
			hand2.graphics.beginBitmapFill(hand2_bm, trans, false, true);
			//				if (smoothEnemies == true)
			//				{
			//					hand2.graphics.beginBitmapFill(hand2_bm, trans, false, true);
			//				}
			//				else
			//				{
			//					hand2.graphics.beginBitmapFill(hand2_bm, trans, false, false);
			//				}
			hand2.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
		}
		
		public var head:Sprite;
		public var head_bm:BitmapData;
		public var body:Sprite;
		public var body_bm:BitmapData;
		public var foot:Sprite;
		public var foot_bm:BitmapData;
		public var ankle:Sprite;
		public var ankle_bm:BitmapData;
		public var hand1:Sprite;
		public var hand1_bm:BitmapData;
		public var hand2:Sprite;
		public var hand2_bm:BitmapData;
		
		
		
		
	}
}