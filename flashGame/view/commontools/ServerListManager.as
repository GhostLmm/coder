package view.commontools
{	
	import com.ghostlmm.xmldata.Node_serverlist;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.loading.XMLLoader;
	import com.greensock.loading.data.XMLLoaderVars;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	
	import Tool.CryptoTool;
	import Tool.ghostCacheLoad.GLCacheLaoderEvent;
	import Tool.ghostCacheLoad.GLCacheLoadConst;
	import Tool.ghostCacheLoad.GLLoader;
	
	import nochump.util.zip.ZipEntry;
	import nochump.util.zip.ZipFile;
	
	import util.Util;
	
	import view.viewData.ServerData;

	public class ServerListManager
	{
		public function get URL():String
		{
			return UrlConfig.serverListZip;
		}
		public function get Version():String
		{
			return UrlConfig.serverListVersion;
		}
		private var loadSucFunc:Function;
		private var loadFailFunc:Function;
		public function get serverDic():Dictionary{
			return m_serverDic;
		}
		public function ServerListManager()
		{
		}
		private static var m_instance:ServerListManager;
		public static function getInstance():ServerListManager
		{
			if(null==m_instance)
			{
				m_instance=new ServerListManager();
			}
			return m_instance;
		}
		public function loadServerList(_suc:Function=null,_fail:Function=null):void
		{
			loadSucFunc=_suc;
			loadFailFunc=_fail;
			loadZip();
		}
		private var glCacheLoad:GLLoader;
		private  function loadZip():void
		{
			GLCacheLoadConst.setHashFile(URL,Version);
			if(glCacheLoad==null){
				glCacheLoad=new GLLoader();
				glCacheLoad.addEventListener(GLCacheLaoderEvent.COMPLETE,onLoadComplete);
				glCacheLoad.addEventListener(GLCacheLaoderEvent.NETERROR,onNeteError);
			}
			glCacheLoad.startLoad(URL);
		}
		
		public function checkIfLoadSuccess():Boolean
		{
			return isLoadSuccess;
		}
		private var isLoadSuccess:Boolean=false;
		private function onLoadComplete(evt:GLCacheLaoderEvent):void
		{
			var fileData:ByteArray=evt.data;				
			var zipFile:ZipFile=new ZipFile(fileData);
			var entry:ZipEntry=zipFile.entries[0];
			XMLDataManager.parseXml(new XML(zipFile.getInput(entry)),entry.name.substr(0,entry.name.length-4));
			if(null!=loadSucFunc)
			{
				loadSucFunc.apply();
				loadSucFunc=null;
				loadFailFunc=null;
			}
			isLoadSuccess=true;
		}
		public static const Status_Baoman:int=1;
		public static const Status_Xinkai:int=2;
		private var m_serverDataList:Array;
		private var m_serverDic:Dictionary;
		public function get serverDataList():Array
		{
			if(null==m_serverDataList)
			{
				m_serverDataList=[];
				m_serverDic=new Dictionary();
				var xmlList:Array=XMLDataManager.Node_serverlistArray;
				var index:int;
				for(index=0;index<xmlList.length;index++)
				{
					var xml:Node_serverlist=xmlList[index] as Node_serverlist;
					var serverData:ServerData=new ServerData();
					if(xml.id<=int(UrlConfig.maxServerId))
					{
						serverData.zoneId=xml.id;
						serverData.zoneName=xml.name;
						serverData.serverUrl=xml.serverUrl;
						if(xml.id<int(UrlConfig.maxServerId))
						{
							serverData.zoneStatus=Status_Baoman;
						}
						else
						{
							serverData.zoneStatus=Status_Xinkai;
						}
						m_serverDataList.push(serverData);
						m_serverDic[xml.id]=serverData;
					}
				}
				m_serverDataList=m_serverDataList.reverse();
			}
			return m_serverDataList;
		}
		public function getServerDataById(_id:int):ServerData
		{
			if(null!=m_serverDic[_id])
			{
				return m_serverDic[_id];
			}
			return null;
		}
		private function onLoadFail(evt:Event):void
		{
			if(null!=loadFailFunc)
			{
				loadFailFunc.apply();
				loadFailFunc=null;
				loadSucFunc=null;
			}
		}
		private function onNeteError(evt:GLCacheLaoderEvent):void
		{
			TopTip.showExitTip(Util.getLanguage("服务器列表加载失败，是否重新加载?"),loadZip,Util.exitGame,true,null,"退出游戏");
		}
	}
}