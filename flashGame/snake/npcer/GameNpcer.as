package snake.npcer
{
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.tempData.NpcerData;
	import com.ghostlmm.guide.RandomNum;
	import com.ghostlmm.tool.MathHelper;
	import com.ghostlmm.xmldata.Node_monster;
	import com.ghostlmm.xmldata.Node_monster_type;
	import com.ghostlmm.xmldata.Node_npc_talk;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import snake.BattleAssetPreload;
	import snake.GameCanvas;
	import snake.GameManager;
	import snake.GameUtil;
	import snake.NpcTalkInfoBar;
	import snake.PlayerInfoBar;
	import snake.RenderPlayerArg;
	import snake.gameEnemys.CharAnimData;
	import snake.gameEnemys.CharSpriteAsset;
	import snake.gameParticle.particles.Particle;
	import snake.guns.GunAsset;
	import snake.guns.GunData;
	

	public class GameNpcer
	{
		public function GameNpcer()
		{
		}
		public var x:Number=500;
		public var y:Number=500;
		public var xOld:Number=0;
		public var yOld:Number=0;
		public var velX:Number=0;
		public var velY:Number=0;
		public var runSpeed:int=10;
		public var jump:Boolean;
		public var releaseJump:Boolean;
		
		public var anim:int;
		public var fr:Number;
		public var frOld:Number;
		
		
		public var face:int;
		
		public var tileOn:int;
		public var hurtTime:int;
		
		public var health:Number=5;
		public var maxHealth:Number=100;
		public var invincibleTime:int=0;
		public var JumpMaxSpeed:int=40;
		
		public var level:Vector.<uint>;
		public var level_width:int;
		public var level_height:int;
		public var level_collidable:Vector.<int>;
		
		public var canvas:GameCanvas;
		public var tempHeadRot:Number;
		public var rect:Rectangle=new Rectangle(0,0,1,1);
		public var tempPoint:Point=new Point();
		
		public var weapons:Array;
		public var reloadTime:int;
		public var gun_total_ammo:Array;
		public var hasDroppedMag:Boolean;
		
		public var gun_mag_size:Array;
		public var gun_ammo:Array;
		
		public var mouseDown:Boolean;
		public var gun16time:int;
		public var burstLength:int;
		
		public var gunTempRand:Number=0;
		public var gunTempSpd:Number=0;
		
		public var recoilRotVel:Number=0;
		public var noRecoil:Boolean;
		public var aimPan:Number=0;
		public var aimPanOld:Number=0;
		
		private var heroModel:HeroModel;
		
		public var gunX:Number=0;
		public var gunY:Number=0;
		public var gunXOld:Number=0;
		public var gunYOld:Number=0;
		public var gunRot:Number=0;
		public var gunRotOld:Number=0;
		public var gunDX:Number=0;
		public var gunDY:Number=0;
		public var headRot:Number=0;
		public var gunEquipped:int;
		public var recoil_rot:Number=0;
		public var recoil_x:Number=0;
		public var recoil_y:Number=0;
		public var gunCoolDown:int;
		public var gunFrame:int;
		
		protected var playerInfoBar:PlayerInfoBar;
		private var talkInfoBar:NpcTalkInfoBar;
		private var talkFrame:int;
		
		//  中间值
		public static var a:int;
		public static var b:int;
		public static var c:int;
		public static var d:int;
		public static var e:int;
		public var radTo:Number=0;
		
		
		public var state:int;
		public var stateFrame:int;
		
		private static const ST_Left:int=-1;
		private static const ST_Right:int=1;
		private static const ST_Idle:int=0;
		
		public static var renderPlayerArg:RenderPlayerArg=new RenderPlayerArg();
		
		public var npcerData:NpcerData;
		
		protected var moveRect:Rectangle;
		
		private var rndDir:RandomNum;
		private var rndJump:RandomNum;
		private var rndTalk:RandomNum;
		
		private var dirFr:int;
		
		private var jumpState:int
		private var jumpFr:int;
		private var rtalkFr:int;
		
		
		public function initData($npcerData:NpcerData,$x:Number,$y:Number,$rect:Rectangle=null):void{
			this.x=$x;
			y=$y;
			moveRect=$rect;
			
			if(moveRect!=null){
				createRandomInitPosition();
			}
			
			initRandomNum();
			
			npcerData=$npcerData;
			canvas=GameManager.manager.canvas;
			level=GameManager.manager.level.level;
			level_collidable=GameManager.manager.level.level_collidable;
			level_height=GameManager.manager.level.level_height;
			level_width=GameManager.manager.level.level_width;
			
			fr=0;
			frOld=0;
			
			face=0;
			
			setAnimTo(1);
			
			gunAsset=BattleAssetPreload.getInstance().getPlayGunAsset(npcerData.gunId);
			gunData=BattleAssetPreload.getInstance().gunDataVect[npcerData.gunId];
			charAsset=BattleAssetPreload.getInstance().getPlayCharAsset(npcerData.appearance,npcerData.color);
			
			playerInfoBar=new PlayerInfoBar();
			playerInfoBar.setInfo(1,npcerData.userName,PlayerInfoBar.TY_Npc);
			
			resetTalkSpan();
		}
		
		private function initRandomNum():void{
			rndDir=new RandomNum();
			rndDir.addType(0,2,[30,100]);
			rndDir.addType(1,1,[10,100]);
			rndDir.addType(-1,1,[10,100]);
			
			rndJump=new RandomNum();
			rndJump.addType(0,2.5,[50,100]);
			rndJump.addType(1,1,[50,200]);
			
			rndTalk=new RandomNum();
			rndTalk.addType(0,5,[50,100]);
//			rndTalk.addType(0,1,[50,100]);
			rndTalk.addType(1,1,[100,200]);
		}
		
		private function createRandomInitPosition():void{
			if(moveRect){
				x=Math.random()*(moveRect.width-10*50)+moveRect.x+10*50;
//				y=Math.random()*moveRect.height+moveRect.y;
				xOld=x;
//				yOld=y;
			}
		}
		
		
		private function resetTalkSpan():void{
			talkSpan=Math.random()*400+300;
		}
		
		public function showTalk($text:String,$frame:int=200,$force:Boolean=false):void{
			if(talkInfoBar==null){
				talkInfoBar=new NpcTalkInfoBar();
			}
			talkInfoBar.setTalk($text);
			talkFrame=$frame;
			if($force){
				
			}
		}
		
		/**
		 *    目前先让他拥有 三种状态，  向左走， 向右走， 休息
		 */
		public function logic():void
		{
			
			adjustMove();
			adjustAnimInUnJump();
			adjustMissFoot();
			adjustAnimInJump();
			adjustFrame();
			adjustPosX();
			adjustPosY();
			aimFun();
			
			
		}
		
		private var timeFrame:int;
		
		private var talkSpan:int;
		private function adjustMove():void{
			dirFr--;
			jumpFr--;
			talkFrame--;
			
			if(talkFrame>0){
				state=ST_Idle;
				velX=0;
				changeAnimTo(1);
				return ;
			}
			
			var tmp:Array;
			if(dirFr<=0){
				tmp=rndDir.createRandomType();
				state=tmp[0];
				dirFr=tmp[1];
				
				if(state==ST_Idle){
					velX=0;
					changeAnimTo(1);
					
				}
				if(state==ST_Left){
					velX=-runSpeed;
					
				}
				if(state==ST_Right){
					velX=runSpeed;
				}
			}
			
			if(state==ST_Idle)
			{
				if(!npcerData.isUser){
					rtalkFr--;
					if(rtalkFr<0){
						tmp=rndTalk.createRandomType();
						rtalkFr=tmp[1];
						if(tmp[0]==1){
							showTalk(createRandomNpcTalk());
						}
					}
				}
				
			}
			
			if(jumpFr<=0){
				if(state!=ST_Idle){
					tmp=rndJump.createRandomType();
					jumpState=tmp[0];
					jumpFr=tmp[1];
					if(jumpState==1){
						jump=true;
						velY = -(0.5+Math.random()*0.5)*Math.abs(JumpMaxSpeed);
						releaseJump = false;
					}
				}
				
				
			}
			
			
			
			
			
			if(velX > 0)
			{
				face=0;
			}
			if(velX < 0)
			{
				face=1;
			}
			
			if(jump==true) return ;
		}
		
		private function createRandomNpcTalk():String{
//			return "";
			var index:int=int(Math.random()*1000000)%XMLDataManager.Node_npc_talkArray.length;
			var node:Node_npc_talk=XMLDataManager.getNpc_talkById(index+1);
			return node.desc;
		}
		
		
		public var charAnimData:CharAnimData;
		public var charAsset:CharSpriteAsset;
		public var gunAsset:GunAsset;
		public var gunData:GunData;
		
		
		
		public function render():void{
			if( (x-canvas.cameraX) > -200 && (x-canvas.cameraX)<(canvas.screenWidth + 200) ){
				if( (y-canvas.cameraY) > -200 && (y-canvas.cameraY) < (canvas.screenHeight + 200) ){
					
					
					renderPlayerArg._charAnimData=charAnimData;
					renderPlayerArg._charAsset=charAsset;
					renderPlayerArg._face=face;
					renderPlayerArg._frame=fr;
					renderPlayerArg._frameOld=frOld;
					renderPlayerArg._gunAsset=gunAsset;
					renderPlayerArg._gunData=gunData;
					
					renderPlayerArg._gunFrame=gunFrame;
					renderPlayerArg._gunRot=gunRot;
					renderPlayerArg._gunRotOld=gunRotOld;
					renderPlayerArg._gunX=gunX;
					renderPlayerArg._gunXOld=gunXOld;
					renderPlayerArg._gunY=gunY;
					renderPlayerArg._gunYOld=gunYOld;
					renderPlayerArg._headless=false;
					renderPlayerArg._headRot=headRot;
					renderPlayerArg._posX=x-canvas.cameraX;
					renderPlayerArg._posX_old=xOld-canvas.cameraX;
					renderPlayerArg._posY=y-canvas.cameraY;
					renderPlayerArg._posY_old=yOld-canvas.cameraY;
					renderPlayerArg._reloadTime=reloadTime;
					renderPlayerArg.hasDroppedMag=hasDroppedMag;
					if(jump){
						renderPlayerArg.renderInfo=false;
						renderPlayerArg.playerInfo=playerInfoBar;
					}else{
						renderPlayerArg.renderInfo=true;
						renderPlayerArg.playerInfo=playerInfoBar;
					}
					if(talkFrame>0){
						renderPlayerArg.talkInfo=talkInfoBar;
					}else{
						renderPlayerArg.talkInfo=null;
					}
					
					canvas.render_a_character(renderPlayerArg);
				}
			}
		}
		
		
		public static const TempSprite:Sprite=new Sprite();
		public var pi_180:int = int(180 / Math.PI * 1000) / 1000;
		public var gunFlash_pt:Point=new Point();
		public function getBarrelPoint():void
		{

			//var gunAsset:GunAsset=assetConfig.gunAssetVect[gunEquipped];
			//			var tempGunRight:Sprite=gunAsset.gun_right[gunData.gunFrames[gunFrame]];
			MathHelper.localToGlobal(gunX - canvas.cameraX,gunY - canvas.cameraY + gunData.gunShoulder_y,
				gunData.gun_barrel_x, gunData.gun_barrel_y,gunFlash_pt,gunRot,(face != 0));
			/*var tempGunRight:Sprite=TempSprite;
			tempGunRight.x = gunX - canvas.cameraX;
			tempGunRight.y = gunY - canvas.cameraY + gunData.gunShoulder_y;
			tempGunRight.rotation = gunRot * pi_180;
			if (face == 0)
			{
				tempGunRight.scaleY = 1;
			}
			else
			{
				tempGunRight.scaleY = -1;
			}
			gunFlash_pt = new Point(gunData.gun_barrel_x, gunData.gun_barrel_y);
			gunFlash_pt = tempGunRight.localToGlobal(gunFlash_pt);*/
			return;
		}// end function
		public function aimFun():void
		{

			//var gunAsset:GunAsset=assetConfig.gunAssetVect[gunEquipped];
			//			var posData:Pos_AnimData=CharacterAnimManager.getInstance().getPos_AnimData(anim,fr);
			
			gunRotOld = gunRot;
			gunXOld = gunX;
			gunYOld = gunY;
			gunX = canvas.cameraX;
			gunY = canvas.cameraY - gunData.gunShoulder_y;
			
			if (gunX > x + charAnimData.body_x[fr])
			{
				if (face == 1)
				{
					if(!FuncSwitchManager.Horizontal_Switch)
					{
						face = 0;
						if (gunRot > 0)
						{
							if (gunRot > Math.PI * 0.5)
							{
								gunRot = 0;
							}
						}
						else if (gunRot < (-Math.PI) * 0.5)
						{
							gunRot = 0;
						}
						gunRotOld = gunRot;
					}
				}
			}
			else if (face == 0)
			{
				if(!FuncSwitchManager.Horizontal_Switch)
				{
					face = 1;
					if (gunRot > 0)
					{
						if (gunRot < Math.PI * 0.5)
						{
							gunRot = -Math.PI;
						}
					}
					else if (gunRot > (-Math.PI) * 0.5)
					{
						gunRot = -Math.PI;
					}
					gunRotOld = gunRot;
				}
			}
			d = gunData.gun_dist;
			if (face == 0)
			{
				gunX = canvas.cameraX + recoil_x;
				gunY = canvas.cameraY - gunData.gunShoulder_y + recoil_y;
				gunDX = gunX - (x + charAnimData.body_x[fr]);
				gunDY = gunY - (y + charAnimData.body_y[fr]);
				radTo = Math.atan2(gunDY, gunDX);
				headRot = radTo;
				radTo = radTo + recoil_rot;
				
				
				gunRot = gunRot - (gunRot - radTo) / 3;
				
				if(FuncSwitchManager.Horizontal_Switch)
				{
					//Fantasy  注意
					radTo=0;
					headRot=0;
					gunRot=0;
				}
				
				if (Math.sqrt(gunDX * gunDX + gunDY * gunDY) > d)
				{
					gunX = x + charAnimData.body_x[fr] + Math.cos(gunRot) * d + recoil_x;
					gunY = y + charAnimData.body_y[fr] + Math.sin(gunRot) * d + recoil_y;
				}
				else
				{
					d = Math.sqrt(gunDX * gunDX + gunDY * gunDY);
				}
				gunX = x + charAnimData.body_x[fr] + recoil_x;
				gunY = y + charAnimData.body_y[fr] + recoil_y;
				getBarrelPoint();
				b = 0;
				tileOn = int((gunFlash_pt.y + canvas.cameraY) / 50) * level_width + int((gunFlash_pt.x + canvas.cameraX+25) / 50);
				if (level_collidable[level[tileOn]] == 0)
				{
					do
					{						
						gunX = gunX + Math.cos(gunRot) * 2;
						gunY = gunY + Math.sin(gunRot) * 2;
						getBarrelPoint();
						tileOn = int((gunFlash_pt.y + canvas.cameraY) / 50) * level_width + int((gunFlash_pt.x + canvas.cameraX) / 50);
						b = b + 2;
					}while (b < d)
				}
			}
			else
			{
				gunX = canvas.cameraX + recoil_x;
				gunY = canvas.cameraY - gunData.gunShoulder_y + recoil_y;
				gunDX = gunX - (x - charAnimData.body_x[fr]);
				gunDY = gunY - (y + charAnimData.body_y[fr]);
				radTo = Math.atan2(gunDY, gunDX);
				headRot = radTo;
				radTo = radTo - recoil_rot;
				if (radTo > gunRot + Math.PI)
				{
					gunRot = gunRot + Math.PI * 2;
					gunRotOld = gunRot;
				}
				if (radTo < gunRot - Math.PI)
				{
					gunRot = gunRot - Math.PI * 2;
					gunRotOld = gunRot;
				}
				gunRot = gunRot - (gunRot - radTo) / 3;
				if(FuncSwitchManager.Horizontal_Switch)
				{
					//Fantasy  注意
					radTo=Math.PI;
					headRot=Math.PI;
					gunRot=Math.PI;
				}
				
				if (Math.sqrt(gunDX * gunDX + gunDY * gunDY) > d)
				{
					gunX = x - charAnimData.body_x[fr] + Math.cos(gunRot) * d + recoil_x;
					gunY = y + charAnimData.body_y[fr] + Math.sin(gunRot) * d + recoil_y;
				}
				gunX = x - charAnimData.body_x[fr] + recoil_x;
				gunY = y + charAnimData.body_y[fr] + recoil_y;
				getBarrelPoint();
				b = 0;
				tileOn = int((gunFlash_pt.y + canvas.cameraY) / 50) * level_width + int((gunFlash_pt.x + canvas.cameraX-50) / 50);
				if (level_collidable[level[tileOn]] == 0)
				{
					do
					{
						gunX = gunX + Math.cos(gunRot) * 2;
						gunY = gunY + Math.sin(gunRot) * 2;
						getBarrelPoint();
						tileOn = int((gunFlash_pt.y + canvas.cameraY) / 50) * level_width + int((gunFlash_pt.x + canvas.cameraX-50) / 50);
						b = b + 2;
					}while (b < d)
				}
			}
			return;
		}
		
		protected function adjustPosY():void{
			// npc 不会跳就不跳了 
			/*if (hurtTime>=0)
			{
				if ()
				{
					if (jump == false)
					{
						jump = true;
						velY = -Math.abs(JumpMaxSpeed);
						releaseJump = false;
					}
				}
			}*/
			if (jump == true)
			{
				/*if (KD[Keyboard.W] == false)
				{
					if (releaseJump == false)
					{
						releaseJump = true;
						if (velY < -8)
						{
							velY = -8;
						}
					}
				}*/
				velY = velY + 2;
				if (velY > Math.abs(JumpMaxSpeed))
				{
					velY = Math.abs(JumpMaxSpeed);
				}
				y = y + velY;
				tileOn = int((y - 80) / 50) * level_width + int(x / 50);
				if (level_collidable[level[tileOn]] == 1)
				{
					velY = 0;
					y = int(y / 50) * 50 + 50;
				}
				tileOn = int(y / 50) * level_width + int(x / 50);
				if (level_collidable[level[tileOn]] == 1)
				{
					jump = false;
					velY = 0;
					y = int(y / 50) * 50 + 2;
					playSoundEffect(int(Math.random() * 4) + 21, 1, 0);
				}
				tileOn = int((y - 5) / 50) * level_width + int((x - 25) / 50);
				if (level_collidable[level[tileOn]] == 1)
				{
					x = int(x / 50) * 50 + 25;
					velX = 0;
				}
				tileOn = int((y - 5) / 50) * level_width + int((x + 25) / 50);
				if (level_collidable[level[tileOn]] == 1)
				{
					x = int(x / 50) * 50 + 25;
					velX = 0;
				}
			}
			else
			{
				tileOn = int(y / 50) * level_width + int((x - 10) / 50);
				if (level_collidable[level[tileOn]] == 0)
				{
					tileOn = int(y / 50) * level_width + int((x + 10) / 50);
					if (level_collidable[level[tileOn]] == 0)
					{
						jump = true;
					}
				}
			}
		}
		protected function adjustPosX():void{
			xOld = x;
			yOld = y;
			if (hurtTime>=0)
			{
				// 加速效果
				if(state==ST_Left){
					velX = velX - 4;
					if (velX < -runSpeed)
					{
						velX = -runSpeed;
					}
				}else if(state==ST_Right){
					velX = velX + 4;
					if (velX > runSpeed)
					{
						velX = runSpeed;
					}
				}
				//  减速效果
				else if (velX > 4)
				{
					velX = velX - 4;
				}
				else if (velX < -4)
				{
					velX = velX + 4;
				}
				else
				{
					velX = 0;
				}
			}
			x = x + velX;
			// 调整位置  防止与 障碍物碰撞
			if (velX < 0)
			{
				tileOn = int((y - 5) / 50) * level_width + int((x - 25) / 50);
				if ((level_collidable[level[tileOn]] == 1)||(level_collidable[level[tileOn - level_width]] == 1))
				{
					x = int(x / 50) * 50 + 25;
					velX = 0;
				}
			}
			else if (velX > 0)
			{
				tileOn = int((y - 5) / 50) * level_width + int((x + 25) / 50);
				if ((level_collidable[level[tileOn]] == 1)||(level_collidable[level[tileOn - level_width]] == 1))
				{
					x = int(x / 50) * 50 + 25;
					velX = 0;
				}	
			}
			else
			{
				tileOn = int((y - 5) / 50) * level_width + int((x - 25) / 50);
				if ((level_collidable[level[tileOn]] == 1)||(level_collidable[level[tileOn - level_width]] == 1))
				{
					x = int(x / 50) * 50 + 25;
					velX = 0;
				}
				
				tileOn = int((y - 55) / 50) * level_width + int((x - 25) / 50);
				if ((level_collidable[level[tileOn]] == 1)||(level_collidable[level[tileOn - level_width]] == 1))
				{
					x = int(x / 50) * 50 + 25;
					velX = 0;
				}
				
			}
		}
		protected function adjustFrame():void{
			frOld = fr;
			fr = fr + 2;
			if (fr >charAnimData.maxFrames)
			{
				if ((anim > 10)||(hurtTime>=1))
				{
					hurtTime = 0;
//					anim = 1;
					setAnimTo(1);
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
		}
		protected function changeAnimTo($anim:int):void{
			if(anim!=$anim){
				anim=$anim;
				fr=0;
				frOld=0;
				charAnimData=BattleAssetPreload.getInstance().charAnimDataVect[anim];
			}
		}
		protected function setAnimTo($anim:int):void{
			anim=$anim;
			fr=0;
			frOld=0;
			charAnimData=BattleAssetPreload.getInstance().charAnimDataVect[anim];
		}
		// 非 跳跃状态下  根据 面向和速度 调整 播放状态
		protected function adjustAnimInUnJump():void{
			if(jump==true) return ;
			if (velX != 0){
				if(velX>0 && face==0){
					changeAnimTo(2);
				}
				if(velX>0 && face==1){
					changeAnimTo(3);
				}
				if(velX<0 && face==0){
					changeAnimTo(3);
				}
				if(velX<0 && face==1){
					changeAnimTo(2);
				}
			}else{
				tileOn = int(y / 50) * level_width + int((x - 15) / 50);
				if (level_collidable[level[tileOn]] == 0)
				{
					if (face == 1)
					{
						changeAnimTo(9);
					}else{
						changeAnimTo(10);
					}
				}
				else
				{
					tileOn = int(y / 50) * level_width + int((x + 15) / 50);
					if (level_collidable[level[tileOn]] == 0)
					{
						if (face == 1)
						{
							changeAnimTo(10);
						}else{
							changeAnimTo(9);
						}
					}else{
						changeAnimTo(1);
					}
				}

			}
		}
		
		// 非 跳跃状态下  x无速度， 调整踏空状态
		protected function adjustMissFoot():void{
			if(jump==true || velX != 0) return;
			if(hurtTime < 1){
				tileOn = int(y / 50) * level_width + int((x - 15) / 50);
				// 左边踏空
				if (level_collidable[level[tileOn]] == 0)
				{
					
					if (face == 1){
						changeAnimTo(9);
					}else{
						changeAnimTo(10);
					}
				}
				return ;
				// 右边踏空
				tileOn = int(y / 50) * level_width + int((x + 15) / 50);
				if (level_collidable[level[tileOn]] == 0){
					if (face == 1){
						changeAnimTo(10);
					}else{
						changeAnimTo(9);
					}
				}
			}
		}
		// 调整跳跃状态下的  转向
		protected function adjustAnimInJump():void{
			if(jump==false) return ;
			if(velY < 0){
				if(anim != 6 && anim != 8){
					if (face == 0){
						if(state==ST_Left){
							setAnimTo(8);
						}else{
							setAnimTo(6);
						}
					}else{
						if(state==ST_Right){
							setAnimTo(8);
						}else{
							setAnimTo(6);
						}
					}
				}
			}else{
				changeAnimTo(7);
			}
		}
	
		public function playSoundEffect(param1:*, param2:*, param3:*):void
		{
			return ;
			Particle.sound.playSoundEffect(param1,param2,param3);
		}
		
		public function destory():void{
			
		}
	}
}