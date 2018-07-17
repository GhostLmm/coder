package com.fish
{
	import flash.geom.Point;
	
	import org.osflash.signals.Signal;

	public class GLBaseData
	{
		public function GLBaseData()
		{
		}
	/*	public static var assetUrl:String="Assets/";
//		http://192.168.40.58:80/tqt/TestServer
		//内网
//		public static var serverUrl:String="http://192.168.200.112/tqt/TqtServer";
		//外网
		public static var serverUrl:String="http://210.73.220.241/tqt/TqtServer";
		
//		public static var serverUrl:String="http://192.168.40.58/tqt/TqtServer";
		
		public static var accountServerUrl:String="http://210.73.220.241/tqt/AccountServer";
//		public static var accountServerUrl:String="http://192.168.200.112/tqt/AccountServer";
		
		
		public static var CoreUrl:String="";*/
		
		
		
		
		/**   外围账号id， 通常是第三方的 openId
		 * */
		public static var accountId:String;
		
		public static var userName:String;
		/**   用户id， 由accountId 和 serverId 决定
		 * */
		public static var userId:String;
		/**   服务器id
		 * */
		public static var serverId:String;
		
		public static var LastServerId:String;
		
		public static var clientVersion:String="1";
		
		public static var serverList:Array;
		
		public static var author:String;
		
		public static var platName:String;
		
		/**   账号是否绑定过
		 * */
		public static var hasBindAccount:Boolean=false;
		
		/**  新手引导完成标准
		 * */
//		public static var hasCompleteNewGuide:Boolean=true;
		
		public static var gameConfig:XML;
		
		public static function clear():void
		{
			accountId=null;
			userId=null;
//			serverId=null;
			serverList=null;
		}
		public static var LastServerChange_SN:Signal=new Signal();
		public static function setLastServerId(_value:String):void
		{
			LastServerId=_value;
			LastServerChange_SN.dispatch();
		}
		
		/** 上一次主城人物的位置  **/
		public static var lastHeroPosition:Point;
		
		
		public static function setHeroPosition(hx:Number,hy:Number):void{
			if(lastHeroPosition==null){
				lastHeroPosition=new Point();
			}
			lastHeroPosition.x=hx;
			lastHeroPosition.y=hy;
		}
	}
}