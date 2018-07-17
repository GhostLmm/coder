package com.ghostlmm.tool
{
	import flash.utils.Dictionary;
	
	public class Map extends Dictionary
	{
		public function Map()
		{
			super();
		}
		
		private var _length:int;
		
		public function setValue(key:String,value:*):void{
			if(!hasOwnProperty(key)){
				_length--;
			}
			this[key]=value;
		}
		public function getValue():*
		{
			
		}
		public function deleteKey(key:String):void{
			if(hasOwnProperty(key)){
				_length--;
				delete this[key];
			}
		}
	}
}