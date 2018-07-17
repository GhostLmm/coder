package snake
{
	import com.ghostlmm.xmldata.Node_gun;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.system.ApplicationDomain;
	
	import snake.gameEnemys.CharAnimData;
	import snake.guns.GunData;

	public class MovieConstData
	{
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
		
		
		
		public  var enemyRunSpeed:int = 12;
		
		public static var pi_halved:Number=int(Math.PI / 2 * 100) / 100;;
		public static var pi_180:Number= int(180 / Math.PI * 1000) / 1000;
		
		public function MovieConstData()
		{
		}
		
		public static var charAnimDataVect:Vector.<CharAnimData>;
		
		public static function initCharAnimData():Vector.<CharAnimData>{
			if(charAnimDataVect!=null) return charAnimDataVect;
			charAnimDataVect=new Vector.<CharAnimData>();
			var charAnim_headRot:Array = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);
			var charAnim_hasHands:Array = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1);
			tempMc = new character_animation_container();
			charAnimDataVect.push(new CharAnimData());
			a = 1;
			while (a < (tempMc.totalFrames + 1))
			{
				var charData:CharAnimData=new CharAnimData();
				charAnimDataVect.push(charData);
				charData.hasHands=charAnim_hasHands[a];
				charData.headRot=charAnim_headRot[a];
				tempMc.gotoAndStop(a);
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
			return charAnimDataVect;
		}
		
		public static var gunDataVect:Vector.<GunData>;
		public static function convertIndexToId(_index:int):int
		{
			return 1000+_index+1;
		}
		public static function initGunData():Vector.<GunData>{
			if(gunDataVect!=null) return gunDataVect;
			gunDataVect=new Vector.<GunData>();
			var gunNode:Node_gun;
			var gunId:int;
			
			for(b=0; b<20; b++){
				var data:GunData=new GunData();
				
				gunDataVect.push(data);			
				
				gunId=convertIndexToId(b);
				gunNode=XMLDataManager.getGunById(gunId);
				
				data.gun_dist=gunNode.gun_dist;
				data.gun_coolDown=gunNode.gun_coolDown;
				data.gun_auto=gunNode.gun_auto;
				data.gun_casingType=gunNode.gun_casingType;
				data.gun_bulletType=gunNode.gun_bulletType;
				data.gun_isIncindiary=gunNode.gun_isIncindiary;
				data.gun_frameToEjectShellOn=gunNode.gun_frameToEjectShellOn;
				data.gun_names=gunNode.gun_names;
				data.gun_sfx=gunNode.gun_sfx;
				//				data.gun_atp=gunNode.gun_atp;
				//				data.gun_atp_enemy=gunNode.gun_atp_enemy;
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
			}
			
			return gunDataVect;
		}
		
	}
}