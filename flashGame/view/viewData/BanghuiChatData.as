package view.viewData
{
	import com.fish.modules.core.gameVO.BanghuichatVO;

	public class BanghuiChatData
	{
		public var userLevel:int;
		public var userName:String="";
		public var info:String;
		public var vipLevel:int;
		public var time:Number;
		public var id:Number;
		public var uid:int;
		public var serverId:int;
		public var pos:int;
		
		public function BanghuiChatData(_vo:BanghuichatVO)
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
			pos=int(infoObj.pos);
		}
		public function destroy():void
		{
			
		}
	}
}