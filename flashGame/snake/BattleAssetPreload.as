package snake
{
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.models.BattleModel;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.LeitaiModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_gun;
	import com.ghostlmm.xmldata.Node_monster_type;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import fl.motion.AdjustColor;
	
	import org.osflash.signals.Signal;
	
	import snake.gameAsset.GameAssetPool;
	import snake.gameEnemys.CharAnimData;
	import snake.gameEnemys.CharSpriteAsset;
	import snake.gameEnemys.ZombieAsset;
	import snake.gameEnemys.ZombieMovieData;
	import snake.guns.GunAsset;
	import snake.guns.GunData;
	
	import util.Dict;
	import util.Util;

	public class BattleAssetPreload
	{
		private var excuteStep:String="none";
		private var excuteTime:int;
		private var maxExcuteCost:int=1;
		private static const loadAssetForZhuchengStepArray:Array=["initCharAnimData","initGunData","createPlayerGunAsset"];
		
		public var loadAssetForZhuchengComplete_SN:Signal=new Signal();
		
		private var assetPool:GameAssetPool;
		public function loadAssetForZhucheng(isContinue:Boolean=false):void{
			var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
			var equipModel:EquipModel=Context.getInjectInstance(EquipModel);
			if(!isContinue){
				excuteTime=getTimer();
			}
			var complete:Boolean=false;
			if(excuteStep=="none"){
				excuteStep="initCharAnimData";
			}
			switch(excuteStep){
				case "initCharAnimData":
					initCharAnimData();
					complete=true;
					break;
				case "initGunData":
					initGunData();
					complete=true;
					break;
//				case "createPlayerAsset":
//					if(playCharAsset==null){
//						createPlayerAsset(heroModel.appearance,heroModel.color);
//						complete=true;
//					}else{
//						complete=true;
//					}
//					break;
				case "createPlayerGunAsset":
					createPlayerGunAsset(equipModel.getBattleCouldUseGunXidArray(),heroModel.appearance,heroModel.color);
					complete=true;
					
					break;
			}
			tempMc=null;
			trace("step: "+excuteStep+"\ttime: "+(getTimer()-excuteTime));
			if(complete){
				clearPoolMCAsset();
				var step:int=loadAssetForZhuchengStepArray.indexOf(excuteStep);
				if(step==loadAssetForZhuchengStepArray.length-1){
					// 全部完成
					excuteStep="none";
					loadAssetForZhuchengComplete_SN.dispatch();
				}else{
					excuteStep=loadAssetForZhuchengStepArray[step+1];
					if(getTimer()-excuteTime<maxExcuteCost){
						loadAssetForZhucheng(true);
					}
				}
				
			}
			tempMc=null;
		}
		private var monsterIds:Array;
		public function setMonsterIds($monsterIds:Array):void{
			monsterIds=$monsterIds;
		}
		private var gunIds:Array;
		public function setGunIds($gunIds:Array):void{
			gunIds=$gunIds;
		}
		public var loadAssetForBattleComplete_SN:Signal=new Signal();
		private static const loadAssetForBattleSteps:Array=["initCharAnimData","initGunData","initZombieData","drawGibletsHuman","createPlayerGunAsset","createOtherPlayerAsset","createOtherPlayerGunAsset","createBloodImpact","createGunBullut","createMonsterAsset","createEnemyGunAsset","createPortalAsset"];
		public function loadAssetForBattle(isContinue:Boolean=false):void{
			var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
			var leitaiModel:LeitaiModel=Context.getInjectInstance(LeitaiModel);
			var equipModel:EquipModel=Context.getInjectInstance(EquipModel);
			if(!isContinue){
				excuteTime=getTimer();
			}
			excuteTime=getTimer();
			var complete:Boolean=false;
			if(excuteStep=="none"){
				excuteStep="initCharAnimData";
			}
			switch(excuteStep){
				case "initCharAnimData":
					initCharAnimData();
					complete=true;
					break;
				case "initGunData":
					initGunData();
					complete=true;
					break;
				case "initZombieData":
					initZombieData();
					complete=true;
					break;
				case "drawGibletsHuman":
					drawGibletsHuman();
					complete=true;
					break;
				case "createPlayerGunAsset":
					if(heroModel && equipModel){
						createPlayerGunAsset(equipModel.getBattleCouldUseGunXidArray(),heroModel.appearance,heroModel.color);
					}
					
					complete=true;					
					break;
				case "createOtherPlayerAsset":
					if(leitaiModel && null!=leitaiModel.cacheLeitaiPerson)
					{
						createEnemyPlayerAsset(leitaiModel.cacheLeitaiPerson.movieFrame,leitaiModel.cacheLeitaiPerson.Colors);
					}
					complete=true;
					break;
				case "createOtherPlayerGunAsset":
					if(leitaiModel && null!=leitaiModel.cacheLeitaiPerson)
					{
						createPlayerGunAsset([leitaiModel.cacheLeitaiPerson.gunId],leitaiModel.cacheLeitaiPerson.movieFrame,leitaiModel.cacheLeitaiPerson.Colors);
					}
					complete=true;					
					break;
				case "createBloodImpact":
					createBloodImpact();
					complete=true;
					break;
				case "createGunBullut":
					createGunBullut();
					complete=true;
					break;
				case "createMonsterAsset":
					createMonsterAsset(monsterIds);
					complete=true;
					break;
				case "createEnemyGunAsset":
					createEnemyGunAsset(gunIds);
					complete=true;
					break;
				case "createPortalAsset":
					createPortalAsset();
					complete=true;
					break;
			}
			
			tempMc=null;
			
			 
			trace("step: "+excuteStep+"\ttime: "+(getTimer()-excuteTime));
			if(complete){
				clearPoolMCAsset();
				var step:int=loadAssetForBattleSteps.indexOf(excuteStep);
				if(step==loadAssetForBattleSteps.length-1){
					// 全部完成
					excuteStep="none";
					loadAssetForBattleComplete_SN.dispatch();
				}else{
					excuteStep=loadAssetForBattleSteps[step+1];
//					if(getTimer()-excuteTime<maxExcuteCost){
//						loadAssetForBattle(true);
//					}
				}
				
			}
//			drawGibletsHuman();
//			createBloodImpact();
//			createGunBullut();
//			createMonsterAsset(monsterIds);
//			createEnemyGunAsset(monsterIds);
//			createPortalAsset();
		}
		
		
		
		//  中间值
		public static var a:int;
		public static var b:int;
		public static var c:int;
		public static var d:int;
		public static var e:int;
		public static var tempMc:MovieClip;
		public static var trans:Matrix=new Matrix();
		public static var rect:Rectangle=new Rectangle();
		public static var tempPoint:Point=new Point();
		public static var tileOn:int;
		
		public var levelColorFilter:AdjustColor;
		public var gunDataVect:Dict;
		
		private static var _instance:BattleAssetPreload;
		public static function getInstance():BattleAssetPreload{
			if(_instance==null){
				_instance=new BattleAssetPreload();
			}
			return _instance;
		}
		public function BattleAssetPreload()
		{
			if(_instance) throw new Error("BattleAssetPreload 重复初始化");
			assetPool=new GameAssetPool();
		}
		
		public var charAnimDataVect:Vector.<CharAnimData>;
		public var maxFrames:Array;
		// 第一步 加载 动画数据
//		private function loadMovieData():void{
//			initCharAnimData();
//			initGunData();
//		}
		
		private function clearPoolMCAsset():void{
			assetPool.clearPoolMCAsset();
		}
		public  function initCharAnimData():Vector.<CharAnimData>{
			if(charAnimDataVect!=null) return charAnimDataVect;
			maxFrames=[];
			maxFrames.push(0);
			charAnimDataVect=new Vector.<CharAnimData>();
			var charAnim_headRot:Array = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
			var charAnim_hasHands:Array = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1);
			tempMc = new character_animation_container();
			charAnimDataVect.push(new CharAnimData());
			a = 1;
			while (a < (tempMc.totalFrames + 1))
			{
				tempMc.gotoAndStop(a);
				maxFrames.push((tempMc.c.totalFrames - 1));
				var charData:CharAnimData=new CharAnimData();
				charAnimDataVect.push(charData);
				charData.hasHands=charAnim_hasHands[a];
				charData.headRot=charAnim_headRot[a];
				
				//				maxFrames.push((tempMc.c.totalFrames - 1));
				charData.maxFrames=(tempMc.c.totalFrames - 1);
				b = 1;
				while (b < (tempMc.c.totalFrames + 1))
				{
					
					tempMc.c.gotoAndStop(b);
					charData.head_x.push(tempMc.c.head.x);
					charData.head_y.push(tempMc.c.head.y);
					if (charAnim_headRot[a] == 1)
					{
						charData.head_r.push(int(tempMc.c.head.rotation / (180 / Math.PI) * 1000) / 1000);
					}
					charData.body_x.push(tempMc.c.body.x);
					charData.body_y.push(tempMc.c.body.y);
					charData.body_r.push(int(tempMc.c.body.rotation / (180 / Math.PI) * 1000) / 1000);
					charData.foot1_x.push(tempMc.c.foot1.x);
					charData.foot1_y.push(tempMc.c.foot1.y);
					charData.foot1_r.push(int(tempMc.c.foot1.rotation / (180 / Math.PI) * 1000) / 1000);
					charData.foot2_x.push(tempMc.c.foot2.x);
					charData.foot2_y.push(tempMc.c.foot2.y);
					charData.foot2_r.push(int(tempMc.c.foot2.rotation / (180 / Math.PI) * 1000) / 1000);
					charData.ankle1_x.push(tempMc.c.ankle1.x);
					charData.ankle1_y.push(tempMc.c.ankle1.y);
					charData.ankle1_r.push(int(tempMc.c.ankle1.rotation / (180 / Math.PI) * 1000) / 1000);
					charData.ankle2_x.push(tempMc.c.ankle2.x);
					charData.ankle2_y.push(tempMc.c.ankle2.y);
					charData.ankle2_r.push(int(tempMc.c.ankle2.rotation / (180 / Math.PI) * 1000) / 1000);
					if (charAnim_hasHands[a] == 1)
					{
						if(tempMc.c.hand1==null){
							trace("no define hand："+b);
						}
						charData.hand1_x.push(tempMc.c.hand1.x);
						charData.hand1_y.push(tempMc.c.hand1.y);
						charData.hand1_r.push(int(tempMc.c.hand1.rotation / (180 / Math.PI) * 1000) / 1000);
						charData.hand2_x.push(tempMc.c.hand2.x);
						charData.hand2_y.push(tempMc.c.hand2.y);
						charData.hand2_r.push(int(tempMc.c.hand2.rotation / (180 / Math.PI) * 1000) / 1000);
					}
					
					b  ++ ;
					
				}
				a  ++ ;
			}
			maxFrames[7]=40;
			return charAnimDataVect;
		}
		
	
		
		public  function initGunData():Dict{
			if(gunDataVect!=null) return gunDataVect;
			gunDataVect=new Dict();
			var gunNode:Node_gun;
			var gunId:int;
			var gunXmlList:Array=XMLDataManager.Node_gunArray;
			for each(gunNode in gunXmlList){
				var data:GunData=new GunData;
				gunDataVect[gunNode.id]=data;			
				
				data.gun_dist=gunNode.gun_dist;
				data.gun_coolDown=gunNode.gun_coolDown;
				data.gun_auto=gunNode.gun_auto;
				data.gun_casingType=gunNode.gun_casingType;
				data.gun_bulletType=gunNode.gun_bulletType;
				data.gun_isIncindiary=gunNode.gun_isIncindiary;
				data.gun_frameToEjectShellOn=gunNode.gun_frameToEjectShellOn;
				data.gun_names=gunNode.gun_names;
				data.gun_sfx=gunNode.gun_sfx;
				data.gun_mag_size=gunNode.gun_mag_size;
				data.gun_ammo=gunNode.gun_ammo;
				data.gun_total_ammo=gunNode.gun_total_ammo;
				data.gun_reload_time=gunNode.gun_reload_time;
				data.gun_recoil_x=gunNode.gun_recoil_x;
				data.gun_recoil_rot=gunNode.gun_recoil_rot;
				data.gun_recoil_dampening=gunNode.gun_recoil_dampening;
				data.gun_recoil_xRecover=gunNode.gun_recoil_xRecover;
				data.gun_hasReloadAnim=gunNode.gun_hasReloadAnim;
				data.gun_magDropFrame=gunNode.gun_magDropFrame;
				data.gun_magType=gunNode.gun_magType;
				
				b=gunNode.gun_appearence;
				if( b==0) data.gunFrames = new Array(0, 4, 4, 3, 2, 1);
				if( b==1) data.gunFrames = new Array(0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 4, 4, 4, 3, 2, 1);
				if( b==2) data.gunFrames = new Array(0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 4, 3, 2, 1);
				if( b==3) data.gunFrames = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 5, 7, 7, 7, 7, 7, 7, 7, 6, 5, 4, 3, 2, 1);
				if( b==4) data.gunFrames = new Array(0, 3, 2, 1);
				if( b==5) data.gunFrames = new Array(0, 3, 2, 1);
				if( b==6) data.gunFrames = new Array(0, 4, 3, 2, 1);
				if( b==7) data.gunFrames = new Array(0, 4, 3, 2, 1);
				if( b==8) data.gunFrames = new Array(0, 0, 0);
				if( b==9) data.gunFrames = new Array(0, 0, 0);
				if( b==10) data.gunFrames = new Array(0, 0, 0);
				if( b==11) data.gunFrames = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 3);
				if( b==12) data.gunFrames = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8);
				if( b==13) data.gunFrames = new Array(0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5);
				if( b==14) data.gunFrames = new Array(0, 0, 0, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5);
				if( b==15) data.gunFrames = new Array(0, 0, 0);
				if( b==16) data.gunFrames = new Array(0, 1, 1);
				if( b==17) data.gunFrames = new Array(0, 3, 2, 1);
				if( b==18) data.gunFrames = new Array(0, 3, 2, 1);
				if( b==19) 
					data.gunFrames = new Array(0, 0, 0);
				if( b==20) data.gunFrames = new Array(0, 0, 0);
				
				tempMc=new (ApplicationDomain.currentDomain.getDefinition("gun"+b) as Class)();
				
				data.gunShoulder_x = (-tempMc.pivot.x);
				data.gunShoulder_y = (-tempMc.pivot.y);
				data.gun_barrel_x = (tempMc.barrel.x - tempMc.pivot.x);
				data.gun_barrel_y = (tempMc.barrel.y - tempMc.pivot.y);
				data.gun_eject_x = (tempMc.eject.x - tempMc.pivot.x);
				data.gun_eject_y = (tempMc.eject.y - tempMc.pivot.y);
				
				Util.stopAllMovie(tempMc);
				tempMc=null;
				
			}
			
			return gunDataVect;
		}
		
		public var zombieMovieDataVect:Vector.<ZombieMovieData>;
//		public static var zombieAssetVect:Vector.<ZombieAsset>;
		private function initZombieData():void{
			if(zombieMovieDataVect==null){
				zombieMovieDataVect=new Vector.<ZombieMovieData>();
				//			zombieAssetVect=new Vector.<ZombieAsset>();
				tempMc = new zombie_animation_container();
				zombieMovieDataVect.push(new ZombieMovieData());
				a = 1;
				while (a < (tempMc.totalFrames + 1))
				{
					var zombieData:ZombieMovieData=new ZombieMovieData();
					zombieMovieDataVect.push(zombieData);
					tempMc.gotoAndStop(a);
					zombieData.zombie_maxFrames=((tempMc.c.totalFrames - 1));
					b = 1;
					while (b < (tempMc.c.totalFrames + 1))
					{
						
						tempMc.c.gotoAndStop(b);
						zombieData.head_x.push(tempMc.c.head.x);
						zombieData.head_y.push(tempMc.c.head.y);
						zombieData.head_r.push(int(tempMc.c.head.rotation / (180 / Math.PI) * 1000) / 1000);
						zombieData.body_x.push(tempMc.c.body.x);
						zombieData.body_y.push(tempMc.c.body.y);
						zombieData.body_r.push(int(tempMc.c.body.rotation / (180 / Math.PI) * 1000) / 1000);
						zombieData.foot1_x.push(tempMc.c.foot1.x);
						zombieData.foot1_y.push(tempMc.c.foot1.y);
						zombieData.foot1_r.push(int(tempMc.c.foot1.rotation / (180 / Math.PI) * 1000) / 1000);
						zombieData.foot2_x.push(tempMc.c.foot2.x);
						zombieData.foot2_y.push(tempMc.c.foot2.y);
						zombieData.foot2_r.push(int(tempMc.c.foot2.rotation / (180 / Math.PI) * 1000) / 1000);
						zombieData.ankle1_x.push(tempMc.c.ankle1.x);
						zombieData.ankle1_y.push(tempMc.c.ankle1.y);
						zombieData.ankle1_r.push(int(tempMc.c.ankle1.rotation / (180 / Math.PI) * 1000) / 1000);
						zombieData.ankle2_x.push(tempMc.c.ankle2.x);
						zombieData.ankle2_y.push(tempMc.c.ankle2.y);
						zombieData.ankle2_r.push(int(tempMc.c.ankle2.rotation / (180 / Math.PI) * 1000) / 1000);
						zombieData.hand1_x.push(tempMc.c.hand1.x);
						zombieData.hand1_y.push(tempMc.c.hand1.y);
						zombieData.hand1_r.push(int(tempMc.c.hand1.rotation / (180 / Math.PI) * 1000) / 1000);
						zombieData.hand2_x.push(tempMc.c.hand2.x);
						zombieData.hand2_y.push(tempMc.c.hand2.y);
						zombieData.hand2_r.push(int(tempMc.c.hand2.rotation / (180 / Math.PI) * 1000) / 1000);
						b  ++ ;
					}
					a  ++ ;
				}
			}
			
		}
		
		
		public var giblets_human_sprites:Vector.<Sprite>;
		
		public var giblets_bm:BitmapData;
		public var giblet_height:Array;
		public var giblet_posX:Array;
		public var giblet_posY:Array;
		public var giblets_small_bm:BitmapData;
		
		
		/**
		 *   生成人物尸体 动画， 只会在战斗场景中出现
		 */
		private function drawGibletsHuman():void{
			if(giblets_human_sprites!=null) return ;
			// 人物内脏 
			giblets_human_sprites=new Vector.<Sprite>();
			tempMc = new giblets_human_mc();
			tempMc.filters = [new ColorMatrixFilter(levelColorFilter.CalculateFinalFlatArray())];
			giblets_bm = new BitmapData(tempMc.width, tempMc.height, true, 0);
			giblet_height = [];
			giblet_posX = [0, 0, 0, 0, 0, -10, -10, 10, 0];
			giblet_posY = [0, 0, 0, 0, 0, -15, 15, -5, 0];
			a = 0;
			while (a < tempMc.totalFrames)
			{
				
				tempMc.gotoAndStop((a + 1));
				giblet_height.push(tempMc.pivot.y);
				trans = new Matrix();
				giblets_bm = new BitmapData(tempMc.width, tempMc.height, true, 0);
				giblets_bm.draw(tempMc, trans, null, null, null, false);
				trans.translate(-tempMc.pivot.x, -tempMc.pivot.y);
				var sp:Sprite=new Sprite();
				sp.graphics.clear();
				sp.graphics.beginBitmapFill(giblets_bm, trans, false, true);
				sp.graphics.drawRect(-tempMc.pivot.x, -tempMc.pivot.y, tempMc.width, tempMc.height);
				giblets_human_sprites.push(sp);
				a  ++ ;
				
			}
			tempMc = new giblets_small_mc();
			tempMc.filters = [new ColorMatrixFilter(levelColorFilter.CalculateFinalFlatArray())];
			giblets_small_bm = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
			a = 0;
			while (a < tempMc.totalFrames)
			{
				
				tempMc.gotoAndStop((a + 1));
				trans.tx = a * 10;
				trans.ty = 0;
				giblets_small_bm.draw(tempMc, trans);
				
				a  ++ ;
				
			}
		}
		public function disposeGibletsHuman():void{
			if(giblets_bm) {giblets_bm.dispose();giblets_bm=null;}
			giblets_human_sprites=null;
			if(giblets_small_bm) {giblets_small_bm.dispose();giblets_small_bm=null;}
		}
		
		
		public var gun_blood_impact_bm1:BitmapData;
		public var gun_blood_impact_bm2:BitmapData;
		public var gun_blood_impact3_fr0:Sprite;
		public var gun_blood_impact3_fr1:Sprite;
		public var gun_blood_impact3_fr2:Sprite;
		public var gun_blood_impact3_fr3:Sprite;
		public var gun_blood_impact3_fr4:Sprite;
		public var gun_blood_impact3_fr5:Sprite;
		public var gun_blood_impact3_fr6:Sprite;
		public var gun_blood_impact3_fr7:Sprite;
		public var gun_blood_impact3_fr8:Sprite;
		public var gun_blood_impact3_fr9:Sprite;
		public var gun_blood_impact3_fr10:Sprite;
		public var gun_blood_impact3_fr11:Sprite;
		public var gun_blood_impact3_fr12:Sprite;
		public var gun_blood_impact3_fr13:Sprite;
		public var gun_blood_impact3_fr14:Sprite;
		public var gun_blood_impact_bm3:BitmapData;
		public var gun_blood_impact4_fr0:Sprite;
		public var gun_blood_impact4_fr1:Sprite;
		public var gun_blood_impact4_fr2:Sprite;
		public var gun_blood_impact4_fr3:Sprite;
		public var gun_blood_impact4_fr4:Sprite;
		public var gun_blood_impact4_fr5:Sprite;
		public var gun_blood_impact4_fr6:Sprite;
		public var gun_blood_impact4_fr7:Sprite;
		public var gun_blood_impact4_fr8:Sprite;
		public var gun_blood_impact_bm4:BitmapData;
		public var gun_blood_impact_bm5:BitmapData;
		public var gun_blood_impact_bm6:BitmapData;
		
		public var bloodSplatters:Vector.<Sprite>;
		public var tempBloodSplatter_bm:BitmapData;
		public var tempBloodSplatter_erase:BitmapData;
		public var blood_drop:BitmapData;
		
		/** 生成 流血效果 动画 **/
		public function createBloodImpact():void{
			if(PictureQuality.DrawBlood){
				if(gun_blood_impact_bm1==null){
					tempMc = new gun_blood_impact1();
					tempMc.filters = [new ColorMatrixFilter(levelColorFilter.CalculateFinalFlatArray())];
					gun_blood_impact_bm1 = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
					a = 0;
					while (a < tempMc.totalFrames)
					{
						
						tempMc.gotoAndStop((a + 1));
						trans.tx = a * tempMc.width;
						trans.ty = 0;
						gun_blood_impact_bm1.draw(tempMc, trans);
						
						a  ++ ;
						
					}
					tempMc = new gun_blood_impact2();
					tempMc.filters = [new ColorMatrixFilter(levelColorFilter.CalculateFinalFlatArray())];
					gun_blood_impact_bm2 = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
					a = 0;
					while (a < tempMc.totalFrames)
					{
						
						tempMc.gotoAndStop((a + 1));
						trans.tx = a * tempMc.width;
						trans.ty = 0;
						gun_blood_impact_bm2.draw(tempMc, trans);
						
						a  ++ ;
						
					}
					tempMc = new gun_blood_impact3();
					tempMc.filters = [new ColorMatrixFilter(levelColorFilter.CalculateFinalFlatArray())];
					gun_blood_impact3_fr0 = new Sprite();
					gun_blood_impact3_fr1 = new Sprite();
					gun_blood_impact3_fr2 = new Sprite();
					gun_blood_impact3_fr3 = new Sprite();
					gun_blood_impact3_fr4 = new Sprite();
					gun_blood_impact3_fr5 = new Sprite();
					gun_blood_impact3_fr6 = new Sprite();
					gun_blood_impact3_fr7 = new Sprite();
					gun_blood_impact3_fr8 = new Sprite();
					gun_blood_impact3_fr9 = new Sprite();
					gun_blood_impact3_fr10 = new Sprite();
					gun_blood_impact3_fr11 = new Sprite();
					gun_blood_impact3_fr12 = new Sprite();
					gun_blood_impact3_fr13 = new Sprite();
					gun_blood_impact3_fr14 = new Sprite();
					gun_blood_impact_bm3 = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
					a = 0;
					while (a < tempMc.totalFrames)
					{
						
						tempMc.gotoAndStop((a + 1));
						trans = new Matrix();
						gun_blood_impact_bm3 = new BitmapData(tempMc.width, tempMc.height, true, 0);
						gun_blood_impact_bm3.draw(tempMc, trans, null, null, null, false);
						trans.translate(-tempMc.pivot.x, -tempMc.pivot.y);
						this["gun_blood_impact3_fr" + a].graphics.clear();
						this["gun_blood_impact3_fr" + a].graphics.beginBitmapFill(gun_blood_impact_bm3, trans, false, true);
						this["gun_blood_impact3_fr" + a].graphics.drawRect(-tempMc.pivot.x, -tempMc.pivot.y, tempMc.width, tempMc.height);
						
						a  ++ ;
						
					}
					tempMc = new gun_blood_impact4();
					tempMc.filters = [new ColorMatrixFilter(levelColorFilter.CalculateFinalFlatArray())];
					gun_blood_impact4_fr0 = new Sprite();
					gun_blood_impact4_fr1 = new Sprite();
					gun_blood_impact4_fr2 = new Sprite();
					gun_blood_impact4_fr3 = new Sprite();
					gun_blood_impact4_fr4 = new Sprite();
					gun_blood_impact4_fr5 = new Sprite();
					gun_blood_impact4_fr6 = new Sprite();
					gun_blood_impact4_fr7 = new Sprite();
					gun_blood_impact4_fr8 = new Sprite();
					gun_blood_impact_bm4 = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
					a = 0;
					while (a < tempMc.totalFrames)
					{
						
						tempMc.gotoAndStop((a + 1));
						trans = new Matrix();
						gun_blood_impact_bm4 = new BitmapData(tempMc.width, tempMc.height, true, 0);
						gun_blood_impact_bm4.draw(tempMc, trans, null, null, null, false);
						trans.translate(-tempMc.pivot.x, -tempMc.pivot.y);
						this["gun_blood_impact4_fr" + a].graphics.clear();
						this["gun_blood_impact4_fr" + a].graphics.beginBitmapFill(gun_blood_impact_bm4, trans, false, true);
						this["gun_blood_impact4_fr" + a].graphics.drawRect(-tempMc.pivot.x, -tempMc.pivot.y, tempMc.width, tempMc.height);
						
						a  ++ ;
						
					}
					tempMc = new gun_blood_impact5();
					tempMc.filters = [new ColorMatrixFilter(levelColorFilter.CalculateFinalFlatArray())];
					gun_blood_impact_bm5 = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
					a = 0;
					while (a < tempMc.totalFrames)
					{
						
						tempMc.gotoAndStop((a + 1));
						trans.tx = a * tempMc.width;
						trans.ty = 0;
						gun_blood_impact_bm5.draw(tempMc, trans);
						
						a  ++ ;
						
					}
					tempMc = new gun_blood_impact6();
					tempMc.filters = [new ColorMatrixFilter(levelColorFilter.CalculateFinalFlatArray())];
					gun_blood_impact_bm6 = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
					a = 0;
					while (a < tempMc.totalFrames)
					{
						
						tempMc.gotoAndStop((a + 1));
						trans.tx = a * tempMc.width;
						trans.ty = 0;
						gun_blood_impact_bm6.draw(tempMc, trans);
						
						a  ++ ;
					}
				}
			}
			if(PictureQuality.DrawBlood_Bg){
				if(bloodSplatters==null){
					bloodSplatters=new Vector.<Sprite>();
					
					
					tempMc = new blood_mc();
					trace("实例化 blood_mc");
					var blood_bm:BitmapData = new BitmapData(tempMc.width, tempMc.height, true, 0);
					var bloodColorFilter:AdjustColor = new AdjustColor();
					bloodColorFilter.brightness = 0;
					bloodColorFilter.contrast = 0;
					bloodColorFilter.saturation = 20;
					bloodColorFilter.hue = 0;
					var bloodHueList:Array = [-180, -130, -80, 30, 130, -50, 160, 60];
					a = 0;
					while (a < 8)
					{
						
						tempMc.gotoAndStop((a + 1));
						
						//				if (levelToLoad == 12)
						//				{
						//					tempMc.filters = [new ColorMatrixFilter(bloodColorFilter.CalculateFinalFlatArray())];
						//					bloodColorFilter.hue = bloodHueList[a];
						//				}
						
						blood_bm = new BitmapData(tempMc.width, tempMc.height, true, 0);
						trans = new Matrix();
						trans.tx = 0;
						trans.ty = 0;
						blood_bm.draw(tempMc, trans);
						trans.tx = (-tempMc.width) * 0.5;
						trans.ty = (-tempMc.height) * 0.5;
						var sp:Sprite=new Sprite();
						sp.graphics.clear();
						sp.graphics.beginBitmapFill(blood_bm, trans, false, false);
						sp.graphics.drawRect(trans.tx, trans.ty, blood_bm.width, blood_bm.height);
						bloodSplatters.push(sp);
						
						a  ++ ;
						
					}
					tempBloodSplatter_bm = new BitmapData(200, 200, true, 16777215);
					tempBloodSplatter_erase = new BitmapData(50, 50, true, 16777215);
					tempMc = new blood_drop_mc();
					blood_drop = new BitmapData(tempMc.width, tempMc.height, true, 0);
					blood_drop.draw(tempMc);
				}
			}
		}
		
		public function disposeBlood():void
		{
			if(gun_blood_impact_bm1) {gun_blood_impact_bm1.dispose();gun_blood_impact_bm1=null;}
			if(gun_blood_impact_bm2) {gun_blood_impact_bm2.dispose();gun_blood_impact_bm2=null;}
			gun_blood_impact3_fr0=null;
			gun_blood_impact3_fr1=null;
			gun_blood_impact3_fr2=null;
			gun_blood_impact3_fr3=null;
			gun_blood_impact3_fr4=null;
			gun_blood_impact3_fr5=null;
			gun_blood_impact3_fr6=null;
			gun_blood_impact3_fr7=null;
			gun_blood_impact3_fr8=null;
			gun_blood_impact3_fr9=null;
			gun_blood_impact3_fr10=null;
			gun_blood_impact3_fr11=null;
			gun_blood_impact3_fr12=null;
			gun_blood_impact3_fr13=null;
			gun_blood_impact3_fr14=null;
			if(gun_blood_impact_bm3) {gun_blood_impact_bm3.dispose();gun_blood_impact_bm3=null;}
			gun_blood_impact4_fr0=null;
			gun_blood_impact4_fr1=null;
			gun_blood_impact4_fr2=null;
			gun_blood_impact4_fr3=null;
			gun_blood_impact4_fr4=null;
			gun_blood_impact4_fr5=null;
			gun_blood_impact4_fr6=null;
			gun_blood_impact4_fr7=null;
			gun_blood_impact4_fr8=null;
			if(gun_blood_impact_bm4) {gun_blood_impact_bm3.dispose();gun_blood_impact_bm3=null;};
			if(gun_blood_impact_bm5) {gun_blood_impact_bm3.dispose();gun_blood_impact_bm3=null;};
			if(gun_blood_impact_bm6) {gun_blood_impact_bm3.dispose();gun_blood_impact_bm3=null;};
		}
		
		
		/** 枪 弹壳位图数据**/
		public var gun_casing_bits:Vector.<BitmapData>;
		/** 枪 壳 位图宽度**/
		public var gunCasingWidth:Vector.<Number>;
		
		/** 枪口火焰 **/
		public var gun_flash:Vector.<Sprite>;
		
		public var smokeWidth:int;
		public var gun_flash_smoke_bm:BitmapData;
		
		public var boolitWidth:int;
		public var gun_boolit:BitmapData;
		public var gun_rocket:Sprite;
		public var rocket_bm:BitmapData;
		public var gun_acidBomb:BitmapData;
		public var gun_acidBomb_drip:BitmapData;
		public var airsoftPellet:BitmapData;
		public var gun_blackhole_bm:BitmapData;
		public var gun_blackhole_fx_bm:BitmapData;
		public var gaussTrail:MovieClip;
		public var gun_incindary_impact_bm:BitmapData;
		
		public var explosion:BitmapData;
		/** 子弹撞击墙的火花 **/
		public var spark_bm:BitmapData;
		public var collectStar_yellow_bm:BitmapData;
		public var collectStar_red_bm:BitmapData;
		public var collectStar_blue_bm:BitmapData;
		public var collectStar_white_bm:BitmapData;
		/** 创建子弹 **/
		public function createGunBullut():void
		{
			if(gun_casing_bits==null){
				gun_casing_bits=new Vector.<BitmapData>();
				gunCasingWidth=new Vector.<Number>();
				var casingFrames:int = 16;
				
				var bit:BitmapData;
				
				tempMc = new gun_casing();
				tempMc.filters = [new ColorMatrixFilter(levelColorFilter.CalculateFinalFlatArray())];
				
				var trans:Matrix = new Matrix();
				
				tempMc.gotoAndStop(1);
				bit = new BitmapData(tempMc.width * casingFrames, tempMc.height, true, 0);
				gun_casing_bits.push(bit);
				gunCasingWidth.push(tempMc.width);
				b = 0;
				while (b < casingFrames)
				{
					
					tempMc.gotoAndStop(b);
					trans.tx = b * tempMc.width;
					bit.draw(tempMc, trans);
					
					b  ++ ;
					
				}
				tempMc.gotoAndStop(18);
				bit = new BitmapData(tempMc.width * casingFrames, tempMc.height, true, 0);
				gun_casing_bits.push(bit);
				gunCasingWidth.push(tempMc.width);
				b = 0;
				while (b < casingFrames)
				{
					
					tempMc.gotoAndStop(18 + b);
					trans.tx = b * tempMc.width;
					bit.draw(tempMc, trans);
					
					b  ++ ;
					
				}
				tempMc.gotoAndStop(35);
				bit = new BitmapData(tempMc.width * casingFrames, tempMc.height, true, 0);
				gun_casing_bits.push(bit);
				gunCasingWidth.push(tempMc.width);
				b = 0;
				while (b < casingFrames)
				{
					
					tempMc.gotoAndStop(35 + b);
					trans.tx = b * tempMc.width;
					bit.draw(tempMc, trans);
					
					b  ++ ;
					
				}
				tempMc.gotoAndStop(52);
				bit = new BitmapData(tempMc.width * casingFrames, tempMc.height, true, 0);
				gun_casing_bits.push(bit);
				gunCasingWidth.push(tempMc.width);
				b = 0;
				while (b < casingFrames)
				{
					
					tempMc.gotoAndStop(52 + b);
					trans.tx = b * tempMc.width;
					bit.draw(tempMc, trans);
					
					b  ++ ;
					
				}
				tempMc.gotoAndStop(69);
				bit = new BitmapData(tempMc.width * casingFrames, tempMc.height, true, 0);
				gun_casing_bits.push(bit);
				gunCasingWidth.push(tempMc.width);
				b = 0;
				while (b < casingFrames)
				{
					
					tempMc.gotoAndStop(69 + b);
					trans.tx = b * tempMc.width;
					bit.draw(tempMc, trans);
					
					b  ++ ;
					
				}
				tempMc.gotoAndStop(86);
				bit = new BitmapData(tempMc.width * casingFrames, tempMc.height, true, 0);
				gun_casing_bits.push(bit);
				gunCasingWidth.push(tempMc.width);
				b = 0;
				while (b < casingFrames)
				{
					
					tempMc.gotoAndStop(86 + b);
					trans.tx = b * tempMc.width;
					bit.draw(tempMc, trans);
					
					b  ++ ;
					
				}
				tempMc.gotoAndStop(103);
				bit = new BitmapData(tempMc.width * casingFrames, tempMc.height, true, 0);
				gun_casing_bits.push(bit);
				gunCasingWidth.push(tempMc.width);
				b = 0;
				while (b < casingFrames)
				{
					
					tempMc.gotoAndStop(103 + b);
					trans.tx = b * tempMc.width;
					bit.draw(tempMc, trans);
					
					b  ++ ;
					
				}
				tempMc.gotoAndStop(121);
				bit = new BitmapData(tempMc.width * casingFrames, tempMc.height, true, 0);
				gun_casing_bits.push(bit);
				gunCasingWidth.push(tempMc.width);
				b = 0;
				while (b < casingFrames)
				{
					
					tempMc.gotoAndStop(121 + b);
					trans.tx = b * tempMc.width;
					bit.draw(tempMc, trans);
					
					b  ++ ;
					
				}
				tempMc.gotoAndStop(137);
				bit = new BitmapData(tempMc.width * casingFrames, tempMc.height, true, 0);
				gun_casing_bits.push(bit);
				gunCasingWidth.push(tempMc.width);
				b = 0;
				while (b < casingFrames)
				{
					
					tempMc.gotoAndStop(137 + b);
					trans.tx = b * tempMc.width;
					bit.draw(tempMc, trans);
					
					b  ++ ;
					
				}
				
				gun_flash=new Vector.<Sprite>();
				tempMc = new gun_flash_mc();
				gun_flash_bm = new BitmapData(1, 1, true, 0);
				a = 0;
				while (a < 5)
				{
					
					tempMc.gotoAndStop((a + 1));
					trans = new Matrix();
					var gun_flash_bm:BitmapData = new BitmapData(tempMc.width, tempMc.height, true, 0);
					gun_flash_bm.draw(tempMc, trans, null, null, null, true);
					trans.translate(-tempMc.pivot.x, -tempMc.pivot.y);
					var gunSp:Sprite=new Sprite();
					gunSp.graphics.clear();
					gunSp.graphics.beginBitmapFill(gun_flash_bm, trans, false, true);
					gunSp.graphics.drawRect(-tempMc.pivot.x, -tempMc.pivot.y, tempMc.width, tempMc.height);
					gun_flash.push(gunSp);
					a  ++ ;
				}
				
				tempMc = new gun_flash_smoke();
				smokeWidth = tempMc.width;
				gun_flash_smoke_bm = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
				a = 0;
				while (a < tempMc.totalFrames)
				{
					
					tempMc.gotoAndStop((a + 1));
					trans.tx = a * smokeWidth;
					trans.ty = 0;
					gun_flash_smoke_bm.draw(tempMc, trans);
					
					a  ++ ;
					
				}
				
				tempMc = new gun_boolit_mc();
				boolitWidth = tempMc.width;
				gun_boolit = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
				a = 0;
				while (a < tempMc.totalFrames)
				{
					
					tempMc.gotoAndStop((a + 1));
					trans.tx = a * boolitWidth;
					trans.ty = 0;
					gun_boolit.draw(tempMc, trans);
					
					a  ++ ;
					
				}
				tempMc = new gun_rocket_mc();
				gun_rocket = new Sprite();
				trans = new Matrix();
				rocket_bm = new BitmapData(tempMc.width, tempMc.height, true, 0);
				rocket_bm.draw(tempMc, trans, null, null, null, false);
				trans.translate(-tempMc.pivot.x, -tempMc.pivot.y);
				gun_rocket.graphics.clear();
				gun_rocket.graphics.beginBitmapFill(rocket_bm, trans, false, true);
				gun_rocket.graphics.drawRect(-tempMc.pivot.x, -tempMc.pivot.y, tempMc.width, tempMc.height);
				tempMc = new gun_acidBomb_mc();
				gun_acidBomb = new BitmapData(tempMc.width, tempMc.height, true, 0);
				gun_acidBomb.draw(tempMc);
				tempMc = new gun_acidBomb_drip_mc();
				gun_acidBomb_drip = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
				a = 0;
				while (a < tempMc.totalFrames)
				{
					
					tempMc.gotoAndStop((a + 1));
					trans.tx = a * tempMc.width;
					trans.ty = 0;
					gun_acidBomb_drip.draw(tempMc, trans);
					
					a  ++ ;
					
				}
				tempMc = new gun_airsoftPellet_mc();
				airsoftPellet = new BitmapData(tempMc.width, tempMc.height, true, 0);
				airsoftPellet.draw(tempMc);
				tempMc = new gun_blackhole_mc();
				gun_blackhole_bm = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
				a = 0;
				while (a < tempMc.totalFrames)
				{
					
					tempMc.gotoAndStop((a + 1));
					tempMc.lightning.gotoAndStop((a + 1));
					trans.tx = a * 40;
					trans.ty = 0;
					gun_blackhole_bm.draw(tempMc, trans);
					
					a  ++ ;
					
				}
				tempMc = new gun_blackhole_fx();
				gun_blackhole_fx_bm = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
				a = 0;
				while (a < tempMc.totalFrames)
				{
					
					tempMc.gotoAndStop((a + 1));
					tempMc.fx.gotoAndStop((a + 1));
					trans.tx = a * tempMc.width;
					trans.ty = 0;
					gun_blackhole_fx_bm.draw(tempMc, trans);
					
					a  ++ ;
					
				}
				gaussTrail = new gun_gaussTrail();
				tempMc = new gun_incindary_impact();
				gun_incindary_impact_bm = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
				a = 0;
				while (a < tempMc.totalFrames)
				{
					
					tempMc.gotoAndStop((a + 1));
					trans.tx = a * 65;
					trans.ty = 0;
					gun_incindary_impact_bm.draw(tempMc, trans);
					
					a  ++ ;
					
				}
				
				tempMc = new explosion_large();
				explosion = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
				a = 0;
				while (a < tempMc.totalFrames)
				{
					
					tempMc.gotoAndStop((a + 1));
					tempMc.s.gotoAndStop((a + 1));
					trans.tx = a * tempMc.width;
					trans.ty = 0;
					explosion.draw(tempMc, trans);
					
					a  ++ ;
					
				}
				
				tempMc = new gun_sparks_mc();
				spark_bm = new BitmapData(12 * 15, 12, true, 0);
				a = 0;
				while (a < 15)
				{
					
					trans.tx = 12 * a;
					trans.ty = 0;
					tempMc.gotoAndStop((a + 1));
					spark_bm.draw(tempMc, trans);
					
					a  ++ ;
					
				}
				
				tempMc = new collectStar_yellow_mc();
				collectStar_yellow_bm = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
				a = 0;
				while (a < tempMc.totalFrames)
				{
					
					tempMc.gotoAndStop((a + 1));
					trans.tx = a * 8;
					trans.ty = 0;
					collectStar_yellow_bm.draw(tempMc, trans);
					
					a  ++ ;
					
				}
				tempMc = new collectStar_red_mc();
				collectStar_red_bm = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
				a = 0;
				while (a < tempMc.totalFrames)
				{
					
					tempMc.gotoAndStop((a + 1));
					trans.tx = a * 8;
					trans.ty = 0;
					collectStar_red_bm.draw(tempMc, trans);
					
					a  ++ ;
					
				}
				tempMc = new collectStar_blue_mc();
				collectStar_blue_bm = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
				a = 0;
				while (a < tempMc.totalFrames)
				{
					
					tempMc.gotoAndStop((a + 1));
					trans.tx = a * 8;
					trans.ty = 0;
					collectStar_blue_bm.draw(tempMc, trans);
					
					a  ++ ;
					
				}
				tempMc = new collectStar_white_mc();
				collectStar_white_bm = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
				a = 0;
				while (a < tempMc.totalFrames)
				{
					
					tempMc.gotoAndStop((a + 1));
					trans.tx = a * 8;
					trans.ty = 0;
					collectStar_white_bm.draw(tempMc, trans);
					
					a  ++ ;
					
				}
			}
		}
		
		public function disposeGunBullut():void
		{
			if(gun_casing_bits){
				for each(var bit:BitmapData in gun_casing_bits){
					bit.dispose();
				}
				gun_casing_bits=null;
			}
			gun_flash=null;
			if(gun_flash_smoke_bm) {gun_flash_smoke_bm.dispose();gun_flash_smoke_bm=null;}
			gun_rocket=null;
			if(rocket_bm) {rocket_bm.dispose();rocket_bm=null;}
			if(gun_acidBomb) {gun_acidBomb.dispose();gun_acidBomb=null;}
			if(gun_acidBomb_drip) {gun_acidBomb_drip.dispose();gun_acidBomb_drip=null;}
			if(airsoftPellet) {airsoftPellet.dispose();airsoftPellet=null;}
			if(gun_blackhole_bm) {gun_blackhole_bm.dispose();gun_blackhole_bm=null;}
			if(gun_blackhole_fx_bm) {gun_blackhole_fx_bm.dispose();gun_blackhole_fx_bm=null;}
			gaussTrail=null;
			if(gun_incindary_impact_bm) {gun_incindary_impact_bm.dispose();gun_incindary_impact_bm=null;}
			if(spark_bm) {spark_bm.dispose();spark_bm=null;}
			if(collectStar_yellow_bm) {collectStar_yellow_bm.dispose();collectStar_yellow_bm=null;}
			if(collectStar_red_bm) {collectStar_red_bm.dispose();collectStar_red_bm=null;}
			if(collectStar_blue_bm) {collectStar_blue_bm.dispose();collectStar_blue_bm=null;}
			if(collectStar_white_bm) {collectStar_white_bm.dispose();collectStar_white_bm=null;}
		}
		
		
		
		
		public static var character_colorTransform:ColorTransform;
		
		/**   **/
		private  function createCharSpriteAsset(appearance:Array,colors:Array):CharSpriteAsset{
			
			assetPool.addChar(appearance,colors);
			return assetPool.getCharAsset(appearance,colors);
		}
		
		/*public var playCharAsset:CharSpriteAsset;
			
		public function createPlayerAsset(appearance:Array,colors:Array):void{
			playCharAsset=createCharSpriteAsset(appearance,colors);
		}*/
		/**
		 * 擂台玩家素材
		 */
		public var enemyPlayCharAsset:CharSpriteAsset;
		
		public function createEnemyPlayerAsset(appearance:Array,colors:Array):void{
			enemyPlayCharAsset=createCharSpriteAsset(appearance,colors);
		}
		
		public var charAssetDic:Object;
		
		public function createMonsterAsset(monsterIds:Array):void{
			if(charAssetDic==null) charAssetDic={};
			a = 0;
			while (a < monsterIds.length) {
				trace(("char " + a));
				if(charAssetDic[monsterIds[a]]==null){
					var node:Node_monster_type=XMLDataManager.getMonster_typeById(monsterIds[a]);
					charAssetDic[monsterIds[a]]=createCharSpriteAsset(JSON.parse(node.movie_frame) as Array,GameUtil.turnArryStringToUint(node.colors));
				}
				a++;
			};
		}
		
		public function disposeMonsterAsset():void{
			if(charAssetDic){
				/*for each(var charAsset:CharSpriteAsset in charAssetDic){
					charAsset.destory();
				}*/
				charAssetDic=null;
			}
		}
		
		
//		public var gunAssetVect:Vector.<GunAsset>;
		public  var enemyGunAssetDict:Dictionary;
		
		private  var maxGunAssetFrame:int=9;
		public  var tempGunBM:BitmapData;
		public function getPlayCharAsset(appearance:Array,color:Array):CharSpriteAsset{
			return assetPool.getCharAsset(appearance,color);
		}
		
		
		
		
		public function getPlayGunAsset(wepon:int):GunAsset{
			if(GameSwitchSceneController.isInBattle){
				
				return assetPool.getBattleGunAsset(wepon,true);
			}
			return assetPool.getZhuchengGunAsset(wepon);
		}
		
		/** 只有当人物枪支变换的时候才会 调用 **/
		public function createPlayerGunAsset(playerWeapon:Array,appearance:Array,colors:Array):void{
//			gunAssetVect=new Vector.<GunAsset>();
			var gunNode:Node_gun;
			var gunId:int;
			
			for each(var weapon:int in playerWeapon){
				if(GameSwitchSceneController.isInBattle){
					assetPool.addBattleGunAsset(weapon);
					assetPool.addGunReloadAsset(weapon);
				}else{
					assetPool.addZhuchengGunAsset(weapon);
				}
				
			}
			
		}
		
		public function createEnemyGunAsset(_gunIds:Array):void{
			if(enemyGunAssetDict==null){
				enemyGunAssetDict=new Dictionary();
			}
			b=0;
			while (b < _gunIds.length)
			{
				if(enemyGunAssetDict[_gunIds[b]]==null){
					assetPool.addBattleGunAsset(_gunIds[b]);
					enemyGunAssetDict[_gunIds[b]]=assetPool.getBattleGunAsset(_gunIds[b]);
				}
				b++;
			}
		}
		
		public function disposeEnemyGunAsset():void{
			if(enemyGunAssetDict!=null){
				for each(var gunAsset:GunAsset in enemyGunAssetDict){
					gunAsset.destory();
				}
				enemyGunAssetDict=null;
			}
		}
		
		/** 获取僵尸的素材 **/
		public function getZombieAssetBySprite(zombieSprite:int):ZombieAsset{
			return assetPool.getZombieAsset(zombieSprite);
		}
		
		public var portalMovie:ParticleMovie;
		
		public function createPortalAsset():void{
			tempMc=new mc_chuansongmen();
			/*if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Copy){
				if(!(Context.getInjectInstance(BattleModel) as BattleModel ).hasNextMinorGuanka()){
					tempMc=new mc_chuansongmen_final();
				}else{
					tempMc=new mc_chuansongmen();
				}
			}else{
				tempMc=new mc_chuansongmen_final();
			}*/
			
			
			portalMovie=new ParticleMovie();
			portalMovie.initMovie(tempMc);
			
			
			/*if(portalMovie==null){
				tempMc=new mc_chuansongmen();
				portalMovie=new ParticleMovie();
				portalMovie.initMovie(tempMc);
			}*/
		}
		
		public function disposePortal():void{
			if(portalMovie==null){
				portalMovie.destory();
			}
		}
	}
}