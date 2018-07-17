package util
{
	
	import com.ghostlmm.xmldata.Node_gongneng_kaiguan;
	import com.ghostlmm.xmldata.XMLDataManager;

	public class SwitchManager
	{

		public var Switch_Huodong:Boolean=false;
		public var Switch_Gonghui:Boolean=false;	
		
		public var Switch_CDKey:Boolean=false;
		
		public var Switch_Jinkuang:Boolean=false;
		
		public var Switch_Shouchong:Boolean=false;
		public var Switch_VIP_Icon:Boolean=false;
		
		
		public var Switch_Gonggao:Boolean=false;
		
		public var Switch_Liaotian:Boolean=false;
		
		public var Switch_Paihangbang:Boolean=false;
		
		public var Switch_Xinshouyindao:Boolean=false;
		
		
		public var Switch_ShowNotCompleteFn:Boolean=false;
		
		public var Switch_PushNotification:Boolean=false;
		
	
		
		public function SwitchManager()
		{
			init();
		}
		private function init():void
		{
//			return ;
			var xmlList:Array=XMLDataManager.Node_gongneng_kaiguanArray;
			var index:int;
			for(index=0;index<xmlList.length;index++)
			{
				var xml:Node_gongneng_kaiguan=xmlList[index] as Node_gongneng_kaiguan;
				if(this.hasOwnProperty(xml.name)){
					this[xml.name]=Boolean(xml.status);
				}
				
			}
		}
		private static var m_instance:SwitchManager;
		public static function getInstance():SwitchManager
		{
			if(null==m_instance)
			{
				m_instance=new SwitchManager();
			}
			return m_instance;
		}
		
	}
}