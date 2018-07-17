package Tool.platform.meijiPlat
{
	import com.fish.GLBaseData;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import Tool.chongzhiCheck.ChongzhiCheckManager;
	import Tool.platform.PlatformManager;
	
	import org.osflash.signals.Signal;
	
	import util.Util;
	
	public class MJPlat_Test extends Plat_Base
	{

		public function MJPlat_Test()
		{
		}
		public override function init():void{
			
		}
		public override function get loginPlatName():String
		{
			return "test";
		}
		
		public override function get payPlatName():String
		{
			return "test";
		}
		
		public override function get onlyPlatName():String
		{
			return "test";
		}
		
		public override function get ExtrFlagObj():Object
		{
			return null;
		}
		
		public override function get supportBindAccount():Boolean
		{
			return false;
		}
		
		public override function get supportLogout():Boolean
		{
			return false;
		}
		
		public override function logout():void
		{
		}
		
		public override function get supportGamecenter():Boolean
		{
			return false;
		}
		
		public override function openGamecenter():void
		{
		}
		
		public override function get osType():String{
			return Plat_Base.OS_And_Guonei;
		}
		
		public override function get supportPlatAccount():Boolean{
			return false;
		}
		

		

		public override function pay(pid:String, bid:String):void
		{
			if(!SwitchConfig.ST_TestChongzhi){
				Util.flow("测试充值关闭");
				return ;
			}
			
			var arg:Object=createPayArg(int(pid),bid);
			
			ChongzhiCheckManager.instance.addCheckData(arg);
		}
		private function createPayArg(pid:int, bid:String):Object
		{
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(pid);
			var arg:Object={};
			arg.id=GLBaseData.userId.toString();
			//			arg.platname=AccountControl.getInstance().currentAccount.platname;
			arg.cost=node.rmb.toString();
			arg.token="tempToken";
			arg.poi=bid;
			arg.pay_id=node.id.toString();
			arg.pay_act="pay_back";
			//			arg.PLATNAME
			arg.sign="sd";
			arg.app_key="tqt";
			return arg;
		}
		
		
		public override function get supportGameconfig():Boolean{
			return false;
		}
	}
}