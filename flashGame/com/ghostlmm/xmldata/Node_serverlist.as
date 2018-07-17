package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_serverlist extends Object
	{
		public var id:int;
		public var name:String;
		public var serverUrl:String;
		public var show_flag_ios:int;
		public var show_flag_android:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			serverUrl=String(String(data.@serverUrl));
			show_flag_ios=int(String(data.@show_flag_ios));
			show_flag_android=int(String(data.@show_flag_android));

		}
	}
}