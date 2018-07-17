package com.fish.modules.core.models.tempData
{
	import com.ghostlmm.xmldata.Node_daily_task;

	public class DailyQuestData
	{
		public function DailyQuestData($node:Node_daily_task)
		{
			questNode=$node;
		}
		
		public var questNode:Node_daily_task;
		public var completeCount:int;
		/**
		 *   是否完成
		 */
		public function get hasComplete():Boolean{
			return completeCount>=questNode.target_num;
		}
		
		public function isYueka():Boolean
		{
			return questNode.guide_type=="yueka";
		}
		
		
	}
}