package Tool.platform.meijiPlat
{
	import com.anzhi.ane.AnzhiEvents;
	import com.anzhi.ane.AnzhiExtension;
	import com.fish.modules.core.S2CHanlder;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.StatusEvent;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;

	public class MJPlat_Anzhi_Android extends Plat_Base
	{
		
		private  var appKey:String = "141138387173fGl9P4qX4W2AwgwGnb";
		private  var appSecret:String = "we119ITU8AxH0DduN9gVQvxu";
//		private  var appKey:String = "13964092718S10eC24C6OFSBNRnaXv";
//		private  var appSecret:String = "BBAoy9mDGU9IkEeDEBM842Hy";
//		private  var ane:AnzhiExtension ;
		
		private var status:int=0;
		
		public function MJPlat_Anzhi_Android()
		{
			super();
		}
		public override function get loginPlatName():String
		{
			return "azand";
		}
		
		public override function get payPlatName():String
		{
			return "azand";
		}
		
		public override function get onlyPlatName():String
		{
			return "azand";
		}
		
		public override function init():void{
//			AnzhiExtension.getInstance().AnzhiInit("13964092718S10eC24C6OFSBNRnaXv","BBAoy9mDGU9IkEeDEBM842Hy");
//			AnzhiExtension.getInstance().AnzhiCreateFloat();
//			AnzhiExtension.getInstance().AnzhiShowFloat();
			AnzhiExtension.getInstance().addEventListener(StatusEvent.STATUS,handler_status);
			
			
			GameServerManager.instance.addEventListener(GameServerEvent.Evt_Server,ongameServerEvent);
			AnzhiExtension.getInstance().AnzhiDismissFloat();
			
			S2CHanlder.instance.initCom_SN.add(onGameInitCom);
			
			GameStatus.change_SN.add(onGameStatusChange);
		}
		
		private function onGameStatusChange($status:String):void{
			if($status==GameStatus.ST_GameOngoing){
				AnzhiExtension.getInstance().AnzhiShowFloat();
			}else{
				AnzhiExtension.getInstance().AnzhiDismissFloat();
			}
		}
		
		public function preInit():void{
			AnzhiExtension.getInstance().AnzhiInit(appKey,appSecret);
			AnzhiExtension.getInstance().AnzhiCreateFloat();
			AnzhiExtension.getInstance().AnzhiShowFloat();
			AnzhiExtension.getInstance().AnzhiDismissFloat();
		}
		
		
		private function onGameInitCom():void
		{
//			AnzhiExtension.getInstance().AnzhiShowFloat();
		}
		private function ongameServerEvent(evt:GameServerEvent):void
		{
			if(!evt.effect) return ;
			
			if(evt.key==GameServerManager.KEY_GetUserInfo){
				if(evt.data && evt.data.infoResult && evt.data.infoResult.code==0){
//					_openId=evt.data.infoResult.userId;
//					_token="noToken";
//					_nickName="noNick";
					setPlatInfo(evt.data.infoResult.uid,"noToken","noNick");
					exctueLoginResult(true);
				}else{
					exctueLoginResult(false);
				}
			}
		}
		private function handler_status(evt:StatusEvent):void
		{
			PlatformManager.log("api返回："+evt.code+" / "+evt.level);
			if (evt.code == AnzhiEvents.ANZHI_LOGIN_STATUS)
			{
				var arr:Array = evt.level.split("*");
				if (arr[0] == "success")
				{
					GameServerManager.instance.getUserInfo(arr[5]);
				}else{
					exctueLoginResult(false);
				}
			}
			if(evt.code==AnzhiEvents.ANZHI_LOGOUT_STATUS){
			}
			if(evt.code==AnzhiEvents.ANZHI_PAY_STATUS){
				proccessBid();
			}
			if(evt.code=="pageback"){
				if(evt.level=="Login"){
					setPlatInfo(null,null,null);
					exctueLoginResult(true);
				}
				if(evt.level=="GameGift"){
					
				}
				if(evt.level=="anzhiBbs"){
					
				}
				if(evt.level=="UserCenter"){
					
				}
				if(evt.level=="gamePay"){
					proccessBid();
				}
			}
			if(evt.code=="gamePay"){
				proccessBid();
			}
			
			
		}
		public override function openGamecenter():void{
		
		}
		public override function get supportGamecenter():Boolean{
			return false;
		}
		
		public override function login():void{
			
			AnzhiExtension.getInstance().AnzhiLogIn();
//			AnzhiExtension.getInstance().
		}
		public override function logout():void{
			
			AnzhiExtension.getInstance().AnzhiExit();
		}
		public override function pay(pid:String, bid:String):void{
			proccessBid();
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node==null){
				return ;
			}
			_tempBid=bid;
			var orderID:int=int(pid);
//			var price:Number=1;
			var price:Number=node.rmb;
			
			CONFIG::PayTest{
				price=0.01;
			}
			
			var body:String=node.name;
			var ext:String=bid;
			
			AnzhiExtension.getInstance().AnzhiPay(orderID,price,body,ext);
		}
		
		public override function get osType():String{
			return Plat_Base.OS_And_Guonei;
		}
		
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.IgnoreCheckSession]=true;
			obj[PlatExtrFlag.PreInit]=true;
			return obj;
		}
		
	}
}