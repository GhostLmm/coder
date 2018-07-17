package
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;

	public class FileSave
	{
		public function FileSave()
		{
		}
		public static function save(filePath:String,byte:ByteArray,offset:int=0,length:int=0):void
		{
			var file:File=File.documentsDirectory.resolvePath(filePath);
			var fileStream:FileStream=new FileStream();
			fileStream.open(file,FileMode.WRITE);
			fileStream.writeBytes(byte,offset,length);
			fileStream.close();
		}
		
		public static function readFile(file:File):ByteArray
		{
			var byts:ByteArray=new ByteArray();
			var fileStream:FileStream=new FileStream();
			fileStream.open(file,FileMode.READ);
			fileStream.readBytes(byts);
			return byts;
		}
		
		public static function saveString(filePath:String,content:String):void
		{
			var file:File=File.documentsDirectory.resolvePath(filePath);
			var fileStream:FileStream=new FileStream();
			fileStream.open(file,FileMode.WRITE);
			fileStream.writeUTFBytes(content);
			fileStream.close();	
		}
	}
}