package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;
	
	import util.Util;

	public class AssetManager
	{
		public function AssetManager()
		{
		}
		private static var clsDic:Dictionary=new Dictionary();
		
		private static var bitdataMap:Dictionary=new Dictionary();
		
		public static function createAsset(assetName:String):*{
			var cls:Class;
			if(clsDic.hasOwnProperty(assetName)){
				cls=clsDic[assetName];
			}else{
				
				cls=ApplicationDomain.currentDomain.getDefinition(assetName) as Class;
				clsDic[assetName]=cls;
			}
			if(bitdataMap.hasOwnProperty(cls)){
				return bitdataMap[cls];
			}else{
				var asset:*=new cls();
				if(asset is BitmapData){
					bitdataMap[cls]=asset;
				}
				return asset;
			}
			
		}
		
		public static function getAssetClass(assetName:String):Class{
			try{
//				if(assetName=="num1_p")
//				{
//					assetName="num2_p"
//				}
				var cls:Class;
				if(clsDic.hasOwnProperty(assetName)){
					cls=clsDic[assetName];
				}else{
					cls=ApplicationDomain.currentDomain.getDefinition(assetName) as Class;
					clsDic[assetName]=cls;
				}
			}catch(e:Error){
				
				trace("[资源没有嵌入]\t"+assetName);
				throw e;
			}
			return cls;
		}
		
		public static function createDisplay(assetName:String):DisplayObject{
			var asset:*=createAsset(assetName);
			if(asset is BitmapData){
				return new Bitmap(asset);
			}
			if(asset is DisplayObject){
				return asset;
			}
			return null;
		}
		
		
		public static const FT_1:String="num1";
		public static const FT_2:String="num2";
		public static const FT_3:String="num3";
		public static const FT_4:String="num4";
		public static const FT_5:String="num5";
		
		private static const FontSizeConfig:Object={
			num1:[35,65],
			num2:[63,66],
			num3:[63,66],
			num4:[34,60],
			num5:[70,100]
		};
		
		public static function getFontWidth(type:String=FT_1):Number{
			return FontSizeConfig[type][0];
		}
		public static function getFontHeight(type:String=FT_1):Number{
			return FontSizeConfig[type][1];
		}
			
			
		private static var fontBitDic:Dictionary=new Dictionary();
		/**
		 *   获取美术字 的 bitdata
		 */
		public static function getFontBitdata(font:String,type:String=FT_1):BitmapData
		{
			if(font.length!=1){
				throw new Error("美术字必须为一个字符: "+font);
			}
			if(font=="/"){
				font="x";
			}
			if(font==" "){
				font="k";
			}
			if(font=="+"){
				font="a";
			}
			if(font=="-"){
				font="p";
			}
			if(!fontBitDic.hasOwnProperty(type+"_"+font)){
				fontBitDic[type+"_"+font]=new (getAssetClass(type+"_"+font))();
			}
			return fontBitDic[type+"_"+font];
		}
		
		/**
		 *   创建素材， 动态文本赋值
		 */
		public static function createMCForText(cls:Class):MovieClip{
			var mc:MovieClip = new cls();
			Util.setStaticText(mc);
			return mc;
		}
	}
}