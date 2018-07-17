package Tool
{
	import Tool.platform.PlatformManager;
	
	import flash.system.Capabilities;
	import flash.system.System;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import model.address.AddressInfo;
	import model.login.ServerInfo;

	public class PlayerGuideLog
	{
		private static var m_instance:PlayerGuideLog;
		
		private var lastTime:int = 0;
		
		public static function get PlayerGuideLogURL():String
		{
			return AddressInfo.Log_Url;
		}
		
		public function PlayerGuideLog()
		{
			lastTime = getTimer()/1000;
		}
		public static function getInstance():PlayerGuideLog
		{
			if(null==m_instance)
			{
				m_instance=new PlayerGuideLog();
			}
			return m_instance;
		}
		public function log(_arg1:Object,_arg2:Object=null):void
		{
			if(!TUTORIAL._completed)
			{
				var curTime:int = getTimer()/1000;
				var postObj:Object={};
				postObj["uid"]=BASE._userID;
				postObj["level"]=BASE._baseLevel;
				postObj["time"]=GLOBAL.Timestamp();
				postObj["timeCost"]=curTime - lastTime;
				postObj["sid"]=ServerInfo.getInstance().getNowServerId();
				postObj["act1"]=_arg1;
				postObj["platform"]=PlatformManager.getInstance().getPlatName();
				if(_arg2)
				{
					postObj["act2"]=_arg2;
				}
				sendHttpRequest(postObj);
				lastTime = curTime;
			}
		}
		private var operateMap:Dictionary = new Dictionary();
		/** 操作统计，对应按钮如下:<br />
		 * 1 军衔
		 * 2 新兵手册
		 * 3 战报
		 * 4 间谍卫星
		 * 5 任务
		 * 6 战役
		 * 7 缩放按钮

		 * 8 内置活动
		 * 9 喜从天降
		 * 10 幸运翻牌
		 * 11 连续登陆
		 * 12 资源抽奖
		 * 13 累计签到
		 * 14 幸运砸蛋
		 * 15 梦幻轮盘

		 * 16 活动
		 * 17 将领
		 * 18 防守活动
		 * 19 贵宾俱乐部
		 * 20 首冲
		 * 21 财神
		 * 22 邀请码
		 * 23 公告
		 * 24 礼包

		 * 25 在线奖励
		 * 26 充值按钮（充值界面的6档购买按钮）

		 * 27 左下系统按钮
		 * 28 空指部
		 * 39 战车工厂
		 * 30 兵营
		 * 31 步兵训练营
		 * 32 作战实验室
		 * 33 建造
		 * 34 武器中心

		 * 35 右下系统按钮
		 * 36 包裹
		 * 37 好友
		 * 38 账号设置
		 * 39 商店
		 * */
		public function saveOperateLog(btnName:String, count:int=1):void
		{
			if(operateMap[btnName])
			{
				operateMap[btnName] += count;
			}
			else{
				operateMap[btnName] = count;
			}
		}
		
		/** 发送操作日志 */
		public function sendOperateLog():void
		{
			var str:String="";
			for(var key:String in operateMap)
			{
				if(operateMap[key])
				{
					str += key;
					str += "=";
					str += operateMap[key];
					str += ",";
					operateMap[key] = 0;
				}
			}
//			trace("操作日志: "+str);
			if(str.length > 0)
			{
				var postObj:Object = {};
				postObj["uid"]=BASE._userID;
				postObj["level"]=BASE._baseLevel;
				postObj["sid"]=ServerInfo.getInstance().getNowServerId();
				postObj["platform"]=PlatformManager.getInstance().getPlatName();
				postObj["op"] = str;
				HttpRequest.getInstance().postRequest(AddressInfo.OperateLog_Url,postObj,handleFunc);
			}
		}
		private function sendHttpRequest(_postObj:Object):void
		{
			HttpRequest.getInstance().postRequest(PlayerGuideLogURL,_postObj,handleFunc);
		}
		private function handleFunc(_data:Object):void
		{
			
		}
		/** 发送机器信息
		 * */
		public function sendPhoneInfo():void
		{
			if(TUTORIAL._completed)
			{
				return;
			}
			var phoneInfo:Object={};
			phoneInfo["_internal"]=Capabilities._internal;
			phoneInfo["avHardwareDisable"]=Capabilities.avHardwareDisable;
			phoneInfo["cpuArchitecture"]=Capabilities.cpuArchitecture;
			phoneInfo["hasAccessibility"]=Capabilities.hasAccessibility;
			phoneInfo["hasAudio"]=Capabilities.hasAudio;
			phoneInfo["hasAudioEncoder"]=Capabilities.hasAudioEncoder;
			phoneInfo["hasEmbeddedVideo"]=Capabilities.hasEmbeddedVideo;
			phoneInfo["hasIME"]=Capabilities.hasIME;
			phoneInfo["hasMP3"]=Capabilities.hasMP3;
			phoneInfo["hasPrinting"]=Capabilities.hasPrinting;
			phoneInfo["hasScreenBroadcast"]=Capabilities.hasScreenBroadcast;
			phoneInfo["hasScreenPlayback"]=Capabilities.hasScreenPlayback;
			phoneInfo["hasStreamingAudio"]=Capabilities.hasStreamingAudio;
			phoneInfo["hasStreamingVideo"]=Capabilities.hasStreamingVideo;
			phoneInfo["hasTLS"]=Capabilities.hasTLS;
			phoneInfo["hasVideoEncoder"]=Capabilities.hasVideoEncoder;
			phoneInfo["isDebugger"]=Capabilities.isDebugger;
			phoneInfo["isEmbeddedInAcrobat"]=Capabilities.isEmbeddedInAcrobat;
			phoneInfo["language"]=Capabilities.language;
			phoneInfo["languages"]=Capabilities.languages;
			phoneInfo["localFileReadDisable"]=Capabilities.localFileReadDisable;
			phoneInfo["manufacturer"]=Capabilities.manufacturer;
			phoneInfo["maxLevelIDC"]=Capabilities.maxLevelIDC;
			phoneInfo["os"]=Capabilities.os;
			phoneInfo["pixelAspectRatio"]=Capabilities.pixelAspectRatio;
			phoneInfo["playerType"]=Capabilities.playerType;
			phoneInfo["screenColor"]=Capabilities.screenColor;
			phoneInfo["screenDPI"]=Capabilities.screenDPI;
			phoneInfo["screenResolutionX"]=Capabilities.screenResolutionX;
			phoneInfo["screenResolutionY"]=Capabilities.screenResolutionY;
			phoneInfo["serverString"]=Capabilities.serverString;
			phoneInfo["supports32BitProcesses"]=Capabilities.supports32BitProcesses;
			phoneInfo["supports64BitProcesses"]=Capabilities.supports64BitProcesses;
			phoneInfo["touchscreenType"]=Capabilities.touchscreenType;
			phoneInfo["version"]=Capabilities.version;
			var str:String="";
			for(var key:String in phoneInfo)
			{
				str+=key;
				str+="=";
				str+=phoneInfo[key].toString();
				str+=",";
			}
			log("deviceinfo",str);
		}
	}
}