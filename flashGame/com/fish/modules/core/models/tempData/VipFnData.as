package com.fish.modules.core.models.tempData
{
	/** vip 功能数据**/
	public class VipFnData
	{
		public function VipFnData()
		{
		}
		/** 是否可以进行vip任务 **/
		public var couldVipTask:Boolean;
		/** 祈愿缩短  **/
		public var couldQiyuanShuduan:Boolean;
		public var qiyuanTime:int;
		
		/** 是否副本-多次挑战,不再有冷却时间**/
		public var couldFubenNoTime:Boolean;
		
		/** 是否购买金币数量增加  **/
	}
}