package Tool.platform.meijiPlat
{
	import com.fish.GLBaseData;
	import com.ghostlmm.tool.HttpRequest;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import Tool.chongzhiCheck.ChongzhiCheckManager;
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import core.event.TqtEvent;
	
	import util.Util;

	public class MJPlat_Union_Test extends Plat_Base
	{
		public function MJPlat_Union_Test()
		{
			super();
		}
		public override function init():void
		{
			
		}
		public override function get osType():String
		{
			return Plat_Base.OS_And_Guonei;
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
		public override function get supportGamecenter():Boolean{
			return false;
		}
		public override function get supportPlatAccount():Boolean{
			return true;
		}
		public override function get supportLogout():Boolean{
			return false;
		}
		public override function get supportSwitchAccount():Boolean{
			return false;
		}
		

		
		public override function login():void
		{
			showLoginPage();
		}		
		
		public override function logout():void{
//			showLoginPage();
			logout_SN.dispatch(true,null);
		}
		
		public override function switchAccount():void{
			showLoginPage();
			
		}
		
		
		private var loginPage:LoginPage;
		private function showLoginPage():void
		{
			if(loginPage==null){
				loginPage=new LoginPage();
				loginPage.x=GlobalRef.width/2;
				loginPage.y=GlobalRef.height/2;
				loginPage.okBtn.addEventListener(TqtEvent.BUTTON_CLICK,onOk);
			}
			GlobalRef.root.addChild(loginPage);
			
		}
		
		private function onOk(evt:Event):void{
			if(loginPage.input.isInputed()){
				var uid:String=loginPage.input.text;
				setPlatInfo(uid,"test_token","test_nick");
				exctueLoginResult(true);
				clearLoginPage();
			}
			
		}
		
		private function enter():void{
			var uid:String="100";
			setPlatInfo(uid,"test_token","test_nick");
			exctueLoginResult(true);
			clearLoginPage();
		}
		
		private function clearLoginPage():void
		{
			
			if(loginPage){
				if(loginPage.okBtn){
					loginPage.okBtn.removeEventListener(TqtEvent.BUTTON_CLICK,onOk);
				}
				loginPage.destory();
				if(loginPage.parent){
					loginPage.parent.removeChild(loginPage);
				}
				loginPage=null;
			}
			
		}
		
		public override function pay(pid:String, bid:String):void
		{
//			Util.flow("测试充值关闭");
//			if(!SwitchConfig.ST_TestChongzhi){
//				return ;
//			}
			
			
			
			var arg:Object=createPayArg(int(pid),bid);
			
			HttpRequest.getInstance().getRequest(UrlConfig.payUrl,arg,function(data:Object):void{});
			
//			ChongzhiCheckManager.instance.setCheckBackUrl("http://120.24.249.95:8080/web/PayServer");
//			ChongzhiCheckManager.instance.addCheckData(arg);
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
		
		
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.IgnoreCheckSession]=true;
			obj[PlatExtrFlag.ShowWanmeiLogo]=true;
			obj[PlatExtrFlag.ReloadAfterLogout]=true;
			obj[PlatExtrFlag.Lengjing]=true;
			obj[PlatExtrFlag.UserKefu]=false;
			return obj;
		}
		
	}
}
import flash.display.Sprite;

import ui.widget.Button;
import ui.widget.InputField;

class LoginPage extends Sprite{
	
	private var mc:flash.display.MovieClip; 
	public var input:InputField;
	public var okBtn:Button;
	
	public function LoginPage()
	{
		mc=new (AssetManager.getAssetClass("WindowTestZhanghao") as Class)(); 
		this.addChild(mc);
		input=new InputField(mc.fnt_shuru_zhanghao);
		input.setRestrict("0-9a-zA-Z");
		okBtn=new Button(mc.btn_queding);
	}
	public function destory():void{
		if(input){input.destory();input=null;}
		if(okBtn){okBtn.destory();okBtn=null;}
		mc=null;
	}
	
	
}
