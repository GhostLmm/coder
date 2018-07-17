package com.ghostlmm.dig
{
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.ghostlmm.xmldata.Node_equip;
	import com.ghostlmm.xmldata.Node_tile;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.system.ApplicationDomain;
	import flash.text.TextField;
	import flash.utils.Dictionary;
	
	import org.osflash.signals.Signal;
	
	import ui.widget.ImageBitmap;

	public class GameTile
	{
		private var _bossLayer:Sprite;
		
		
		public function GameTile()
		{
			_bitmap=new Bitmap();
			_display=new Sprite();
			_display.addChild(_bitmap);
		}
		
		public function setBossLayer($layer:Sprite):void
		{
			_bossLayer=$layer;
		}
		
		public var tileX:int;
		public var tileY:int; 
		public var id:int;
		
		public var state:int=0;
		
		public var life:Number;
		
		private var _bitmap:Bitmap;
		private var _display:Sprite;
		
		private var _lineText:TextField;
		
		private var _toolImag:DisplayObject;
		
		
		public var hasDie:Boolean=false;
		public var hasEat:Boolean=false;
		
		public var effectEat_SN:Signal=new Signal(TileData,int,int);
		
		private var _tileData:TileData;
		
		public function get tileData():TileData{
			return _tileData;
		}
		
		public function get display():DisplayObject{
			return _display;
		}
		
		private var idleFlag:Boolean=false;
		
		public function die():void{
			hasDie=true;
			_bitmap.bitmapData=null;
			tileData.hasDie=true;
			GameConstConfig.log("[die]\t"+this.toString());
		}
		
		public function eat():void{
			if(couldEat() && hasDie){
				hasEat=true;
				if(_toolImag && _display.contains(_toolImag)){
					_display.removeChild(_toolImag);
				}
				tileData.hasEat=true;
				GameConstConfig.log("[eat]\t"+this.toString());
				effectEat_SN.dispatch(_tileData,tileX,tileY);
			}
		}
		
		/**
		 *   受到伤害
		 */
		public function injure(hurtValue:Number):Boolean{
			if(hasDie){
				return false;
			}
			if(_tileData.couldDrill){
				life-=hurtValue;
				if(life<=0){
					die();
				}
			}
			return true;
		}
		
		public function toString():String{
			return "(id:"+id+",\ttype:"+_tileData.type+",\ttx:"+tileX+",\tty:"+tileY+",\tlife:"+life.toFixed(2)+")";
		}
		
		
		
		public function couldEat():Boolean{
			return _tileData.couldEat && !hasEat;
		}
		public function couldDrill():Boolean{
			return _tileData.couldDrill;
		}
		
		public function init($tileData:TileData,$life:Number,$tx:int,$ty:int):void
		{
			
//			if(_lineText==null){
//				_lineText=new TextField();
//				_display.addChild(_lineText);
//			}
//			_lineText.text=$tileData.line+"";
			
			_tileData=$tileData;
			hasDie=_tileData.hasDie;
			idleFlag=false;
			hasEat=_tileData.hasEat;
			tileX=$tx;
			tileY=$ty;
			life=$life;
			id=tileY*100+tileX;
		
			var layerP:Object=DigGameControl.instance.calcTileToLayerPosition(tileX,tileY);
			_display.x=layerP.x;
			_display.y=layerP.y;
			
			setBitmapData();
			
			if(_tileData.defaultDie){
				life=-1;
				die();
			}
			
		}
		
		public function recycle():void{
			_bitmap.bitmapData=null;
			if(_toolImag && _toolImag.parent){
				_toolImag.parent.removeChild(_toolImag);
			}
			idleFlag=true;
			
		}
		
		private static var bitdataDic:Dictionary=new Dictionary();
		private static function getTileBitdata(cls:String):BitmapData{
			if(bitdataDic[cls]==null){
				bitdataDic[cls]=new (ApplicationDomain.currentDomain.getDefinition(cls) as Class)();
			}
			return bitdataDic[cls];
		}
		
		private function setBitmapData():void{

			if(_tileData.hasBackground ){
				_bitmap.bitmapData=getTileBitdata(_tileData.back);
			}else{
				_bitmap.bitmapData=null;
			}
			
			if(hasDie){
				_bitmap.bitmapData=null;
			}
			
			
			
			if(_tileData.hasImag){
				if(_tileData.type==ResourceConst.R_equip){
//					_toolImag=AssetManager.createDisplay(_tileData.image);
					var sp:Sprite=new Sprite();
					var node:Node_equip=XMLDataManager.getEquipById(_tileData.xid);
//					var back:
					var back:DisplayObject=new ImageBitmap("bg_equip_"+node.star);
					back.width=GameConstConfig.Tile_Width;
					back.height=GameConstConfig.Tile_Height;
					sp.addChild(back);
					var font:DisplayObject=AssetManager.createDisplay(_tileData.image);
					font.width=GameConstConfig.Tile_Width;
					font.height=GameConstConfig.Tile_Height;
					sp.addChild(font);
					_toolImag=sp;
				}else{
					_toolImag=AssetManager.createDisplay(_tileData.image);
				}
				
				
				if(_tileData.topLayer){
					_toolImag.width=GameConstConfig.Tile_Width;
					_toolImag.height=GameConstConfig.Tile_Height;
					_toolImag.x=-_toolImag.width/2+_display.x;
					_toolImag.y=-_toolImag.height/2+_display.y;
					_bossLayer.addChild(_toolImag);
					
					
				}else{
					_display.addChild(_toolImag);
					
					_toolImag.width=GameConstConfig.Tile_Width;
					_toolImag.height=GameConstConfig.Tile_Height;
					_toolImag.x=-_toolImag.width/2;
					_toolImag.y=-_toolImag.height/2;
				}
				
				
			}
//			new (AssetManager.getAssetClass("icon_banghui_huizhang1") as Class)(); 
//			_bitmap.bitmapData=new (AssetManager.getAssetClass("icon_boom") as Class)(); 
			
			if(_bitmap.bitmapData!=null){
				_bitmap.width=GameConstConfig.Tile_Width;
				_bitmap.height=GameConstConfig.Tile_Height;
				_bitmap.x=-_bitmap.width/2;
				_bitmap.y=-_bitmap.height/2;
			}else{
				//GameConstConfig.log();
			}
			
			if(hasEat){
				if(_toolImag && _display.contains(_toolImag)){
					_display.removeChild(_toolImag);
				}
			}
			
		}
		
		
		public function isBoundary():Boolean{
			return _tileData.id==TileData.TY_Boundary || TileData.TY_BWall==_tileData.id;
		}
		
		
		public function destory():void{
			
		}
		
		
		
		
		
		
		
		private static const ClsMap:Object={
			101:"icon_boom",
			102:"icon_box",
			103:"icon_key",
			104:"icon_time",
			105:"icon_zuantou"
		};
	}
}

