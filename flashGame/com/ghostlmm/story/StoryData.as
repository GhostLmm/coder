package com.ghostlmm.story
{
	import com.ghostlmm.xmldata.Node_story;
	import com.ghostlmm.xmldata.XMLDataManager;

	public class StoryData
	{
		public function StoryData()
		{
		}
		
		public var copId:int;
		public var type:int;
		public var list:Array=[];
		
		public var currentStep:int=-1;
		
		public function hasNextStep():Boolean{
			if(currentStep<list.length-1){
				return true;
			}
			return false;
		}
		
		public function goNextStep():void
		{
			currentStep++;
		}
		
		public function getCurrentStoryNode():Node_story{
			return XMLDataManager.getStoryById(list[currentStep]);
		}
		
	}
}