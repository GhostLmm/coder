package Tool.facebook
{
	import flash.events.MouseEvent;

	public class FacebookPlatMock
	{
		public function FacebookPlatMock()
		{
		}
		public function loginOut(louginOutComplete:Function):void
		{
			louginOutComplete();
//			_loginOutCom=louginOutComplete;
//			GoViral.goViral.logoutFacebook();
		}
		public function init():void
		{
			
		}
		public function setAppId(id:String):void
		{
			
		}
		public static var MOCK_Data:Object={
			"openId":"100002352698161",
			"token":"CAAF8icCrz8QBAG61bZCZAk5RHYa64gY4ra9JwaIc7v4sGKPIUVdsPdFfHz1fJMBoj4EUcDFcWfbjmZCDJtvNCgC81DNAoY6kDwR9pvc0JjEZBRiMpDoZBN9ZAERWDsy8XtaBl6QIZCsZBFx5WodAaoyGWgpfKXO345cAeCyFRD1efAZDZD",
			"name":"ghostLmm"
		};
		private static var mock:Object
		public static function getMockData():Object{
//			var obj:Object={};
			if(mock==null){
				mock={};
				mock.openId=new Date().time;
				mock.token="CAAF8icCrz8QBAG61bZCZAk";
				mock.name="lmm"+mock.openId;
			}
			return mock;
				
		}
			
		
		private var loginComplete:Function;
		private var loginFail:Function;
		
		public function login(_complete:Function,_fail:Function):void
		{
			loginComplete=_complete;
			loginFail=_fail;
			showFacebookLogin();
//			if(randomBool()){
//				trace("登录成功");
//				_complete(getMockData());
//			}else{
//				trace("登录失败");
//				_fail();
//			}
		}
		private var loginPage:LOGIN_WINDOW;
		private function showFacebookLogin():void{
			if(loginPage==null){
				loginPage=new LOGIN_WINDOW();
				loginPage.sure.addEventListener(MouseEvent.CLICK,onSureClick);
				loginPage.cancel.addEventListener(MouseEvent.CLICK,onCancelClick);
			}
			GLOBAL._stage.addChild(loginPage);
		}
		private function onSureClick(evt:MouseEvent):void{
			handle(true);
		}
		private function onCancelClick(evt:MouseEvent):void{
			handle(false);
		}
		private function handle(result:Boolean):void{
			if(result){
				if(loginComplete!=null){
					var data:Object={};
					data.openId=loginPage.zhanghu.text;
					data.token=loginPage.mima.text;
					data.name=data.openId;
					loginComplete(data);
				}
			}else{
				if(loginFail!=null){
					loginFail();
				}
			}
			loginComplete=null;
			loginFail=null;
			if(GLOBAL._stage.contains(loginPage)){
				GLOBAL._stage.removeChild(loginPage)
			}
		}
//		public function loginOut(_logoutCom:Function):void{
//			_logoutCom();
//		}
		
		
		public function share(title:String, comment:String, summary:String,link:String,picUrl:String,shareCom:Function,shareFail:Function):void
		{
			if(randomBool()){
				trace("分享成功");
				shareCom();
			}else{
				trace("分享失败");
				shareFail();
			}
		}
		
		private function randomBool():Boolean{
			if(int(Math.random()*1000)%2==0){
				return false;
			}
			return true;
		}
	}
}