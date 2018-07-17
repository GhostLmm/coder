package com.fish.modules.core.models
{
	public class JudgeResult
	{
		public function JudgeResult()
		{
		}
		
		public var success:Boolean=false;
		public var desc:String;
		public var data:Object;
		public var code:int;
		public var needAlert:Boolean=false;
		
		/**   用户 代币不足
		 * */
		public static const CD_CashNotEnough:int=-1000;
		/**  用户等级不足
		 * */
		public static const CD_UserLevelNotEnough:int=-2000;
		/**  用户铜币不足
		 * */
		public static const CD_UserMoneyNotEnough:int=-3000;
		
		/**  持卡数量超标
		 * */
		public static const CD_HasCardsToMuch:int=-4000;
		
		/**  材料不足
		 * */
		public static const CD_CailiaoNotEnough:int=-5000;
		
		/**  正在使用中
		 * */
		public static const CD_IsOnUsing:int=-6000;
		
		/**  已经达到上限
		 * */
		public static const CD_HasOverLimit:int=-7000;
		
		public static const CD_HasntItem:int=-8000;
		
		/**  cd 冷却中
		 * */
		public static const CD_CoolDown:int=-9000;
		
		/**  未开始
		 * */
		public static const CD_NotBegin:int=-10000;
		
		/**  已经结束
		 * */
		public static const CD_AreadyEnd:int=-11000;
		
		/**  已经领取
		 * */
		public static const CD_AreadyLingqu:int=-12000;
		
		/**  体力不足
		 * */
		public static const CD_TiliNotEnough:int=-13000;
		
		
		/**  时间未到
		 * */
		public static const CD_Time_Nonarrival:int=-14000;
		
		/**  时间已经过
		 * */
		public static const CD_Time_Out:int=-15000;
		
		/**  boss 已经死了
		 * */
		public static const CD_BossDie:int=-16000;
		
		/**  越界
		 * */
		public static const CD_OutOfRange:int=-17000;
		
		/**  有特别的事情需要处理
		 * */
		public static const CD_HasThingToDo:int=-18000;
		
		/**  祈愿石不足
		 * */
		public static const CD_QiyuanshiNotEnough:int=-19000;
		
		/**
		 *   包裹栏格子不够
		 */
		public static const CD_BagGridNotEnough:int=-20000;
		
		/**
		 * 其它处理 
		 */
		public static const CD_OtherHanlder:int=1000;
		public static const ERROR_DATA:int=int.MIN_VALUE;

	}
}