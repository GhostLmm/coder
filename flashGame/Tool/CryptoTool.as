package Tool
{
	import com.hurlant.crypto.prng.ARC4;
	import com.hurlant.crypto.symmetric.DESKey;
	
	import flash.utils.ByteArray;

	public class CryptoTool
	{
		public function CryptoTool()
		{
		}
		
		
		/**   解密
		 * */
		public static function decode(source:ByteArray,password:String):ByteArray
		{
			source.position=0;
			var key:ByteArray=convertStringToByteArray(password);
//			var mydes:DESKey=new DESKey(key);
			var mydes:ARC4=new ARC4(key);
			mydes.decrypt(source);
			mydes.dispose();
			return source;
		}
		/**  加密
		 * */
		public static function encode(source:ByteArray,password:String):ByteArray
		{
			source.position=0;
			var key:ByteArray=convertStringToByteArray(password);
			var mydes:ARC4=new ARC4(key);
			mydes.encrypt(source);
			mydes.dispose();
			return source;
		}
		public static function convertStringToByteArray(str:String):ByteArray
		{
			var bytes:ByteArray;
			if (str)
			{
				bytes=new ByteArray();
				bytes.writeUTFBytes(str);
			}
			return bytes;
		} 
		
		public static function convertByteArrayToString(byte:ByteArray):String
		{
			byte.position=0;
			return byte.readUTFBytes(byte.length);
		}
	}
}