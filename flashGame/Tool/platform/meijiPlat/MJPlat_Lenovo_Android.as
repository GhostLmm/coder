package Tool.platform.meijiPlat
{
	import com.fantasy.lenovo.LenovoSdkHelper;
	import com.fish.GLBaseData;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.StatusEvent;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;

	public class MJPlat_Lenovo_Android extends Plat_Base
	{
		public static const Result_Success:String="success";
		public static const Result_Fail:String="fail";
		public static const Result_Cancel:String="cancel";
		public static const ResultKey:String="result";
		public static const ResultParam:String="param";
		
		public static const Opt_Login:String ="login";
		public static const Opt_Pay:String ="pay";
		public static const Opt_Logout:String ="logout";
		
		
		private var uid:String=null;
		private var sessionId:String =null;
		private var appid:String = "1408120467205.app.ln";
		private var appkey:String = "QURDMzgzREUzMkM0MjQ4NkQyNkZFOEMwNkFDNjVCRDg4NEVEMDM4NU1UVXlNelUxTXpVMU5qRXlOek16TnpnM09ETXJNVEV6TURNeE9UZ3dNems0TmpjME5qWTFPRE15TVRnNE16WXlPRGd6T1RJM09EZzRNakEz";
		private var exorderno:String;
		private var cpprivateinfo:String;
		
		public function MJPlat_Lenovo_Android()
		{
			super();
		}
		public override function init():void
		{
			LenovoSdkHelper.instance.addEventListener(StatusEvent.STATUS,onStatusChange);
			GameServerManager.instance.addEventListener(GameServerEvent.Evt_Server,onServerData);
			LenovoSdkHelper.instance.init(appid,appkey);
		}
		private function onServerData(evt:GameServerEvent):void{
			
			PlatformManager.log("gameserver 请求: "+evt.url+"\n\r"+evt.json);
			if(!evt.effect) return ;
			if(evt.key==GameServerManager.KEY_GetUserInfo){				
				if(evt.data && evt.data.infoResult && evt.data.infoResult.code==0){
					var xml:XML=new XML(evt.data.infoResult["msg"]);
					var uid:String=String(xml.AccountID[0]);			
					setPlatInfo(uid,"noToken");
					exctueLoginResult(true);
				}
				else
				{
					exctueLoginResult(false);
				}
			}
		}
		private function onStatusChange(e:StatusEvent):void
		{
			trace("code"+e.code+"\n");
			trace("level"+e.level);
			var reObj:Object=JSON.parse(e.level);
			var result:String=reObj[ResultKey];
			switch(e.code)
			{
				case Opt_Login:
					if (result == Result_Success)
					{	
						var sessionId:String=reObj[ResultParam]["arg0"];
						GameServerManager.instance.getUserInfo(sessionId);
					}
					else
					{
						//登录失败
						outputs("登录失败：");
						exctueLoginResult(false);
					}
					break;
				case Opt_Logout:
					logout_SN.dispatch(true,{});
					break;
				case Opt_Pay:
					if (result == Result_Success)
					{	
						
					}
					else
					{
						//登录失败
						outputs("支付失败");
						exctueLoginResult(false);
					}
					proccessBid();
					break;
			}
		}
		private function outputs(txt:String):void
		{
			trace(txt);
		}
		public override function login():void
		{
			LenovoSdkHelper.instance.login(appid,appkey);
		}
		public override function pay(pid:String, bid:String):void
		{			
			proccessBid();			
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node==null) return ;
			
			_tempBid=bid;
			
			var allowContinuousPay: Boolean=true;

			var amount: Number=node.rmb;
			CONFIG::PayTest{
				amount=1;
			}
			var roleId: String=GLBaseData.userId;
			var roleName: String=GLBaseData.userName;
			var grade: String="grade";
			var customInfo: String=bid;
			LenovoSdkHelper.instance.pay(node.id,bid,amount);
		}
		public override function get loginPlatName():String
		{
			return "lenand";
		}
		
		public override function get payPlatName():String
		{
			return "lenand";
		}
		
		public override function get onlyPlatName():String
		{
			return "lenand";
		}
		public override function get osType():String{
			return OS_And_Guonei;
		}
		public override function logout():void
		{
			LenovoSdkHelper.instance.logout(appid,appkey);
		}
		public override function openGamecenter():void
		{
			
		}
		public override function switchAccount():void
		{
			
		}
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.IgnoreCheckSession]=true;
			return obj;
		}
	}
}