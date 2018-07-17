package Tool.ghostCacheLoad
{
	import com.hurlant.util.Base64;
	
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.SharedObject;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;

	public class GLCacheLoadConst
	{
		public function GLCacheLoadConst()
		{
		}
		internal static var _hashDic:Dictionary;
		
		internal static const sharePath:String="ghsotlmm.cacheload";
		
		/**  设置 hash字典， 如果在此之前已经设置过，并且有 loader正在加载，那么当前加载的loader将被中断，跑出 FORCESTOP 事件
		 * */
		public static function setHashDic(hashDic:Dictionary):void
		{
			if(_hashDic!=null)
			{
				//需要 吧正在加载过程的 loader 全部 清理 
//				restartAllLoader();
				
			}else{
				_hashDic=new Dictionary();
			}
			
			for (var key:String in hashDic){
				_hashDic[key]=hashDic[key];
			}
			
		}
		
		public static function setHashFile(url:String,version:String):void
		{
			if(_hashDic==null){
				_hashDic=new Dictionary();
			}
			_hashDic[url]=version;
		}
		
//		public static function setHashDicFromXmlList(hashXmlList:XMLList):void{
//			
//		}
		
		internal static function getHashCode(fileUrl:String):String{
			if(_hashDic==null){
				return null;
			}
			return _hashDic[fileUrl];
		}
		
		internal static function createLocalFilePath(fileUrl:String,hashCode:String):String{
			var sourcePath:String=fileUrl+"@code:"+hashCode;
			var targetPath:String=Base64.encode(sourcePath);
			var __reg:RegExp = new RegExp('\\\\', 'g');
			targetPath=targetPath.replace(__reg, "-");
			targetPath=targetPath.replace(/\//g, "~")
			return targetPath;
		}
		
		internal static function hasCacheFile(fileUrl:String):Boolean{
			var hash:String=getHashCode(fileUrl);
			if(hash==null){
				return false;
			}else{
				var path:String=createLocalFilePath(fileUrl,hash);
				if(hasLocalFile(path)){
					return true;
				}
				return false;
			}
		}
		
		internal static function readFileFromCache(fileUrl:String,hashCode:String):ByteArray{
			try{
				if(hashCode==null)
				{
					return null;
				}
				var path:String=createLocalFilePath(fileUrl,hashCode);
				var file:File = File.applicationStorageDirectory.resolvePath(path);
				var data:ByteArray = new ByteArray();
				var fs:FileStream = new FileStream();
				fs.open(file,FileMode.READ);
				fs.readBytes(data);
				fs.close();
				trace("File read complete FileUrl:"+fileUrl+"\t"+file.nativePath);
				return data;
			}catch(e:Error){
				trace("File read form cache error fileUrl:"+fileUrl);
				trace("Error: "+e.message);
				return null;
			}
			return null;
		}
		
		internal static function deleteOldFile(fileUrl:String):void{
			try{
				var so:SharedObject=SharedObject.getLocal(sharePath);
				if(so && so.data.hasOwnProperty(fileUrl) )
				{
					var oldHash:String=so.data[fileUrl];
					var oldPath:String=createLocalFilePath(fileUrl,oldHash);
					var file:File = File.applicationStorageDirectory.resolvePath(oldPath);
					if(file.spaceAvailable && file.size)
					{
						file.deleteFileAsync();
						trace("delete file "+file.nativePath);
					}
				}
			}catch(e:Error){
				trace("deleteOldFile error file: "+fileUrl+" error:"+e.message);
			}
		}
		
		internal static function saveFileToLocal(fileUrl:String,hashCode:String,data:ByteArray):void{
			var path:String=createLocalFilePath(fileUrl,hashCode);
			var file:File = File.applicationStorageDirectory.resolvePath(path);
			if(file.spaceAvailable && file.size)
			{
				trace("The file is exist, couldn't save. file: "+fileUrl+" code:"+hashCode+" path:"+path);
				return;
			}
			
			try
			{
				var fs:FileStream = new FileStream();
				fs.open(file,FileMode.WRITE);
				fs.writeBytes(data);
				fs.close();
				
				var so:SharedObject=SharedObject.getLocal(sharePath);
				
				so.data[fileUrl]=hashCode;
				so.flush();
				
				
				trace("File save complete file: "+fileUrl+" code:"+hashCode+" path:"+path);
			}
			catch(e:Error){
				trace("File save error file: "+fileUrl+" code:"+hashCode+" path:"+path);
				trace(e.message);
			}
		}
		
		/**   
		 * */
		private static function hasLocalFile(path:String):Boolean
		{
			var file:File = File.applicationStorageDirectory.resolvePath(path);
			
			if(file.spaceAvailable && file.size)
			{
				return true;
			}
			return false;
		}
		
		
		
		
		//  控制loader 在重启加载是，全部停止当前正在加载的数据
		
		private static var glLoaderVect:Vector.<GLLoader>=new Vector.<GLLoader>();
		
		internal static function addLoader(glLoader:GLLoader):void{
			for each(var loader:GLLoader in glLoaderVect){
				if(loader==glLoader){
					return ;
				}
			}
			glLoaderVect.push(glLoader);
		}
		
		internal static function removeLoader(glLoader:GLLoader):void{
			var index:int=0;
			var vectLength:int=glLoaderVect.length;
			var loader:GLLoader;
			for(index=0; index<vectLength; index++){
				loader=glLoaderVect[index];
				if(loader==glLoader){
					glLoaderVect.splice(index,1);
					return ;
				}
			}
		}
		
		private static function restartAllLoader():void{
			for each(var loader:GLLoader in glLoaderVect){
				loader.forceStop();
			}
//			glLoaderVect.length=0;
			glLoaderVect=new Vector.<GLLoader>();
		}
		
	}
}