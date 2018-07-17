package Tool.platform
{
	import com.fantasy.mzw.MzwSdkHelper;
	import com.fish.GLBaseData;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.StatusEvent;
	
	import Tool.platform.meijiPlat.GameServerEvent;
	import Tool.platform.meijiPlat.GameServerManager;
	import Tool.platform.meijiPlat.Plat_Base;
	
	public class MJPlat_Mzw_Android extends Plat_Base
	{
		public static const appKey:String = "141138387173fGl9P4qX4W2AwgwGnb";
		public static const appSecret:String = "we119ITU8AxH0DduN9gVQvxu";
		
		public static const Result_Success:String="success";
		public static const Result_Fail:String="fail";
		public static const Result_Cancel:String="cancel";
		public static const ResultKey:String="result";
		public static const ResultParam:String="param";
		
		public static const Opt_Login:String ="login";
		public static const Opt_Pay:String ="pay";
		public static const Opt_Logout:String ="logout";
		
		public function MJPlat_Mzw_Android()
		{
			super();
		}
		public override function init():void
		{
			MzwSdkHelper.instance.addEventListener(StatusEvent.STATUS,onStatusChange);
			GameServerManager.instance.addEventListener(GameServerEvent.Evt_Server,onServerData);
			MzwSdkHelper.instance.init(appKey,appSecret);
		}
		private function onServerData(evt:GameServerEvent):void{
			
			PlatformManager.log("gameserver 请求: "+evt.url+"\n\r"+evt.json);
			if(!evt.effect) return ;
			if(evt.key==GameServerManager.KEY_GetUserInfo){				
				if(evt.data && evt.data.infoResult && evt.data.infoResult.code==0){
					var uid:String=evt.data.infoResult.user.uid;			
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
						var token:String=reObj[ResultParam]["arg0"];
						GameServerManager.instance.getUserInfo(token);
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
					if(result == Result_Success)
					{
						outputs("支付成功");
						PlatformManager.getInstance().showTipAfterBuy();
					}
					else
					{
						outputs("支付失败");
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
			MzwSdkHelper.instance.login(appKey,appSecret);
		}
		public override function logout():void
		{
			MzwSdkHelper.instance.logout(appKey,appSecret);
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
			MzwSdkHelper.instance.pay(pid,node.name,amount);
		}
		public override function get loginPlatName():String
		{
			return "mzwand";
		}
		
		public override function get payPlatName():String
		{
			return "mzwand";
		}
		
		public override function get onlyPlatName():String
		{
			return "mzwand";
		}
		
		public override function get osType():String{
			return OS_And_Guonei;
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