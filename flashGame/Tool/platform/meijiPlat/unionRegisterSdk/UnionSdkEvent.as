package Tool.platform.meijiPlat.unionRegisterSdk
{
	import com.ghostlmm.lightMVC.LightEvent;
	
	public class UnionSdkEvent extends LightEvent
	{
//		internal static const UnionGoDenglu:String="UnionGoDenglu";
//		internal static const UnionGoRegister:String="UnionGoRegister";
//		internal static const UnionGoFastLogin:String="UnionGoFastLogin";
		
		internal static const UnionGoPage:String="goPage";
		internal static const UnionClosePage:String="closePage";
		
		internal static const UnionDengluOk:String="UnionDengluOk";
		internal static const UnionRegisterOk:String="UnionRegisterOk";
		internal static const UnionFastLoginOk:String="UnionFastLoginOk";
		
		public static const LoginResult:String="LoginResult";
		
		public static const CD_NetError:int=-1;
		public static const CD_ServerError:int=-2;
		public static const CD_Success:int=1;
		
		
		
		public function UnionSdkEvent(type:String, $args:Object=null)
		{
			super(type, $args);
		}
		
		
		public var code:int;
		
		public var uid:String;
		public var token:String;
		
		public var targetPage:Class;
		
		public var inGame:Boolean=false;
	}
}