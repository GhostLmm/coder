package
{
	public class TixingCanshu
	{
		public function TixingCanshu()
		{
		}
//		/**
//		 *   梯形上边宽缩放比例
//		 */
//		public static const topWidthScale:Number=0.75;
//		/**
//		 *   梯形下边宽缩放比例
//		 */
//		public static const bottomWidthScale:Number=1.25;
//		/**
//		 *   梯形高宽缩放比例
//		 */
//		public static const heightScale:Number=1;
		
		/**
		 *   上边卡牌梯形变换参数
		 */
		public static const TopTixinScale:Object={
			tws:0.65,    // 梯形上边宽缩放比例
			bws:0.9,	// 梯形下边宽缩放比例
			hs:0.6        //梯形高宽缩放比例
		};
		
		/**
		 *   上边卡牌梯形变换参数
		 */
		public static const ButtomTixinScale:Object={
			tws:1,   // 梯形上边宽缩放比例
			bws:1.4,	// 梯形下边宽缩放比例
			hs:1     //梯形上边宽缩放比例
		};
		
		public static const T2BScale:Number=1/0.8;
		public static const B2TScale:Number=0.8/1;
		
		public static const T2BScale2:Number=1/0.6;
		public static const B2TScale2:Number=0.6/1;
		
	}
}