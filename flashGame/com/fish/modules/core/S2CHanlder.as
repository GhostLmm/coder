package com.fish.modules.core
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.events.CoreEvent;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.UserVO;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.api.IInjector;
	import com.ghostlmm.lightMVC.api.ILogger;
	import com.mutou.tqt.DigC2SProto;
	import com.mutou.tqt.S2C.DigS2CProto;
	
	import flash.events.IEventDispatcher;
	import flash.utils.ByteArray;
	
	import Tool.platform.PlatformManager;
	
	import org.osflash.signals.Signal;
	
	import view.CommonControlFun;
	import view.commontools.ServerListManager;

	public class S2CHanlder
	{
		private var inject:IInjector;
		private var log:ILogger;
		private var coreDispatcher:IEventDispatcher;
		public function S2CHanlder()
		{
			inject=Context.getInsance().inject;
			log=Context.getInsance().logger;
			coreDispatcher=Context.getInsance().coreDispatcher;
		}
		
		public function reset():void
		{
			Error_Message_SN.removeAll();
			Opt_Message_SN.removeAll();
			initCom_SN.removeAll();
			message_SN.removeAll();
			serverRestart_SN.removeAll();
			messageMax_SN.removeAll();
		}
		
		
		
		public var initCom_SN:Signal=new Signal();
		public var message_SN:Signal=new Signal(String);
		public var messageMax_SN:Signal=new Signal(String,DigC2SProto,int);
		
		/**  验证author出错
		 * */
		public var authorError_SN:Signal=new Signal();
		
		
		public static var instance:S2CHanlder=new S2CHanlder();
		
		private var _currentMessage:String;
		

		public function get currentMessage():String
		{
			return _currentMessage;
		}
		
		public var serverRestart_SN:Signal=new Signal();
		
		public var Error_Message_SN:Signal=new Signal(String,int);

		public var Opt_Message_SN:Signal=new Signal(String,int);
		
		/**  服务器数据与前段不一致
		 * */
		public var serverDataError_SN:Signal=new Signal(int);
//		public var Error_Message_SN:Signal=new Signal(String,int);

		public var serverStartRunTime:Number=0;
		
		public var curCode:int;
		
		/**   对协议预处理
		 * */
		private function preProcessProto(s2cProto:DigS2CProto):void
		{
			if(s2cProto.extrdata && s2cProto.extrdata.jingkuangLogNull>0){
				if(s2cProto.jinkuanglogs==null){
					s2cProto.jinkuanglogs=[];
				}
			}
			if(s2cProto.extrdata && s2cProto.extrdata.huodongNull>0){
				if(s2cProto.huodongswitchs==null){
					s2cProto.huodongswitchs=[];
				}
			}
			if(s2cProto.extrdata && s2cProto.extrdata.jingkuangLogNull>0){
				if(s2cProto.jinkuanglogs==null){
					s2cProto.jinkuanglogs=[];
				}
			}
			if(s2cProto.extrdata && s2cProto.extrdata.shengqingpersionNull>0){
				if(s2cProto.shengqingpersions==null){
					s2cProto.shengqingpersions=[];
				}
			}
			if(s2cProto.extrdata && s2cProto.extrdata.banghuiPersoionNull>0){
				if(s2cProto.banghuipersions==null){
					s2cProto.banghuipersions=[];
				}
			}
			if(s2cProto.extrdata && s2cProto.extrdata.xitongkuangNull>0){
				if(s2cProto.xitongkuangs==null){
					s2cProto.xitongkuangs=[];
				}
			}
			if(s2cProto.extrdata && s2cProto.extrdata.baomingbanghuiNull>0){
				if(s2cProto.baomingbanghuis==null){
					s2cProto.baomingbanghuis=[];
				}
			}
			
			if(s2cProto.extrdata && s2cProto.extrdata.banghuizhanjifenNull>0){
//				if(s2cProto.banghuizhanjifens==null){
//					s2cProto.banghuizhanjifens=[];
//				}
			}
			if(s2cProto.extrdata && s2cProto.extrdata.banghuizhandetailNull>0){
//				if(s2cProto.banghuizhandetails==null){
//					s2cProto.banghuizhandetails=[];
//				}
			}
			if(s2cProto.extrdata && s2cProto.extrdata.gerenzhanjiNull>0){
//				if(s2cProto.gerenzhanjis==null){
//					s2cProto.gerenzhanjis=[];
//				}
			}
			if(s2cProto.extrdata && s2cProto.extrdata.chongzhijiluNull>0){
				if(s2cProto.chongzhijilus==null){
					s2cProto.chongzhijilus=[];
				}
			}
			if(s2cProto.extrdata && s2cProto.extrdata.lingqujiluNull>0){
				if(s2cProto.lingqujilus==null){
					s2cProto.lingqujilus=[];
				}
			}
			if(s2cProto.extrdata && s2cProto.extrdata.hongbaoNull>0){
				if(s2cProto.hongbaos==null){
					s2cProto.hongbaos=[];
				}
			}
		}
		
		public function processMessage(s2cProto:DigS2CProto,c2sProto:DigC2SProto):void
		{			
			preProcessProto(s2cProto);
			
			if(serverStartRunTime==0){
				serverStartRunTime=s2cProto.timeStart.toNumber();
			}
			if(serverStartRunTime!=s2cProto.timeStart.toNumber()){
				serverRestart_SN.dispatch();
				return ;
			}
			_currentMessage=s2cProto.rce;
			curCode=s2cProto.retCode;
			var needProcess:Boolean=true;
			if(s2cProto.retCode<=0){
				trace("暂停");
				switch(s2cProto.retCode)
				{
					case ErrorCode.AUTHKEY_WRONG:
						onAuthorError();
						needProcess=false;
						return ;
						break;
					case ErrorCode.HUODONG_XML_ERROR:
						CommonControlFun.reLoadGame();
						needProcess=false;
						return ;
						break;
					default:
						needProcess=false;
//						Error_Message_SN.dispatch(s2cProto.rce,s2cProto.retCode);
						break;
				}
			}
			
			(Context.getInjectInstance(TimerModel) as TimerModel).init(s2cProto.timeStamp.toNumber());
			
			if(needProcess){
				if(AutoProcessMap.indexOf(s2cProto.rce)!=-1){
					trace("特殊处理： "+s2cProto.rce);
					this[s2cProto.rce](s2cProto);
				}else
				{
					trace("自动处理： "+s2cProto.rce);
					GameVOManager.getInstance().setMessage(s2cProto);
				}
				
				
				message_SN.dispatch(s2cProto.rce);
				messageMax_SN.dispatch(s2cProto.rce,c2sProto,s2cProto.retCode);
				if(s2cProto.rce==C2SEmitter.REQ_DigMapGetHandler){
					if(GameStatus.status!=GameStatus.ST_GameOngoing){
						coreDispatcher.dispatchEvent(new CoreEvent(CoreEvent.GameInitComplete));
					}
				}
			}else{
				serverDataError_SN.dispatch(s2cProto.retCode);
			}

			_currentMessage=null;

			Opt_Message_SN.dispatch(s2cProto.rce,s2cProto.retCode);

		}
		
		private static const AutoProcessMap:Array=[
			C2SEmitter.REQ_Initgame
		];
		
		private function DigMapGetHandler(s2cProto:DigS2CProto):void{
			var bytes:ByteArray=new ByteArray();
			s2cProto.writeTo(bytes);
			log.info("Handle DigMapGetHandler : "+bytes.length);
			GameVOManager.getInstance().setMessage(s2cProto);
			if(GameStatus.status!=GameStatus.ST_GameOngoing){
				coreDispatcher.dispatchEvent(new CoreEvent(CoreEvent.GameInitComplete));
			}
		}
		
		private function GetUserInitHandler(s2cProto:DigS2CProto):void
		{
			
			var bytes:ByteArray=new ByteArray();
			s2cProto.writeTo(bytes);
			log.info("Handle GetUserInitHandler : "+bytes.length);
			GameVOManager.getInstance().setMessage(s2cProto);

			initCom_SN.dispatch();
			coreDispatcher.dispatchEvent(new CoreEvent(CoreEvent.GameInitComplete));
//			var userModel:UserModel=Context.getInjectInstance(UserModel);
//			C2SEmitter.getDigmapInfo(userModel.userVo.curGuanka);
			
			try{
				var userModel:UserModel=Context.getInjectInstance(UserModel);
				(PlatformManager.getInstance().platformObj as Object).logEnterServer(GLBaseData.userId,GLBaseData.userName,
					GLBaseData.serverId,ServerListManager.getInstance().getServerDataById(int(GLBaseData.serverId)).zoneName,
					userModel.userVo.userLevel,userModel.userVo.userCash,userModel.userVo.vipLevel);
			}catch(e:Error){}
		}
		
		
		public function onAuthorError():void
		{
			authorError_SN.dispatch();
		}
		
	}
}