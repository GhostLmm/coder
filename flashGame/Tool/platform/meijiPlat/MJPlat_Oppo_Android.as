package Tool.platform.meijiPlat
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TweenLite;
	
	import flash.events.Event;
	import flash.events.StatusEvent;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import sgf.ane.OppoAndroid;
	
	import util.Util;

	public class MJPlat_Oppo_Android extends Plat_Base
	{
		//warning
//		private static const OppoCallBackUrl:String="http://112.64.150.42/pay!finishOrder.action?platformflag=opand&paytypeflag=opand";
		//正式回调地址
		private static const OppoCallBackUrl:String="http://pay.wow.shanjinzhen.com/pay/payOppo/oppopay.jsp";
		public function MJPlat_Oppo_Android()
		{
			super();
		}
		public override function get loginPlatName():String
		{
			return "opand";
		}
		
		public override function get payPlatName():String
		{
			return "opand";
		}
		
		public override function get onlyPlatName():String
		{
			return "opand";
		}
		public override function get osType():String{
			return Plat_Base.OS_And_Guonei;
		}
		public override function init():void{
			OppoAndroid.onStatus=onStatus;
			OppoAndroid.init("AYZL62m2ce80C8kGk8gcoowOc","4e2e93f4929180929f7f3C048243333c",true,true);
			GameServerManager.instance.addEventListener(GameServerEvent.Evt_Server,ongameServerEvent);
			GameStatus.change_SN.add(onGameStatusChange);
			GlobalRef.stage.addEventListener(Event.ACTIVATE,onActive);
			GlobalRef.stage.addEventListener(Event.DEACTIVATE,onDeActive);
			
			S2CHanlder.instance.initCom_SN.add(onDataInitCom);
			
		}
		private function onDataInitCom():void{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			OppoAndroid.submitUserInfo(GLBaseData.userId,GLBaseData.serverId,GLBaseData.userName,userModel.userVo.userLevel.toString());
				
//			OppoAndroid.submitExtendInfo(int(GLBaseData.userId),GLBaseData.serverId,GLBaseData.userName,userModel.userVo.userLevel.toString());
//			UCGameSDK.getInstance().submitExtendData("roleId",GLBaseData.userId);
//			UCGameSDK.getInstance().submitExtendData("roleName",GLBaseData.userName);
//			UCGameSDK.getInstance().submitExtendData("roleLevel",userModel.userVo.userLevel.toString());
//			UCGameSDK.getInstance().submitExtendData("zoneId",GLBaseData.serverId);
//			UCGameSDK.getInstance().submitExtendData("zoneName",GLBaseData.serverId);
		}
		
		private function onActive(evt:Event):void{
			setFloat();

			//TweenLite.delayedCall(1,setFloat);
		}
		private function onDeActive(evt:Event):void{
			TweenLite.killTweensOf(setFloat);
			setSpriteState(1);
		}
		private function onGameStatusChange($status:String):void{
			setFloat();
		}
		
		private var spriteState:int=1;
		
		private function setSpriteState($s:int):void{
			if(spriteState==$s){
				return ;
			}
			spriteState=$s;
			if(spriteState==1){
				OppoAndroid.controlFloat(false);
			}else{
				OppoAndroid.controlFloat(true);
			}
		}
		
		private function setFloat():void{
			
			
			if(GameStatus.ST_GameOngoing==GameStatus.status){
				setSpriteState(2);
			}else{
				setSpriteState(1);
			}
		}
		
		private function ongameServerEvent(evt:GameServerEvent):void
		{
			if(!evt.effect) return ;
			
			if(evt.key==GameServerManager.KEY_GetUserInfo){
				if(evt.data && evt.data.infoResult && evt.data.infoResult.code==0){
					//					_openId=evt.data.infoResult.userId;
					//					_token="noToken";
					//					_nickName="noNick";
					setPlatInfo(evt.data.infoResult.BriefUser.id,"noToken","noNick");
					exctueLoginResult(true);
				}else{
					exctueLoginResult(false);
				}
			}
		}
		
		private function onStatus(code:String,level:String):void{
			trace("api返回："+code+" / "+level);
			var xml:XML=new XML(level);
			if(code==OppoAndroid.CODE_DL_LOGIN){
				if(String(xml.errorCode)=="0"){
					getUserInfo();
				}else{
					exctueLoginResult(false);
				}
			}
			if(code=="onForceUpgradeCancel"){
				Util.exitGame();
			}
			if(code=="DL_USER_INFO"){
				if(String(xml.errorCode)=="0"){
					var jsonStr:String=String(xml.errorMsg);
					var json:Object=JSON.parse(jsonStr);
					var to:String=String(json.token);
					
					var args:Object=Util.trifyUrlToObj(String(xml.orderNo));
					
					
//					var auth:String=String(xml.
					var uid:String=json.BriefUser.id;
					var uname:String=json.BriefUser.userName;
					
					GameServerManager.instance.getUserInfo(args.oauth_token,args.oauth_token_secret);
					
//					setPlatInfo(uid,to,uname);
					
//					exctueLoginResult(true);
				}else{
					exctueLoginResult(false);
				}
//				{"token":"oauth_token=653cf3b34ad724faee09f8b77f7c2371&oauth_token_secret=d3f8f006d12565dc050ac0e2580dda21","BriefUser":{"id":"12037533","mobileStatus":"false","sex":"true","email":"","status":"VISITOR_LOCKED","profilePictureUrl":"http:\/\/gcfs.nearme.com.cn\/avatar\/717\/282\/4a65001ec13b4d16b69ca7360ed89672.jpg","name":"pywfun2","userName":"pywfun2","gameBalance":"9","mobile":"","emailStatus":"false"}}</errorMsg></result>
				//				<result><orderNo>null</orderNo><errorCode>0</errorCode><errorMsg>{"BriefUser" : {"id":"12037533","sex":"true","profilePictureUrl":"http://gcfs.nearme.com.cn/avatar/717/282/4a65001ec13b4d16b69ca7360ed89672.jpg","name":"pywfun2","gameBalance":"9","userName":"pywfun2","emailStatus":"false","mobileStatus":"false","status":"VISITOR_LOCKED","mobile":"","email":""}}</errorMsg></result>
			}
			if(code=="DL_PAY"){
				if(String(xml.errorCode)=="0"){
					PlatformManager.getInstance().showTipAfterBuy();
				}
				proccessBid();
			}
		}
		
		public override function login():void{
			OppoAndroid.login();
			
		}

		public override function get supportGamecenter():Boolean{
			return true;
		}
		
		public override function openGamecenter():void{
			OppoAndroid.openMemberCenter();
		}
		public override function pay(pid:String, bid:String):void{
			proccessBid();
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node==null) return ;
			_tempBid=bid;
			
			var money:Number=node.rmb*100;
//			var money:Number=1;
			CONFIG::PayTest{
				money=1;
			}
//			var proName:String;
//			var proNum:int;
			var proName:String=node.name;
			var proNum:int=1;
//			var productName:String=proName;
			var extrInfo:String=bid;
			
			if(node.id==XMLDataManager.getConstById("yuanbaoshuItemId").value){
				proName="张月卡";
				proNum=1;
			}else{
				proName=Util.getLanguage(ResourceConst.R_cash);
				proNum=node.cash;
			}
				
			
//			var callBack:String="";
			OppoAndroid.payment(money,proName,extrInfo,OppoCallBackUrl,bid,proNum);
			
		}
		private function getUserInfo():void{
			OppoAndroid.getUserInfo();
		}
		
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.IgnoreCheckSession]=true;
//			obj[PlatExtrFlag.NotAutoLogin]=true;
			return obj;
		}
		
		
	}
}