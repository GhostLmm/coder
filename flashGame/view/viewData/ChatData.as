package view.viewData
{
	import com.fish.modules.core.gameVO.ChatVO;

	public class ChatData
	{
		public var userLevel:int;
		public var userName:String="";
		public var info:String;
		public var vipLevel:int;
		public var time:Number;
		public var id:Number;
		public var uid:int;
		public var serverId:int;
		
		public function ChatData(_vo:ChatVO)
		{
			id=_vo.id;
			var infoStr:String=_vo.chatInfo;
			var infoObj:Object=JSON.parse(infoStr);
			userLevel=int(infoObj.level);
			userName=String(infoObj.name);
			time=Number(infoObj.time);
			uid=int(infoObj.uid);
			vipLevel=int(infoObj.vip);
			info=String(infoObj.info);
			serverId=int(infoObj.zoneId);
		}
		public function destroy():void
		{
			
		}
	}
}