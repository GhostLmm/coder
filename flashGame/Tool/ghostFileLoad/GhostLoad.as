package Tool.ghostFileLoad
{
	import com.greensock.TweenLite;
	import com.stimuli.loading.BulkLoader;
	import com.stimuli.loading.BulkProgressEvent;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.TimerEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	
	/**   大文件分割加载器
	 *    自动缓存文件
	 *    
	 * */
	public class GhostLoad extends EventDispatcher
	{
		private var name:String;
		public function GhostLoad(_name:String)
		{
			name=_name;
		}
		
		private var absolutPath:String;
		private var webPerPath:String
		private var partNum:int;
		private var outByte:ByteArray;
		private var totalBytes:Number;
		
		private var needUnion:Boolean=false;
		private var fileDataArray:Array=[];
		
		private var needLoadFilePathArray:Array=[];
		private var loadIndex:int=0;
		
		private var byteLoaded:Number=0;
		
		private var loadTimeOutTimer:Timer;
		
		private var bulkLoad:BulkLoader;
		
		private var completeFlag:Boolean=false;
		
		private var LoadMaxTime:int=30*60;
		
		public function get complete():Boolean
		{
			return completeFlag;
		}
		
		public function get fileData():ByteArray
		{
			return outByte;
		}
		
		public function setInitdata(_absolutPath:String,_webPerPath:String,_totalBytes:Number=0,_partNum:int=0):void
		{
			absolutPath=_absolutPath;
			webPerPath=_webPerPath;
			partNum=_partNum;
			totalBytes=_totalBytes;
			if(partNum>0)
			{
				needUnion=true;
			}
		}
		
		
		public function startLoad():void
		{
			analysePath();
			initTimer();
			loadFile();
			TweenLite.delayedCall(LoadMaxTime,loadFail);
		}

		private function loadFail():void
		{
			if(!completeFlag)
			{
				var ghostEvt:GhostProgressEvent=new GhostProgressEvent(GhostProgressEvent.NETERROR);
				ghostEvt.i_byteLoaded=byteLoaded;
				ghostEvt.i_bytesTotal=totalBytes;
				dispatchEvent(ghostEvt);
				
				if(loadTimeOutTimer)
				{
					loadTimeOutTimer.stop();
					loadTimeOutTimer.removeEventListener(TimerEvent.TIMER,onTimeOut);
					loadTimeOutTimer=null;
				}
				if(bulkLoad)
				{
					bulkLoad.removeEventListener(BulkProgressEvent.PROGRESS,onWebLoadProgress);
					bulkLoad.removeEventListener(BulkProgressEvent.COMPLETE,onWebLoadComplete);
					bulkLoad.removeAll();
					bulkLoad=null;
				}
			}
		}
		private function initTimer():void
		{
			loadTimeOutTimer=new Timer(20000);
			loadTimeOutTimer.addEventListener(TimerEvent.TIMER,onTimeOut);
//			loadTimeOutTimer.start();
		}
		private function onTimeOut(evt:TimerEvent):void
		{
			var ghostEvt:GhostProgressEvent=new GhostProgressEvent(GhostProgressEvent.NETERROR);
			ghostEvt.i_byteLoaded=byteLoaded;
			ghostEvt.i_bytesTotal=totalBytes;
			dispatchEvent(ghostEvt);
			loadFile(true);
		}
		
		private function timerReset():void
		{
			if(loadTimeOutTimer.running)
			{
				loadTimeOutTimer.stop();
			}
			loadTimeOutTimer.reset();
			loadTimeOutTimer.start();
		}
		
		private function clearPartFiles(infoArray:Array):void
		{
			for each(var info:Object in infoArray)
			{
				if(!info.hasOwnProperty("key") || info.key==absolutPath )
				{
					continue;
				}
				var file:File = File.applicationStorageDirectory.resolvePath(info.key);
				if(file.spaceAvailable && file.size)
				{
					try
					{
						file.deleteFileAsync();
						trace("delete file "+file.nativePath);
					}
					catch(e:Error)
					{
						trace("fail to delete "+info.key );
					}
				}
			}
		}
		
		public function clear():void
		{
			if(loadTimeOutTimer)
			{
				loadTimeOutTimer.stop();
				loadTimeOutTimer.removeEventListener(TimerEvent.TIMER,onTimeOut);
				loadTimeOutTimer=null;
			}
			if(bulkLoad)
			{
				bulkLoad.removeEventListener(BulkProgressEvent.PROGRESS,onWebLoadProgress);
				bulkLoad.removeEventListener(BulkProgressEvent.COMPLETE,onWebLoadComplete);
				bulkLoad.removeAll();
				bulkLoad=null;
			}
			if(fileDataArray)
			{
				for each(var data:ByteArray in fileDataArray)
				{
					data.clear();
				}
				fileDataArray=null;
			}
			TweenLite.killDelayedCallsTo(loadFail);
			needLoadFilePathArray=null;
			completeFlag=false;
			if(outByte)
			{
				outByte.clear();
				outByte=null;
			}
		}
		
		private function loadFile(reload:Boolean=false):void
		{
			TweenLite.killTweensOf(loadFile);
			
			
			
			
			if(loadIndex>=needLoadFilePathArray.length)
			{
				if(loadTimeOutTimer!=null)
				{
					loadTimeOutTimer.removeEventListener(TimerEvent.TIMER,onTimeOut);
					loadTimeOutTimer.stop();
					loadTimeOutTimer=null;
				}
				
				if(!completeFlag)
				{
					completeFlag=true;
					
					if(needUnion )
					{
						outByte=new ByteArray();
						for each(var partData:ByteArray in fileDataArray)
						{
							outByte.writeBytes(partData);
						}
						saveToLocal(absolutPath,outByte);
						
						TweenLite.delayedCall(0.2,clearPartFiles,[needLoadFilePathArray.concat([])]);
					}
					else
					{
						outByte=fileDataArray[0];
					}
					var progress:GhostProgressEvent=new GhostProgressEvent(GhostProgressEvent.COMPLETE);
					progress.i_bytesTotal=totalBytes;
					progress.i_byteLoaded=byteLoaded;
					
					dispatchEvent(progress);
					
					
				}
				
				
				//完成加载
				return ;
			}
			
			timerReset();
			
			var info:Object=needLoadFilePathArray[loadIndex];
			
			var traceInfo:String="";
			for (var key:String  in info)
			{
				traceInfo+=" ["+key+"] "+info[key]+"   ";
			}
			trace("start load file : "+traceInfo);
			
			if(info.type=="local")
			{
				var file:File = File.applicationStorageDirectory.resolvePath(info.path);
				var data:ByteArray = new ByteArray();
				var fs:FileStream = new FileStream();
				fs.open(file,FileMode.READ);
				fs.readBytes(data);
				fs.close();
				fileDataArray.push(data);
				
				byteLoaded+=data.length;
				
				var progress1:GhostProgressEvent=new GhostProgressEvent(GhostProgressEvent.PROGRESS);
				progress1.i_bytesTotal=totalBytes;
				progress1.i_byteLoaded=byteLoaded;
				
				dispatchEvent(progress1);
				
				trace("load file complete: "+info.key+" from "+info.type);
				
				loadIndex++;
				
				//0.2s 后加载下一个
				TweenLite.delayedCall(0.2,loadFile);
			}
			else
			{
				if(bulkLoad==null)
				{
					bulkLoad=new BulkLoader("ghostLoad"+name);
					bulkLoad.addEventListener(BulkProgressEvent.PROGRESS,onWebLoadProgress);
					bulkLoad.addEventListener(BulkProgressEvent.COMPLETE,onWebLoadComplete);
				}
				if(reload)
				{
					bulkLoad.reload(info.key);
				}
				else
				{
					bulkLoad.add(info.path,{type:"binary",id:info.key});
					bulkLoad.start();
				}
				
				
			}
			
		}
		
		private function onWebLoadProgress(evt:BulkProgressEvent):void
		{
			var progress:GhostProgressEvent=new GhostProgressEvent(GhostProgressEvent.PROGRESS);
			progress.i_bytesTotal=totalBytes;
			progress.i_byteLoaded=byteLoaded+evt.bytesLoaded;
			dispatchEvent(progress);
			timerReset();
		}
		private function onWebLoadComplete(evt:BulkProgressEvent):void
		{
			byteLoaded+=evt.bytesTotal;
			var info:Object=needLoadFilePathArray[loadIndex];
			var data:ByteArray=bulkLoad.getBinary(info.key);
			fileDataArray.push(data);
			
			
			
			
			var progress:GhostProgressEvent=new GhostProgressEvent(GhostProgressEvent.PROGRESS);
			progress.i_bytesTotal=totalBytes;
			progress.i_byteLoaded=byteLoaded;
			dispatchEvent(progress);
			timerReset();
			
			bulkLoad.removeAll();
			
			trace("load file complete: "+info.path+" from "+info.type);
			
			loadIndex++;
			TweenLite.delayedCall(0.2,loadFile);
			
			saveToLocal(info.key,data);	
			
		}
		
		private function saveToLocal(path:String,data:ByteArray):void
		{
			trace("保存文件："+path);
			var file:File = File.applicationStorageDirectory.resolvePath(path);
			if(file.spaceAvailable && file.size)
			{
				return ;
			}
			
			try
			{
				var fs:FileStream = new FileStream();
				fs.open(file,FileMode.WRITE);
				fs.writeBytes(data);
				fs.close();
			}
			catch(e:Error){
				trace(e.message);
			}
		}
		
		private function analysePath():void
		{
			if(hasLocalFile(absolutPath))
			{
				needLoadFilePathArray.push({path:absolutPath,type:"local",key:absolutPath});
				return ;
			}
			if(needUnion)
			{
				for(var index:int=0; index<partNum; index++)
				{
					var partPath:String=absolutPath+".part"+index;
					if(hasLocalFile(partPath))
					{
						needLoadFilePathArray.push({path:partPath,type:"local",key:partPath});
					}
					else
					{
						needLoadFilePathArray.push({path:(webPerPath+partPath),type:"web",key:partPath});
					}
				}
			}
			else
			{
				needLoadFilePathArray.push({path:(webPerPath+absolutPath),type:"web",key:absolutPath});
			}
		}
		
		//加载本地缓存文件
		private function loadLocalHoleFile():void
		{
			
		}
		
		private function hasLocalFile(path:String):Boolean
		{
			var file:File = File.applicationStorageDirectory.resolvePath(path);
			
			if(file.spaceAvailable && file.size)
			{
				return true;
			}
			return false;
		}
			
	}
}