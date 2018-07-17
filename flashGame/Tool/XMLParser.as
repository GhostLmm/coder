package Tool
{
	/**
	 * XML解析器
	 *@author 锋
	 *@version 1.0.0
	 *@创建时间:2012-10-25 下午11:33:09
	 * */
	public class XMLParser
	{
		private static var m_instance:XMLParser;
		public function XMLParser()
		{
		}
		
		/**
		 * 
		 * @return XMLParser单例
		 * 
		 */		
		public static function getInstance():XMLParser
		{
			if(null==m_instance)
			{
				m_instance=new XMLParser();
			}
			return m_instance;
		}
		
		/**
		 * 根据key值获得XML
		 * @param xml 查询的XML
		 * @param keyValue key值
		 * @return 
		 * 
		 */		
		public function getXMLByKey(xml:XML,keyValue:String):XML
		{
			return xml.node.(@key==keyValue)[0];
		}
		
		public function getXMLById(xml:XML,keyValue:String):XML
		{
			return xml.node.(@id==keyValue)[0];
		}
	}
}