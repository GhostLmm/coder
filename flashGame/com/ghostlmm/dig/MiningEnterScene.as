package com.ghostlmm.dig
{
	import com.greensock.TimelineLite;
	import com.greensock.TimelineMax;
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	import org.osflash.signals.Signal;

	public class MiningEnterScene
	{
		private var _mc_up:MovieClip;
		private var _mc_down:MovieClip;
		private var _fnt_desc:TextField;
		private var _timeLine:TimelineMax;
		private var mc:WindowHeiping;
		public var effectCom_SN:Signal;
		
		public function MiningEnterScene()
		{
			mc=new WindowHeiping();
			mc.x=GlobalRef.width/2;
			mc.y=GlobalRef.height/2;
			_mc_down=mc.mc_down;
			_mc_up=mc.mc_up;
			_fnt_desc=mc.fnt_desc;
			_fnt_desc.alpha=0;
			effectCom_SN=new Signal();
		}
		public function get display():DisplayObject{
			return mc;
		}
		
		
		public function startShow():void{
			Music.play(Music.MC_EnterMining);
			var offsetY:Number=_fnt_desc.textHeight/2+10;
			var label:String="start";
			_timeLine=new TimelineMax();
			_timeLine.addLabel(label);
			_timeLine.add(TweenLite.to(_mc_up,0.8,{y:_mc_up.y-offsetY}),label);
			_timeLine.add(TweenLite.to(_mc_down,0.8,{y:_mc_down.y+offsetY}),label);
			
			_timeLine.add(TweenLite.to(_fnt_desc,1,{alpha:1}),label+"+=0.2");
			_timeLine.add(TweenLite.to(mc,0.5,{}),label+"+=1.4");
//			_timeLine.addLabel("asdf",label+"+4");
			_timeLine.addCallback(effectComplete,label+"+=2");
		}
		
		private function effectComplete():void{
			
			effectCom_SN.dispatch();
		}
		
		public function destory():void{
			if(effectCom_SN){
				effectCom_SN.removeAll();
				effectCom_SN=null;
			}
			_mc_up=null;
			_mc_down=null;
			_fnt_desc=null;
			if(mc){
				if(mc.parent) mc.parent.removeChild(mc);
				mc=null;
			}
			if(_timeLine){
				_timeLine.clear();
				_timeLine=null;
			}
		}
	}
}