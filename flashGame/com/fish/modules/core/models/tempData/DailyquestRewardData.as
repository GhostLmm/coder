package com.fish.modules.core.models.tempData
{
	import com.ghostlmm.xmldata.Node_daily_task_reward;

	public class DailyquestRewardData
	{
		public function DailyquestRewardData($node:Node_daily_task_reward)
		{
			rewardNode=$node;
		}
		
		public var rewardNode:Node_daily_task_reward;
		
		/**
		 *    是否领取
		 */
		public var hasLinqu:Boolean=false;
		
		
		
	}
}