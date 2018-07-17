package com.ghostlmm.story
{
	import com.fish.GLBaseData;
	import com.ghostlmm.xmldata.Node_monster;
	import com.ghostlmm.xmldata.Node_story;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	
	import org.osflash.signals.Signal;
	
	import ui.widget.FontField;
	import ui.widget.MyRichText;
	import ui.widget.Position;

	public class StoryPartMc
	{
		private var pos:int;
		private var _mc_bg:MovieClip;
		private var _fnt_name:FontField;
		private var _pos_play:Position;
//		private var _thumb:PlayerThumb;
		private var _img:StoryMcImag;
		private var _fnt_story:MyRichText;
		
		private var node:Node_story;
		
		private var step:int;
		
		private var bgX1:Number;
		private var bgX2:Number;
		private var thbX1:Number;
		private var thbX2:Number;
		
		private static const Time_1:Number=0.5;
		
		public static const FontsRate:Number=15;
		public static const AutoNext:Number=4;
		
		
		public var complete_SN:Signal=new Signal(StoryPartMc);
		
		public function StoryPartMc($pos:int,$mc:MovieClip)
		{
			pos=$pos;
			_mc_bg=$mc["mc_bg"+pos];
			_fnt_name=new FontField($mc["fnt_name"+pos]);
			_pos_play=new Position($mc["pos_"+pos]);
			_img=new StoryMcImag();
			_img.y=_pos_play.rect.y+_pos_play.rect.height/2;
			
			
			$mc.addChild(_img);
			_fnt_story=new MyRichText($mc["fnt_story"+pos]);
			
			var offset:int= (pos==1) ? -1 : 1 ;
			
			bgX1=_mc_bg.x;
			bgX2=bgX1+offset*200;
			thbX1=_pos_play.rect.x+_pos_play.rect.width/2;
			thbX2=thbX1+offset*200;
			setActive(false);
		}
		private function setActive(active:Boolean):void{
			_mc_bg.visible=active;
			_fnt_name.visible=active;
			_pos_play.visible=active;
			_img.visible=active;
			_fnt_story.visible=active;
		}
		
		private var _textIndex:int=-1;
		public function get textIndex():int{
			return _textIndex;
		}
		public function set textIndex(value:int):void{
			if(_textIndex!=value){
				_textIndex=value;
				_fnt_story.showIndex=_textIndex;
			}
		}
		
		private function clearStep():void{
			if(_mc_bg) {TweenLite.killTweensOf(_mc_bg);}
			if(_img) {TweenLite.killTweensOf(_img);}
			TweenLite.killTweensOf(this);
			TweenLite.killDelayedCallsTo(step4);
		}
		
		public function goNextStep():void{
			if(step<=1) return ;
			step++;
			switch (step){
				case 3:
					step3();
					break;
				case 4:
					step4();
					break;
			}
		}
		
		public function startShow($node:Node_story):void{
			node=$node;
			_img.fill(node.Pic,pos,_pos_play);
			step=0;
//			textRe=ImageShortcutPlungin.resetText(node.dialog)[2];
			_fnt_story.setText(node.dialog);
			textIndex=0;
			setActive(true);
			clearStep();
			step1();
			
		}
		private function step1():void{
			clearStep();
			step=1;
			_fnt_name.text="";
			_mc_bg.x=bgX2;
			_img.x=thbX2;
			TweenLite.to(_mc_bg,Time_1,{x:bgX1,onComplete:step2});
			TweenLite.to(_img,Time_1,{x:thbX1});
		}
		private function step2():void{
			clearStep();
			step=2;
			if(node.Pic==0){
				_fnt_name.text=GLBaseData.userName;
			}else{
				var monsterNode:Node_monster=XMLDataManager.getMonsterById(node.Pic);
				_fnt_name.text=monsterNode.name;
			}
			
			TweenLite.to(this,_fnt_story.getText().length/FontsRate,{textIndex:_fnt_story.getText().length+1,onComplete:step3});
		}
		
		private function step3():void{
			clearStep();
			step=3;
			textIndex=_fnt_story.getText().length+1;
			TweenLite.delayedCall(AutoNext,step4);
		}
		
		private function step4():void{
			clearStep();
			step=4;
			setActive(false);
			complete_SN.dispatch(this);
		}
		
		public function destory():void{
			clearStep();
			complete_SN.removeAll();
			_mc_bg=null;
			if(_fnt_name) {_fnt_name.destory(); _fnt_name=null;}
			if(_pos_play) {_pos_play.destory(); _pos_play=null;}
			if(_img) {_img.destory(); _img=null;}
			if(_fnt_story) {_fnt_story.destory(); _fnt_story=null;}
		}
		
	}
}