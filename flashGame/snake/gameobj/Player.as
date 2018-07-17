package snake.gameobj
{
	import com.fish.GLBaseData;
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.models.BattleModel;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.LeitaiModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.tool.MathHelper;
	
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import core.PlayerGuideManager;
	
	import org.osflash.signals.Signal;
	
	import snake.BattleAssetPreload;
	import snake.GameCanvas;
	import snake.GameLevel;
	import snake.GameManager;
	import snake.NpcTalkInfoBar;
	import snake.PlayerInfoBar;
	import snake.RenderPlayerArg;
	import snake.gameEnemys.CharAnimData;
	import snake.gameEnemys.CharSpriteAsset;
	import snake.gameParticle.particles.Particle;
	import snake.gameParticle.simpleParticles.SimpleParticle;
	import snake.guns.GunAsset;
	import snake.guns.GunData;
	import snake.module.DamageUtil;
	import snake.module.HpBarUtil;
	import snake.viewdata.IHeroData;
	import snake.viewdata.battle.AttackComputeData;
	import snake.viewdata.battle.BattleData_Hero;
	import snake.viewdata.battle.GunChangeManager;
	
	import util.Util;

	public class Player extends Base_GameObj
	{
		/**
		 * 注册键盘事件的按键
		 */
		public static const K:Array=[Keyboard.W,Keyboard.S,Keyboard.A,Keyboard.D,Keyboard.E,Keyboard.F,Keyboard.R,Keyboard.P,Keyboard.M,Keyboard.DELETE];
		public static var KD:Dictionary;
		public static var KDTime:Dictionary;
		
		public static const PlayerWidth:int=50;
		public static const PlayerHeight:int=50*2;
		
		public static const TempSprite:Sprite=new Sprite();
		
		public var renderPlayerArg:RenderPlayerArg=new RenderPlayerArg();
					
		public var character_x:Number=500;
		public var character_y:Number=500;
		public var character_xOld:Number=0;
		public var character_yOld:Number=0;
		public var character_velX:Number=0;
		public var character_velY:Number=0;
		public var runSpeed:int=18;
		public var jump:Boolean;
		public var releaseJump:Boolean;
		public var maxFrames:Array;
		
		public var anim:int;
		public var fr:Number;
		public var frOld:Number;
		public var idleTime:int;
		public var idle_x:Number;
		public var idle_x_last:Number;
		public var idle_change_x:Number;
		public var idle_movement:Number;
		public var idle_timePlus:Number;
		public var multiplier_countdown:Number;
		public var enemiesOnScreen:int;
		
		public var character_face:int;
		
		public var tileOn:int;
		public var character_hurtTime:int;
		
		public var _character_health:int=5;
		public var character_maxHealth:int=100;
		public var character_invincibleTime:int=0;
		public var JumpMaxSpeed:int=80;
		
		public var level:Vector.<uint>;
		public var level_width:int;
		public var level_height:int;
		public var level_collidable:Vector.<int>;
		
		
		public var tempHeadRot:Number;
		public var rect:Rectangle=new Rectangle(0,0,1,1);
		public var tempPoint:Point=new Point();
		
		public var character_weapons:Array;
		public var character_reloadTime:int;
		public var gun_total_ammo:Array;
		public var hasDroppedMag:Boolean;
		
		public var mouseDown:Boolean;
		public var gun16time:int;
		public var character_burstLength:int;
		
		public var gunTempRand:Number=0;
		public var gunTempSpd:Number=0;
		
		public var recoilRotVel:Number=0;
		public var noRecoil:Boolean;
		public var aimPan:Number=0;
		public var aimPanOld:Number=0;
		
		//需要回收的
		private var assetConfig:BattleAssetPreload;
//		private var heroModel:HeroModel;
//		private var battleModel:BattleModel;
				
		protected var gunAsset:GunAsset;
		protected var charAsset:CharSpriteAsset;
		private var playerInfo:PlayerInfoBar;
		
		/**
		 * 英雄显示数据
		 */
		public var viewData:IHeroData;
		/**
		 * 英雄枪的数据
		 */
		public var playerGunData:GunData;
		
		public var canvas:GameCanvas;
		
		protected function resetArg():void{
			character_x=500;
			character_y=500;
			character_xOld=0;
			character_yOld=0;
			character_velX=0;
			character_velY=0;
			runSpeed=18;
			jump=false;
			releaseJump=false;
			maxFrames=null;
			
			anim=0;
			fr=0;
			frOld=0;
			idleTime=0;
			idle_x=0;
			idle_x_last=0;
			idle_change_x=0;
			idle_movement=0;
			idle_timePlus=0;
			multiplier_countdown=0;
			enemiesOnScreen=0;
			
			character_face=0;
			
			tileOn=0;
			character_hurtTime=0;
			
			_character_health=5;
			character_maxHealth=100;
			character_invincibleTime=0;
			JumpMaxSpeed=80;
			
			character_weapons=null;
			character_reloadTime=0;
			gun_total_ammo=null;
			hasDroppedMag=false;
			
			mouseDown=false;
			gun16time=0;
			character_burstLength=0;
			
			gunTempRand=0;
			gunTempSpd=0;
			
			recoilRotVel=0;
			noRecoil=false;
			aimPan=0;
			aimPanOld=0;
		}
		
		private  function destroyData():void
		{
			assetConfig=null;
//			heroModel=null;
//			battleModel=null;
			gunAsset=null;
			charAsset=null;
			viewData=null;
			playerGunData=null;
			canvas=null;
		}
		
		public function Player()
		{
			super();
		}
	 	public function initModule($viewData:IHeroData,$cx:Number,$cy:Number,$gunId:int=-1):void
		{
			resetArg();
			assetConfig=BattleAssetPreload.getInstance();
			viewData=$viewData;
			character_x=$cx;
			character_xOld=$cx;
			character_y=$cy;
			character_yOld=$cy;
//			heroModel=Context.getInjectInstance(HeroModel);
//			battleModel=Context.getInjectInstance(BattleModel);
			initKeyBoard();
			initData();
			
			if($gunId>0){
				initGun($gunId);
			}else{
				initBattleGun();
			}
			
			if(GameManager.getManagerType()==GameManager.MG_Zhucheng){
				initPlayerInfoBar();
			}
			
			registerEvent();
		}

		public static var PlayerHp_SN:Signal=new Signal();
		public function set character_health(_value:int):void
		{
			_character_health=_value;
			if(_character_health>=character_maxHealth)
			{
				_character_health=character_maxHealth;
			}
			if(_character_health<=0)
			{
				_character_health=0;
				BattleModel.playerDie();				
			}
			PlayerHp_SN.dispatch();
		}
		public function get character_health():int
		{
			return _character_health;
		}
		private function initData():void
		{
			canvas=GameManager.manager.canvas;
			
			var gameLevel:GameLevel=GameManager.manager.level;
			level=gameLevel.level;
			level_width=gameLevel.level_width;
			level_height=gameLevel.level_height;
			level_collidable=gameLevel.level_collidable;
			
			/*if(!GameSwitchSceneController.isInBattle && GLBaseData.lastHeroPosition){
				character_x=GLBaseData.lastHeroPosition.x;
				character_y=GLBaseData.lastHeroPosition.y;
			}else{
				character_x=GameManager.level.characterStartPoint.x;  
				character_y=GameManager.level.characterStartPoint.y;
			}*/
			
			maxFrames=assetConfig.maxFrames;
//			charAsset=BattleAssetPreload.getInstance().playCharAsset;
			
			charAsset=BattleAssetPreload.getInstance().getPlayCharAsset(viewData.appearance,viewData.color);
			
			/*if(!GameSwitchSceneController.isInBattle)
			{
				viewData=heroModel.getHeroData();
			}
			else
			{
				viewData=battleModel.getMyHeroData();
			}*/
			
			JumpMaxSpeed=viewData.jumpHeight;
			character_maxHealth=viewData.maxHealth;
			runSpeed=viewData.runSpeed;
			character_health=viewData.curHealth;
			
			/*if(!GameSwitchSceneController.isInBattle)
			{
				initGun();
			}
			else
			{
				initBattleGun();
			}*/
		}
		public function initGun($gunId:int):void
		{
//			character_gunEquipped=heroModel.mainGunId;
			character_gunEquipped=$gunId;
			playerGunData=GunData.gunDataVect[character_gunEquipped];
			playerGunData.gun_ammo = playerGunData.gun_mag_size;
			gunAsset=BattleAssetPreload.getInstance().getPlayGunAsset(character_gunEquipped);
		}
		private function initBattleGun():void
		{
			changeGun(GunChangeManager.getInstance().currentUseGun);
		}
		private function changeGun(_gunId:int):void
		{
			saveCurrentGunData();
			character_gunEquipped=_gunId;
			playerGunData=GunData.gunDataVect[character_gunEquipped];
			playerGunData.gun_ammo=GunChangeManager.getInstance().getGunAmmo(character_gunEquipped);
			gunAsset=BattleAssetPreload.getInstance().getPlayGunAsset(character_gunEquipped);
		}
		private function saveCurrentGunData():void
		{
			if(GameSwitchSceneController.isInBattle)
			{
				if(null!=playerGunData)
				{
					GunChangeManager.getInstance().saveGunAmmo(character_gunEquipped,playerGunData.gun_ammo);
				}
			}
		}
		/**
		 * 保存数据，战斗中有小关的概念，所以需要保存 
		 */
		private function saveData():void
		{
			saveCurrentGunData();
		}
		private function updateGun():void
		{
			changeGun(GunChangeManager.getInstance().currentUseGun);
		}	
	 	protected function registerEvent():void
		{
			addTargetEvent(GlobalRef.stage,KeyboardEvent.KEY_DOWN,onKeyPressed);
			addTargetEvent(GlobalRef.stage,KeyboardEvent.KEY_UP,onKeyUpPressed);
			if(!FuncSwitchManager.Horizontal_Switch)
			{
				addTargetEvent(GlobalRef.stage,MouseEvent.MOUSE_DOWN,md);
				addTargetEvent(GlobalRef.stage,MouseEvent.MOUSE_UP,mu);
			}
			GunChangeManager.getInstance().GunChange_SN.add(updateGun);
		}

		public override function destroy():void
		{
			saveData();
			GunChangeManager.getInstance().GunChange_SN.remove(updateGun);
			viewData.destroy();
			viewData=null;
			destroyData();
			destroyPlayerInfoBar();
			destroyKeyBoard();
			if(talkInfoBar) {talkInfoBar.destory();talkInfoBar=null;}
			super.destroy();
		}
		
		//<-------------------用户名字称号等等--------->
		private function initPlayerInfoBar():void
		{
			if(!GameSwitchSceneController.isInBattle){
				playerInfo=new PlayerInfoBar();
				if(GLBaseData.userName==null){
					playerInfo.setInfo(1,"",PlayerInfoBar.TY_Self);
				}else{
					playerInfo.setInfo(1,GLBaseData.userName,PlayerInfoBar.TY_Self);
				}
				
			}
		}
		private function destroyPlayerInfoBar():void
		{
			if(playerInfo)
			{
				playerInfo.destory();
				playerInfo=null;
			}
		}
		
		//<-----------------------------------------键盘事件----------------------------------->
		private function initKeyBoard():void
		{
			KD=new Dictionary();
			KDTime=new Dictionary();
			var index:int;
			for(index=0;index<K.length;index++)
			{
				var key:int=K[index];
				KD[key]=false;
				KDTime[key]=0;
			}
		}		
		public function setAllKDToFalse():void{
			var index:int;
			for(index=0;index<K.length;index++)
			{
				var key:int=K[index];
				KD[key]=false;
				KDTime[key]=0;
			}
		}
		public function md(event:MouseEvent):void
		{
			mouseDown = true;
			return;
		}// end function
		
		public function mu(event:MouseEvent):void
		{
			mouseDown = false;
			character_burstLength = 0;
			return;
		}
		public function onKeyPressed(event:KeyboardEvent):void
		{
			if(!Util.guideIsCompelete()){
				PlayerGuideManager.getInstance().createFadeButtonClick("joyStick");
			}
			KD[event.keyCode]=true;
			KDTime[event.keyCode]=getTimer();
		}
		
		public function onKeyUpPressed(event:KeyboardEvent):void
		{
			KD[event.keyCode]=false;
		}
		private function destroyKeyBoard():void
		{
			if(null==KD)
			{
				return;
			}
			var index:int;
			for(index=0;index<K.length;index++)
			{
				var key:int=K[index];
				KD[key]=null;
				KDTime[key]=null;
				delete KD[key];
				delete KDTime[key];
			}
			KD=null;
			KDTime=null;
		}	
		//<----------------------------------------------------------------->
		public function logic():void
		{
//			trace("anim "+anim+" character_face "+character_face);
			if(jump==true)
			{
				if (character_velX != 0)
				{
					if(character_velX > 0)
					{
						character_face=0;
					}
					else
					{
						character_face=1;
					}
				}
			}
			if (jump == false)
			{
				if (character_velX != 0)
				{
					if(FuncSwitchManager.Horizontal_Switch)
					{
						if(character_velX > 0)
						{
							character_face=0;
						}
						else
						{
							character_face=1;
						}
					}
					if (character_velX > 0)
					{
						if (character_face == 0)
						{
							if (anim != 2)
							{
								anim = 2;
								fr = 0;
								frOld = fr;
							}
						}
						else if (anim != 3)
						{
							anim = 3;
							fr = 0;
							frOld = fr;
						}
					}
					else if (character_face == 0)
					{
						if (anim != 3)
						{
							anim = 3;
							fr = 0;
							frOld = fr;
						}
					}
					else if (anim != 2)
					{
						anim = 2;
						fr = 0;
						frOld = fr;
					}
				}
				else if (character_hurtTime < 1)
				{
					tileOn = int(character_y / 50) * level_width + int((character_x - 15) / 50);
					if (level_collidable[level[tileOn]] == 0)
					{
						if (character_face == 1)
						{
							if (anim != 9)
							{
								anim = 9;
								fr = 0;
								frOld = fr;
							}
						}
						else if (anim != 10)
						{
							anim = 10;
							fr = 0;
							frOld = fr;
						}
					}
					else
					{
						tileOn = int(character_y / 50) * level_width + int((character_x + 15) / 50);
						if (level_collidable[level[tileOn]] == 0)
						{
							if (character_face == 1)
							{
								if (anim != 10)
								{
									anim = 10;
									fr = 0;
									frOld = fr;
								}
							}
							else if (anim != 9)
							{
								anim = 9;
								fr = 0;
								frOld = fr;
							}
						}
						else if (anim != 1)
						{
							anim = 1;
							fr = 0;
							frOld = fr;
						}
					}
				}
			}
			else if (character_velY < 0)
			{
				if (anim != 6)
				{
					if (anim != 8)
					{
						if (character_face == 0)
						{
							if (KD[Keyboard.A] == true)
							{
								anim = 8;
							}
							else
							{
								anim = 6;
							}
						}
						else if (KD[Keyboard.D] == true)
						{
							anim = 8;
						}
						else
						{
							anim = 6;
						}
						fr = 0;
						frOld = fr;
					}
				}
				
			}
			else if (anim != 7)
			{
				anim = 7;
				fr = 0;
				frOld = fr;
			}
			frOld = fr;
			fr = fr + 2;
//			trace("走帧："+fr);
			if (fr > maxFrames[anim])
			{
				if ((anim > 10)||(character_hurtTime>=1))
				{
					character_hurtTime = 0;
					anim = 1;
				}
				fr = 0;
				frOld = 0;
			}
			if (anim == 2)
			{
				if ((fr == 0)||(fr == 14))
				{
					playSoundEffect(int(Math.random() * 4) + 21, 1, 0);
				}
			}
			else if (anim == 3)
			{
				if ((fr == 0)||(fr == 10))
				{
					playSoundEffect(int(Math.random() * 4) + 21, 1, 0);
				}
			}
			character_xOld = character_x;
			character_yOld = character_y;
			if (character_hurtTime>=0)
			{
				if (KD[Keyboard.A] == true)
				{
					/*character_velX = character_velX - 4;
					if (character_velX < -runSpeed)
					{
						character_velX = -runSpeed;
					}*/
					character_velX = -runSpeed;
				}
				else if (KD[Keyboard.D] == true)
				{
					/*character_velX = character_velX + 4;
					if (character_velX > runSpeed)
					{
						character_velX = runSpeed;
					}*/
					character_velX = runSpeed;
				}else{
					character_velX = 0;
				}
				/*else if (character_velX > 4)
				{
					character_velX = character_velX - 4;
				}
				else if (character_velX < -4)
				{
					character_velX = character_velX + 4;
				}
				else
				{
					character_velX = 0;
				}*/
			}
			character_x = character_x + character_velX;
			if (character_velX < 0)
			{
				tileOn = int((character_y - 5) / 50) * level_width + int((character_x - 25) / 50);
				if ((level_collidable[level[tileOn]] == 1)||(level_collidable[level[tileOn - level_width]] == 1))
				{
					character_x = int(character_x / 50) * 50 + 25;
					character_velX = 0;
				}
			}
			else if (character_velX > 0)
			{
				tileOn = int((character_y - 5) / 50) * level_width + int((character_x + 25) / 50);
				if ((level_collidable[level[tileOn]] == 1)||(level_collidable[level[tileOn - level_width]] == 1))
				{
					character_x = int(character_x / 50) * 50 + 25;
					character_velX = 0;
				}	
			}
			else
			{
				tileOn = int((character_y - 5) / 50) * level_width + int((character_x - 25) / 50);
				if ((level_collidable[level[tileOn]] == 1)||(level_collidable[level[tileOn - level_width]] == 1))
				{
					character_x = int(character_x / 50) * 50 + 25;
					character_velX = 0;
				}
				tileOn = int((character_y - 55) / 50) * level_width + int((character_x - 25) / 50);
				if ((level_collidable[level[tileOn]] == 1)||(level_collidable[level[tileOn - level_width]] == 1))
				{
					character_x = int(character_x / 50) * 50 + 25;
					character_velX = 0;
				}
			}
			if (character_hurtTime>=0)
			{
				if (KD[Keyboard.W] == true)
				{
					if (jump == false)
					{
						jump = true;
						character_velY = -Math.abs(JumpMaxSpeed);
						releaseJump = false;
					}
				}
			}
			if (jump == true)
			{
				if (KD[Keyboard.W] == false)
				{
					if (releaseJump == false)
					{
						releaseJump = true;
						if (character_velY < -8)
						{
							character_velY = -8;
						}
					}
				}
				character_velY = character_velY + 2;
				if (character_velY > Math.abs(JumpMaxSpeed))
				{
					character_velY = Math.abs(JumpMaxSpeed);
				}
				character_y = character_y + character_velY;
				tileOn = int((character_y - 80) / 50) * level_width + int(character_x / 50);
				
				// 头上的 
				if (level_collidable[level[tileOn]] == 1)
				{
					character_velY = 0;
					character_y = int(character_y / 50) * 50 + 50;
				}
				
				
				
				tileOn = int(character_y / 50) * level_width + int(character_x / 50);
				if (level_collidable[level[tileOn]] == 1)
				{
					jump = false;
					character_velY = 0;
					character_y = int(character_y / 50) * 50 + 2;
					playSoundEffect(int(Math.random() * 4) + 21, 1, 0);
				}
				tileOn = int((character_y - 5) / 50) * level_width + int((character_x - 25) / 50);
				if (level_collidable[level[tileOn]] == 1)
				{
					character_x = int(character_x / 50) * 50 + 25;
					character_velX = 0;
				}
				tileOn = int((character_y - 5) / 50) * level_width + int((character_x + 25) / 50);
				if (level_collidable[level[tileOn]] == 1)
				{
					character_x = int(character_x / 50) * 50 + 25;
					character_velX = 0;
				}
			}
			else
			{
				tileOn = int(character_y / 50) * level_width + int((character_x - 10) / 50);
				if (level_collidable[level[tileOn]] == 0)
				{
					tileOn = int(character_y / 50) * level_width + int((character_x + 10) / 50);
					if (level_collidable[level[tileOn]] == 0)
					{
						jump = true;
					}
				}
			}
			aimFun();
			if (character_gunCoolDown > 0){
				character_gunCoolDown--;
			};
			if (character_reloadTime > 0){
				if (mouseDown == true){
					playSoundEffect(20, 1, 0);
					mouseDown = false;
				};
				character_burstLength = 0;
				if (character_reloadTime == 1){
					if (playerGunData.gun_hasReloadAnim == 1){
						playSoundEffect(50, 1, 0);
					};
					if (playerGunData.gun_total_ammo >= playerGunData.gun_mag_size){
						playerGunData.gun_ammo = playerGunData.gun_mag_size;
					}
					else {
						playerGunData.gun_ammo = playerGunData.gun_total_ammo;
						playerGunData.gun_total_ammo = 0;
					};
				};
				character_reloadTime--;
			};
			if (playerGunData.gun_ammo < 1){
				if ((((character_reloadTime < 1)) && ((playerGunData.gun_total_ammo > 0)))){
					hasDroppedMag = false;
					character_reloadTime = playerGunData.gun_reload_time;
					mouseDown = false;
				};
			}
			else {
				if ((((((character_gunEquipped == 16)) && ((mouseDown == false)))) && ((character_reloadTime < 1)))){
					gun16time++;
					if (gun16time > 1){
						gun16time = 0;
						playerGunData.gun_ammo = (playerGunData.gun_ammo + 1);
						if (playerGunData.gun_ammo > playerGunData.gun_mag_size){
							playerGunData.gun_ammo = playerGunData.gun_mag_size;
						};
					};
				};
			};
			
			//---------------------------------------
			if (mouseDown == true)
			{
				if (character_gunCoolDown < 1)
				{
					if (playerGunData.gun_ammo > 0)
					{
					}
					if (character_reloadTime < 1)
					{
						character_gunCoolDown = playerGunData.gun_coolDown;
						playerGunData.gun_ammo -=1;
						character_recoil_x = character_recoil_x - Math.cos(character_gunRot) * playerGunData.gun_recoil_x;
						character_recoil_y = character_recoil_y - Math.sin(character_gunRot) * playerGunData.gun_recoil_x;
						if (playerGunData.gun_auto == 0)
						{
							mouseDown = false;
							character_recoil_rot = character_recoil_rot + playerGunData.gun_recoil_rot;
						}
						else
						{
							
							character_burstLength  ++ ;
							
							if (character_burstLength > 30)
							{
								character_burstLength = 30;
							}
							character_recoil_rot = character_recoil_rot + (Math.random() * (playerGunData.gun_recoil_rot + character_burstLength * 0.05) * 0.5 - (playerGunData.gun_recoil_rot + character_burstLength * 0.05) * 0.25);
						}
						playSoundEffect(playerGunData.gun_sfx, 1, 0);
						if (playerGunData.gun_bulletType != 9)
						{
							var rightSprite:Sprite=TempSprite;
							rightSprite.x = character_gunX - canvas.cameraX;
							rightSprite.y = character_gunY - canvas.cameraY + playerGunData.gunShoulder_y;
							rightSprite.rotation = character_gunRot * pi_180;
							if (character_face == 0)
							{
								rightSprite.scaleY = 1;
							}
							else
							{
								rightSprite.scaleY = -1;
							}
							gunFlash_pt = new Point(playerGunData.gun_barrel_x, playerGunData.gun_barrel_y);
							gunFlash_pt = rightSprite.localToGlobal(gunFlash_pt);
							SimpleParticle.addSimpleParticle(0, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, int(Math.random() * 5), 0);
						}
						var damage:int=viewData.atk;
						var computeData:AttackComputeData=viewData.computeData;
						switch(playerGunData.gun_bulletType)
//						switch(4)
						{
							case 0:
							{
								Particle.addParticle(1, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(character_gunRot + Math.PI) * -16, Math.sin(character_gunRot + Math.PI) * -16, 0, int((character_gunRot + Math.PI) / (Math.PI * 2) * 64), playerGunData.gun_isIncindiary, character_gunEquipped, 0, damage,computeData);
								break;
							}
							case 1:
							{
								a = 0;
								while (a < 4)
								{
									
									gunTempRand = (Math.random() - 0.5) * 0.25;
									gunTempSpd = 14 + Math.random() * 4;
									Particle.addParticle(1, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(character_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), Math.sin(character_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), 0, int((character_gunRot + gunTempRand + Math.PI) / (Math.PI * 2) * 64), playerGunData.gun_isIncindiary, character_gunEquipped, 0, damage,computeData);
									
									a  ++ ;
									
								}
								break;
							}
							case 2:
							{
								a = 0;
								while (a < 5)
								{
									
									gunTempRand = (Math.random() - 0.5) * 0.3;
									gunTempSpd = 14 + Math.random() * 4;
									Particle.addParticle(1, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(character_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), Math.sin(character_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), 0, int((character_gunRot + gunTempRand + Math.PI) / (Math.PI * 2) * 64), playerGunData.gun_isIncindiary, character_gunEquipped, 0, damage,computeData);
									
									a  ++ ;
									
								}
								break;
							}
							case 4:
							{
								playerGunData.gun_ammo -= 1;
								a = 0;
								while (a < 5)
								{
									
									gunTempRand = (Math.random() - 0.5) * 0.6;
									gunTempSpd = 14 + Math.random() * 4;
									Particle.addParticle(1, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(character_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), Math.sin(character_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), 0, int((character_gunRot + gunTempRand + Math.PI) / (Math.PI * 2) * 64), playerGunData.gun_isIncindiary, character_gunEquipped, 0, damage,computeData);
									
									a  ++ ;
									
								}
								a = 0;
								while (a < 5)
								{
									
									gunTempRand = (Math.random() - 0.5) * 0.6;
									gunTempSpd = 14 + Math.random() * 4;
									Particle.addParticle(1, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(character_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), Math.sin(character_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), 0, int((character_gunRot + gunTempRand + Math.PI) / (Math.PI * 2) * 64), playerGunData.gun_isIncindiary, character_gunEquipped, 0, damage,computeData);
									
									a  ++ ;
									
								}
//								gunFlash_pt = new Point(playerGunData.gun_barrel_x, playerGunData.gun_barrel_x + 10);								
//								gunFlash_pt = gunAsset.gun_right[playerGunData.gunFrames[character_gunFrame]].localToGlobal(gunFlash_pt);
//								SimpleParticle.addSimpleParticle(0, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, int(Math.random() * 5), 0);

								break;
							}
							case 5://毒
							{
								Particle.addParticle(12, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(character_gunRot + Math.PI) * -16, Math.sin(character_gunRot + Math.PI) * -16, 0, int((character_gunRot + Math.PI) / (Math.PI * 2) * 64), playerGunData.gun_isIncindiary, 0, 0, damage,computeData);
								break;
							}
							case 7://激光    现在改成没有衰减
							{
								if (character_gunFrame == 0)
								{
									Particle.addParticle(16, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(character_gunRot + Math.PI) * -16, Math.sin(character_gunRot + Math.PI) * -16, 0, int((character_gunRot + Math.PI) / (Math.PI * 2) * 64), 0, character_gunEquipped, 0, 1,computeData);
								}
								else
								{
//									Particle.addParticle(16, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(character_gunRot + Math.PI) * -16, Math.sin(character_gunRot + Math.PI) * -16, 0, int((character_gunRot + Math.PI) / (Math.PI * 2) * 64), 0, character_gunEquipped, 0, character_gunFrame / playerGunData.gunFrames.length * 1,computeData);
								}
								break;
							}
							case 8://榴弹
							{
								
								Particle.addParticle(14, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(character_gunRot + Math.PI) * -16, Math.sin(character_gunRot + Math.PI) * -16, 0, int((character_gunRot + Math.PI) / (Math.PI * 2) * 64), 0, character_gunEquipped, 0, damage,computeData);
								break;
							}
							case 9://来回弹的小颗粒
							{
								if(character_face==0)
								{
									Particle.addParticle(15, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(character_gunRot + Math.PI) * -30, Math.sin(character_gunRot + Math.PI) * -30, 0, int((character_gunRot + Math.PI) / (Math.PI * 2) * 64), 0, character_gunEquipped, 0, damage,computeData);
								}
								else
								{
									Particle.addParticle(15, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY+30, character_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(character_gunRot + Math.PI) * -30, Math.sin(character_gunRot + Math.PI) * -30, 0, int((character_gunRot + Math.PI) / (Math.PI * 2) * 64), 0, character_gunEquipped, 0, damage,computeData);
								}
								break;
							}
							case 10://黑色的大球
							{
								Particle.addParticle(18, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(character_gunRot + Math.PI) * -16, Math.sin(character_gunRot + Math.PI) * -16, 0, int((character_gunRot + Math.PI) / (Math.PI * 2) * 64), 0, character_gunEquipped, 0, damage,computeData);
								break;
							}
							case 11:
							{
								a = -1;
								while (a < 2)
								{
									
									Particle.addParticle(18, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(character_gunRot + a * 0.25 + Math.PI) * -16, Math.sin(character_gunRot + a * 0.25 + Math.PI) * -16, 0, int((character_gunRot + Math.PI) / (Math.PI * 2) * 64), 0, character_gunEquipped, 0, damage,computeData);
									
									a  ++ ;
									
								}
								break;
							}
							case 12:
							{
								a = -1;
								while (a < 2)
								{
									
									Particle.addParticle(14, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(character_gunRot + a * 0.18 + Math.PI) * -16, Math.sin(character_gunRot + a * 0.18 + Math.PI) * -16, 0, int((character_gunRot + a * 0.18 + Math.PI) / (Math.PI * 2) * 64), 0, character_gunEquipped, 0, damage,computeData);
									
									a  ++ ;
									
								}
								break;
							}
							case 13:
							{
								a = 0;
								while (a < 10)
								{
									
									gunTempRand = (Math.random() - 0.5) * 0.3;
									gunTempSpd = 24 + Math.random() * 8;
									Particle.addParticle(15, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(character_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), Math.sin(character_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), 0, int((character_gunRot + gunTempRand + Math.PI) / (Math.PI * 2) * 64), playerGunData.gun_isIncindiary, character_gunEquipped, 0, damage,computeData);
									
									a  ++ ;
									
								}
								break;
							}
							default:
							{
								break;
							}
						}
						character_gunFrame = 1;
					}
				}
			}
			if (character_gunFrame > 0)
			{
				
				character_gunFrame  ++ ;
				
				if (character_gunFrame == playerGunData.gun_frameToEjectShellOn)
				{
					var gunRight:Sprite=TempSprite;
					gunRight.x = character_gunX - canvas.cameraX;
					gunRight.y = character_gunY - canvas.cameraY + playerGunData.gunShoulder_y;
					gunRight.rotation = character_gunRot * pi_180;
					if (character_face == 0)
					{
						gunRight.scaleY = 1;
					}
					else
					{
						gunRight.scaleY = -1;
					}
					gunFlash_pt = new Point(playerGunData.gun_eject_x, playerGunData.gun_eject_y);
					gunFlash_pt = gunRight.localToGlobal(gunFlash_pt);
					gunTempSpd = 20 + Math.random() * 4;
					if (character_face == 0)
					{
						Particle.addParticle(0, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Math.cos(character_gunRot - 2) * gunTempSpd, Math.sin(character_gunRot - 2) * gunTempSpd, 0, int(playerGunData.gun_casingType), int((character_gunRot + Math.PI) / (Math.PI * 2) * 16), (int(Math.random() * 4) + 0.25) / 10, 0, 0);
					}
					else
					{
						Particle.addParticle(0, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Math.cos(character_gunRot + 2) * gunTempSpd, Math.sin(character_gunRot + 2) * gunTempSpd, 0, int(playerGunData.gun_casingType), int((character_gunRot + Math.PI) / (Math.PI * 2) * 16), (int(Math.random() * 4) + 0.25) / 10, 0, 0);
					}
					if (playerGunData.gun_bulletType == 4)
					{
						gunFlash_pt = new Point(playerGunData.gun_eject_x - 5, playerGunData.gun_eject_y);
						gunFlash_pt = gunRight.localToGlobal(gunFlash_pt);
						gunTempSpd = 15 + Math.random() * 4;
						if (character_face == 0)
						{
							Particle.addParticle(0, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Math.cos(character_gunRot - 2) * gunTempSpd, Math.sin(character_gunRot - 2) * gunTempSpd, 0, int(playerGunData.gun_casingType), int((character_gunRot + Math.PI) / (Math.PI * 2) * 16), (int(Math.random() * 4) + 0.25) / 10, 0, 0);
						}
						else
						{
							Particle.addParticle(0, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, character_gunRot, Math.cos(character_gunRot + 2) * gunTempSpd, Math.sin(character_gunRot + 2) * gunTempSpd, 0, int(playerGunData.gun_casingType), int((character_gunRot + Math.PI) / (Math.PI * 2) * 16), (int(Math.random() * 4) + 0.25) / 10, 0, 0);
						}
					}
				}
				if (character_gunFrame > playerGunData.gunFrames.length-1)
				{
					character_gunFrame = 0;
				}
			}
			if (noRecoil == true)
			{
				character_recoil_x = 0;
				character_recoil_y = 0;
				character_recoil_rot = 0;
				character_gunCoolDown = 0;
				playerGunData.gun_auto = 1;
				playerGunData.gun_coolDown = 1;
			}
			if (character_recoil_rot != 0)
			{
				recoilRotVel = recoilRotVel + character_recoil_rot * 0.95;
				character_recoil_rot = character_recoil_rot - recoilRotVel;
				character_recoil_rot = character_recoil_rot * playerGunData.gun_recoil_dampening;
				if (Math.abs(recoilRotVel) < 0.01)
				{
					recoilRotVel = 0;
					character_recoil_rot = 0;
				}
			}
			if (character_recoil_x != 0)
			{
				character_recoil_x = character_recoil_x * playerGunData.gun_recoil_xRecover;
				if (Math.abs(character_recoil_x) < 0.01)
				{
					character_recoil_x = 0;
				}
			}
			if (character_recoil_y != 0)
			{
				character_recoil_y = character_recoil_y * playerGunData.gun_recoil_xRecover;
				if (Math.abs(character_recoil_y) < 0.01)
				{
					character_recoil_y = 0;
				}
			}
			aimPanOld = aimPan;
			if (character_face == 0)
			{
				if (aimPan < 100)
				{
					aimPan = aimPan - (aimPan - 100) * 0.25;
				}
				else
				{
					aimPan = 100;
				}
			}
			else if (aimPan > -100)
			{
				aimPan = aimPan - (aimPan - -100) * 0.25;
			}
			else
			{
				aimPan = -100;
			}
			if(!GameSwitchSceneController.isInBattle){
				GLBaseData.setHeroPosition(character_x,character_y);
			}
		}
		
		public var character_gunX:Number=0;
		public var character_gunY:Number=0;
		public var character_gunXOld:Number=0;
		public var character_gunYOld:Number=0;
		public var character_gunRot:Number=0;
		public var character_gunRotOld:Number=0;
		public var character_gunDX:Number=0;
		public var character_gunDY:Number=0;
		public var character_headRot:Number=0;
		public var character_gunEquipped:int;
		public var character_recoil_rot:Number=0;
		public var character_recoil_x:Number=0;
		public var character_recoil_y:Number=0;
		public var character_gunCoolDown:int;
		public var character_gunFrame:int;
		
		//  中间值
		public static var a:int;
		public static var b:int;
		public static var c:int;
		public static var d:int;
		public static var e:int;
		public static var radTo:Number=0;
		
		

		
		public function aimFun():void
		{
//			return ;
			var gunData:GunData=assetConfig.gunDataVect[character_gunEquipped];
			var charAminData:CharAnimData=assetConfig.charAnimDataVect[anim];
			
			character_gunRotOld = character_gunRot;
			character_gunXOld = character_gunX;
			character_gunYOld = character_gunY;
			character_gunX = canvas.cameraX;
			character_gunY =  canvas.cameraY - gunData.gunShoulder_y;
			
			if (character_gunX > character_x + charAminData.body_x[fr])
			{
				if (character_face == 1)
				{
					if(!FuncSwitchManager.Horizontal_Switch)
					{
						character_face = 0;
						if (character_gunRot > 0)
						{
							if (character_gunRot > Math.PI * 0.5)
							{
								character_gunRot = 0;
							}
						}
						else if (character_gunRot < (-Math.PI) * 0.5)
						{
							character_gunRot = 0;
						}
						character_gunRotOld = character_gunRot;
					}
				}
			}
			else if (character_face == 0)
			{
				if(!FuncSwitchManager.Horizontal_Switch)
				{
					character_face = 1;
					if (character_gunRot > 0)
					{
						if (character_gunRot < Math.PI * 0.5)
						{
							character_gunRot = -Math.PI;
						}
					}
					else if (character_gunRot > (-Math.PI) * 0.5)
					{
						character_gunRot = -Math.PI;
					}
					character_gunRotOld = character_gunRot;
				}
			}
			d = gunData.gun_dist;
			if (character_face == 0)
			{
				character_gunX = canvas.cameraX + character_recoil_x;
				character_gunY = canvas.cameraY - gunData.gunShoulder_y + character_recoil_y;
				character_gunDX = character_gunX - (character_x + charAminData.body_x[fr]);
				character_gunDY = character_gunY - (character_y + charAminData.body_y[fr]);
				radTo = Math.atan2(character_gunDY, character_gunDX);
				character_headRot = radTo;
				radTo = radTo + character_recoil_rot;

				
				character_gunRot = character_gunRot - (character_gunRot - radTo) / 3;
				
				if(FuncSwitchManager.Horizontal_Switch)
				{
					//Fantasy  注意
					radTo=0;
					character_headRot=0;
					character_gunRot=0;
				}
				
				if (Math.sqrt(character_gunDX * character_gunDX + character_gunDY * character_gunDY) > d)
				{
					character_gunX = character_x + charAminData.body_x[fr] + Math.cos(character_gunRot) * d + character_recoil_x;
					character_gunY = character_y + charAminData.body_y[fr] + Math.sin(character_gunRot) * d + character_recoil_y;
				}
				else
				{
					d = Math.sqrt(character_gunDX * character_gunDX + character_gunDY * character_gunDY);
				}
				character_gunX = character_x + charAminData.body_x[fr] + character_recoil_x;
				character_gunY = character_y + charAminData.body_y[fr] + character_recoil_y;
				getBarrelPoint();
				b = 0;
				tileOn = int((gunFlash_pt.y + canvas.cameraY) / 50) * level_width + int((gunFlash_pt.x + canvas.cameraX+25) / 50);
				if (level_collidable[level[tileOn]] == 0)
				{
					do
					{						
						character_gunX = character_gunX + Math.cos(character_gunRot) * 2;
						character_gunY = character_gunY + Math.sin(character_gunRot) * 2;
						getBarrelPoint();
						tileOn = int((gunFlash_pt.y + canvas.cameraY) / 50) * level_width + int((gunFlash_pt.x + canvas.cameraX) / 50);
						b = b + 2;
					}while (b < d)
				}
			}
			else
			{
				character_gunX = canvas.cameraX + character_recoil_x;
				character_gunY = canvas.cameraY - gunData.gunShoulder_y + character_recoil_y;
				character_gunDX = character_gunX - (character_x - charAminData.body_x[fr]);
				character_gunDY = character_gunY - (character_y + charAminData.body_y[fr]);
				radTo = Math.atan2(character_gunDY, character_gunDX);
				character_headRot = radTo;
				radTo = radTo - character_recoil_rot;
				if (radTo > character_gunRot + Math.PI)
				{
					character_gunRot = character_gunRot + Math.PI * 2;
					character_gunRotOld = character_gunRot;
				}
				if (radTo < character_gunRot - Math.PI)
				{
					character_gunRot = character_gunRot - Math.PI * 2;
					character_gunRotOld = character_gunRot;
				}
				character_gunRot = character_gunRot - (character_gunRot - radTo) / 3;
				if(FuncSwitchManager.Horizontal_Switch)
				{
					//Fantasy  注意
					radTo=Math.PI;
					character_headRot=Math.PI;
					character_gunRot=Math.PI;
				}
				
				if (Math.sqrt(character_gunDX * character_gunDX + character_gunDY * character_gunDY) > d)
				{
					character_gunX = character_x - charAminData.body_x[fr] + Math.cos(character_gunRot) * d + character_recoil_x;
					character_gunY = character_y + charAminData.body_y[fr] + Math.sin(character_gunRot) * d + character_recoil_y;
				}
				character_gunX = character_x - charAminData.body_x[fr] + character_recoil_x;
				character_gunY = character_y + charAminData.body_y[fr] + character_recoil_y;
				getBarrelPoint();
				b = 0;
				tileOn = int((gunFlash_pt.y + canvas.cameraY+70) / 50) * level_width + int((gunFlash_pt.x + canvas.cameraX-50) / 50);
				if (level_collidable[level[tileOn]] == 0)
				{
					do
					{
						character_gunX = character_gunX + Math.cos(character_gunRot) * 2;
						character_gunY = character_gunY + Math.sin(character_gunRot) * 2;
						getBarrelPoint();
						tileOn = int((gunFlash_pt.y + canvas.cameraY+70) / 50) * level_width + int((gunFlash_pt.x + canvas.cameraX-50) / 50);
						b = b + 2;
					}while (b < d)
				}
			}
		}
		public static var pi_180:int = int(180 / Math.PI * 1000) / 1000;
		public static var gunFlash_pt:Point=new Point();
		public function getBarrelPoint():void
		{
			var gunData:GunData=assetConfig.gunDataVect[character_gunEquipped];
			MathHelper.localToGlobal(character_gunX - canvas.cameraX,character_gunY - canvas.cameraY + gunData.gunShoulder_y,
				gunData.gun_barrel_x, gunData.gun_barrel_y,gunFlash_pt,character_gunRot,(character_face != 0));
			/*var tempGunRight:Sprite=TempSprite;
			tempGunRight.x = character_gunX - canvas.cameraX;
			tempGunRight.y = character_gunY - canvas.cameraY + gunData.gunShoulder_y;
			tempGunRight.rotation = character_gunRot * pi_180;
			if (character_face == 0)
			{
				tempGunRight.scaleY = 1;
			}
			else
			{
				tempGunRight.scaleY = -1;
			}
			gunFlash_pt = new Point(gunData.gun_barrel_x, gunData.gun_barrel_y);
			gunFlash_pt = tempGunRight.localToGlobal(gunFlash_pt);*/
			
		}// end function
		

		public function render():void{
			var charAnimData:CharAnimData=BattleAssetPreload.getInstance().charAnimDataVect[anim];
						
			renderPlayerArg._charAnimData=charAnimData;
			renderPlayerArg._charAsset=charAsset;
			renderPlayerArg._face=character_face;
			renderPlayerArg._frame=fr;
			renderPlayerArg._frameOld=frOld;
			renderPlayerArg._gunAsset=gunAsset;
			renderPlayerArg._gunData=playerGunData;
			renderPlayerArg._gunFrame=character_gunFrame;
			renderPlayerArg._gunRot=character_gunRot;
			renderPlayerArg._gunRotOld=character_gunRotOld;
			renderPlayerArg._gunX=character_gunX;
			renderPlayerArg._gunXOld=character_gunXOld;
			renderPlayerArg._gunY=character_gunY;
			renderPlayerArg._gunYOld=character_gunYOld;
			renderPlayerArg._headless=false;
			renderPlayerArg._headRot=character_headRot;
			renderPlayerArg._posX=character_x-canvas.cameraX;
			renderPlayerArg._posX_old=character_xOld-canvas.cameraX;
			renderPlayerArg._posY=character_y-canvas.cameraY;
			renderPlayerArg._posY_old=character_yOld-canvas.cameraY;
			renderPlayerArg._reloadTime=character_reloadTime;
			renderPlayerArg.hasDroppedMag=hasDroppedMag;
			renderPlayerArg._host=this;
			
			if(GameManager.getManagerType()==GameManager.MG_Zhucheng && !GameSwitchSceneController.isInBattle && ! jump){
				renderPlayerArg.renderInfo=true;
				renderPlayerArg.playerInfo=playerInfo;
			}else{
				renderPlayerArg.renderInfo=false;
				renderPlayerArg.playerInfo=null;
			}	
			if(needShowTalk){
				renderPlayerArg.talkInfo=talkInfoBar;
			}else{
				renderPlayerArg.talkInfo=null;
			}
			GameManager.manager.canvas.render_a_character(renderPlayerArg);
			if(GameSwitchSceneController.isInBattle && GameManager.getManagerType()!=GameManager.MG_Select){
				renderHpBar();
			}
			renderReloadBar();
		}
		public function renderHpBar():void
		{
			var percents:Number=character_health/character_maxHealth;
			HpBarUtil.getInstance().render(character_x,character_y,percents,0,true);
		}
		public function renderReloadBar():void
		{
			if(character_reloadTime>=1)
			{
				var percents:Number=1-Number(character_reloadTime)/playerGunData.gun_reload_time;
				HpBarUtil.getInstance().renderReload(character_x,character_y,percents);
			}
		}
		/**
		 * 包括减血，显示暴击,显示闪避
		 */
		public function dealDamage(_data:AttackComputeData):void
		{
			var attackSide:AttackComputeData=_data;
			var defSide:AttackComputeData=(viewData as BattleData_Hero).computeData;
			var mingzhongPro:Number=BattleModel.computeReal_Hit_Pro(attackSide.hit_pro,attackSide.hit_pro_lvzi,defSide.eva_pro,defSide.eva_pro_lvzi);
			var isShanbi:Boolean=(Math.random()>mingzhongPro);
			if(isShanbi)//闪避
			{
				showDamage(0,false,true);
				BattleModel.sendBattling(defSide,attackSide,damage,BattleModel.JI_SHANBI,true);
				return;
			}
			var baojiPro:Number=BattleModel.computeReal_Cri_Pro(attackSide.cri_pro,attackSide.cri_pro_lvzi,defSide.renxing_pro,defSide.renxing_pro_lvzi);
			var damage:int;
			var isBaoji:Boolean=(Math.random()<=baojiPro);
			if(isBaoji)//暴击
			{
				damage=BattleModel.computeCri_Damage(attackSide.atk,attackSide.nbDamage,defSide.def,attackSide.nbCridamage,attackSide.BaojiBase);
				showDamage(damage,true,false);
			}
			else
			{
				damage=BattleModel.computeDamage(attackSide.atk,attackSide.nbDamage,defSide.def);
				showDamage(damage,false,false);
			}
			var fireWay:Number=BattleModel.NULL;
			if(isBaoji)
			{
				fireWay=BattleModel.JI_BAOJI;
			}
			BattleModel.sendBattling(defSide,attackSide,damage,fireWay,true);	
			character_health-=damage;
		}
		public  function showDamage(_damage:int,_isBaoji:Boolean,_isShanbi:Boolean):void
		{
			var cameraOffseX:Number=(character_x - canvas.cameraX);
			var cameraOffseY:Number=(character_y - canvas.cameraY);
			DamageUtil.showDamage(cameraOffseX,cameraOffseY,_damage,this,_isBaoji,_isShanbi);
		}	
		
		public function playSoundEffect(param1:int, param2:Number, param3:int):void
		{
			Particle.sound.playSoundEffect(param1,param2,param3);
		}
		
		
		protected var talkInfoBar:NpcTalkInfoBar;
		protected var needShowTalk:Boolean;
		
	}
}