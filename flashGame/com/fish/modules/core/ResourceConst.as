package com.fish.modules.core
{
	public class ResourceConst
	{
		public function ResourceConst()
		{
		}
		public static const R_cash:String="cash";
		public static const R_money:String="money";
		public static const R_ronglian:String="ronglian";
		public static const R_item:String="item";
		
//		public static const R_card:String="card";
		public static const R_pet:String="pet";
		public static const R_skill:String="skill";
		public static const R_chongzhi:String="chongzhi";
		public static const R_equip:String="equip";
		public static const R_shengwang:String="rongyu";
		public static const R_yongqi:String="yongqi";
		public static const R_tili:String="tili";
		public static const R_hun:String="hun";
		public static const R_exp:String="exp";
		public static const R_baoshi:String="baoshi";
		
		public static const R_rongyu:String="rongyu";
		/**
		 *   钻头
		 */
		public static const T_Zhuantou:String="zhuantou";
		/**
		 *    炸弹
		 */
		public static const T_Zhadan:String="zhadan";
		/**
		 *   城墙
		 */
		public static const T_Wall:String="wall";
		
		/**
		 *   星星
		 */
		public static const R_Star:String="star";
		
		private static const BaseKey:Array=[R_cash,R_money,R_ronglian,R_tili,R_exp,R_Star,R_rongyu];
		public static function isBaseResource(key:String):Boolean{
			return BaseKey.indexOf(key)!=-1;
		}
		
		
		public static function isDuidieResource(key:String):Boolean{
			return key==R_baoshi || key==R_item;
		}
		
//		public static const R_xilian:String="xilian";
	}
}