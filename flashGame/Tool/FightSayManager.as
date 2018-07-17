package Tool
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Expo;
	import com.greensock.easing.Strong;
	import com.thor.constants.FontNames;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.system.System;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;

	/**
	 *@author 锋
	 *@version 1.0.0
	 *@创建时间:2012-12-24 下午2:44:10
	 * */
	public class FightSayManager
	{
		private static var m_instance:FightSayManager;
		private var m_Text:String;
		private var myloader:Loader;
		private static var IMAGE_WIDTH:int=512;
		private static var IMAGE_HEIGHT:int=512;
		private var timer:Timer;
		private var txtArray:Array;
		private var uWidth:int=50;
		private var txtContainer:Sprite;
		private var textFadetime:Number;
		public function FightSayManager()
		{
		}
		
		
		public static function getInstance():FightSayManager
		{
			if(m_instance==null)
			{
				m_instance=new FightSayManager();
			}
			return m_instance;
		}
		
		public function addTip(text:String,txtSize:int=50,imageName:String="-1",textTime:Number=0.2):void
		{
			if(myloader||txtContainer)
				return;
			m_Text=text;
			uWidth=txtSize;
			txtArray=m_Text.split(" ");
			textFadetime=textTime;
			if(imageName=="-1")
			{
				TweenLite.delayedCall(0.2,showText);
				TweenLite.delayedCall(0.2*txtArray.length+1.3,hideEffect);
				return;
			}
				
			myloader=new Loader();
			myloader.load(new URLRequest(GameSystemData.assetURL+"assets/fight/"+imageName+".png"));
			myloader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadComp);
			
		}
		
		private function loadComp(e:Event):void
		{
			myloader.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadComp);
			myloader.scaleX=myloader.scaleY=IMAGE_WIDTH/myloader.width;
			myloader.x=100+GLOBAL._gameSize.width;
			myloader.y=(GLOBAL._gameSize.height-myloader.height)/2;
			GLOBAL._layerTop.addChild(myloader);
			TweenLite.to(myloader,0.6,{x:(GLOBAL._gameSize.width-myloader.width)/2,ease:Strong.easeOut});
			if(m_Text=="")
			{
				TweenLite.delayedCall(1.6,hideEffect);
				return;
			}
			TweenLite.delayedCall(0.2,showText);
			TweenLite.delayedCall(0.2*txtArray.length+1,hideEffect);
		}
		
		private function showText():void
		{
			txtContainer=new Sprite();
			GLOBAL._layerTop.addChild(txtContainer);
			txtContainer.x=(GLOBAL._gameSize.width-txtArray.length*uWidth)/2;
			if(myloader)
				txtContainer.y=myloader.y-uWidth;
			else
				txtContainer.y=GLOBAL._gameSize.height/2-uWidth-20;
			timer=new Timer(200,txtArray.length);
			timer.start();
			timer.addEventListener(TimerEvent.TIMER,txtEffect);
		}
		
		private function txtEffect(e:Event):void
		{
			var holder:MovieClip = new MovieClip();
			var i:int = timer.currentCount-1;
			
			var tf:TextField = new TextField();
			tf.text = txtArray[i];
			holder.addChild(tf); 
			tf.selectable=false;
			var tfm:TextFormat=new TextFormat();
			tfm.font=FontNames.NORMAL;		
			tfm.size=uWidth;
			tfm.align="center";
			tfm.color="0xffff00";
//			tf.embedFonts=true;
			tf.setTextFormat(tfm);
			
			holder.alpha = 0.1;
			holder.scaleX=3;
			holder.scaleY=3;
			
			
			
			holder.x=i*uWidth;
			if(!txtContainer) 
				txtContainer = new Sprite();
			txtContainer.addChild(holder);
			TweenLite.to(holder,0.3,{alpha:1,scaleX:1,scaleY:1,ease:Strong.easeIn});
			if(i==txtArray.length-1)
			{
				timer.removeEventListener(TimerEvent.TIMER,txtEffect);
				timer.stop();
				timer=null;
			}
		}
		
		private function hideEffect():void
		{
			if(txtContainer)
				TweenLite.to(txtContainer,textFadetime,{alpha:0,ease:Strong.easeIn});
			if(myloader)
				TweenLite.to(myloader,0.5,{alpha:0,x:-myloader.width,ease:Strong.easeIn});
			TweenLite.delayedCall(0.5,removeAll);
		}
		
		private function removeAll():void
		{
			if(txtContainer)
			{
				GLOBAL._layerTop.removeChild(txtContainer);
				txtContainer.removeChildren();
				txtContainer=null;
			}
			if(myloader)
			{
				GLOBAL._layerTop.removeChild(myloader);
				myloader.unload();
				myloader=null;
			}
			System.gc();
		}
	}
}