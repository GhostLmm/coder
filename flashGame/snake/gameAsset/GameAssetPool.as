package snake.gameAsset
{
	import com.ghostlmm.xmldata.Node_gun;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.utils.Dictionary;
	
	import snake.BattleAssetPreload;
	import snake.gameEnemys.CharSpriteAsset;
	import snake.gameEnemys.ZombieAsset;
	import snake.guns.GunAsset;

	public class GameAssetPool
	{
		private var anklePool:PoolObject=new PoolObject();
		private var bodyPool:PoolObject=new PoolObject();
		private var footPool:PoolObject=new PoolObject();
		private var handPool:PoolObject=new PoolObject();
		private var headPool:PoolObject=new PoolObject();
		
		private var classArray:Array;
		private var poolArray:Array;
		
		private var zhuchengGunAssetPool:PoolObject=new PoolObject();
		private var battleGunAssetPool:PoolObject=new PoolObject();
		private var gunReloadAssetPool:PoolObject=new PoolObject();
		
		private var zombieAssetPool:PoolObject=new PoolObject();
		
		public function GameAssetPool()
		{
			anklePool=new PoolObject();
			bodyPool=new PoolObject();
			footPool=new PoolObject();
			handPool=new PoolObject();
			headPool=new PoolObject();
			classArray=[CharAnkle,CharBody,CharFoot,CharHand,CharHead];
			poolArray=[anklePool,bodyPool,footPool,handPool,headPool];
		}
		
		public function clearPoolMCAsset():void{
			CharAnkle.tempMc=null;
			CharBody.tempMc=null;
			CharFoot.tempMc=null;
			CharHead.tempMc=null;
			CharHand.tempMc1=null;
			CharHand.tempMc2=null;
			GunBaseAsset.tempMc=null;
			GunReloadAsset.tempMc=null;
			
		}
		
		internal static function createCharPartKey(appearance:Array,color:Array,AppearanceIndex:Array,ColorIndex:Array):String{
			var key:String="";
			key+="a";
			var index:int;
			for each(index in AppearanceIndex){
				key+=appearance[index]+"_";
			}
			key+="c";
			for each(index in ColorIndex){
				key+=color[index]+"_";
			}
			return key;
		}
		internal static function createGunKey(weapon:int):String{
			var key:String="";
//			key+="a";
//			var index:int;
//			for each(index in GunBaseAsset.AppearanceIndex){
//				key+=appearance[index]+"_";
//			}
//			key+="c";
//			for each(index in GunBaseAsset.ColorIndex){
//				key+=color[index]+"_";
//			}
//			key+="w";
//			key+=weapon;
			key=weapon.toString();
			return key;
		}
		
		public function getCharAsset(appearence:Array,colors:Array):CharSpriteAsset
		{
			var asset:CharSpriteAsset=new CharSpriteAsset();
			for(var index:int=0; index<classArray.length; index++){
				var pool:PoolObject=poolArray[index];
				var cls:Class=classArray[index];
				var key:String=createCharPartKey(appearence,colors,cls.AppearanceIndex,cls.ColorIndex);
				var value:*=pool.getValue(key);
				if(value==null){
					trace("错误大哥："+key);
					value=new cls(appearence,colors);
					pool.add(key,value);
					clearPoolMCAsset();
				}
				if(value is CharAnkle){
					asset.char_ankle=(value as CharAnkle).char_ankle;
					asset.char_ankle_bm=(value as CharAnkle).char_ankle_bm;
				}
				if(value is CharBody){
					asset.char_body=(value as CharBody).char_body;
					asset.char_body_bm=(value as CharBody).char_body_bm;
				}
				if(value is CharFoot){
					asset.char_foot=(value as CharFoot).char_foot;
					asset.char_foot_bm=(value as CharFoot).char_foot_bm;
				}
				if(value is CharHand){
					asset.char_hand1=(value as CharHand).char_hand1;
					asset.char_hand1_bm=(value as CharHand).char_hand1_bm;
					asset.char_hand2=(value as CharHand).char_hand2;
					asset.char_hand2_bm=(value as CharHand).char_hand2_bm;
				}
				if(value is CharHead){
					asset.char_head=(value as CharHead).char_head;
					asset.char_head_bm=(value as CharHead).char_head_bm;
				}
			}
			return asset;
		}
		
		
		public function getZhuchengGunAsset(weapon:int):GunAsset{
			var gunAsset:GunAsset=new GunAsset();
			var key:String=createGunKey(weapon);
			var gunBase:GunBaseAsset=zhuchengGunAssetPool.getValue(key);
			if(gunBase==null){
				trace("错误大哥："+key);
				gunBase=new GunBaseAsset(weapon,true);
				zhuchengGunAssetPool.add(key,gunBase);
			}
			gunAsset.gun_left=gunBase.gun_left;
			gunAsset.gun_right=gunBase.gun_right;
			return gunAsset;
		}
		
		public function getBattleGunAsset(weapon:int=0,isPlay:Boolean=false):GunAsset{
			var gunAsset:GunAsset = new GunAsset();
			var key:String=createGunKey(weapon);
			var gunBaseAsset:GunBaseAsset=battleGunAssetPool.getValue(key);
			if(gunBaseAsset==null){
				trace("错误大哥："+key);
				gunBaseAsset=new GunBaseAsset(weapon);
				battleGunAssetPool.add(key,gunBaseAsset);
			}
			gunAsset.gun_left=gunBaseAsset.gun_left;
			gunAsset.gun_right=gunBaseAsset.gun_right;
			
			var gunNode:Node_gun=XMLDataManager.getGunById(weapon);
			if((isPlay)&&(gunNode.gun_hasReloadAnim == 1)){
				var gunRealodAsset:GunReloadAsset=gunReloadAssetPool.getValue(key);
				if(gunRealodAsset==null){
					trace("错误大哥Reload："+key);
					gunRealodAsset=new GunReloadAsset(weapon);
					gunReloadAssetPool.add(key,gunRealodAsset);
				}
				gunAsset.gun_reload_left=gunRealodAsset.gun_reload_left;
				gunAsset.gun_reload_right=gunRealodAsset.gun_reload_right;
			}
			return gunAsset;
		}
		
		public function lockGunAsset():void{
			
		}
		
		public function addZhuchengGunAsset(weapon:int,appearence:Array=null,colors:Array=null):void{
			var key:String=createGunKey(weapon);
			var gunAsset:GunBaseAsset=zhuchengGunAssetPool.getValue(key);
			if(gunAsset==null){
				gunAsset=new GunBaseAsset(weapon,true);
			}
			zhuchengGunAssetPool.add(key,gunAsset);
		}
		public function addBattleGunAsset(weapon:int,appearence:Array=null,colors:Array=null):void{
			var key:String=createGunKey(weapon);
			var gunAsset:GunBaseAsset=battleGunAssetPool.getValue(key);
			if(gunAsset==null){
				gunAsset=new GunBaseAsset(weapon,false);
			}
			battleGunAssetPool.add(key,gunAsset);
		}
		public function addGunReloadAsset(weapon:int=0):void{
//			var gunId:int=BattleAssetPreload.convertIndexToId(weapon);
			var gunNode:Node_gun=XMLDataManager.getGunById(weapon);
			if (gunNode.gun_hasReloadAnim != 1) return ;
			var key:String=createGunKey(weapon);
			var gunReloadAsset:GunReloadAsset=gunReloadAssetPool.getValue(key);
			if(gunReloadAsset==null){
				gunReloadAsset=new GunReloadAsset(weapon);
			}
			gunReloadAssetPool.add(key,gunReloadAsset);
		}
		
		public function unlockGunAsset():void{
			
		}
		
		
		public function lockCharAsset():void{
			
		}
		public function addChar(appearence:Array,colors:Array):void{
			for(var index:int=0; index<classArray.length; index++){
				var pool:PoolObject=poolArray[index];
				var cls:Class=classArray[index];
				var key:String=createCharPartKey(appearence,colors,cls.AppearanceIndex,cls.ColorIndex);
				var value:*=pool.getValue(key);
				if(value==null) value=new cls(appearence,colors);
				pool.add(key,value);
			}
		}
		public function unlockCharAsset():void{
			
		}
		
		
		public function getZombieAsset(zombieSprite:int):ZombieAsset{
			var key:String=zombieSprite.toString();
			var zombieAsset:ZombieAsset=zombieAssetPool.getValue(key);
			if(zombieAsset==null){
				trace("错误大哥："+key);
				zombieAsset=new ZombieAsset(zombieSprite);
				zombieAssetPool.add(key,zombieAsset);
			}
			return zombieAsset;
		}
	}
}