package Tool
{
	import flash.desktop.NativeApplication;

	/**    给出应用程序的程序信息
	 * */
	public class ApplicationInfoDesc
	{
		private var applicationXml:XML;
		private var _versionId:int;
		private var _packageId:String;
		private var _appName:String;
		private var _fileName:String;
		
		private var _versionStr:String;
		
		public function get versionStr():String
		{
			return _versionStr;
		}
		
		public function get appXml():XML
		{
			return applicationXml;
		}
		public function get versionId():int
		{
			return _versionId;
		}
		public function get packageId():String
		{
			return _packageId;
		}
		public function get appName():String
		{
			return _appName;
		}
//		public function get fileName():String
	
		
		public function ApplicationInfoDesc()
		{
			applicationXml=NativeApplication.nativeApplication.applicationDescriptor;
			
			var children:XMLList=applicationXml.children();
			for each(var child:XML in children)
			{
				var name:String=child.localName();
				switch(name)
				{
					case "id":
						_packageId=child.valueOf();
						break;
					case "versionNumber":
						_versionStr=String(child.valueOf());
						_versionId=handleVersionId(String(child.valueOf()));
						break;
					case "filename":
						_fileName=child.valueOf();
						break;
					case "name":
						_appName=child.valueOf();
						break;
				}
			}
		}
		
		public static function handleVersionId(source:String):int
		{
			var version:int=0;
			var temp:Array=source.split(".");
			for(var index:int=0; index<temp.length; index++)
			{
				version+=temp[index]*Math.pow(1000,temp.length-index-1);
			}
			return version;
		}
		
		private static var _native:ApplicationInfoDesc;
		public static function get NativeInfo():ApplicationInfoDesc
		{
			if(_native==null) _native=new ApplicationInfoDesc();
			return _native;
		}
	}
}