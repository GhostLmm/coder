package Tool.platform.meijiPlat
{
	import flash.events.Event;
	
	public class GameServerEvent extends Event
	{
		public static const Evt_Server:String="server";
		
		public function GameServerEvent(type:String)
		{
			super(type);
		}
		
		public var key:String;
		public var json:String;
		public var data:Object;
		
//		public var success:Boolean;
		/**  数据是否有效， 比如网络问题 返回的数据就是无效的
		 * */
		public var effect:Boolean;
		
		
		public var url:String;
		
		public function setKeyAndJson($key:String,$json:String):void
		{
			key=$key;
			json=$json;
			try{
				data=JSON.parse(json);
				if(data.hasOwnProperty("code")){
					if(data.code.toString()=="101" || data.code.toString()=="102" || data.code.toString()=="103")
					{
						effect=false;
					}else{
						effect=true;
					}
				}else{
					effect=true;
				}
			}catch(e:Error){
				effect=false;
			}
		}
		
	}
}