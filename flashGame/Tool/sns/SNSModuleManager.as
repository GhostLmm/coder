package Tool.sns
{
	import com.greensock.TweenLite;
	
	import flash.net.SharedObject;
	import flash.utils.Dictionary;

	public class SNSModuleManager
	{
		private static var _instance:SNSModuleManager;
		public static function getInstance():SNSModuleManager{
			if(_instance==null) _instance=new SNSModuleManager();
			return _instance;
		}
		public function SNSModuleManager()
		{
			iniSharedObject();
			initSNSPlat();
		}
		
		private var _so:SharedObject;
		private static const ShareName:String="redwar.snsmodule";
		private var _snsPlatVect:Vector.<ISnsPlat>;
		
		private var lastLoginType:String=SNSType.Type_FastXP;
		/**   游戏服务器账号唯一id
		 * */
		private var _gameUid:String;
		
		private var _bindDic:Dictionary=new Dictionary();
		
		/**   
		 * */
		
		
		
		private function iniSharedObject():void{
			try{
				_so=SharedObject.getLocal(ShareName);
				if(_so && _so.data.loginType){
					lastLoginType=_so.data.loginType;
				}else{
					lastLoginType=SNSPlatConfig.SNSClassArray[0].Type;
				}
			}catch(e:Error){
				trace(e.message);
			}
		}
		
		public function initXPAccount():void{
			if(lastLoginType==SNSType.Type_FastXP){
				var xpPlat:ISnsPlat=getPlatByType(SNSType.Type_FastXP);
				xpPlat.loginSuccessSingal.add(xpAccountLoginComplete);
				xpPlat.login();
			}
		}
		
		private function xpAccountLoginComplete(xp:ISnsPlat):void{
			
		}
		
		/**   验证账号
		 * */
		private function verifyAccount(plat:ISnsPlat):void{
			
			
			TweenLite.delayedCall(4,mockVerify);
			
		}
		private function mockVerify():void{
			var data:Object={uid:"23",facebook:"12324",email:"123@123.com",local:"1234321432314234"};
			verifyResult(data);
		}
		
		private function verifyResult(data:Object):void{
			if(	true){
				_gameUid=data.uid;
				if(data.email){
					_bindDic[SNSType.Type_Email]=data.email;
				}
				if(data.facebook){
					_bindDic[SNSType.Type_Facebook]=data.facebook;
				}
			}
		}
		
		public function getCurrentUserPlatIdByType(type:String):String{
			return _bindDic[type];
		}
		
		public function getPlatByType(type:String):ISnsPlat{
			for each(var plat:ISnsPlat in _snsPlatVect){
				if(plat.snsType==type){
					return plat;
				}
			}
			return null;
		}
		private function initSNSPlat():void{
			_snsPlatVect=new Vector.<ISnsPlat>();
			for each(var cs:Class in SNSPlatConfig.SNSClassArray){
				_snsPlatVect.push(new cs());
			}
		}
		private function snsLoginFail(plat:ISnsPlat):void{
			
		}
		private function snsLoginSuccess(plat:ISnsPlat):void{
			
		}
		
	}
}