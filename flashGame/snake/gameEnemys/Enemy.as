package snake.gameEnemys
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.models.BattleModel;
	import com.fish.modules.core.models.LeitaiModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	import flash.utils.clearTimeout;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	import org.osflash.signals.Signal;
	
	import snake.BattleAssetPreload;
	import snake.GameCanvas;
	import snake.GameLevel;
	import snake.GameManager;
	import snake.GameObjective;
	import snake.GameSoundSFX;
	import snake.GameTileSet;
	import snake.RenderPlayerArg;
	import snake.gameobj.Player;
	import snake.guns.GunAsset;
	import snake.guns.GunData;
	import snake.module.DamageUtil;
	import snake.module.HpBarUtil;
	import snake.npcer.LeitaiNpcer;
	import snake.viewdata.IHeroData;
	import snake.viewdata.ViewData_LeitaiPlayer;
	import snake.viewdata.ViewData_Zombie;
	import snake.viewdata.battle.AttackComputeData;
	import snake.viewdata.battle.BattleData_Hero;

	public class Enemy
	{
		/*
		
		public override function excuteLogic():void{
		
		}
		public override function excuteRender():void{
		
		}
		
		
		 */
		
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
		public static var tileOnOther:int;
		public static var enemy_dX:Number;
		public static var enemy_dY:Number;
		public static var enemy_tempRise:Number;
		public static var enemy_tempRun:Number;
		public static var enemy_dist:Number;
		public static var enemy_isMoving:Boolean;
		public static var tempScoreQue:String;
		public static var enemy_tempPos_x:int;
		public static var enemy_tempPos_y:int;
		public static var enemy_tempPos_face:int;
		public static var enemy_tempVel_x:Number;
		public static var enemy_tempVel_y:Number;
		public static var tempRad:Number;
		public static var wasGibbed:Boolean;
		
		public static var gunFlash_pt:Point=new Point();
		public static var gunFlash_pt2:Point=new Point();
		public static var gunTempRand:Number;
		public static var gunTempSpd:Number;
		public static var tempSprite:Sprite=new Sprite();
		public static var interpFrame:Number;
		public static var rotInterp:Number;
		public static var tempHeadRot:Number;
		
		public static var tempPartToRender:String;
		public static var tempPartSprite:String;
		public static var character_colorTransform:ColorTransform;
		
		public static var renderPlayerArg:RenderPlayerArg=new RenderPlayerArg();
		
		
		
		public  var enemyRunSpeed:int = 12;
		
		public static var pi_halved:Number=int(Math.PI / 2 * 100) / 100;;
		public static var pi_180:Number= int(180 / Math.PI * 1000) / 1000;
		
		public static var level:GameLevel;
		public static var tileSet:GameTileSet;
		public static var canvas:GameCanvas;
//		public static var assetConfig:AssetConfig;
		public static var assetConfig:BattleAssetPreload;
		public static var sound:GameSoundSFX;
		public static var objective:GameObjective;
		public static var discsDestroyed:int=0;
		
		
		public var unId:int;
		
		public var enemy_type:int;
		
		public var _enemy_health:Number;
		
		public function get enemy_health():Number
		{
			return _enemy_health;
		}
		public function set enemy_health(_value:Number):void
		{
			_enemy_health= _value
		}
//		public var enemy_health_head:Number;
//		public var enemy_health_body:Number;
//		public var enemy_health_foot:Number;
		
		public function get enemy_health_head():Number
		{
			return enemy_health;
		}
		public function set enemy_health_head(_value:Number):void
		{
			enemy_health= _value
		}
		public function get enemy_health_body():Number
		{
			return enemy_health;
		}
		public function set enemy_health_body(_value:Number):void
		{
			enemy_health= _value
		}
		public function get enemy_health_foot():Number
		{
			return enemy_health;
		}
		public function set enemy_health_foot(_value:Number):void
		{
			enemy_health= _value
		}
		
		public var enemy_health_headMax:Number;
		public var enemy_health_bodyMax:Number;
		public var enemy_health_footMax:Number;
		public var enemy_health_headOld:Number;
		public var enemy_health_bodyOld:Number;
		public var enemy_health_footOld:Number;
		public var enemy_damagedBy:int;
		public var enemy_spriteSet:Number;
		
//		public var node:Node_monster_type;
		
		public var enemy_face:Number;
		public var enemy_anim:Number;
		public var enemy_fr:Number;
		public var enemy_frOld:Number;
		public var enemy_x:Number;
		public var enemy_y:Number;
		public var enemy_xOld:Number;
		public var enemy_yOld:Number;
		public var enemy_velX:Number;
		public var enemy_velY:Number;
		public var enemy_jump:Boolean;
		public var enemy_gunX:Number;
		public var enemy_gunY:Number;
		public var enemy_gunXOld:Number;
		public var enemy_gunYOld:Number;
		public var enemy_gunRot:Number;
		public var enemy_gunRotOld:Number;
		public var enemy_headRot:Number;
		public var enemy_radTo:Number;
		public var enemy_gunEquipped:Number;
		public var enemy_recoil_rot:Number;
		public var enemy_recoil_rotVel:Number;
		public var enemy_recoil_x:Number;
		public var enemy_recoil_y:Number;
		public var enemy_gunCoolDown:Number;
		public var enemy_gunFrame:Number;
		public var enemy_burstLength:Number;
		public var enemy_lineOfSightTimer:int;
		public var enemy_nextNode:int;
		public var _enemy_aiState:int;
		public function get enemy_aiState():int{
			return _enemy_aiState;
		}
		public function set enemy_aiState(value:int):void{
			_enemy_aiState=value;
		}
		public var enemy_maxJumpHeight:int;
		public var enemy_hasLineOfSight:Boolean;
		public var enemy_lineOfSightCountdown:int;
		public var enemy_markedForRemoval:Boolean;
		public var enemy_isHeadless:Boolean;
		public var enemy_statusEffect:int;
		public var enemy_statusEffect_atp:Number;
		public var enemy_inacc_x:Number;
		public var enemy_inacc_y:Number;
		public var enemy_inacc_x_target:Number;
		public var enemy_inacc_y_target:Number;
		public var enemy_initialized:Number;
		
		/**
		 * 标识量   逻辑上是否已经移除
		 */
		public var logic_remove:Boolean=false;
		/**
		 * 是否处于激活状态
		 */
		public var enemy_active:Boolean=false;
		
		/**
		 * 激活状态Y方向距离
		 */
		public static const Active_DerY:Number=60;
		
		/**
		 * 超过此距离将不会跑进
		 */
		public static var Enemy_CloseTo_Dist:Number=960;
		
		/**
		 * ai 被逼走逃离格子数
		 */
		public static const Enemy_RunAway_TileNum:int=5;
		
		
		public static const Enemy_Min_DerY:Number=100;
		public static const Enemy_Max_DerY:Number=640;
		
		public var enemy_engagementDistance:Number;
		
		
		
		public var enemy_aimTime:int=5;
		
		public var enemy_aimDerTime:int=15;
		
		public var gun_data:GunData;
//		public var gun_asset:GunAsset;
		public var gun_enemy_asset:GunAsset;
		public var zombieData:IHeroData;
		
		public function excuteLogic():void{
			
		}
		public function excuteRender():void{
			
		}
		
		public var isShowHpBar:Boolean=false;
		public var disappearTimeID:int;
		/**
		 * boss始终显示血条
		 */
		public function renderHpBar():void
		{
			var boss:int=0;
			if(zombieData is ViewData_Zombie)
			{
				boss=(zombieData as ViewData_Zombie).monsterNode.boss
			};
//			if(boss!=1)
//			{
//				if(!isShowHpBar)
//				{
//					return;
//				}
//			}
			var percents:Number=enemy_health_head/enemy_health_headMax;
			if(percents<0)
			{
				percents=0;
			}
			if(percents>1)
			{
				percents=1;
			}
			switch(boss)
			{
				case 0:
					HpBarUtil.getInstance().render(enemy_x,enemy_y,percents,startTime);
					break;
				case 1:
					HpBarUtil.getInstance().render_boss_hpBar(enemy_x,enemy_y,percents,0,false,true);
					break;
				default:
					HpBarUtil.getInstance().render(enemy_x,enemy_y,percents,startTime);
					break;
			}
			
		}
		/**
		 * 包括减血，显示暴击,显示闪避
		 */
		public function dealDamage(_data:AttackComputeData):void
		{
			var attackSide:AttackComputeData=_data;
			var defSide:AttackComputeData=zombieData.computeData;
			var mingzhongPro:Number=BattleModel.computeReal_Hit_Pro(attackSide.hit_pro,attackSide.hit_pro_lvzi,defSide.eva_pro,defSide.eva_pro_lvzi);
			var isShanbi:Boolean=(Math.random()>mingzhongPro);
			if(isShanbi)//闪避
			{
				showDamage(0,false,true);
				BattleModel.sendBattling(attackSide,defSide,damage,BattleModel.JI_SHANBI,false);
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
			enemy_health-=damage;
			var fireWay:Number=BattleModel.NULL;
			if(isBaoji)
			{
				fireWay=BattleModel.JI_BAOJI;
			}
			BattleModel.sendBattling(attackSide,defSide,damage,fireWay,false);
		}
		public var startTime:Number;
		public function showDamage(_damage:int,_isBaoji:Boolean,_isShanbi:Boolean):void
		{
			var cameraOffseX:Number=(enemy_x - canvas.cameraX);
			var cameraOffseY:Number=(enemy_y - canvas.cameraY);
			DamageUtil.showDamage(cameraOffseX,cameraOffseY,_damage,this,_isBaoji,_isShanbi);
			clearTimeout(disappearTimeID);
			isShowHpBar=true;
			disappearTimeID=setTimeout(setAppearable,HpBarUtil.HpBarDisappearTime);
			startTime=getTimer();
		}
		private function setAppearable():void
		{
			isShowHpBar=false;
		}
		
		public static function destory():void{
			
			player=null;
			assetConfig=null;
			level=null;
			tileSet=null;
			
			
			beanAnimDataVect=new Vector.<BeanAnimData>();
			charAnimDataVect=new Vector.<CharAnimData>();
			charSpriteAssetDic=new Dictionary();
			
			enemyVect=new Vector.<Enemy>();
		}
		
		
		
		
		public function Enemy()
		{
		}
		public static var isHackedVersion:Boolean=false;
		public static var multiKillCount:int;
		public static var multiKillTime:int;
		public static var tempNumOfEnemies:int;
		public static var timePassed:int;
		public static var maxNumOfEnemies:int;
		public static var maxNumOfEnemies_forReal:int;
		public static function logic():void{
			addEnemyLogic();
//			for each(var enemy:Enemy in enemyVect){
//				enemy.excuteLogic();
//			}
			a=0;
			while(a<enemyVect.length){
				enemyVect[a].excuteLogic();
				a++;
			}
			
		}
		public static function render():void{
			for each(var enemy:Enemy in enemyVect){
				enemy.excuteRender();
			}
			/*a=0;
			while(a<enemyVect.length){
				if(enemyVect[a].enemy_markedForRemoval){
					removeEnemy(a);
				}
				a++;
			}*/
			
		}
		
		public static var stinkyBeanMode:Boolean=false;
		public static var zombieMode:Boolean=false;
		/** 根据时间 在合适的地点添加 敌人 **/
		private static function addEnemyLogic():void{
			player=GameManager.manager.player;
			return ;
			timePassed++;
			if (stinkyBeanMode == true){
				if (timePassed > 150){
					if (maxNumOfEnemies < 6){
						maxNumOfEnemies = 6;
					};
					maxNumOfEnemies_forReal = 6;
				};
				if (timePassed > 450){
					if (maxNumOfEnemies < 8){
						maxNumOfEnemies = 8;
					};
					maxNumOfEnemies_forReal = 8;
				};
				if (timePassed > 900){
					if (maxNumOfEnemies < 10){
						maxNumOfEnemies = 10;
					};
					maxNumOfEnemies_forReal = 10;
				};
				if (timePassed > 1800){
					if (maxNumOfEnemies < 12){
						maxNumOfEnemies = 12;
					};
					maxNumOfEnemies_forReal = 12;
				};
				if (timePassed > 2100){
					if (maxNumOfEnemies < 14){
						maxNumOfEnemies = 14;
					};
					maxNumOfEnemies_forReal = 14;
				};
				if (timePassed > 3600){
					if (maxNumOfEnemies < 16){
						maxNumOfEnemies = 16;
					};
					maxNumOfEnemies_forReal = 16;
				};
			}
			else {
				if (zombieMode == true){
					if (timePassed > 150){
						if (maxNumOfEnemies < 6){
							maxNumOfEnemies = 6;
						};
						maxNumOfEnemies_forReal = 6;
					};
					if (timePassed > 450){
						if (maxNumOfEnemies < 8){
							maxNumOfEnemies = 8;
						};
						maxNumOfEnemies_forReal = 8;
					};
					if (timePassed > 900){
						if (maxNumOfEnemies < 10){
							maxNumOfEnemies = 10;
						};
						maxNumOfEnemies_forReal = 10;
					};
					if (timePassed > 1800){
						if (maxNumOfEnemies < 12){
							maxNumOfEnemies = 12;
						};
						maxNumOfEnemies_forReal = 12;
					};
					if (timePassed > 2100){
						if (maxNumOfEnemies < 14){
							maxNumOfEnemies = 14;
						};
						maxNumOfEnemies_forReal = 14;
					};
					if (timePassed > 3600){
						if (maxNumOfEnemies < 16){
							maxNumOfEnemies = 16;
						};
						maxNumOfEnemies_forReal = 16;
					};
				}
				else {
					if (timePassed > 450){
						if (maxNumOfEnemies < 4){
							maxNumOfEnemies = 4;
						};
						maxNumOfEnemies_forReal = 4;
					};
					if (timePassed > 900){
						if (maxNumOfEnemies < 5){
							maxNumOfEnemies = 5;
						};
						maxNumOfEnemies_forReal = 5;
					};
					if (timePassed > 1800){
						if (maxNumOfEnemies < 6){
							maxNumOfEnemies = 6;
						};
						maxNumOfEnemies_forReal = 6;
					};
					if (timePassed > 2100){
						if (maxNumOfEnemies < 7){
							maxNumOfEnemies = 7;
						};
						maxNumOfEnemies_forReal = 7;
					};
					if (timePassed > 3600){
						if (maxNumOfEnemies < 8){
							maxNumOfEnemies = 8;
						};
						maxNumOfEnemies_forReal = 8;
					};
				};
			};
			tempNumOfEnemies = 0;
			a = 0;
			while (a < enemyVect.length) {
				var type:int=enemyVect[a].enemy_type;
				if ((((((((type == 1)) || ((type == 4)))) || ((type == 5)))) || ((type == 6)))){
					tempNumOfEnemies++;
				};
				a++;
			};
			
			//Fantasy测试用			
//			maxNumOfEnemies=1;			
			//Fantasy测试用
			
			if (tempNumOfEnemies < maxNumOfEnemies){
				if (maxNumOfEnemies < 9){
					if (tempNumOfEnemies == 0){
						c = 0;
					}
					else {
						c = int((Math.random() * 20));
					};
					if (player.idleTime > 500){
						c = 1;
					};
				}
				else {
					c = 0;
					if (isHackedVersion == false){
						if (player.idleTime > 500){
							c = 1;
						};
					};
				};
				if (c == 0){
					d = int((Math.random() * 2));
					if (d == 0){
						if (((canvas.cameraX + canvas.screenWidth) + 250) < (level.level_width * 50)){
							a = -5;
							while (a < 3) {
								tileOn = ((int((((player.character_y - 10) + (a * 50)) / 50)) * level.level_width) + int((((canvas.cameraX + canvas.screenWidth) + 250) / 50)));
								if ((((((((tileOn > 0)) && ((level.level_collidable[level.level[tileOn]] == 0)))) && ((level.level_collidable[level.level[(tileOn + level.level_width)]] == 1)))) && ((((canvas.cameraX + canvas.screenWidth) + 250) < (level.level_width * 50))))){
									if (stinkyBeanMode == true){
										e = (Math.random() * 3);
										if (e == 0){
											addEnemy(5, 1, 1, 1, (int((Math.random() * 5)) + 1), ((int((((canvas.cameraX + canvas.screenWidth) + 250) / 50)) * 50) + 25), ((player.character_y - 10) + (a * 50)));
										}
										else {
											addEnemy(4, 5, 5, 5, (int((Math.random() * 5)) + 1), ((int((((canvas.cameraX + canvas.screenWidth) + 250) / 50)) * 50) + 25), ((player.character_y - 10) + (a * 50)));
										};
									}
									else {
										if (zombieMode == true){
											addEnemy(6, 7, 7, 7, int((Math.random() * 6)), ((int((((canvas.cameraX + canvas.screenWidth) + 250) / 50)) * 50) + 25), ((player.character_y - 10) + (a * 50)));
										}
										else {
											addEnemy(1, 5, 5, 5, (int((Math.random() * 5)) + 1), ((int((((canvas.cameraX + canvas.screenWidth) + 250) / 50)) * 50) + 25), ((player.character_y - 10) + (a * 50)));
										};
									};
									a = 10;
								};
								a++;
							};
						};
					}
					else {
						if ((canvas.cameraX - 250) > 0){
							a = -5;
							while (a < 3) {
								tileOn = ((int((((player.character_y - 10) + (a * 50)) / 50)) * level.level_width) + int(((canvas.cameraX - 250) / 50)));
								if ((((((((tileOn > 0)) && ((level.level_collidable[level.level[tileOn]] == 0)))) && ((level.level_collidable[level.level[(tileOn + level.level_width)]] == 1)))) && (((canvas.cameraX - 250) > 0)))){
									if (stinkyBeanMode == true){
										e = (Math.random() * 3);
										if (e == 0){
											addEnemy(5, 1, 1, 1, (int((Math.random() * 5)) + 1), ((int(((canvas.cameraX - 250) / 50)) * 50) + 25), ((player.character_y - 10) + (a * 50)));
										}
										else {
											addEnemy(4, 5, 5, 5, (int((Math.random() * 5)) + 1), ((int(((canvas.cameraX - 250) / 50)) * 50) + 25), ((player.character_y - 10) + (a * 50)));
										};
									}
									else {
										if (zombieMode == true){
											addEnemy(6, 7, 7, 7, int((Math.random() * 6)), ((int(((canvas.cameraX - 250) / 50)) * 50) + 25), ((player.character_y - 10) + (a * 50)));
										}
										else {
											addEnemy(1, 5, 5, 5, (int((Math.random() * 5)) + 1), ((int(((canvas.cameraX - 250) / 50)) * 50) + 25), ((player.character_y - 10) + (a * 50)));
										};
									};
									a = 10;
								};
								a++;
							};
						};
					};
				};
			};
			if (multiKillTime < 1){
				multiKillCount = 0;
			}
			else {
				multiKillTime--;
			};
		}
		
		public static var enemyVect:Vector.<Enemy>=new Vector.<Enemy>();
		public static var enemyIndexDic:Dictionary=new Dictionary();
		public static var player:Player;
		public static var udid:int=1000;
		public static function addEnemy(type:int, health_head:Number, health_body:Number, health_foot:Number, enemy_spriteSet:Number, x:Number, y:Number,_zombieData:ViewData_Zombie=null):void
		{
			player=GameManager.manager.player;
//			trace("添加敌人："+type);
			var enemy:Enemy;
			
			if(type==1){
				enemy=new Enemy_1();
			}
			
			if(type==2){
				enemy=new Enemy_2();
			}
//			if(type==3){
//				enemy=new Enemy_3();
//			}
			if(type==4){
				enemy=new Enemy_4();
			}
			if(type==5){
				enemy=new Enemy_5();
			}
			if(type==6){
				enemy=new Enemy_6();
			}
			udid++;
			enemy.enemy_type=(type);
//			enemy.enemy_health_head=(health_head);
//			enemy.enemy_health_body=(health_body);
//			enemy.enemy_health_foot=(health_foot);
//			enemy.enemy_health_headMax=(health_head);
//			enemy.enemy_health_bodyMax=(health_body);
//			enemy.enemy_health_footMax=(health_foot);
//			enemy.enemy_health_headOld=(health_head);
//			enemy.enemy_health_bodyOld=(health_body);
//			enemy.enemy_health_footOld=(health_foot);
			enemy.enemy_damagedBy=(0);
			enemy.enemy_spriteSet=(enemy_spriteSet);
			enemy.enemy_face=(0);
			enemy.enemy_anim=(1);
			enemy.enemy_fr=(0);
			enemy.enemy_frOld=(0);
			enemy.enemy_x=(x);
			enemy.enemy_y=(y);
			enemy.enemy_xOld=(x);
			enemy.enemy_yOld=(y);
			enemy.enemy_velX=(0);
			enemy.enemy_velY=(0);
			enemy.enemy_jump=(false);
			enemy.enemy_gunX=(x);
			enemy.enemy_gunY=(y - 50);
			enemy.enemy_gunXOld=(x);
			enemy.enemy_gunYOld=(y - 50);
			enemy.enemy_gunRot=(0);
			enemy.enemy_gunRotOld=(0);
			enemy.enemy_headRot=(0);
			enemy.enemy_radTo=(0);
			// warning
			if(_zombieData){
				enemy.zombieData=_zombieData;
				enemy.enemy_gunEquipped=_zombieData.monsterNode.gun;
				enemy.enemyRunSpeed=_zombieData.runSpeed;
				
				enemy.enemy_health_head=(_zombieData.maxHealth);
				enemy.enemy_health_body=(_zombieData.maxHealth);
				enemy.enemy_health_foot=(_zombieData.maxHealth);
				enemy.enemy_health_headMax=(_zombieData.maxHealth);
				enemy.enemy_health_bodyMax=(_zombieData.maxHealth);
				enemy.enemy_health_footMax=(_zombieData.maxHealth);
				enemy.enemy_health_headOld=(_zombieData.maxHealth);
				enemy.enemy_health_bodyOld=(_zombieData.maxHealth);
				enemy.enemy_health_footOld=(_zombieData.maxHealth);
				
				
				
			}else{
				enemy.enemy_gunEquipped=(level.enemyWeapons[(enemy_spriteSet - 1)]);
				enemy.enemy_health_head=(health_head);
				enemy.enemy_health_body=(health_body);
				enemy.enemy_health_foot=(health_foot);
				enemy.enemy_health_headMax=(health_head);
				enemy.enemy_health_bodyMax=(health_body);
				enemy.enemy_health_footMax=(health_foot);
				enemy.enemy_health_headOld=(health_head);
				enemy.enemy_health_bodyOld=(health_body);
				enemy.enemy_health_footOld=(health_foot);
			}
			
			
			
			
			enemy.enemy_recoil_rot=(0);
			enemy.enemy_recoil_rotVel=(0);
			enemy.enemy_recoil_x=(0);
			enemy.enemy_recoil_y=(0);
			enemy.enemy_gunCoolDown=(0);
			enemy.enemy_gunFrame=(0);
			enemy.enemy_burstLength=(0);
			enemy.enemy_engagementDistance=(Math.random() * 100 + 100);
			if(_zombieData && _zombieData.isZombie){
				enemy.enemy_engagementDistance = _zombieData.runSpeed;
//				enemy.enemy_engagementDistance=20;
				enemy.enemy_spriteSet=(JSON.parse(_zombieData.monsterTypeNode.movie_frame) as Array)[0];
			}
			enemy.enemy_lineOfSightTimer=(0);
			enemy.enemy_nextNode=(-1);
			enemy.enemy_aiState=(0);
			enemy.enemy_maxJumpHeight=(0);
			enemy.enemy_hasLineOfSight=(false);
			enemy.enemy_lineOfSightCountdown=(0);
			enemy.enemy_markedForRemoval=(false);
			enemy.enemy_isHeadless=(false);
			enemy.enemy_statusEffect=(0);
			enemy.enemy_statusEffect_atp=(0);
			enemy.enemy_inacc_x=(0);
			enemy.enemy_inacc_y=(0);
			enemy.enemy_inacc_x_target=(0);
			enemy.enemy_inacc_y_target=(0);
			enemy.enemy_initialized=(0);
			enemy.unId=udid;
			if(enemy.enemy_gunEquipped>=0){
				enemy.gun_data=GunData.gunDataVect[enemy.enemy_gunEquipped];
//				enemy.gun_asset=GunData.gunAssetVect[enemy.enemy_gunEquipped];
			}
			
//			if(enemy.enemy_spriteSet
//			if(enemy.enemy_spriteSet>0){
////				enemy.gun_enemy_asset=GunData.enemyGunAssetVect[enemy.enemy_spriteSet-1];
//				enemy.gun_enemy_asset=GunData.enemyGunAssetDict[enemy.node.id];
//			}
			if(_zombieData){
				enemy.gun_enemy_asset=assetConfig.enemyGunAssetDict[_zombieData.monsterNode.gun];
			}
			
			
			enemyVect.push(enemy);
			enemyIndexDic[enemy]=enemyVect.length;
		}
		public static function addLeitaiPlayer():void
		{
			
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			addLeitaiEnemy(1,level.otherCharacterStartPoint.x,level.otherCharacterStartPoint.y,battleModel.getEnemyHeroData());
		}
		private static function addLeitaiEnemy(enemy_spriteSet:Number, x:Number, y:Number,_zombieData:BattleData_Hero):void
		{
			player=GameManager.manager.player;
			var enemy:Enemy;
			enemy=new Enemy_Leitai();
			udid++;

			enemy.enemy_damagedBy=(0);
			enemy.enemy_spriteSet=(enemy_spriteSet);
			enemy.enemy_face=(0);
			enemy.enemy_anim=(1);
			enemy.enemy_fr=(0);
			enemy.enemy_frOld=(0);
			enemy.enemy_x=(x);
			enemy.enemy_y=(y);
			enemy.enemy_xOld=(x);
			enemy.enemy_yOld=(y);
			enemy.enemy_velX=(0);
			enemy.enemy_velY=(0);
			enemy.enemy_jump=(false);
			enemy.enemy_gunX=(x);
			enemy.enemy_gunY=(y - 50);
			enemy.enemy_gunXOld=(x);
			enemy.enemy_gunYOld=(y - 50);
			enemy.enemy_gunRot=(0);
			enemy.enemy_gunRotOld=(0);
			enemy.enemy_headRot=(0);
			enemy.enemy_radTo=(0);
			// warning
			if(_zombieData){
				enemy.zombieData=_zombieData;
				enemy.enemy_gunEquipped=_zombieData.gunXid;
				enemy.enemyRunSpeed=_zombieData.runSpeed;
				
				enemy.enemy_health_head=(_zombieData.maxHealth);
				enemy.enemy_health_body=(_zombieData.maxHealth);
				enemy.enemy_health_foot=(_zombieData.maxHealth);
				enemy.enemy_health_headMax=(_zombieData.maxHealth);
				enemy.enemy_health_bodyMax=(_zombieData.maxHealth);
				enemy.enemy_health_footMax=(_zombieData.maxHealth);
				enemy.enemy_health_headOld=(_zombieData.maxHealth);
				enemy.enemy_health_bodyOld=(_zombieData.maxHealth);
				enemy.enemy_health_footOld=(_zombieData.maxHealth);
			}
			if(enemy.enemy_gunEquipped>=0){
				enemy.gun_data=GunData.gunDataVect[enemy.enemy_gunEquipped];
			}
			if(_zombieData){
				enemy.gun_enemy_asset=BattleAssetPreload.getInstance().getPlayGunAsset(_zombieData.gunXid);
			}	
			enemy.enemy_aimTime=1;
			enemy.enemy_aimDerTime=0;
			enemy.enemy_recoil_rot=(0);
			enemy.enemy_recoil_rotVel=(0);
			enemy.enemy_recoil_x=(0);
			enemy.enemy_recoil_y=(0);
			enemy.enemy_gunCoolDown=(0);
			enemy.enemy_gunFrame=(0);
			enemy.enemy_burstLength=(0);
			enemy.enemy_engagementDistance=(Math.random() * 100 + 100);
			enemy.enemy_lineOfSightTimer=(0);
			enemy.enemy_nextNode=(-1);
			enemy.enemy_aiState=(0);
			enemy.enemy_maxJumpHeight=(0);
			enemy.enemy_hasLineOfSight=(false);
			enemy.enemy_lineOfSightCountdown=(0);
			enemy.enemy_markedForRemoval=(false);
			enemy.enemy_isHeadless=(false);
			enemy.enemy_statusEffect=(0);
			enemy.enemy_statusEffect_atp=(0);
			enemy.enemy_inacc_x=(0);
			enemy.enemy_inacc_y=(0);
			enemy.enemy_inacc_x_target=(0);
			enemy.enemy_inacc_y_target=(0);
			enemy.enemy_initialized=(0);
			enemy.unId=udid;			
			enemyVect.push(enemy);
			enemyIndexDic[enemy]=enemyVect.length;
		}
		public static var EnemyDie_SN:Signal=new Signal();
		/**
		 * 实际上从屏幕中移除敌人
		 */
		public static function removeEnemy(index:int):void
		{
//			trace("移除敌人:\t"+enemyVect[index].unId);
			
			var dieEnemy:Enemy=enemyVect.splice(index,1)[0];
//			if(!(dieEnemy is Enemy_Leitai))
//			{
//				BattleModel.sendFubenEnemyDie(dieEnemy.zombieData.id);
//			}
//			else
//			{
//				BattleModel.sendLeitaiEnemyDie(dieEnemy.zombieData.id);
//			}
//			EnemyDie_SN.dispatch();
			a--;	
		}
		
		/**
		 * 逻辑上移除敌人
		 */
		public static function removeEnemyLogic(index:int):void
		{
			var dieEnemy:Enemy=enemyVect[index];
			if(!dieEnemy.logic_remove)
			{
				if(!(dieEnemy is Enemy_Leitai))
				{
					BattleModel.sendFubenEnemyDie(dieEnemy.zombieData.id);
				}
				else
				{
					BattleModel.sendLeitaiEnemyDie(dieEnemy.zombieData.id);
				}
				EnemyDie_SN.dispatch();
				dieEnemy.logic_remove=true;
			}
		}
		
		internal static var enemy_large_renderOrder:Array = new Array("gun", "foot2", "ankle2", "pad2", "body", "head", "shoulder", "pad1", "foot1", "ankle1", "sword");
		internal static var enemy_large_spriteOrder:Array = new Array("gun", "foot", "ankle", "pad2", "body", "head", "shoulder", "pad1", "foot", "ankle", "sword");
		internal static var enemy_large_frame:int = 0;
		internal static var enemy_large_anims:Vector.<LargeAnimPosData>;
		internal static var enemy_large_maxFrames:Array;
		internal static var enemy_large_head:Sprite;
		internal static var enemy_large_head_bm:BitmapData;
		internal static var enemy_large_body:Sprite;
		internal static var enemy_large_body_bm:BitmapData;
		internal static var enemy_large_foot:Sprite;
		internal static var enemy_large_foot_bm:BitmapData;
		internal static var enemy_large_ankle:Sprite;
		internal static var enemy_large_ankle_bm:BitmapData;
		internal static var enemy_large_gun:Sprite;
		internal static var enemy_large_gun_bm:BitmapData;
		internal static var enemy_large_sword:Sprite;
		internal static var enemy_large_sword_bm:BitmapData;
		internal static var enemy_large_shoulder:Sprite;
		internal static var enemy_large_shoulder_bm:BitmapData;
		internal static var enemy_large_pad1:Sprite;
		internal static var enemy_large_pad1_bm:BitmapData;
		internal static var enemy_large_pad2:Sprite;
		internal static var enemy_large_pad2_bm:BitmapData;
		
		
		
		public static function initLargeMovieAnimate():void{
			return ;
//			enemy_large_anims=new Vector.<LargeAnimPosData>();
//			enemy_large_maxFrames=[];
//			enemy_large_maxFrames.push(0);
//			enemy_large_anims.push(new LargeAnimPosData());
////			tempMc = new enemy_large1_animationContainer();
//			a = 1;
//			while (a < (tempMc.totalFrames + 1))
//			{
//				
//				tempMc.gotoAndStop(a);
//				enemy_large_maxFrames.push((tempMc.c.totalFrames - 1));
//				b = 1;
//				var movieData:LargeAnimPosData=new LargeAnimPosData();
//				enemy_large_anims.push(movieData);
//				while (b < (tempMc.c.totalFrames + 1))
//				{
//					
//					tempMc.c.gotoAndStop(b);
//					
//					movieData.head_x.push(tempMc.c.head.x);
//					movieData.head_y.push(tempMc.c.head.y);
//					movieData.head_r.push(tempMc.c.head.rotation / (180 / Math.PI));
//					movieData.body_x.push(tempMc.c.body.x);
//					movieData.body_y.push(tempMc.c.body.y);
//					movieData.body_r.push(tempMc.c.body.rotation / (180 / Math.PI));
//					movieData.foot1_x.push(tempMc.c.foot1.x);
//					movieData.foot1_y.push(tempMc.c.foot1.y);
//					movieData.foot1_r.push(tempMc.c.foot1.rotation / (180 / Math.PI));
//					movieData.foot2_x.push(tempMc.c.foot2.x);
//					movieData.foot2_y.push(tempMc.c.foot2.y);
//					movieData.foot2_r.push(tempMc.c.foot2.rotation / (180 / Math.PI));
//					movieData.ankle1_x.push(tempMc.c.ankle1.x);
//					movieData.ankle1_y.push(tempMc.c.ankle1.y);
//					movieData.ankle1_r.push(tempMc.c.ankle1.rotation / (180 / Math.PI));
//					movieData.ankle2_x.push(tempMc.c.ankle2.x);
//					movieData.ankle2_y.push(tempMc.c.ankle2.y);
//					movieData.ankle2_r.push(tempMc.c.ankle2.rotation / (180 / Math.PI));
//					movieData.gun_x.push(tempMc.c.gun.x);
//					movieData.gun_y.push(tempMc.c.gun.y);
//					movieData.gun_r.push(tempMc.c.gun.rotation / (180 / Math.PI));
//					movieData.sword_x.push(tempMc.c.sword.x);
//					movieData.sword_y.push(tempMc.c.sword.y);
//					movieData.sword_r.push(tempMc.c.sword.rotation / (180 / Math.PI));
//					movieData.shoulder_x.push(tempMc.c.shoulder.x);
//					movieData.shoulder_y.push(tempMc.c.shoulder.y);
//					movieData.shoulder_r.push(tempMc.c.shoulder.rotation / (180 / Math.PI));
//					movieData.pad1_x.push(tempMc.c.pad1.x);
//					movieData.pad1_y.push(tempMc.c.pad1.y);
//					movieData.pad1_r.push(tempMc.c.pad1.rotation / (180 / Math.PI));
//					movieData.pad2_x.push(tempMc.c.pad2.x);
//					movieData.pad2_y.push(tempMc.c.pad2.y);
//					movieData.pad2_r.push(tempMc.c.pad2.rotation / (180 / Math.PI));
//					
//					b  ++ ;
//					
//				}
//				
//				a  ++ ;
//				
//			}
//			
//			enemy_large_head = new Sprite();
//			enemy_large_head_bm = new BitmapData(1, 1, true, 0);
//			enemy_large_body = new Sprite();
//			enemy_large_body_bm = new BitmapData(1, 1, true, 0);
//			enemy_large_foot = new Sprite();
//			enemy_large_foot_bm = new BitmapData(1, 1, true, 0);
//			enemy_large_ankle = new Sprite();
//			enemy_large_ankle_bm = new BitmapData(1, 1, true, 0);
//			enemy_large_gun = new Sprite();
//			enemy_large_gun_bm = new BitmapData(1, 1, true, 0);
//			enemy_large_sword = new Sprite();
//			enemy_large_sword_bm = new BitmapData(1, 1, true, 0);
//			enemy_large_shoulder = new Sprite();
//			enemy_large_shoulder_bm = new BitmapData(1, 1, true, 0);
//			enemy_large_pad1 = new Sprite();
//			enemy_large_pad1_bm = new BitmapData(1, 1, true, 0);
//			enemy_large_pad2 = new Sprite();
//			enemy_large_pad2_bm = new BitmapData(1, 1, true, 0);
//			var tempParts:Array = new Array(0, "head", "body", "foot", "ankle", "gun", "sword", "shoulder", "pad1", "pad2");
//			a = 1;
//			while (a < 10)
//			{
//				
//				switch(a)
//				{
//					case 1:
//					{
//						tempMc = new enemy_large1_head_mc();
//						break;
//					}
//					case 2:
//					{
//						tempMc = new enemy_large1_body_mc();
//						break;
//					}
//					case 3:
//					{
//						tempMc = new enemy_large1_foot_mc();
//						break;
//					}
//					case 4:
//					{
//						tempMc = new enemy_large1_ankle_mc();
//						break;
//					}
//					case 5:
//					{
//						tempMc = new enemy_large1_gun_mc();
//						break;
//					}
//					case 6:
//					{
//						tempMc = new enemy_large1_sword_mc();
//						break;
//					}
//					case 7:
//					{
//						tempMc = new enemy_large1_shoulder_mc();
//						break;
//					}
//					case 8:
//					{
//						tempMc = new enemy_large1_pad1_mc();
//						break;
//					}
//					case 9:
//					{
//						tempMc = new enemy_large1_pad2_mc();
//						break;
//					}
//					default:
//					{
//						break;
//					}
//				}
//				Enemy["enemy_large_" + tempParts[a] + "_bm"] = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
//				tempMc.box.visible = false;
//				trans = new Matrix();
//				trans.tx = -tempMc.box.x;
//				trans.ty = -tempMc.box.y;
//				Enemy["enemy_large_" + tempParts[a] + "_bm"].draw(tempMc, trans);
//				trans.tx = tempMc.box.x;
//				trans.ty = tempMc.box.y;
//				Enemy["enemy_large_" + tempParts[a]].graphics.clear();
//				Enemy["enemy_large_" + tempParts[a]].graphics.beginBitmapFill(Enemy["enemy_large_" + tempParts[a] + "_bm"], trans, false, true);
//				Enemy["enemy_large_" + tempParts[a]].graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
//				
//				a  ++ ;
//				
//			}
			
		}
		
		
		////        bean
		
		public static var beanAnimDataVect:Vector.<BeanAnimData>;
		public static var teenieAnimDataVect:Vector.<TeenieAnimData>;
		
		
		public static function initBeamMovieData():void{
			beanAnimDataVect=new Vector.<BeanAnimData>();
		
//			tempMc = new stinkyBean_anim();
//			a = 0;
//			while (a < tempMc.totalFrames)
//			{
//				var beanData:BeanAnimData=new BeanAnimData();
//				beanAnimDataVect.push(beanData);
//				tempMc.gotoAndStop((a + 1));
//				beanData.beanAnimWidth=(tempMc.width);
//				beanData.beanAnimHeight=(tempMc.height);
//				beanData.beanAnimOrigin_x=(tempMc.anim.origin.x);
//				beanData.beanAnimOrigin_y=(tempMc.anim.origin.y);
//				beanData.beanAnimFrMax=((tempMc.anim.totalFrames - 1));
//				beanData.bean_anim_0 = new BitmapData(tempMc.width * tempMc.anim.totalFrames, tempMc.height, true, 0);
//				beanData.bean_anim_1 = new BitmapData(tempMc.width * tempMc.anim.totalFrames, tempMc.height, true, 0);
//				trans = new Matrix();
//				b = 0;
//				while (b < tempMc.anim.totalFrames)
//				{
//					
//					tempMc.anim.gotoAndStop((b + 1));
//					trans.tx = b * tempMc.width;
//					trans.ty = 0;
//					beanData.bean_anim_0.draw(tempMc, trans);
//					
//					b  ++ ;
//					
//				}
//				trans = new Matrix();
//				trans.a = -1;
//				b = 0;
//				while (b < tempMc.anim.totalFrames)
//				{
//					
//					tempMc.anim.gotoAndStop((b + 1));
//					trans.tx = (b + 1) * tempMc.width;
//					trans.ty = 0;
//					beanData.bean_anim_1.draw(tempMc, trans);
//					
//					b  ++ ;
//					
//				}
//				
//				a  ++ ;
//				
//			}
//			teenieAnimDataVect=new Vector.<TeenieAnimData>();
//			tempMc = new teenieBeanie_anim();
//			a = 0;
//			while (a < tempMc.totalFrames)
//			{
//				var teenieData:TeenieAnimData=new TeenieAnimData();
//				teenieAnimDataVect.push(teenieData);
//				tempMc.gotoAndStop((a + 1));
//				teenieData.teenieAnimWidth=(tempMc.width);
//				teenieData.teenieAnimHeight=(tempMc.height);
//				teenieData.teenieAnimOrigin_x=(tempMc.anim.origin.x);
//				teenieData.teenieAnimOrigin_y=(tempMc.anim.origin.y);
//				teenieData.teenieAnimFrMax=((tempMc.anim.totalFrames - 1));
//				teenieData.teenie_anim_0 = new BitmapData(tempMc.width * tempMc.anim.totalFrames, tempMc.height, true, 0);
//				teenieData.teenie_anim_1 = new BitmapData(tempMc.width * tempMc.anim.totalFrames, tempMc.height, true, 0);
//				trans = new Matrix();
//				b = 0;
//				while (b < tempMc.anim.totalFrames)
//				{
//					
//					tempMc.anim.gotoAndStop((b + 1));
//					trans.tx = b * tempMc.width;
//					trans.ty = 0;
//					teenieData.teenie_anim_0.draw(tempMc, trans);
//					
//					b  ++ ;
//					
//				}
//				trans = new Matrix();
//				trans.a = -1;
//				b = 0;
//				while (b < tempMc.anim.totalFrames)
//				{
//					
//					tempMc.anim.gotoAndStop((b + 1));
//					trans.tx = (b + 1) * tempMc.width;
//					trans.ty = 0;
//					teenieData.teenie_anim_1.draw(tempMc, trans);
//					
//					b  ++ ;
//					
//				}
//				
//				a  ++ ;
//			}
		}
		
		
		public static var zombieMovieDataVect:Vector.<ZombieMovieData>;
		/*public static var zombieAssetVect:Vector.<ZombieAsset>;
		
		
		public static function initZombieMovieData():void{
			zombieMovieDataVect=new Vector.<ZombieMovieData>();
			zombieAssetVect=new Vector.<ZombieAsset>();
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
		
			
			
			a = 0;
			while (a < 6)
			{
				var zombieAsset:ZombieAsset=new ZombieAsset();
				zombieAssetVect.push(zombieAsset);
				
				tempMc = new zombie_head_mc();
				tempMc.gotoAndStop(a);
				zombieAsset.head_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
				tempMc.box.visible = false;
				tempMc.filters = [new ColorMatrixFilter(tileSet.levelColorFilter.CalculateFinalFlatArray())];
				trans = new Matrix();
				trans.tx = -tempMc.box.x;
				trans.ty = -tempMc.box.y;
				zombieAsset.head_bm.draw(tempMc, trans);
				trans.tx = tempMc.box.x;
				trans.ty = tempMc.box.y;
				zombieAsset.head.graphics.clear();
				zombieAsset.head.graphics.beginBitmapFill(zombieAsset.head_bm, trans, false, true);
				
				zombieAsset.head.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
				tempMc = new zombie_body_mc();
				tempMc.gotoAndStop(a);
				
				zombieAsset.body_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
				tempMc.box.visible = false;
				tempMc.filters = [new ColorMatrixFilter(tileSet.levelColorFilter.CalculateFinalFlatArray())];
				trans = new Matrix();
				trans.tx = -tempMc.box.x;
				trans.ty = -tempMc.box.y;
				zombieAsset.body_bm.draw(tempMc, trans);
				trans.tx = tempMc.box.x;
				trans.ty = tempMc.box.y;
				zombieAsset.body.graphics.clear();
				zombieAsset.body.graphics.beginBitmapFill(zombieAsset.body_bm, trans, false, true);
				
				zombieAsset.body.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
				tempMc = new zombie_foot_mc();
				tempMc.gotoAndStop(a);
				zombieAsset.foot_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
				tempMc.box.visible = false;
				tempMc.filters = [new ColorMatrixFilter(tileSet.levelColorFilter.CalculateFinalFlatArray())];
				trans = new Matrix();
				trans.tx = -tempMc.box.x;
				trans.ty = -tempMc.box.y;
				zombieAsset.foot_bm.draw(tempMc, trans);
				trans.tx = tempMc.box.x;
				trans.ty = tempMc.box.y;
				zombieAsset.foot.graphics.clear();
				zombieAsset.foot.graphics.beginBitmapFill(zombieAsset.foot_bm, trans, false, true);
				
				zombieAsset.foot.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
				tempMc = new zombie_ankle_mc();
				tempMc.gotoAndStop(a);
				zombieAsset.ankle_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
				tempMc.box.visible = false;
				tempMc.filters = [new ColorMatrixFilter(tileSet.levelColorFilter.CalculateFinalFlatArray())];
				trans = new Matrix();
				trans.tx = -tempMc.box.x;
				trans.ty = -tempMc.box.y;
				zombieAsset.ankle_bm.draw(tempMc, trans);
				trans.tx = tempMc.box.x;
				trans.ty = tempMc.box.y;
				zombieAsset.ankle.graphics.clear();
				zombieAsset.ankle.graphics.beginBitmapFill(zombieAsset.ankle_bm, trans, false, false);
				zombieAsset.ankle.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
				tempMc = new zombie_hand1_mc();
				tempMc.gotoAndStop(a);
				zombieAsset.hand1_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
				tempMc.box.visible = false;
				tempMc.filters = [new ColorMatrixFilter(tileSet.levelColorFilter.CalculateFinalFlatArray())];
				trans = new Matrix();
				trans.tx = -tempMc.box.x;
				trans.ty = -tempMc.box.y;
				zombieAsset.hand1_bm.draw(tempMc, trans);
				trans.tx = tempMc.box.x;
				trans.ty = tempMc.box.y;
				zombieAsset.hand1.graphics.clear();
				zombieAsset.hand1.graphics.beginBitmapFill(zombieAsset.hand1_bm, trans, false, true);
//				if (smoothEnemies == true)
//				{
//					zombieAsset.hand1.graphics.beginBitmapFill(zombieAsset.hand1_bm, trans, false, true);
//				}
//				else
//				{
//					zombieAsset.hand1.graphics.beginBitmapFill(zombieAsset.hand1_bm, trans, false, false);
//				}
				zombieAsset.hand1.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
				tempMc = new zombie_hand2_mc();
				tempMc.gotoAndStop(a);
				zombieAsset.hand2_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
				tempMc.box.visible = false;
				tempMc.filters = [new ColorMatrixFilter(tileSet.levelColorFilter.CalculateFinalFlatArray())];
				trans = new Matrix();
				trans.tx = -tempMc.box.x;
				trans.ty = -tempMc.box.y;
				zombieAsset.hand2_bm.draw(tempMc, trans);
				trans.tx = tempMc.box.x;
				trans.ty = tempMc.box.y;
				zombieAsset.hand2.graphics.clear();
				zombieAsset.hand2.graphics.beginBitmapFill(zombieAsset.hand2_bm, trans, false, true);
//				if (smoothEnemies == true)
//				{
//					zombieAsset.hand2.graphics.beginBitmapFill(zombieAsset.hand2_bm, trans, false, true);
//				}
//				else
//				{
//					zombieAsset.hand2.graphics.beginBitmapFill(zombieAsset.hand2_bm, trans, false, false);
//				}
				zombieAsset.hand2.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
				
				a  ++ ;
				
			}
			
			
		}*/
		
		
		
		public static var charAnimDataVect:Vector.<CharAnimData>;
//		public static var charSpriteAssetVect:Vector.<CharSpriteAsset>;
		
		public static var charSpriteAssetDic:Object;
		
		private static function createCharSpriteAsset(appearance:Array,colors:Array):CharSpriteAsset{
			var charAsset:CharSpriteAsset=new CharSpriteAsset();
			//				charSpriteAssetVect.push(charAsset);
			
			tempMc = new character_head_mc();
			charAsset.character_appearance=appearance;
			charAsset.character_colors=colors;
			//				charAsset.character_appearance=[36, 2, 10, 4, 5, 6];//characterCofigMap[tileSet.id].character_appearance;
			//				charAsset.character_colors=[3702459, 0x333333, 0x333333, 0x333333, 3702459, 11461375, 3702459, 0x333333, 3702459, 0x999999];//characterCofigMap[tileSet.id].character_colors;
			
			tempMc.gotoAndStop(charAsset.character_appearance[0]);
			tempMc.eye.gotoAndStop(charAsset.character_appearance[1]);
			tempMc.face.gotoAndStop(charAsset.character_appearance[5]);
			character_colorTransform = tempMc.color1.transform.colorTransform;
			character_colorTransform.color = charAsset.character_colors[0];
			tempMc.color1.transform.colorTransform = character_colorTransform;
			character_colorTransform = tempMc.color2.transform.colorTransform;
			character_colorTransform.color = charAsset.character_colors[1];
			tempMc.color2.transform.colorTransform = character_colorTransform;
			character_colorTransform = tempMc.color3.transform.colorTransform;
			character_colorTransform.color = charAsset.character_colors[0];
			tempMc.color3.transform.colorTransform = character_colorTransform;
			character_colorTransform = tempMc.eye.color1.transform.colorTransform;
			character_colorTransform.color = charAsset.character_colors[2];
			tempMc.eye.color1.transform.colorTransform = character_colorTransform;
			character_colorTransform = tempMc.eye.color2.transform.colorTransform;
			character_colorTransform.color = charAsset.character_colors[3];
			tempMc.eye.color2.transform.colorTransform = character_colorTransform;
			charAsset.char_head_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
			tempMc.box.visible = false;
			tempMc.filters = [new ColorMatrixFilter(tileSet.levelColorFilter.CalculateFinalFlatArray())];
			trans = new Matrix();
			trans.tx = -(tempMc.box.x);
			trans.ty = -(tempMc.box.y);
			charAsset.char_head_bm.draw(tempMc, trans);
			trans.tx = tempMc.box.x;
			trans.ty = tempMc.box.y;
			charAsset.char_head.graphics.clear();
			charAsset.char_head.graphics.beginBitmapFill(charAsset.char_head_bm, trans, false, true);
//			if ((((((a == 0)) && ((smoothPlayer == true)))) || ((((a > 0)) && ((smoothEnemies == true)))))){
//				charAsset.char_head.graphics.beginBitmapFill(charAsset.char_head_bm, trans, false, true);
//			}
//			else {
//				charAsset.char_head.graphics.beginBitmapFill(charAsset.char_head_bm, trans, false, false);
//			};
			charAsset.char_head.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
			tempMc = new character_body_mc();
			tempMc.gotoAndStop(charAsset.character_appearance[2]);
			character_colorTransform = tempMc.color1.transform.colorTransform;
			character_colorTransform.color = charAsset.character_colors[4];
			tempMc.color1.transform.colorTransform = character_colorTransform;
			character_colorTransform = tempMc.color2.transform.colorTransform;
			character_colorTransform.color = charAsset.character_colors[5];
			tempMc.color2.transform.colorTransform = character_colorTransform;
			charAsset.char_body_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
			tempMc.box.visible = false;
			tempMc.filters = [new ColorMatrixFilter(tileSet.levelColorFilter.CalculateFinalFlatArray())];
			trans = new Matrix();
			trans.tx = -(tempMc.box.x);
			trans.ty = -(tempMc.box.y);
			charAsset.char_body_bm.draw(tempMc, trans);
			trans.tx = tempMc.box.x;
			trans.ty = tempMc.box.y;
			charAsset.char_body.graphics.clear();
			charAsset.char_body.graphics.beginBitmapFill(charAsset.char_body_bm, trans, false, true);
//			if ((((((a == 0)) && ((smoothPlayer == true)))) || ((((a > 0)) && ((smoothEnemies == true)))))){
//				charAsset.char_body.graphics.beginBitmapFill(charAsset.char_body_bm, trans, false, true);
//			}
//			else {
//				charAsset.char_body.graphics.beginBitmapFill(charAsset.char_body_bm, trans, false, false);
//			};
			charAsset.char_body.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
			tempMc = new character_foot_mc();
			tempMc.gotoAndStop(charAsset.character_appearance[4]);
			charAsset.char_foot_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
			tempMc.box.visible = false;
			tempMc.filters = [new ColorMatrixFilter(tileSet.levelColorFilter.CalculateFinalFlatArray())];
			character_colorTransform = tempMc.color1.transform.colorTransform;
			character_colorTransform.color = charAsset.character_colors[8];
			tempMc.color1.transform.colorTransform = character_colorTransform;
			character_colorTransform = tempMc.color2.transform.colorTransform;
			character_colorTransform.color = charAsset.character_colors[9];
			tempMc.color2.transform.colorTransform = character_colorTransform;
			trans = new Matrix();
			trans.tx = -(tempMc.box.x);
			trans.ty = -(tempMc.box.y);
			charAsset.char_foot_bm.draw(tempMc, trans);
			trans.tx = tempMc.box.x;
			trans.ty = tempMc.box.y;
			charAsset.char_foot.graphics.clear();
			charAsset.char_foot.graphics.beginBitmapFill(charAsset.char_foot_bm, trans, false, true);
//			if ((((((a == 0)) && ((smoothPlayer == true)))) || ((((a > 0)) && ((smoothEnemies == true)))))){
//				charAsset.char_foot.graphics.beginBitmapFill(charAsset.char_foot_bm, trans, false, true);
//			}
//			else {
//				charAsset.char_foot.graphics.beginBitmapFill(charAsset.char_foot_bm, trans, false, false);
//			};
			charAsset.char_foot.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
			tempMc = new character_ankle_mc();
			tempMc.gotoAndStop(charAsset.character_appearance[4]);
			character_colorTransform = tempMc.color1.transform.colorTransform;
			character_colorTransform.color = charAsset.character_colors[8];
			tempMc.color1.transform.colorTransform = character_colorTransform;
			charAsset.char_ankle_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
			tempMc.box.visible = false;
			tempMc.filters = [new ColorMatrixFilter(tileSet.levelColorFilter.CalculateFinalFlatArray())];
			trans = new Matrix();
			trans.tx = -(tempMc.box.x);
			trans.ty = -(tempMc.box.y);
			charAsset.char_ankle_bm.draw(tempMc, trans);
			trans.tx = tempMc.box.x;
			trans.ty = tempMc.box.y;
			charAsset.char_ankle.graphics.clear();
			charAsset.char_ankle.graphics.beginBitmapFill(charAsset.char_ankle_bm, trans, false, false);
			charAsset.char_ankle.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
			tempMc = new character_hand1_mc();
			tempMc.gotoAndStop(charAsset.character_appearance[3]);
			character_colorTransform = tempMc.color1.transform.colorTransform;
			character_colorTransform.color = charAsset.character_colors[6];
			tempMc.color1.transform.colorTransform = character_colorTransform;
			charAsset.char_hand1_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
			tempMc.box.visible = false;
			tempMc.filters = [new ColorMatrixFilter(tileSet.levelColorFilter.CalculateFinalFlatArray())];
			trans = new Matrix();
			trans.tx = -(tempMc.box.x);
			trans.ty = -(tempMc.box.y);
			charAsset.char_hand1_bm.draw(tempMc, trans);
			trans.tx = tempMc.box.x;
			trans.ty = tempMc.box.y;
			charAsset.char_hand1.graphics.clear();
			charAsset.char_hand1.graphics.beginBitmapFill(charAsset.char_hand1_bm, trans, false, true);
//			if ((((((a == 0)) && ((smoothPlayer == true)))) || ((((a > 0)) && ((smoothEnemies == true)))))){
//				charAsset.char_hand1.graphics.beginBitmapFill(charAsset.char_hand1_bm, trans, false, true);
//			}
//			else {
//				charAsset.char_hand1.graphics.beginBitmapFill(charAsset.char_hand1_bm, trans, false, false);
//			};
			charAsset.char_hand1.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
			tempMc = new character_hand2_mc();
			tempMc.gotoAndStop(charAsset.character_appearance[3]);
			character_colorTransform = tempMc.color1.transform.colorTransform;
			character_colorTransform.color = charAsset.character_colors[6];
			tempMc.color1.transform.colorTransform = character_colorTransform;
			charAsset.char_hand2_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
			tempMc.box.visible = false;
			tempMc.filters = [new ColorMatrixFilter(tileSet.levelColorFilter.CalculateFinalFlatArray())];
			trans = new Matrix();
			trans.tx = -(tempMc.box.x);
			trans.ty = -(tempMc.box.y);
			charAsset.char_hand2_bm.draw(tempMc, trans);
			trans.tx = tempMc.box.x;
			trans.ty = tempMc.box.y;
			charAsset.char_hand2.graphics.clear();
			charAsset.char_hand2.graphics.beginBitmapFill(charAsset.char_hand2_bm, trans, false, true);
//			if ((((((a == 0)) && ((smoothPlayer == true)))) || ((((a > 0)) && ((smoothEnemies == true)))))){
//				charAsset.char_hand2.graphics.beginBitmapFill(charAsset.char_hand2_bm, trans, false, true);
//			}
//			else {
//				charAsset.char_hand2.graphics.beginBitmapFill(charAsset.char_hand2_bm, trans, false, false);
//			};
			charAsset.char_hand2.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
			return charAsset;
		}
		
		public static function init():void{
			charAnimDataVect=assetConfig.charAnimDataVect;
			charSpriteAssetDic=assetConfig.charAssetDic;
			zombieMovieDataVect=assetConfig.zombieMovieDataVect;
//			initZombieMovieData();
		}
		
	}
}