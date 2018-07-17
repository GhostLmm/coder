package com.fish.modules.core.models.tempData
{
	import com.ghostlmm.xmldata.Node_jiban;
	
	import flash.utils.Dictionary;

	public class JibanStaticData
	{
		public function JibanStaticData()
		{
		}
		
		private var _node:Node_jiban;
		private var _kapaiArray:Array;
		
		public function setNode($node:Node_jiban):void
		{
			_node=$node;
			_kapaiArray=JSON.parse(_node.kapai_id) as Array;
		}
		
		public function get id():int{
			return _node.id;
		}
		
		public function get desc():String
		{
			return _node.desc;
		}
		public function get name():String{
			return _node.name;
		}
		
		public function get baseKids():Array
		{
			return _kapaiArray;
		}
	}
}