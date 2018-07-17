package util
{
	import com.adobe.images.PNGEncoder;
	import com.ghostlmm.xmldata.Node_monster_type;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.BitmapData;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import snake.BattleAssetPreload;
	import snake.GameUtil;
	import snake.gameEnemys.CharSpriteAsset;

	public class ToolFunc
	{
		public function ToolFunc()
		{
		}
		public static function createRoleTouxiang():void
		{
			var xmllist:Array=XMLDataManager.Node_monster_typeArray;
			var index:int;
			
			for(index=0;index<xmllist.length;index++)
			{
				var xml:Node_monster_type=xmllist[index] as Node_monster_type;
				var charAsset:CharSpriteAsset;
				var appearrance:Array=JSON.parse(xml.movie_frame) as Array;
				var color:Array=GameUtil.turnArryStringToUint(xml.colors);
				charAsset=BattleAssetPreload.getInstance().getPlayCharAsset(appearrance,color);
				saveBitmap(charAsset.char_head_bm,xml.id.toString());
			}
		}
		public static function saveBitmap(_bitMapData:BitmapData,_name:String):void
		{
			var imgByteArray:ByteArray = PNGEncoder.encode(_bitMapData);
			var fl:File = File.desktopDirectory.resolvePath(("touxiang/"+_name+".png"));
			var fs:FileStream = new FileStream();
			try{
				//open file in write mode
				fs.open(fl,FileMode.WRITE);
				//write bytes from the byte array
				fs.writeBytes(imgByteArray);
				//close the file
				fs.close();
			}catch(e:Error){
				trace(e.message);
			}
		}
	}
}