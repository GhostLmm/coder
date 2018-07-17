package Tool.platform.meijiPlat
{
	import ane.ljsdk.GameProxy;

	public class MJPlat_Lengjing extends Plat_Base
	{
		public function MJPlat_Lengjing()
		{
			super();
		}
		
		public override function init():void{
			GameProxy.getInstance().init();
//			GameProxy.getInstance().setuserListener(
		}
	}
}