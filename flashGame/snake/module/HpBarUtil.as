package snake.module
{
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	import snake.GameCanvas;
	import snake.GameManager;
	
	import util.Dict;

	public class HpBarUtil
	{
		public static const HpBarDisappearTime:Number=3000;
		public static var hpbarBg:mc_hpbarBG;
		public static var hpBar:mc_hpbar;
		public static var hpBar_player:mc_hpbar_player;
		public static var MaxWidth:Number;
		public static var MaxHeight:Number;
		public static var canvas:GameCanvas;
		
		public static var bulletMc:McHuanqiangAnim;
		public static var bulletMcWidth:Number;
		
		public function HpBarUtil()
		{
			init();
		}
		private static var m_instance:HpBarUtil;
		public static function getInstance():HpBarUtil
		{
			if(null==m_instance)
			{
				m_instance=new HpBarUtil();
			}
			return m_instance;
		}
		private function init():void
		{
			canvas=GameManager.manager.canvas;
			hpbarBg=new mc_hpbarBG();
			hpBar=new mc_hpbar();
			hpBar_player=new mc_hpbar_player();
			MaxWidth=hpBar.width;
			MaxHeight=hpBar.height;
			bulletMc=new McHuanqiangAnim();
			bulletMc.gotoAndStop(bulletMc.totalFrames);
			bulletMcWidth=bulletMc.width;
			initBossRelated();
		}
		private static const MaxBossHpBarNum:int=5;
		private var bossHpBarBg:mc_hpbarBG_boss;
		private var bossHpBarDic:Dict;
		public static var MaxWidth_Boss:Number;
		public static var MaxHeight_Boss:Number;
		
		private function initBossRelated():void
		{
			bossHpBarBg=new mc_hpbarBG_boss();
			bossHpBarDic=new Dict();
			var index:int;
			for(index=1;index<=MaxBossHpBarNum;index++)
			{
				var name:String=("mc_hpbar_boss"+index).toString();
				bossHpBarDic[index]=new (AssetManager.getAssetClass(name) as Class);
			}
			MaxWidth_Boss=bossHpBarBg.width;
			MaxHeight_Boss=bossHpBarBg.height;
		}
		public function render_boss_hpBar(_x:Number,_y:Number,_percents:Number,_startTime:Number=0,_isPlayer:Boolean=false,_isBoss:Boolean=false,_maxHpNum:int=5):void
		{
			var cameraOffseX:Number=(_x - canvas.cameraX);
			var cameraOffseY:Number=(_y - canvas.cameraY);
			var startX:Number=cameraOffseX-MaxWidth_Boss/2;
			var startY:Number=cameraOffseY-120;
			var al:Number=0;
			if(0==_startTime)
			{
				al=1;
			}
			else
			{
				var derTime:Number=getTimer()-_startTime;
				al=1-derTime/HpBarDisappearTime>=0?1-derTime/HpBarDisappearTime:0;
			}
			var colorTrans:ColorTransform=new ColorTransform();
			colorTrans.alphaMultiplier=0;
			colorTrans.alphaOffset=al*255;
			var trans:Matrix=new Matrix();
			trans.createBox(1, 1,0, startX, startY);
			canvas.bm.draw(bossHpBarBg,trans,colorTrans);
			
			var hpIndexs:Array=computeBossShowHpBarIndex(_maxHpNum,_percents);
			if(null!=bossHpBarDic[hpIndexs[0]])
			{
				canvas.bm.draw(bossHpBarDic[hpIndexs[0]],trans,colorTrans);
			}
			var showWidth:Number=MaxWidth_Boss*(_percents-Number(hpIndexs[0])/_maxHpNum)*_maxHpNum;
			trans.createBox(1, 1,0, startX, startY);
			var rect:Rectangle=new Rectangle(startX,startY,showWidth,MaxHeight_Boss);
			if(_isPlayer)
			{
				canvas.bm.draw(bossHpBarDic[hpIndexs[1]],trans,colorTrans,null,rect);
			}
			else
			{
				canvas.bm.draw(bossHpBarDic[hpIndexs[1]],trans,colorTrans,null,rect);
			}
		}

		private static function computeBossShowHpBarIndex(_showNum:int,_percents:Number):Array
		{
			var result:Array=[];
			var index:int;
			for(index=_showNum-1;index>=0;index--)
			{
				if(_percents>=Number(index)/_showNum)
				{
					result.push(index);
					result.push(index+1);
					break;
				}
			}
			return result;
		}
		public function render(_x:Number,_y:Number,_percents:Number,_startTime:Number=0,_isPlayer:Boolean=false):void
		{
			_startTime=0;
			var cameraOffseX:Number=(_x - canvas.cameraX);
			var cameraOffseY:Number=(_y - canvas.cameraY);
			var startX:Number=cameraOffseX-hpbarBg.width/2;
			var startY:Number=cameraOffseY-100;
			var al:Number=0;
			if(0==_startTime)
			{
				al=1;
			}
			else
			{
				var derTime:Number=getTimer()-_startTime;
				al=1-derTime/HpBarDisappearTime>=0?1-derTime/HpBarDisappearTime:0;
			}
			var colorTrans:ColorTransform=new ColorTransform();
			colorTrans.alphaMultiplier=0;
			colorTrans.alphaOffset=al*255;
			var trans:Matrix=new Matrix();
			trans.createBox(1, 1,0, startX, startY);
			canvas.bm.draw(hpbarBg,trans,colorTrans);
			var showWidth:Number=MaxWidth*_percents;
			trans.createBox(1, 1,0, startX, startY);
			var rect:Rectangle=new Rectangle(startX,startY,showWidth,MaxHeight);
			if(_isPlayer)
			{
				canvas.bm.draw(hpBar_player,trans,colorTrans,null,rect);
			}
			else
			{
				canvas.bm.draw(hpBar,trans,colorTrans,null,rect);
			}
		}
		public function renderReload(_x:Number,_y:Number,_percents:Number):void
		{
			var cameraOffseX:Number=(_x - canvas.cameraX);
			var cameraOffseY:Number=(_y - canvas.cameraY);
			var startX:Number=cameraOffseX-bulletMcWidth/2;
			var startY:Number=cameraOffseY-120;
			var frame:int=Math.round(_percents*10)+1;
			bulletMc.gotoAndStop(frame);
			var trans:Matrix=new Matrix();
			trans.createBox(1, 1,0, startX, startY);
			canvas.bm.draw(bulletMc,trans);
		}
		public function destroy():void
		{
			canvas=null;
			
			hpbarBg.stop();
			hpbarBg.removeChildren();
			hpbarBg=null;
			
			hpBar.stop();
			hpBar.removeChildren();
			hpBar=null;
			
			bulletMc.stop();
			bulletMc.removeChildren();
			bulletMc=null;
		}
	}
}