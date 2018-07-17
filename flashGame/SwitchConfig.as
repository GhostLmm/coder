package
{
	public class SwitchConfig
	{
		public function SwitchConfig()
		{
		}
		
		public static var ST_IngoreGuide:Boolean=false;
		
		/** 新手引导时候 可以ctrl 拖拽， 调整对话框位置  **/
		public static var ST_GuideDrag:Boolean=true;
		
		/**   图鉴 功能开关
		 * */
		public static var ST_Tujian:Boolean=true;
		
		/**   扫荡功能开关
		 * */
		public static var ST_Saodang:Boolean=true;
		
		/**
		 * 新的选秀开关
		 */
		public static var ST_NewXuanxiu:Boolean=true;
		
		/**
		 * 快速登录
		 */
//		public static var ST_FastLogin:Boolean=false;
		
		/**  测试充值
		 * */
		public static var ST_TestChongzhi:Boolean=false;
		
		public static function get ST_RemoteLoad():Boolean{
			CONFIG::UseSwc{
				return false;
			}
			CONFIG::TestUseSwf{
				return false;
			}
			CONFIG::UseSwf{
				return true;
			}
			return false;
		}
		
		/**  是否使用统一的账号系统
		 * */
		public static function get ST_UserUnionAccount():Boolean
		{
			return true;
		}
		
		/**
		 *   统一账号忽略过 平台验证系统  警告，请勿随意开启
		 */
		public static var ST_IgnorePlatVerify:Boolean=false;
		
		/**
		 *   版本号验证
		 */
		public static var ST_VersionVerigy:Boolean=true;
		
		/**
		 *   忽略服务器显示控制
		 */
		public static var ST_IngoreServerControl:Boolean=false;
		
	}
}