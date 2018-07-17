package Tool.ghostCacheLoad
{
	public class GLLoadStats
	{
		public function GLLoadStats()
		{
		}
		
		/**   没有开始加载前的状态，  初始化后的自然状态,或者是clear之后的状态
		 * */
		internal static const Stats_UnStart:int=0;
		
		/**   网络加载过程中的状态
		 * */
		internal static const Stats_Loading:int=10;
		
		/**   加载成功后的状态
		 * */
		internal static const Stats_LoadComplete:int=100;
		/**   加载失败后台的状态
		 * */
		internal static const Stats_LoadFail:int=-111;
	}
}