package Tool
{

	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.utils.ByteArray;
	import flash.utils.getTimer;
	
	import org.osflash.signals.Signal;

	public class CapacityDownload
	{
		public function CapacityDownload()
		{
		}
		
		/**   初始化下载信息     文件总大小 / 已经下载的大小
		 * */
		public var loadInfo_SN:Signal=new Signal(Number,Number);
		/**   下载过程 信息  文件总大小 / 已经下载的大小
		 * */
		public var loadProgress_SN:Signal=new Signal(Number,Number,Number);
		
		/**   下载失败
		 * */
		public var loadFail_SN:Signal=new Signal();
		
		/**  下载成功
		 * */
		public var loadSuccess:Signal=new Signal();
		
		
		
		/**  设置网络文件地址、本地保存文件地址、每次加载的数据大小
		 * */
		public function setBaseInfo($webUrl:String,$localUrl:String,$range:Number=100000):void{
			_webUrl=$webUrl;
			_localUrl=$localUrl;
			_range=$range;
		}
		
		/**  开始获取网络上文件信息
		 * */
		public function getWebFileInfo():void{
			initLoader();
		}
		
		
		private var _range:Number=50000;
		private var _webUrl:String;
		private var _localUrl:String;
		
		private var _lastLoadTime:Number=0;
		
		private var getContentLengthLoader:URLLoader;
		private var rangeLoader:URLLoader;
		
		private var _fileSize:Number;
		
		private var _file:File;
		
		private var _startPoint:Number=0;
		
		private var _hasComplete:Boolean=false;
		
		private var _state:int=0;
		private var _errorTick:int=10;
		
		private var _curLoadBytes:Number;
		
//		private var timer:Timer;
		
		private function initFile():void{
			_file= File.applicationStorageDirectory.resolvePath(_localUrl);
			trace("本地目录："+_file.nativePath);
			var fileStr:FileStream = new FileStream();
			if(_file.exists) {//如果文件是存在的，就说明下载过，需要计算从哪个点开始下载
				fileStr.open(_file, FileMode.READ);
				_startPoint = fileStr.bytesAvailable;//计算从哪个点开始下载
				fileStr.close();//关闭文件流
			}
			_curLoadBytes=_startPoint;
			if(_startPoint>=_fileSize){
				_hasComplete=true;
			}
		}
		
		public function startRangeLoad():void{
			if(!_hasComplete){
				
				rangeLoadFile();
			}
		}
		
		public function continueLoad():void{
			if(_hasComplete) return ;
			if(_state==1){
				initLoader();
			}
			if(_state==2){
				rangeLoadFile();
			}
		}
		
		private function initLoader():void{
			_state=1;
			trace("初始化预加载");
			if(getContentLengthLoader==null){
				getContentLengthLoader=new URLLoader();
				getContentLengthLoader.addEventListener(ProgressEvent.PROGRESS,getSize);
				getContentLengthLoader.addEventListener(IOErrorEvent.IO_ERROR,onError);
				getContentLengthLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);
			}
			getContentLengthLoader.load(new URLRequest(_webUrl));
		}
		
		private function clearGetLoader():void{
			if(getContentLengthLoader){
				getContentLengthLoader.addEventListener(ProgressEvent.PROGRESS,getSize);
				getContentLengthLoader.addEventListener(IOErrorEvent.IO_ERROR,onError);
				getContentLengthLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);
				getContentLengthLoader.close();
				getContentLengthLoader=null;
			}
			
		}
		private function clearRangelLoad():void{
			if(rangeLoader){
				rangeLoader.removeEventListener(ProgressEvent.PROGRESS,onRangeProgress);
				rangeLoader.removeEventListener(IOErrorEvent.IO_ERROR,onError);
				rangeLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);
				rangeLoader.removeEventListener(Event.COMPLETE,onRangeComplete);
				rangeLoader=null;
			}
		}
		
		public function destory():void{
			clearGetLoader();
			clearRangelLoad();
			if(loadFail_SN) {loadFail_SN.removeAll();loadFail_SN=null;}
			if(loadInfo_SN) {loadInfo_SN.removeAll();loadInfo_SN=null;}
			if(loadProgress_SN) {loadProgress_SN.removeAll();loadProgress_SN=null;}
			if(loadSuccess) {loadSuccess.removeAll();loadFail_SN=null;}
		}
		
		private function onError(evt:Object):void{
//			var e:IOErrorEvent; e.text
			trace(evt.text);
			_errorTick--;
			if(_errorTick<=0){
				clearGetLoader();
				clearRangelLoad();
				loadFail_SN.dispatch();
				return ;
			}
			
			
			if(_state==1){
				initLoader();
			}
			if(_state==2){
				rangeLoadFile();
			}
		}
		
		private function getSize(evt:ProgressEvent):void
		{
		
			_fileSize=evt.bytesTotal;
			trace("文件总大小： "+_fileSize);
			initFile();
			loadInfo_SN.dispatch(_fileSize,_startPoint);
			clearGetLoader();
			
		}
		
		private function rangeLoadFile():void
		{
			_state=2;
			var endPoint:Number=_startPoint+_range;
			endPoint=Math.min(endPoint,_fileSize);
			endPoint--;
			if(_hasComplete){
				trace("加载完成");
				clearRangelLoad();
				loadSuccess.dispatch();
				return ;
			}
			if(rangeLoader==null){
				rangeLoader=new URLLoader();
				rangeLoader.addEventListener(ProgressEvent.PROGRESS,onRangeProgress);
				rangeLoader.addEventListener(IOErrorEvent.IO_ERROR,onError);
				rangeLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);
				rangeLoader.addEventListener(Event.COMPLETE,onRangeComplete);
			}
			
			trace(" 断点加载 "+"bytes="+_startPoint+"-"+endPoint);
			var rangeRequest:URLRequest = new URLRequest(_webUrl);
			var header:URLRequestHeader = new URLRequestHeader("Range", "bytes="+_startPoint+"-"+endPoint);//注意这里很关键，我们在请求的Header里包含对Range的描述，这样服务器会返回文件的某个部分
			rangeRequest.requestHeaders.push(header);//将头信息添加到请求里
			rangeLoader.dataFormat=URLLoaderDataFormat.BINARY;
			rangeLoader.load(rangeRequest);
			_lastLoadTime=getTimer();
		}
		
		
		
		private function onRangeProgress(evt:ProgressEvent):void{
			
			var useTime:Number=getTimer()-_lastLoadTime;
			if(useTime==0){
				return ;
			}
			_lastLoadTime=getTimer();
			var loadBytes:Number=_startPoint+evt.bytesLoaded-_curLoadBytes;
			
			_curLoadBytes=_startPoint+evt.bytesLoaded;
			var loadSpeed:Number=loadBytes*1000/useTime;
			
			trace(" 加载过程 ： "+_fileSize+"\t/\t"+_curLoadBytes+"\t/\t"+loadSpeed);
			loadProgress_SN.dispatch(_fileSize,_curLoadBytes,loadSpeed);
		}
		private function onRangeComplete(evt:Event):void{
			var currentData:ByteArray = rangeLoader.data;//得到下载的数据
			var fileStr:FileStream = new FileStream();
			fileStr.open(_file, FileMode.UPDATE);
			fileStr.position = fileStr.bytesAvailable;//将指针指向文件尾
			fileStr.writeBytes(currentData, 0, currentData.length);//在文件中写入新下载的数据
			fileStr.close();//关闭文件流
			
			_startPoint+=currentData.length;
			_curLoadBytes=_startPoint;
			
//			clearRangelLoad();
			
			if(_startPoint>=_fileSize){
				_hasComplete=true;
				trace("加载完毕");
			}
			rangeLoadFile();
		}
		
	}
}