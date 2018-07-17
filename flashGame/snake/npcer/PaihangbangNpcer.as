package snake.npcer
{
	import com.fish.modules.core.gameVO.PaihangbangpersionVO;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	import snake.BattleAssetPreload;
	import snake.GameManager;
	import snake.GameUtil;
	import snake.PlayerInfoBar;
	import snake.PlayerThumb;

	public class PaihangbangNpcer extends GameNpcer
	{
		private var isInit:Boolean=false;
		public var _bit:BitmapData;
		public var _bound:Rectangle;
		public function PaihangbangNpcer()
		{
			super();
		}
		public override function destory():void{
			if(_bit){
				_bit.dispose();
				_bit=null;
			}
			super.destory();
		}
		public override function logic():void
		{	
			if(!isInit)
			{
				adjustFrame();
				aimFun();
				draw();
			}
			isInit=true;
		}
		
		private function draw():void{
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
			renderPlayerArg._gunX=renderPlayerArg._gunX-renderPlayerArg._posX-canvas.cameraX;
			renderPlayerArg._gunY=renderPlayerArg._gunY-renderPlayerArg._posY-canvas.cameraY;
			renderPlayerArg._posX=0;
			renderPlayerArg._posY=0;
			
			
			
			/*var thumb:PlayerThumb=new PlayerThumb();
			thumb.initModule();
			thumb.loadAppearance(appearance,color,XMLDataManager.getGunById(gunXmlId).gun_appearence);
			thumb.changToStatic(renderPlayerArg,1.3);
			var con:Sprite=new Sprite();
			con.addChild(thumb.display);
			_bound=con.getBounds(con);
			_bit=new BitmapData(_bound.width,_bound.height,true,0);
			var mt:Matrix=new Matrix();
			mt.translate(-_bound.x,-_bound.y);
			_bit.draw(con,mt,null,null,null,true);
			thumb.destory();*/
		}
		
		protected override function adjustFrame():void
		{
			setNpcerStandStill();
		}
		private var appearance:Array;
		private var color:Array;
		private var gunXmlId:int; 
		public function initFromLeitaiViewData(viewData:PaihangbangpersionVO,$x:Number,$y:Number):void{
			isInit=false;
			this.x=$x;
			y=$y;
			appearance=JSON.parse(viewData.userMovieFrame) as Array;
			color=GameUtil.turnArryStringToUint(viewData.userColors) as Array;
			canvas=GameManager.manager.canvas;
			level=GameManager.manager.level.level;
			level_collidable=GameManager.manager.level.level_collidable;
			level_height=GameManager.manager.level.level_height;
			level_width=GameManager.manager.level.level_width;
			
			fr=0;
			frOld=0;
			
			face=1;
			
			setAnimTo(1);
			gunXmlId=viewData.userGunId;
			gunAsset=BattleAssetPreload.getInstance().getPlayGunAsset(gunXmlId);
			gunData=BattleAssetPreload.getInstance().gunDataVect[gunXmlId];
			charAsset=BattleAssetPreload.getInstance().getPlayCharAsset(appearance,color);
			
			playerInfoBar=new PlayerInfoBar();
			playerInfoBar.setInfo(1,viewData.userName,PlayerInfoBar.TY_Npc);
		}
		public override function aimFun():void
		{
			
			//var gunAsset:GunAsset=assetConfig.gunAssetVect[gunEquipped];
			//			var posData:Pos_AnimData=CharacterAnimManager.getInstance().getPos_AnimData(anim,fr);
//			trace("fr:"+fr);
			gunRotOld = gunRot;
			gunXOld = gunX;
			gunYOld = gunY;
			gunX = 0 + canvas.cameraX;
			gunY = 0 + canvas.cameraY - gunData.gunShoulder_y;
			
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
				gunX = 0 + canvas.cameraX + recoil_x;
				gunY = 0 + canvas.cameraY - gunData.gunShoulder_y + recoil_y;
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
				gunRot=-Math.PI*1/4;
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
				tileOn = int((gunFlash_pt.y + canvas.cameraY) / 50) * level_width + int((gunFlash_pt.x + canvas.cameraX) / 50);
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
				gunX = 0 + canvas.cameraX + recoil_x;
				gunY = 0 + canvas.cameraY - gunData.gunShoulder_y + recoil_y;
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
				gunRot=-Math.PI*3/4;
				if (Math.sqrt(gunDX * gunDX + gunDY * gunDY) > d)
				{
					gunX = x - charAnimData.body_x[fr] + Math.cos(gunRot) * d + recoil_x;
					gunY = y + charAnimData.body_y[fr] + Math.sin(gunRot) * d + recoil_y;
				}
				gunX = x - charAnimData.body_x[fr] + recoil_x;
				gunY = y + charAnimData.body_y[fr] + recoil_y;
				getBarrelPoint();
				b = 0;
				tileOn = int((gunFlash_pt.y + canvas.cameraY) / 50) * level_width + int((gunFlash_pt.x + canvas.cameraX) / 50);
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
			return;
		}
		protected override function setAnimTo($anim:int):void{
			anim=$anim;		
			charAnimData=BattleAssetPreload.getInstance().charAnimDataVect[anim];
			fr=frOld=int(charAnimData.maxFrames*Math.random());
		}
		protected override function changeAnimTo($anim:int):void{
			if(anim!=$anim){
				anim=$anim;		
				charAnimData=BattleAssetPreload.getInstance().charAnimDataVect[anim];
				fr=frOld=int(charAnimData.maxFrames*Math.random());
			}
		}
		private function setNpcerStandStill():void
		{
			fr=48;
			frOld=0;					
			gunFrame=0;
		}
		private var firstflag:Boolean=true;
		public override function render():void{
//			if(_bit==null) return ;
			if( (x-canvas.cameraX) > -200 && (x-canvas.cameraX)<(canvas.screenWidth + 200) ){
				if( (y-canvas.cameraY) > -200 && (y-canvas.cameraY) < (canvas.screenHeight + 200) ){
					
//					return ;
					if(firstflag){
						firstflag=false;
						return ;
					}
					
					
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
					renderPlayerArg.talkInfo=null;
					
					if(_bit==null){
						var sp:Sprite=canvas.reder_a_large_character_sprite(renderPlayerArg);
						
						_bound=sp.getBounds(sp);
						
						_bit=new BitmapData(_bound.width,_bound.height,true,0);
						var mt:Matrix=new Matrix();
						mt.translate(-_bound.x,-_bound.y);
						_bit.draw(sp,mt,null,null,null,true);
//						_bit=new BitmapData(1,1);
//						var bmp:Bitmap=new Bitmap(_bit);
//						bmp.x=0;
//						bmp.y=0;
//						GlobalRef.root.addChild(bmp);
						_bound.x-=x-canvas.cameraX;
						_bound.y-=y-canvas.cameraY;
						charAsset.resetTransform();
					}
					tempPoint.x=x-canvas.cameraX+_bound.x;
					tempPoint.y=y-canvas.cameraY+_bound.y;
					canvas.bm.copyPixels(_bit,_bit.rect,tempPoint);
					
					tempPoint.x=x-canvas.cameraX-playerInfoBar.bitdata.width/2;
					tempPoint.y=y-canvas.cameraY;
					canvas.bm.copyPixels(playerInfoBar.bitdata,playerInfoBar.bitdata.rect,tempPoint,null,null,true);
//					canvas.render_a_large_character(renderPlayerArg,1.3);
				}
			}
		}
	}
}