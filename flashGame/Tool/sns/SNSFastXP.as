package Tool.sns
{
	
	import Tool.platform.PlatformUserInfo;
	
	import com.adobe.crypto.MD5;
	
	import flash.events.Event;
	import flash.net.SharedObject;
	
	import org.osflash.signals.Signal;
	
	public class SNSFastXP extends SnsBase
	{
		public static const Type:String=SNSType.Type_FastXP;
		private var _share:SharedObject;
		public function SNSFastXP()
		{
			try{
				_share=SharedObject.getLocal("redWar_loginInfomation");	
			}catch(e:Error){
				trace(e.message);
			}
		}
		
		protected override function initProperty():void{
			_type=SNSType.Type_FastXP;
			_priority=0;
		}
		
		public override function login():void{
			if(_share && _share.data.openid){
				_openId=_share.data.openId;
			}else{
				_openId=createOpenID();
				_share.data.openid=_openId;
				_share.flush();
			}
			_token= MD5.hash(_openId+"^_^");
			
			_successSingal.dispatch(this);
			
		}
		
		protected function createOpenID():String{
			var date:Date=new Date();
			return (date.monthUTC+""+date.dateUTC+""+date.hoursUTC+""+date.minutesUTC+""+date.secondsUTC+""+date.millisecondsUTC+""+Math.ceil(Math.random()*1000000000));
		}
		
		public override function clearLoginInfo():void{
			
		}
	}
}