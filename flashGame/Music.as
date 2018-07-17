package
{
	import com.fish.modules.preloadMD.models.SystemMD;
	import com.fish.modules.preloadMD.models.XMLLoader_MD;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_sound;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TweenLite;
	
	import flash.utils.Dictionary;
	
	import treefortress.sound.SoundManager;

	public class Music
	{
		/**
		 *  当前播放的音乐
		 */
//		private static var yinyueDic:Dictionary=new Dictionary();
		private static var Manager:SoundManager=new SoundManager();
		
		/**  战斗背景音乐
		 * */
		public static const BattleBackground:String="battle";
		
		/**  冒险音乐
		 * */
		public static const BattleMaoxian:String="maoxian";
		
		/**
		 *   主城音乐
		 */
		public static const MainMusic:String="main";
		
		/**
		 *   副本音乐
		 */
		public static const MC_Fuben:String="fuben";
		
		/**
		 *  战斗音乐
		 */
		public static const FightMusic:String="fight";
		
		/**
		 * loading音乐
		 */
		public static const MC_Loading:String="loading";
		/**
		 * 背景音乐
		 */
		public static const MC_Background:String="bg";
		
		/**
		 * 起名字选卡的音乐
		 */
		public static const MC_Xuanren_Background:String="xuanren";
		/**
		 * 选秀音乐
		 */
		public static const MUSIC_Xuanxiu:String="xuanxiu";
		/**
		 * 活动音乐
		 */
		public static const MUSIC_Huodong:String="huodong";
		/**
		 * 窗口open
		 */
		public static const FX_Window_Open:String="window";
		
		/**
		 *   擂台音效
		 */
		public static const FX_readygo:String="readygo";
		
		/**
		 * 窗口close
		 */
		public static const FX_Window_Close:String="close";
		/**
		 * 获得卡牌
		 */
		public static const FX_Window_GetCard:String="getcard";
		
		/**
		 * 升级
		 */
		public static const FX_Window_LevelUp:String="levelup";
		
		/** 挖矿 **/
		public static const MC_Wakuang:String="mwakuang";
		public static const MC_EnterMining:String="heiping";
		
		
		public static const FX_btnclick:String="btnclick";
		public static const FX_tabclick:String="tabclick";
		
		public static const FX_succseshengxing:String="succseshengxing";
		public static const FX_succseqianghua:String="succseqianghua";
		public static const FX_succsexiangqian:String="succsexiangqian";
		public static const FX_shop:String="shop";
		public static const FX_equip:String="equip";
		
		public static const FX_taskreward:String="taskreward";
		
		public static const FX_ronglianwindow:String="ronglianwindow";
		
		public static const FX_ronglian:String="ronglian";
		
		public static const FX_cunkou:String="cunkou";
		
		/**
		 * 战斗胜利
		 */
		public static const FX_Window_Win:String="win";
		
		/**
		 * 战斗失败
		 */
		public static const FX_Window_Lose:String="lose";
		
		/**
		 * 点击宠幸按钮 
		 */
		public static const FX_ChongXing:String="chongxing";
		/**
		 * 新手引导女仆说话
		 */
//		public static const FX_Nvpu:String="nvpu";
		
		public static var curBackMusic:String;
		
		private static var soudDic:Dictionary=new Dictionary();

		public static function initSound():void
		{			
			Manager.loadSound("assets/music/music_loading.mp3",MC_Loading);
			
			GlobalRef.App_Activate_SN.add(resumeMusic);
			GlobalRef.APP_Deactivate_SN.add(pauseMusic);
		}
		private static var xmlDic:Dictionary=new Dictionary();
		public static function LoadSoundXmlMaterial():void
		{
			for each(var node:Node_sound in XMLDataManager.Node_soundArray){
				xmlDic[node.name]=node;
			}
			
//			return ;
			var soundXmlList:Array=XMLDataManager.Node_soundArray;
			var index:int;
			for(index=0;index<soundXmlList.length;index++)
			{
				var xml:Node_sound=soundXmlList[index];
				Manager.loadSound(xml.sound,xml.name);
				soudDic[xml.name]=xml.sound;
			}
		}
		
		public static function dymicLoadSound(type:String):void{
			if(soudDic[type]==null){
				var xml:Node_sound=xmlDic[type];
				if(xml){
					trace("动态加载音乐： "+type);
					Manager.loadSound(xml.sound,xml.name);
					soudDic[xml.name]=xml.sound;
				}
			}
		}
		
		private static function resumeMusic():void
		{
			
			Manager.resumeAll();
			var music:String=curBackMusic;
			curBackMusic=null;
			if(music){
				play(music);
			}
			
//			Manager.fadeMasterFrom();
		}
		private static function pauseMusic():void
		{
			Manager.pauseAll();
//			Manager.fadeMasterFrom(1,0);
//			TweenLite.delayedCall(1,Manager.pauseAll);
		}
		
		public static function playFX(type:String):void
		{
			try
			{
				if(yinxiaoSwitch)
				{
					if(soudDic[type]==null){
						trace("音乐丢失："+type);
					}
					trace("播放音效："+type);
					if(GlobalRef.activateState){
						dymicLoadSound(type);
						Manager.playFx(type);
					}
					
				}
			}
			catch(e:Error)
			{
				
			}
		}
		/**
		 *  播放音效 （需要关闭背景音乐）
		 */
		public static function playFxDownBackMusic(type:String):void
		{
			try
			{
				if(yinxiaoSwitch)
				{
					if(soudDic[type]==null){
						trace("音乐丢失："+type);
					}
					trace("播放音效："+type);
					if(GlobalRef.activateState){
						dymicLoadSound(type);
						Manager.playFx(type,1.2);
					}
					
				}
			}
			catch(e:Error)
			{
				
			}
		}
		
		
		
		public static function play(type:String,isFade:Boolean=false):void
		{
			trace("Play Music: "+type);
			try
			{
				if(curBackMusic==type){
					return ;
				}
				
				if(curBackMusic) Manager.stop(curBackMusic);
				
				curBackMusic=type;
	//			addToDic(type);
				curBackMusic=type;
				if(yinyueSwitch)
				{
					if(GlobalRef.activateState){
						dymicLoadSound(type);
						Manager.play(type,1,0,int.MAX_VALUE);	
					}
							
				}
			}
			catch(e:Error)
			{
				
			}
//			if(isFade){
//				Manager.fadeFrom(type,0,1,2000,false);
//			}else{
//				Manager.play(type);
//			}
		}
		public static function stop(type:String):void
		{
//			return ;
//			removeFromDic(type);
			try{
				Manager.stop(type);
			}catch(e:Error){
				trace("[E]:\t"+e.message);
			}
			
		}
		
		public static function stopAll():void
		{
			
//			yinyueDic=new Dictionary();
			Manager.stopAll();
		}
		
		public static function stopForExitGame():void
		{
			Manager.stopAll();
		}
		
		/*private static function addToDic(_type:String):void
		{
			yinyueDic[_type]=_type;
		}
		public static function checkAreadyPlay(type:String):Boolean
		{
			if(yinyueDic[type])
			{
				return true;
			}
			return false;
		}*/
		/*private static function removeFromDic(_type:String):void
		{
			if(null!=yinyueDic[_type])
			{
				yinyueDic[_type]=null;
				delete yinyueDic[_type];
			}
		}*/
		private static var yinyueSwitch:Boolean;
		public static function changeYinyueSwitch(_v:Boolean):void
		{
			try
			{
				yinyueSwitch=_v;
				
	//			trace("是否关闭音乐："+yin);
				/*for each(var nameStr:String in yinyueDic)
				{
					if(yinyueSwitch)
					{
						Manager.play(nameStr,1,0,int.MAX_VALUE);
					}
					else
					{
						Manager.stop(nameStr);
					}
				}*/
				if(curBackMusic){
					if(yinyueSwitch){
						dymicLoadSound(curBackMusic);
						Manager.play(curBackMusic,1,0,int.MAX_VALUE);
					}else{
						Manager.stop(curBackMusic);
					}
				}
			}
			catch(e:Error)
			{
				
			}
		}
		private static var yinxiaoSwitch:Boolean;
		public static function changeYinxiaoSwitch(_v:Boolean):void
		{
			yinxiaoSwitch=_v;
		}
		
		
		public static const DIG_Exp:String="sound_exp";
		public static const DIG_Money:String="sound_money";
		public static const Dig_ArriveBoss:String="sound_boss";
		
		public static const DIG_Main:String="main";
		public static const DIG_Fight:String="fight";
		
	}
}