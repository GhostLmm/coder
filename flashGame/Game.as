package
{
	import com.fish.modules.core.CoreConfig;
	import com.fish.modules.core.ViewControl;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.WalkNpcModel;
	import com.fish.modules.preloadMD.PreloadConfig;
	import com.fish.modules.preloadMD.events.PreloadEvent;
	import com.ghostlmm.guide.SceneCaption;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.ModuleManager;
	import com.ghostlmm.notificationAir.NotificationManager;
	import com.ghostlmm.socketCommunication.Transport;
	import com.ghostlmm.tool.AsyExcute;
	import com.ghostlmm.tool.GameSession;
	import com.ghostlmm.tool.JoyStick;
	import com.ghostlmm.tool.ShakeTool;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import core.LayerController;
	import core.WindowManager;
	import core.timer.TimerManager;
	
	import fl.motion.Animator;
	
	import snake.NpcTalkInfoBar;
	import snake.effect.BattleTimeTick;
	import snake.effect.ClearOut;
	
	import ui.battle.BattleResultWindowData;
	import ui.battle.ShengliWindow;
	import ui.digWindow.AlertWindow;
	import ui.widget.MyRichText;
	
	import view.CommonControlFun;
	


	
	public class Game extends Sprite
	{
		public function Game()
		{
			super();
			if(stage)
			{
				init();
			}else
			{
				addEventListener(Event.ADDED_TO_STAGE,init);
			}
		}
		
		private function init(evt:Event=null):void
		{
			NotificationManager.instance.init();
			removeEventListener(Event.ADDED_TO_STAGE,init);
			GlobalRef.root=this;
			GlobalRef.stage=this.stage;
			
			AsyExcute.initStage(this.stage);
			
			
//			Density.initialize(this.stage);
//			Density.zoom(this);
//			x=(stage.fullScreenWidth-GlobalRef.width)/2;
//			y=(stage.fullScreenHeight-GlobalRef.height)/2;
			
			Music.initSound();
			
			GameSession.instance.setStageAndRoot(stage,this);
			GameSession.instance.startTick();
			
			LayerController.instance.init(this);
//			WindowManager_New.getInstance().setLayer(LayerController.instance.newWindowLayer);
			
			WindowManager.init();
			
			TimerManager.init(); 
			TAbDebug.setStage(this.stage);
//			LayerControl.setRoot(this);
//			
//			WindowManager.getInstance().setLayer(LayerControl.windowLayer);
//			WindowName.registerWindow();
//			
//			SceneManager.getInstance().setSceneLayer(LayerControl.stageLayer);
			
			
//			this.addChild(new Stats());
			
			GameStatus.setStatus(GameStatus.ST_Logining);
			
			Context.init();
			ModuleManager.getInstance().registerModule(PreloadConfig.NAME,PreloadConfig);
			ModuleManager.getInstance().loadmodule(PreloadConfig.NAME);
			Context.getInsance().coreDispatcher.dispatchEvent(new PreloadEvent(PreloadEvent.StartPreload));
			
//			enterMain();
			
			testFresh();
		}
		
		private function enterMain():void{
			ModuleManager.getInstance().registerModule(CoreConfig.NAME,CoreConfig);
			ModuleManager.getInstance().loadmodule(CoreConfig.NAME);
			(Context.getInjectInstance(TimerModel) as TimerModel).init(new Date().time);
//			ViewAssemble.bindMediator(LayerController.instance.worldLayer);
			ViewControl.init();
		}
		
		private function testFresh():void
		{
			TAbDebug.debug_SN.add(onDebug);
		}
		

		private var animate:Animator;
		private function testMovie():void{
			
			
				
		}
		
		private function onDebug(type:String,args:Array):void{
			
			if(type=="url"){
				if(args.length>=2){
					if(args[0]=="server"){
						if(args[1]=="+"){
							UrlConfig.serverListZip+="x";
						}else{
							UrlConfig.serverListZip=UrlConfig.serverListZip.substr(0,UrlConfig.serverListZip.length-1);
						}
					}
					if(args[0]=="all"){
						if(args[1]=="+"){
							UrlConfig.serverListZip+="x";
							UrlConfig.xmlZipUrl+="x";
							UrlConfig.huodongXmlUrl+="x";
						}else{
							UrlConfig.serverListZip=UrlConfig.serverListZip.substr(0,UrlConfig.serverListZip.length-1);
							UrlConfig.xmlZipUrl=UrlConfig.xmlZipUrl.substr(0,UrlConfig.xmlZipUrl.length-1);
							UrlConfig.huodongXmlUrl=UrlConfig.huodongXmlUrl.substr(0,UrlConfig.huodongXmlUrl.length-1);
						}
					}
					if(args[0]=="xml"){
						if(args[1]=="+"){
							UrlConfig.xmlZipUrl+="x";
						}else{
							UrlConfig.xmlZipUrl=UrlConfig.xmlZipUrl.substr(0,UrlConfig.xmlZipUrl.length-1);
						}
					}
					if(args[0]=="huodong"){
						if(args[1]=="+"){
							UrlConfig.huodongXmlUrl+="x";
						}else{
							UrlConfig.huodongXmlUrl=UrlConfig.huodongXmlUrl.substr(0,UrlConfig.huodongXmlUrl.length-1);
						}
					}
					
					trace("server:\t"+UrlConfig.serverListZip);
					trace("xml:\t"+UrlConfig.xmlZipUrl);
					trace("huodong:\t"+UrlConfig.huodongXmlUrl);
				}
			}
			
			if(type=="cut"){
//				Transport._socket.close();
			}
			
			if(type=="chat"){
				CommonControlFun.gotoChat();
			}
			if(type=="re"){
				ViewControl.reEnterGameStartScene();
			}
			
			if(type=="shengli"){
				var battleData:BattleResultWindowData=new BattleResultWindowData();
				battleData.newStarNum=3;
				battleData.oldStarNum=1;
				WindowManager.openOnlyWinodw(ShengliWindow,battleData);
			}
			
			if(type=="shake"){
				ShakeTool.shake(this,1,0.2);
			}
			
			if(type=="talk"){
				if(args.length>=2){
					var talkObj:Object={};
					talkObj[args[0]]=args[1];
					var walkNpc:WalkNpcModel=Context.getInjectInstance(WalkNpcModel);
					if(walkNpc){
						walkNpc.npcerTalk_SN.dispatch(talkObj);
					}
				}
			}
			
			if(type=="alert"){
				WindowManager.openOnlyWinodw(AlertWindow);
			}
			if(type=="move"){
				if(args.length>=2){
//					PlayMoveGuide.moveToPos(Number(args[0]),Number(args[1]));
				}
				
			}
			if(type=="date"){
				trace(new Date().toLocaleTimeString());
			}
			
			if(type=="show"){
				var talkInfo:NpcTalkInfoBar=new NpcTalkInfoBar();
				talkInfo.setTalk("随便说的话，/a不要在/a意");
//				var img:Bitmap=new Bitmap(talkInfo.bitdata);
//				img.x=talkInfo.offset.x;
//				img.y=talkInfo.offset.y;
				this.addChild(new Bitmap(talkInfo.bitdata));
//				NpcTalkInfoBar.qipao.x=talkInfo.offset.x+400;
//				NpcTalkInfoBar.qipao.y=talkInfo.offset.y+400;
//				this.addChild(new Bitmap(talkInfo.bitdata));
//				this.addChild(NpcTalkInfoBar.qipao);
			}
			
			
			
			if(type=="clear"){
				new ClearOut().startShow(this);
			}
			
			if(type=="story"){
//				StoryManager.instance.startStory(1001,1,this);
			}
			
			
			if(type=="time"){
				var timer:Timer=new Timer(1000,10);
				var time:int=10;
				var timeTick:BattleTimeTick=new BattleTimeTick(this);
				
				var onTimer:Function=function(evt:Event):void{
					time--;
					timeTick.show(time);
				};
				timer.addEventListener(TimerEvent.TIMER,onTimer);
				timer.start();
			}
			
			if(type=="printer"){
				if(caption==null){
					caption=new SceneCaption();
					caption.x=GlobalRef.width/2;
					caption.y=GlobalRef.height/2;
					this.addChild(caption);
				}
//				caption.showDesc("你好，欢迎来到腾讯视频致力于打造中国最大的在线视频媒体平台,以丰富的内容、极致的观看.");
			}
			
			if(type=="text"){
				var mc:WindowUseItem=new WindowUseItem();
				mc.x=GlobalRef.width/2;
				mc.y=GlobalRef.height/2;
				this.addChild(mc);
				var myText:MyRichText=new MyRichText(mc.fnt_desc);
				myText.setText("我了  个擦，/10你哥哥/11  升级wsefsdd的/15身份是否实得分啊实得分违法的吧/220");
//				myText.showTextIndex(10);
				myText.showIndex=23;
			}
			
			if(type=="1"){
				var ss:McStoryMain=new McStoryMain();
				ss.x=GlobalRef.width/2;
				ss.y=GlobalRef.height;
				this.addChild(ss);
				ss.fnt_story1.text="我是东方哦啊是副驾驶的方式的将付老师的军绿色vjxcklvjsd的是否是分手了的风景违法 了实得分";
			}
			
		}
		
		private var caption:SceneCaption;
		
	}
}