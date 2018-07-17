package Tool.platform.meijiPlat
{
	import com.fish.GLBaseData;
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.display.Sprite;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import org.osflash.signals.Signal;

	/**
	 *   程序进入前闪屏界面控制
	 */
	public class SplashScreen
	{
		public function SplashScreen()
		{
		}
		
		public var finish_SN:Signal=new Signal();
		
		
		
	
				
		
//		private var splash_pic:Bitmap;
		private var container:Sprite;
		private var timeLine:TimelineLite;
		
//		private var arg1:
//		[Embed(source="Assets/Splash/perfectworld.png")]/
		private function get wanmeiPic():Class{
			return EmbedData.wanmeiPic;
		}
		private function createWanmeiPic():DisplayObject
		{
			return new wanmeiPic();
		}
		
		public function splashWanmei(root:Sprite):void{
			container=new Sprite();
			var splash_pic:DisplayObject=createWanmeiPic();
			
			splash_pic.x=(GlobalRef.width-splash_pic.width)/2;
			splash_pic.y=(GlobalRef.height-splash_pic.height)/2;
			
			//			var back:Bitmap=new Bitmap(new BitmapData(1,1,true,0xffffffff) );
			//			back.width=rootWidth*4;
			//			back.height=rootHeight*4;
			//			back.x=-rootWidth;
			//			back.y=-rootHeight;
			container.graphics.beginFill(0xffffff,1.0);
			container.graphics.drawRect(-GlobalRef.width,-GlobalRef.height,GlobalRef.width*4,GlobalRef.height*4);
			container.graphics.endFill();
			//			container.addChild(back);
			container.addChild(splash_pic);
			root.addChild(container);
//			TweenLite.to(1,splashEnd);
			TweenLite.delayedCall(1,splashEnd);
		}

		
		public function splashPlat(root:Sprite):void
		{
			var platObj:IMJPlatform=PlatformManager.getInstance().platformObj;
			if(!platObj.supportPlatSplash){
				finish_SN.dispatch();
				return ;
			}
			container=new Sprite();
			var splash_pic:DisplayObject=new (platObj.platSplashPicClass)();
			
			splash_pic.x=(GlobalRef.width-splash_pic.width)/2;
			splash_pic.y=(GlobalRef.height-splash_pic.height)/2;
			
//			var back:Bitmap=new Bitmap(new BitmapData(1,1,true,0xffffffff) );
//			back.width=rootWidth*4;
//			back.height=rootHeight*4;
//			back.x=-rootWidth;
//			back.y=-rootHeight;
			container.graphics.beginFill(getBackColor(),1.0);
			container.graphics.drawRect(-GlobalRef.width,-GlobalRef.height,GlobalRef.width*4,GlobalRef.height*4);
			container.graphics.endFill();
//			container.addChild(back);
			container.addChild(splash_pic);
			root.addChild(container);
			
			startShow();
		}
		
		private function getBackColor():uint
		{
			var arg:Object=PlatformManager.getInstance().platformObj.platSplashArg;
			if(arg && arg.hasOwnProperty("backColor") ){
				return arg.backColor;
			}
			return 0xffffff;
			
		}
		
		private function startShow():void
		{
//			TweenLite.delayedCall(2,splashEnd);
		
			if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.FlashApale)){
				TweenLite.delayedCall(1.5,splashEnd);
				return ;
			}
			
			container.alpha=0.5;
			timeLine=new TimelineLite({onComplete:splashEnd});
			timeLine.add(TweenLite.to(container,0.8,{alpha:1}));
			timeLine.append(TweenLite.to(container,0.2,{alpha:0.5}),"+=1");
		}
		private function splashEnd():void
		{
			TweenLite.killTweensOf(container);
			TweenLite.killTweensOf(splashEnd);
			if(container){
				container.removeChildren();
				if(container.parent){
					container.parent.removeChild(container);
				}
				container=null;
			}
			if(timeLine){
				timeLine.kill();
				timeLine=null;
			}
			finish_SN.dispatch();
		}
	}
}