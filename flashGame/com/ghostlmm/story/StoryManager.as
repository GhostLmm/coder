package com.ghostlmm.story
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.ExtrdataVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_story;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	
	import org.osflash.signals.Signal;

	public class StoryManager
	{
		public static const Type_Start:int=1;
		public static const Type_End:int=2;
		public static const Type_Guide:int=3;
		
		public function StoryManager()
		{
			initStoryData();
		}
		
		private static var _instance:StoryManager;
		public static function get instance():StoryManager
		{
			if(_instance==null) _instance=new StoryManager();
			return _instance;
		}
		
		
		
		private var _storyDataDic:Dictionary=new Dictionary();
		private var _storyView:StoryView;
		private var _copyId:int;
		private var _type:int;
		
		public var storyComplete_SN:Signal=new Signal(int,int);
		
		private var needPostResult:Boolean;
		
		private function initStoryData():void
		{
			for each(var node:Node_story in XMLDataManager.Node_storyArray){
				var key:int=node.copy_id*10+node.type;
				var storyData:StoryData=_storyDataDic[key];
				if(storyData==null){
					storyData=new StoryData();
					storyData.copId=node.copy_id;
					storyData.type=node.type;
					_storyDataDic[key]=storyData;
				}
				
				storyData.list.push(node.id);
			}
		}
		
		
		public function getStroyData(copyId:int,type:int):StoryData
		{
			return _storyDataDic[copyId*10+type];
		}
		
		/**  是否需要启动对话
		 * */
		public function couldStartStory(copyId:int,type:int):Boolean
		{
			if(getStroyData(copyId,type)==null){
				return false;
			}
			return true;
		}
		
		public function initStoryView():void
		{
			if(_storyView==null){
				_storyView=new StoryView();
				_storyView.stepComplete_SN.add(onStoryStepComplete);
			}
		}
		
		public function startStory(copyId:int,type:int,layer:Sprite,$needPostResult:Boolean=false):void
		{
			S2CHanlder.instance.message_SN.add(onMessage);
			needPostResult=$needPostResult;
			if(_storyView==null){
				initStoryView();
			}
			layer.addChild(_storyView.display);
			_copyId=copyId;
			_type=type;
			var storyData:StoryData=getStroyData(copyId,type);
			storyData.currentStep=-1;
			var node:Node_story=goStep(_copyId,_type);
//			Music.play(node.SoundEffect);
			_storyView.fillStory(node);
		}
		private function onMessage(msType:String):void{
			if(msType==C2SEmitter.REQ_FubenStoryHandler){
				if(needPostResult){
					storyComplete_SN.dispatch(_copyId,_type);
					hideStoryView();
				}
			}
		}
		private function onStoryStepComplete():void
		{
			var node:Node_story=goStep(_copyId,_type);
			if(node==null){
//				storyComplete_SN.dispatch(_copyId,_type);
//				hideStoryView();
				endStory();
			}else{
				_storyView.fillStory(node);
			}
		}
		
		private function endStory():void{
			if(needPostResult){
				C2SEmitter.fubenStoryComplete(_copyId);
			}else{
				storyComplete_SN.dispatch(_copyId,_type);
				hideStoryView();
			}
		}
		
		internal function tiaoguo():void{
			endStory();
//			storyComplete_SN.dispatch(_copyId,_type);
//			hideStoryView();
		}
		
		public function hideStoryView():void
		{
//			if(_storyView && _storyView.display.parent){
//				_storyView.display.parent.removeChild(_storyView.display);
//			}
			if(_storyView){
				if(_storyView.display.parent){
					_storyView.display.parent.removeChild(_storyView.display);
				}
				_storyView.destory();
				_storyView=null;
			}
		}
		
		public function goStep(copyId:int,type:int):Node_story
		{
			var storyData:StoryData=getStroyData(copyId,type);
			if(storyData.hasNextStep()){
				storyData.goNextStep();
				return storyData.getCurrentStoryNode();
			}
			return null;
		}
		
		
		
	}
}