package
{
	import org.osflash.signals.Signal;

	public class GameStatus
	{
		public function GameStatus()
		{
		}
		public static var change_SN:Signal=new Signal(String);
		/**
		 *   配置文件有没有载入完毕的标志
		 */
		public static var configFlag:Boolean=false;
		
		private static var _status:String=ST_NotInit;
		/**
		 *   游戏状态
		 */
		public static function get status():String{
			return _status;
		}
		
		public static function setStatus($status:String):void{
			_status=$status;
			change_SN.dispatch(_status);
			trace("游戏状态改变 : "+_status);
		}
		
		/**
		 *   没有初始化
		 */
		public static const ST_NotInit:String="notInit";
		
		/**
		 *   登陆过程中
		 */
		public static const ST_Logining:String="logining";
		
		/**
		 *   登录完毕后， 选择服务器和加载素材
		 */
		public static const ST_LoadAsset:String="loadingAsset";
		/**
		 *   游戏进行中
		 */
		public static const ST_GameOngoing:String="gameOngoing";
		
		
		
		/**
		 *   切换账号
		 */
		public static const ST_SwitchAccount:String="switchAccount";
		
		
		/**
		 *   隐藏登陆动画
		 */
		public static const ST_HideLoadingMovie:String="hideLoadingMovie";
		
	}
}