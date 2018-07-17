package
{
	import com.ghostlmm.tool.HttpRequest;
	import com.greensock.TweenLite;
	
	import Tool.ApplicationInfoDesc;
	import Tool.platform.PlatformManager;
	
	import appUpdate.AppUpdateControl;
	
	import util.Util;

	public class AppstoreVerify
	{
		public function AppstoreVerify()
		{
		}
		
		public static var inVerify:Boolean=false;
		
		private static var hasVerifyComplete:Boolean;
		
		
		private static var repeatCount:int=3;
		public static function startVerify():void{
			trace("开始请求验证版本号");
			hasVerifyComplete=false;
			repeatCount=3;
			requestVerify();
		}
		
		private static function requestVerify(netError:Boolean=false):void{
			repeatCount--;
			if(repeatCount<=0){
				// 验证重复
				TopTip.showExitTip("无法连接服务器，请检查网络连接。是否重新连接？",startVerify,Util.exitGame);
				return ;
			}
			// appstore 版本检测
//			var op:String="checkapp";
			
			var op:String="newcheckapp";
			
			HttpRequest.getInstance().getRequest(UrlConfig.UnionAccountUrl,{appVs:ApplicationInfoDesc.NativeInfo.versionStr,op:op,platname:PlatformManager.getInstance().getOnlyPlatName()},
				function(data:Object):void{
					if(data.toString().indexOf("code")!=-1){
						TweenLite.delayedCall(0.5,requestVerify,[true]);
					}else{
						TweenLite.killTweensOf(requestVerify);
						
						var json:Object=JSON.parse(data.toString());
						
						var useVersion:String=json.appversion;
						if(ApplicationInfoDesc.NativeInfo.versionId > ApplicationInfoDesc.handleVersionId(useVersion) ){
							inVerify=true;
						}else{
							inVerify=false;
						}
						
						trace("是否为测试版本 ： "+inVerify +"\t"+ApplicationInfoDesc.NativeInfo.versionStr+" \ "+useVersion);
						
						AppUpdateControl.continue_SN.addOnce(onUpdateContinue);
						AppUpdateControl.proccessUpdate(json);
					}
				}
				);
			
		}
		
		private static function onUpdateContinue():void{
			hasVerifyComplete=true;
			excuteCallBack();
		}
		
		private static var _fn:Function;
		public static function setCallBack($fn:Function):void{
			_fn=$fn;
			excuteCallBack();
		}
		
		private static function excuteCallBack():void{
			if(hasVerifyComplete){
				if(_fn!=null){
					_fn();
					_fn=null;
				}
			}
		}
		
	}
}