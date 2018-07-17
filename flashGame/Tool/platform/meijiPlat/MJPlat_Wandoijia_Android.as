package Tool.platform.meijiPlat
{
	import com.ghostlmm.wdj.WandoujiaSdkHelper;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import Tool.platform.PlatformManager;
	
	public class MJPlat_Wandoijia_Android extends Plat_Base
	{
		public function MJPlat_Wandoijia_Android()
		{
			super();
		}
		public override function get loginPlatName():String
		{
			return "wdjand";
		}
		
		public override function get payPlatName():String
		{
			return "wdjand";
		}
		
		public override function get onlyPlatName():String
		{
			return "wdjand";
		}
		
		public override function init():void
		{
//			WandoujiaSdkHelper.instance.init("100001581","f97a72fdd23c29b41444b6c2103a4744");
			WandoujiaSdkHelper.instance.init("100014019","d32688fd0b45bcb40151a0972ca30813");
			WandoujiaSdkHelper.instance.setOnStatus(sdkCallBack);
		}
		private function sdkCallBack(code:String,data:Object):void
		{
			switch(code){
				case "loginResult":
					if(data.success){
						//						_openId=data.uid;
						//						_token=data.token;
						setPlatInfo(data.uid,data.token);
						exctueLoginResult(true);
					}else{
						exctueLoginResult(false);
					}
					break;
				case "payResult":
					if(data.success){
						trace("支付成功");
						PlatformManager.getInstance().showTipAfterBuy();
					}
					proccessBid();
					break;
				case "reloginResult":
					logout_SN.dispatch(true,{});
					break;
				case "logoutResult":
					logout_SN.dispatch(true,{});
					break;
			}
		}
		public override function login():void{
			WandoujiaSdkHelper.instance.login();
		}
		public override function logout():void{
			WandoujiaSdkHelper.instance.logout();
		}
		public override function get supportLogout():Boolean{
			return true;
		}
		public override function pay(pid:String, bid:String):void{
			//			WandoujiaSdkHelper.instance.pay("名称","描述",1,bid);
			
			proccessBid();
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node==null){
				return ;
			}
			
			_tempBid=bid;
			
			var price:int=node.rmb*100;
			CONFIG::PayTest{
				price=1;
			}
				var productName:String=node.name;
			var productDesc:String=node.desc;
			
			WandoujiaSdkHelper.instance.pay(productName,productName,price,bid);
		}
		
		public override function get supportGamecenter():Boolean{
			return false;
//			WandoujiaSdkHelper.instance.
		}
		public override function get osType():String{
			return Plat_Base.OS_And_Guonei;
		}
	}
}

