package view.viewData
{
	import com.ghostlmm.xmldata.Node_banghui_juanxian;
	import com.ghostlmm.xmldata.XMLDataManager;

	public class RecordData_BanghuiJianshe
	{
		public var time:Number;
		public var name:String;
		public var xid:int;
		public function RecordData_BanghuiJianshe()
		{
		}
		public function get BanghuiJianshe():int
		{
			var juanXianXml:Node_banghui_juanxian=XMLDataManager.getBanghui_juanxianById(xid); 
			if(juanXianXml)
			{
				return juanXianXml.get_banghuijianshe;
			}
			return 0;
		}
	}
}