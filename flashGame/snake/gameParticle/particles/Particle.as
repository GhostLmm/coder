package snake.gameParticle.particles
{
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import snake.BattleAssetPreload;
	import snake.GameCanvas;
	import snake.GameLevel;
	import snake.GameManager;
	import snake.GameObjective;
	import snake.GameSoundSFX;
	import snake.GameTileSet;
	import snake.gameEnemys.Enemy;
	import snake.gameEnemys.Enemy_1;
	import snake.gameEnemys.ZombieMovieData;
	import snake.gameobj.Player;
	import snake.viewdata.battle.AttackComputeData;

	public class Particle
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
		public static var bullet_dx:Number;
		public static var bullet_dy:Number;
		
		public static var gaussStartPoint_x:Number;
		public static var gaussStartPoint_y:Number;
		public static var gaussLength:int;
		
		
		public static var shellHeight:Array = new Array(2, 2, 4, 3, 6, 6, 6, 6, 8);
		
		public function Particle()
		{
		}
		
		public static var level:GameLevel;
		public static var tileSet:GameTileSet;
		public static var canvas:GameCanvas;
//		public static var assetConfig:AssetConfig;
		public static var assetConfig:BattleAssetPreload;
		public static var sound:GameSoundSFX;
		public static var objective:GameObjective;
		
		
		public var particle_type:int;
		public var particle_x:Number;
		public var particle_y:Number;
		public var particle_r:Number;
		public var particle_xOld:Number;
		public var particle_yOld:Number;
		public var particle_rOld:Number;
		public var particle_velX:Number;
		public var particle_velY:Number;
		public var particle_frame:Number;
		public var particle_p1:Number;
		
		
		public var particle_p2:Number;
		public var particle_p3:Number;
		/** 子弹的阵营 敌方还是朋友 **/
		public var particle_p4:Number;
		public var particle_p5:Number;
		
		public var attackComputeData:AttackComputeData;
		
		
		
		public function excuteLogic():void{
			
		}
		
		public function excuteRender():void{
			
		}
		
		private function bullectCollisions_1(target:Enemy):void{
			if (target.enemy_markedForRemoval == false){
				if (Math.abs((particle_x - target.enemy_x)) < 25){
					if (Math.abs((particle_y - (target.enemy_y - 50))) < 50){
						if (target.enemy_face == 0){
							
							bullet_dx = (particle_x - (target.enemy_x + Enemy.charAnimDataVect[target.enemy_anim].head_x[target.enemy_fr]));
							bullet_dy = (particle_y - (target.enemy_y + Enemy.charAnimDataVect[target.enemy_anim].head_y[target.enemy_fr]));
							if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 20){
								particle_frame = 2;
								if (particle_type != 16){
									b = 100;
								};
								
								dealDamage(target,attackComputeData);
								//									target.enemy_health_head = (target.enemy_health_head - particle_p5);
								//									//Fantasy
								//									showDamage(target,particle_p5);
								//									//
								target.enemy_damagedBy = particle_p3;
								if (particle_type == 12){
									target.enemy_statusEffect = 1;
									target.enemy_statusEffect_atp = 0.1;
								};
								c = (Enemy.enemyVect.length + 1);
							}
							else {
								bullet_dx = (particle_x - (target.enemy_x + Enemy.charAnimDataVect[target.enemy_anim].body_x[target.enemy_fr]));
								bullet_dy = (particle_y - (target.enemy_y + Enemy.charAnimDataVect[target.enemy_anim].body_y[target.enemy_fr]));
								if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 16){
									particle_frame = 2;
									if (particle_type != 16){
										b = 100;
									};
									dealDamage(target,attackComputeData);
									//										target.enemy_health_body = (target.enemy_health_body - particle_p5);
									//										//Fantasy
									//										showDamage(target,particle_p5);
									//										//
									target.enemy_damagedBy = particle_p3;
									if (particle_type == 12){
										target.enemy_statusEffect = 1;
										target.enemy_statusEffect_atp = 0.1;
									};
									c = (Enemy.enemyVect.length + 1);
								}
								else {
									bullet_dx = (particle_x - (target.enemy_x + Enemy.charAnimDataVect[target.enemy_anim].foot2_x[target.enemy_fr]));
									bullet_dy = (particle_y - (target.enemy_y + Enemy.charAnimDataVect[target.enemy_anim].foot2_y[target.enemy_fr]));
									if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 12){
										particle_frame = 2;
										if (particle_type != 16){
											b = 100;
										};
										dealDamage(target,attackComputeData);
										//											target.enemy_health_foot = (target.enemy_health_foot - particle_p5);
										//											//Fantasy
										//											showDamage(target,particle_p5);
										//											//
										target.enemy_damagedBy = particle_p3;
										if (particle_type == 12){
											target.enemy_statusEffect = 1;
											target.enemy_statusEffect_atp = 0.1;
										};
										c = (Enemy.enemyVect.length + 1);
									}
									else {
										bullet_dx = (particle_x - (target.enemy_x + Enemy.charAnimDataVect[target.enemy_anim].foot1_x[target.enemy_fr]));
										bullet_dy = (particle_y - (target.enemy_y + Enemy.charAnimDataVect[target.enemy_anim].foot1_y[target.enemy_fr]));
										if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 12){
											particle_frame = 2;
											if (particle_type != 16){
												b = 100;
											};
											dealDamage(target,attackComputeData);
											//												target.enemy_health_foot = (target.enemy_health_foot - particle_p5);
											//												//Fantasy
											//												showDamage(target,particle_p5);
											//												//
											target.enemy_damagedBy = particle_p3;
											if (particle_type == 12){
												target.enemy_statusEffect = 1;
												target.enemy_statusEffect_atp = 0.1;
											};
											c = (Enemy.enemyVect.length + 1);
										};
									};
								};
							};
						}
						else {
							bullet_dx = (particle_x - (target.enemy_x - Enemy.charAnimDataVect[target.enemy_anim].head_x[target.enemy_fr]));
							bullet_dy = (particle_y - (target.enemy_y + Enemy.charAnimDataVect[target.enemy_anim].head_y[target.enemy_fr]));
							if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 20){
								particle_frame = 2;
								if (particle_type != 16){
									b = 100;
								};
								dealDamage(target,attackComputeData);
								//									target.enemy_health_head = (target.enemy_health_head - particle_p5);
								//									//Fantasy
								//									showDamage(target,particle_p5);
								//									//
								target.enemy_damagedBy = particle_p3;
								if (particle_type == 12){
									target.enemy_statusEffect = 1;
									target.enemy_statusEffect_atp = 0.1;
								};
								c = (Enemy.enemyVect.length + 1);
							}
							else {
								bullet_dx = (particle_x - (target.enemy_x - Enemy.charAnimDataVect[target.enemy_anim].body_x[target.enemy_fr]));
								bullet_dy = (particle_y - (target.enemy_y + Enemy.charAnimDataVect[target.enemy_anim].body_y[target.enemy_fr]));
								if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 16){
									particle_frame = 2;
									if (particle_type != 16){
										b = 100;
									};
									dealDamage(target,attackComputeData);
									
									//										target.enemy_health_body = (target.enemy_health_body - particle_p5);
									//										//Fantasy
									//										showDamage(target,particle_p5);
									//										//
									
									target.enemy_damagedBy = particle_p3;
									if (particle_type == 12){
										target.enemy_statusEffect = 1;
										target.enemy_statusEffect_atp = 0.1;
									};
									c = (Enemy.enemyVect.length + 1);
								}
								else {
									bullet_dx = (particle_x - (target.enemy_x - Enemy.charAnimDataVect[target.enemy_anim].foot2_x[target.enemy_fr]));
									bullet_dy = (particle_y - (target.enemy_y + Enemy.charAnimDataVect[target.enemy_anim].foot2_y[target.enemy_fr]));
									if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 12){
										particle_frame = 2;
										if (particle_type != 16){
											b = 100;
										};
										dealDamage(target,attackComputeData);
										//											target.enemy_health_foot = (target.enemy_health_foot - particle_p5);
										//											//Fantasy
										//											showDamage(target,particle_p5);
										//											//
										target.enemy_damagedBy = particle_p3;
										if (particle_type == 12){
											target.enemy_statusEffect = 1;
											target.enemy_statusEffect_atp = 0.1;
										};
										c = (Enemy.enemyVect.length + 1);
									}
									else {
										bullet_dx = (particle_x - (target.enemy_x - Enemy.charAnimDataVect[target.enemy_anim].foot1_x[target.enemy_fr]));
										bullet_dy = (particle_y - (target.enemy_y + Enemy.charAnimDataVect[target.enemy_anim].foot1_y[target.enemy_fr]));
										if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 12){
											particle_frame = 2;
											if (particle_type != 16){
												b = 100;
											};
											dealDamage(target,attackComputeData);
											//												target.enemy_health_foot = (target.enemy_health_foot - particle_p5);
											//												//Fantasy
											//												showDamage(target,particle_p5);
											//												//
											target.enemy_damagedBy = particle_p3;
											if (particle_type == 12){
												target.enemy_statusEffect = 1;
												target.enemy_statusEffect_atp = 0.1;
											};
											c = (Enemy.enemyVect.length + 1);
										};
									};
								};
							};
						};
					};
				};
			};
			
		}
		private function bullectCollisions_6(target:Enemy):void{
			var zombieMovieData:ZombieMovieData =Enemy.zombieMovieDataVect[target.enemy_anim];
			if (target.enemy_markedForRemoval == false){
				if (Math.abs((particle_x - target.enemy_x)) < 25){
					if (Math.abs((particle_y - (target.enemy_y - 50))) < 50){
						if (target.enemy_face == 0){
							bullet_dx = (particle_x - (target.enemy_x + zombieMovieData.head_x[int(target.enemy_fr)]));
								bullet_dy = (particle_y - (target.enemy_y + zombieMovieData.head_y[int(target.enemy_fr)]));
									if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 20){
										particle_frame = 2;
										if (particle_type != 16){
											b = 100;
										};
//										target.enemy_health_head = (target.enemy_health_head - particle_p5);
										dealDamage(target,attackComputeData);
										target.enemy_damagedBy = particle_p3;
										if (particle_type == 12){
											target.enemy_statusEffect = 1;
											target.enemy_statusEffect_atp = 0.1;
										};
										c = (Enemy.enemyVect.length + 1);
									}
									else {
										
										bullet_dx = (particle_x - (target.enemy_x + zombieMovieData.body_x[int(target.enemy_fr)]));
											bullet_dy = (particle_y - (target.enemy_y + zombieMovieData.body_y[int(target.enemy_fr)]));
												if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 16){
													particle_frame = 2;
													if (particle_type != 16){
														b = 100;
													};
//													target.enemy_health_body = (target.enemy_health_body - particle_p5);
													dealDamage(target,attackComputeData);
													target.enemy_damagedBy = particle_p3;
													if (particle_type == 12){
														target.enemy_statusEffect = 1;
														target.enemy_statusEffect_atp = 0.1;
													};
													c = (Enemy.enemyVect.length + 1);
												}
												else {
													bullet_dx = (particle_x - (target.enemy_x + zombieMovieData.foot2_x[int(target.enemy_fr)]));
														bullet_dy = (particle_y - (target.enemy_y + zombieMovieData.foot2_y[int(target.enemy_fr)]));
															if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 12){
																particle_frame = 2;
																if (particle_type != 16){
																	b = 100;
																};
//																target.enemy_health_foot = (target.enemy_health_foot - particle_p5);
																dealDamage(target,attackComputeData);
																target.enemy_damagedBy = particle_p3;
																if (particle_type == 12){
																	target.enemy_statusEffect = 1;
																	target.enemy_statusEffect_atp = 0.1;
																};
																c = (Enemy.enemyVect.length + 1);
															}
															else {
																bullet_dx = (particle_x - (target.enemy_x + zombieMovieData.foot1_x[int(target.enemy_fr)]));
																	bullet_dy = (particle_y - (target.enemy_y + zombieMovieData.foot1_y[int(target.enemy_fr)]));
																		if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 12){
																			particle_frame = 2;
																			if (particle_type != 16){
																				b = 100;
																			};
//																			target.enemy_health_foot = (target.enemy_health_foot - particle_p5);
																			dealDamage(target,attackComputeData);
																			target.enemy_damagedBy = particle_p3;
																			if (particle_type == 12){
																				target.enemy_statusEffect = 1;
																				target.enemy_statusEffect_atp = 0.1;
																			};
																			c = (Enemy.enemyVect.length + 1);
																		};
																		};
															};
												};
									}
						else {
							bullet_dx = (particle_x - (target.enemy_x - zombieMovieData.head_x[int(target.enemy_fr)]));
								bullet_dy = (particle_y - (target.enemy_y + zombieMovieData.head_y[int(target.enemy_fr)]));
									if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 20){
										particle_frame = 2;
										if (particle_type != 16){
											b = 100;
										};
//										target.enemy_health_head = (target.enemy_health_head - particle_p5);
										dealDamage(target,attackComputeData);
										target.enemy_damagedBy = particle_p3;
										if (particle_type == 12){
											target.enemy_statusEffect = 1;
											target.enemy_statusEffect_atp = 0.1;
										};
										c = (Enemy.enemyVect.length + 1);
									}
									else {
										bullet_dx = (particle_x - (target.enemy_x - zombieMovieData.body_x[int(target.enemy_fr)]));
											bullet_dy = (particle_y - (target.enemy_y + zombieMovieData.body_y[int(target.enemy_fr)]));
												if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 16){
													particle_frame = 2;
													if (particle_type != 16){
														b = 100;
													};
//													target.enemy_health_body = (target.enemy_health_body - particle_p5);
													dealDamage(target,attackComputeData);
													target.enemy_damagedBy = particle_p3;
													if (particle_type == 12){
														target.enemy_statusEffect = 1;
														target.enemy_statusEffect_atp = 0.1;
													};
													c = (Enemy.enemyVect.length + 1);
												}
												else {
													bullet_dx = (particle_x - (target.enemy_x - zombieMovieData.foot2_x[int(target.enemy_fr)]));
														bullet_dy = (particle_y - (target.enemy_y + zombieMovieData.foot2_y[int(target.enemy_fr)]));
															if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 12){
																particle_frame = 2;
																if (particle_type != 16){
																	b = 100;
																};
//																target.enemy_health_foot = (target.enemy_health_foot - particle_p5);
																dealDamage(target,attackComputeData);
																target.enemy_damagedBy = particle_p3;
																if (particle_type == 12){
																	target.enemy_statusEffect = 1;
																	target.enemy_statusEffect_atp = 0.1;
																};
																c = (Enemy.enemyVect.length + 1);
															}
															else {
																bullet_dx = (particle_x - (target.enemy_x - zombieMovieData.foot1_x[int(target.enemy_fr)]));
																	bullet_dy = (particle_y - (target.enemy_y + zombieMovieData.foot1_y[int(target.enemy_fr)]));
																		if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 12){
																			particle_frame = 2;
																			if (particle_type != 16){
																				b = 100;
																			};
//																			target.enemy_health_foot = (target.enemy_health_foot - particle_p5);
																			dealDamage(target,attackComputeData);
																			target.enemy_damagedBy = particle_p3;
																			if (particle_type == 12){
																				target.enemy_statusEffect = 1;
																				target.enemy_statusEffect_atp = 0.1;
																			};
																			c = (Enemy.enemyVect.length + 1);
																		};
																		};
															};
												};
									};
					};
				};
			};
		}
		protected  function bulletCollisions():void{
			c=0;
			while(c<Enemy.enemyVect.length){
				var target:Enemy=Enemy.enemyVect[c];
				switch(target.enemy_type){
					case 1:
						bullectCollisions_1(target);
						break;
					case 6:
						bullectCollisions_6(target);
						break;
					default:
						bullectCollisions_1(target);
						break;
				}
				c++;
			}
			
		}
		
		public static function destory():void{
			player=null;
			assetConfig=null;
			level=null;
			tileSet=null;
			canvas=null;
			
			particleVect=new Vector.<Particle>();
			
			
		}
		
		protected function bulletCollisions_enemy():void{
			if (Math.abs((particle_x - player.character_x)) < 25){
				if (Math.abs((particle_y - (player.character_y - 50))) < 50){
					if (player.character_face == 0){
						bullet_dx = (particle_x - (player.character_x + Enemy.charAnimDataVect[player.anim].head_x[player.fr]));
						bullet_dy = (particle_y - (player.character_y + Enemy.charAnimDataVect[player.anim].head_y[player.fr]));
						if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 20){
							particle_frame = 2;
							if (particle_type != 16){
								b = 100;
							};
//							player.character_health = (player.character_health - particle_p5);
//							showDamage(player,particle_p5);
							dealDamage(player,attackComputeData);
							if (player.character_invincibleTime < 1){
								if ((((player.jump == false)) && ((player.character_velX == 0)))){
									player.character_hurtTime = 30;
									player.anim = (int((Math.random() * 4)) + 11);
									player.fr = 0;
									player.frOld = 0;
									player.character_velX = 0;
								};
							};
						}
						else {
							bullet_dx = (particle_x - (player.character_x + Enemy.charAnimDataVect[player.anim].body_x[player.fr]));
							bullet_dy = (particle_y - (player.character_y + Enemy.charAnimDataVect[player.anim].body_y[player.fr]));
							if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 16){
								particle_frame = 2;
								if (particle_type != 16){
									b = 100;
								};
//								player.character_health = (player.character_health - particle_p5);
//								showDamage(player,particle_p5);
								dealDamage(player,attackComputeData);
								if (player.character_invincibleTime < 1){
									if ((((player.jump == false)) && ((player.character_velX == 0)))){
										player.character_hurtTime = 30;
										player.anim = (int((Math.random() * 4)) + 15);
										player.fr = 0;
										player.frOld = 0;
										player.character_velX = 0;
									};
								};
							};
						};
					}
					else {
						bullet_dx = (particle_x - (player.character_x - Enemy.charAnimDataVect[player.anim].head_x[player.fr]));
						bullet_dy = (particle_y - (player.character_y + Enemy.charAnimDataVect[player.anim].head_y[player.fr]));
						if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 20){
							particle_frame = 2;
							if (particle_type != 16){
								b = 100;
							};
//							player.character_health = (player.character_health - particle_p5);
//							showDamage(player,particle_p5);
							dealDamage(player,attackComputeData);
							if (player.character_invincibleTime < 1){
								if ((((player.jump == false)) && ((player.character_velX == 0)))){
									player.character_hurtTime = 30;
									player.anim = (int((Math.random() * 4)) + 11);
									player.fr = 0;
									player.frOld = 0;
									player.character_velX = 0;
								};
							};
						}
						else {
							bullet_dx = (particle_x - (player.character_x - Enemy.charAnimDataVect[player.anim].body_x[player.fr]));
							bullet_dy = (particle_y - (player.character_y + Enemy.charAnimDataVect[player.anim].body_y[player.fr]));
							if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 16){
								particle_frame = 2;
								if (particle_type != 16){
									b = 100;
								};
//								player.character_health = (player.character_health - particle_p5);
//								showDamage(player,particle_p5);
								dealDamage(player,attackComputeData);
								if (player.character_invincibleTime < 1){
									if ((((player.jump == false)) && ((player.character_velX == 0)))){
										player.character_hurtTime = 30;
										player.anim = (int((Math.random() * 4)) + 15);
										player.fr = 0;
										player.frOld = 0;
										player.character_velX = 0;
									};
								};
							};
						};
					};
				};
			};
//			return false;
		}
		public static function dealDamage(_gameObj:Object,_data:AttackComputeData):void
		{
			if(_data==null) return ;
			if(null==_gameObj)
			{
				return;
			}
			_gameObj.dealDamage(_data);
		}
		internal static var player:Player;
		public static function logic():void{
			player=GameManager.manager.player;
			a=0;
			while(a<particleVect.length){
				particleVect[a].excuteLogic();
				a++;
			}
		}
		
		public static function render():void{
			a=0;
			while(a<particleVect.length){
				particleVect[a].excuteRender();
				a++;
			}
		}
		
		public static var particleVect:Vector.<Particle>=new Vector.<Particle>();
		
		public static function get particleLastX():Number{
			if(particleVect.length>0){
				return particleVect[particleVect.length-1].particle_x;
			}
			return 0;
		}
		public static function get particleLastY():Number{
			if(particleVect.length>0){
				return particleVect[particleVect.length-1].particle_y;
			}
			return 0;
		}
		
		public static function addParticle(particle_type, particle_x, particle_y, particle_r, particle_xOld, particle_yOld,
										   particle_rOld, particle_velX, particle_velY, particle_frame, particle_p1, particle_p2, particle_p3, particle_p4, particle_p5,_computeData:AttackComputeData=null):void
		{
//			trace("particle "+particle_type);
			var particle:Particle;
			if(particle_type==0){
				particle=new Particle_0();
			}
			else if(particle_type==1){
				particle=new Particle_1();
			}
			else if(particle_type==2){
				particle=new Particle_2();
			}
			else if(particle_type==3){
				particle=new Particle_3();
			}
//			if(particle_type==4){
//				particle=new Particle_4();
//			}
//			if(particle_type==5){
//				particle=new Particle_5();
//			}
			else if(particle_type==6){
				particle=new Particle_6();
			}
			else if(particle_type==7){
				particle=new Particle_7();
			}
//			if(particle_type==8){
//				particle=new Particle_8();
//			}
			else if(particle_type==9){
				particle=new Particle_9();
			}
//			if(particle_type==10){
//				particle=new Particle_10();
//			}
//			if(particle_type==11){
//				particle=new Particle_11();
//			}
			else if(particle_type==12){
				particle=new Particle_12();
			}
			else if(particle_type==13){
				particle=new Particle_13();
			}
			else if(particle_type==14){
				particle=new Particle_14();
			}
			else if(particle_type==15){
				particle=new Particle_15();
			}
			else if(particle_type==16){
				particle=new Particle_16();
			}
			else if(particle_type==17){
				particle=new Particle_17();
			}
			else if(particle_type==18){
				particle=new Particle_18();
			}
			else if(particle_type==19){
				particle=new Particle_19();
			}
//			if(particle_type==20){
//				particle=new Particle_20();
//			}
			else if(particle_type==21){
				particle=new Particle_21();
			}
			if(particle==null){
				trace("发射效果没有实现：\t"+particle_type);
				return ;
			}
			
			particle.particle_type=(particle_type);
			particle.particle_x=(particle_x);
			particle.particle_y=(particle_y);
			particle.particle_r=(particle_r);
			particle.particle_xOld=(particle_xOld);
			particle.particle_yOld=(particle_yOld);
			particle.particle_rOld=(particle_rOld);
			particle.particle_velX=(particle_velX);
			particle.particle_velY=(particle_velY);
			particle.particle_frame=(particle_frame);
			particle.particle_p1=(particle_p1);
			particle.particle_p2=(particle_p2);
			particle.particle_p3=(particle_p3);
			particle.particle_p4=(particle_p4);
			particle.particle_p5=(particle_p5);
			particle.attackComputeData=_computeData;
			
			particleVect.push(particle);
			return;
		}// end function
		
		public static function removeParticle(index:int=0):void
		{
//			trace("移除子弹"+a);
			particleVect.splice(a,1);
			a  -- ;
		}
	}
}