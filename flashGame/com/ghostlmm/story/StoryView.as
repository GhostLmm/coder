package com.ghostlmm.story
{
	import com.fish.GLBaseData;
	import com.ghostlmm.xmldata.Node_monster;
	import com.ghostlmm.xmldata.Node_story;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import core.event.TqtEvent;
	
	import org.osflash.signals.Signal;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.ImageBitmap;
	import ui.widget.Position;
	
	import util.Util;
	
	public class StoryView
	{
		private var window:McStoryMain;
		
		
		public var stepComplete_SN:Signal=new Signal();
		
		private var currentNode:Node_story;
		


		
		private var container:Sprite;
		
		private var _btn_tiaoguo:Button;
		
		private var _part1:StoryPartMc;
		private var _part2:StoryPartMc;
		
		public function get display():Sprite
		{
			return container;
		}
		
		public function StoryView()
		{
			container=new Sprite();
			window=new McStoryMain();
			window.x=GlobalRef.width/2;
			window.y=GlobalRef.height;
			
			container.addChild(window);
			var mcbtn:MovieClip=new BtnStoryTiaoguo();
			mcbtn.x=GlobalRef.width-mcbtn.width/2;
			mcbtn.y=GlobalRef.height/2;
			container.addChild(mcbtn);
			_btn_tiaoguo=new Button(mcbtn);
			
			container.graphics.beginFill(0,0.3);
			container.graphics.drawRect(0,0,GlobalRef.width,GlobalRef.height);
			container.graphics.endFill();

			
			GlobalRef.stage.addEventListener(MouseEvent.CLICK,onClick);
			_btn_tiaoguo.addEventListener(TqtEvent.BUTTON_CLICK,onClickTiaoguo);

			_part1=new StoryPartMc(1,window);
			_part2=new StoryPartMc(2,window);
			
			_part1.complete_SN.add(onPartCom);
			_part2.complete_SN.add(onPartCom);
			
		}
		
		private function get curStoryPart():StoryPartMc{
			return this["_part"+currentNode.Position];
		}
		
		private function onPartCom(part:StoryPartMc):void{
			stepComplete_SN.dispatch();
		}
		
		
		private function onClick(evt:MouseEvent=null):void
		{
			if(curStoryPart){
				curStoryPart.goNextStep();
			}
		}
		private function onClickTiaoguo(evt:Event):void{
			StoryManager.instance.tiaoguo();
		}
		
		
		public function fillStory(node:Node_story):void
		{
			currentNode=node;
			curStoryPart.startShow(node);
		}
		
	
		
		public function destory():void
		{
			GlobalRef.stage.removeEventListener(MouseEvent.CLICK,onClick);
			if(_part1){
				_part1.complete_SN.remove(onPartCom);
				_part1.destory();
				_part1=null;
			}
			if(_part2){
				_part2.complete_SN.remove(onPartCom);
				_part2.destory();
				_part2=null;
			}
			if(_btn_tiaoguo){
				_btn_tiaoguo.removeEventListener(TqtEvent.BUTTON_CLICK,onClickTiaoguo);
				_btn_tiaoguo.destory();
				_btn_tiaoguo=null;
			}
		}
		

		
	}
}
