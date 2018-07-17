package Tool.chongzhiCheck
{
	import com.ghostlmm.tool.HttpRequest;
	import com.greensock.TweenLite;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import Tool.FileLog;
	
	import util.Util;
	


	public class CheckItem
	{
		private var currency:int;
		public var postArg:Object;
		
//		private var timer:Timer;
		
		private var checkComFlag:Boolean=false;
		
		private var needShowTip:Boolean=false;
		
		internal var key:String;
		
		private var checkNum:int=30;
		
		private var totalCheck:int=60;
		
		private var data:Object;
		
		//订单已经 验证过了， 重复验证
		public var repeatVerify:Boolean=false;
		
		public var souchong:Boolean=false;
		
		public function get postObj():Object{
			return postArg;
		}
		
		public function CheckItem()
		{
		}
		
		public function initFromObj(_data:Object,_key:String):void
		{
			data=_data;
			currency=data.currency;
			postArg=data.postArg;
			key=_key;
			needShowTip=false;
		}
		
		public function initData(_postArg:Object,_key:String):void
		{
			key=_key;
			currency=0;
			postArg=_postArg;
			needShowTip=true;
		}
		
		public function turnToObj():Object
		{
			return {currency:currency,postArg:postArg};
		}
		
		private function check():void
		{
			totalCheck--;
			if(totalCheck<=0)
			{
				return ;
			}
			
			var objString:String="[发送后台请求] ";
			objString+=ChongzhiCheckManager.instance.checkBackUrl+"?";
			for(var key:String in postArg)
			{
				objString+=key+"="+postArg[key]+"&";
			}
			objString=objString.substr(0,objString.length-1);
			trace(objString);
			FileLog.log("充值",objString);
			HttpRequest.getInstance().realyPostRequest(ChongzhiCheckManager.instance.checkBackUrl,postArg,callBack);
		
		}
		
		private var checkError:Boolean=true;
		public function get success():Boolean
		{	
			return !checkError;
		}
		private function callBack(data:Object):void
		{
//			trace("[充值验证数据返回：]"+data);
			if(checkComFlag)
			{
				return ;
			}
			
			try{
				var json:Object=JSON.parse(data as String);
				if(json.hasOwnProperty("code")){
					return ;
				}else{
					//充值成功
					if(json.result==1 || json.result==1000){
						
						souchong=(json.first_pay=="true");
						
						checkNum=0;
						checkError=false;
					}else if(json.result==3 || json.result==1003){
						//充值已经处理过了
						repeatVerify=true;
						checkNum=0;
						checkError=false;
					}else{
						checkNum--;
					}
				}
			}catch(e:Error){
				
			}
			
			
//			var flag:int=0;
			/*if(data.toString().indexOf("error")!=-1)
			{
//				flag=-1;
				checkNum--;
//				this.data.re="error";
			}
			else if(data.toString().indexOf("ok")!=-1)
			{
//				flag=1;
				checkNum=0;
				checkError=false;
				var temp:Array=data.toString().split(",");
				if(temp.length>=2)
				{
					currency=temp[1];
				}
				
				
				if(needShowTip)
				{
					showTip();
				}*/
//				this.data.re="ok";
//			}
			
			trace("[充值返回] "+data+"\tcheckNum: "+checkNum+ "totalNum:"+totalCheck);
			
			if(checkNum==0)
			{
//				if(timer)
//				{
//					timer.removeEventListener(TimerEvent.TIMER,onTimer);
//					timer.stop();
//					timer=null;
//				}
				
				if(checkError)
				{
					/*if(postArg.tryAgain==null || postArg.tryAgain<=0)
					{
//						HttpRequest.getInstance().realyPostRequest(EnvironmentParameter.gamePreUrl+"pay_bak.php",postArg,function(_data:Object):void
//						{
//							
//						});
						ChongzhiCheckManager.instance.killItem(this);
					}
					else
					{
						postArg.tryAgain=0;
						ChongzhiCheckManager.instance.updataItem(this);
					}*/
				}
				else
				{
					ChongzhiCheckManager.instance.killItem(this);
//					Util.flow("充值成功");
				}
				
				checkComFlag=true;
			}
			else
			{
//				var delayTime:int=(4-checkNum)*20;
//				delayTime=Math.max(10,delayTime);
				var delayTime:int=5;
				
				if(checkNum>20){
					delayTime=5;
				}else if(checkNum>10){
					delayTime=10;
				}else{
					delayTime=30;
				}
				
				
				TweenLite.delayedCall(delayTime,check);
			}
		}
		
		private function showTip():void
		{
			/*if(GLOBAL._mode=="build" )
			{
				var arg:Object={};
				arg.body=Locales.Get("chongzhi_suc_tip",{v1:currency});
				WindowManager.getInstance().openWindow(WindowManager.ConfirmWindow,arg);
			}*/
				
		}
		public function startCheck():void
		{
//			if(timer==null)
//			{
//				timer=new Timer(4000,10);
//				timer.addEventListener(TimerEvent.TIMER,onTimer);
//				timer.start();
//				check();
//			}
			
			if(postArg.tryAgain==null){
				postArg.tryAgain=ChongzhiCheckManager.MaxTryAgain;
			}
			postArg.tryAgain--;
			if(postArg.tryAgain<=0){
				ChongzhiCheckManager.instance.killItem(this);
			}else{
				ChongzhiCheckManager.instance.updataItem(this);
				check();
			}
			
		}
		
		private function onTimer(evt:Event):void
		{
			check();
		}
			
	}
}