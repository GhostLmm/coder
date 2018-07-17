package com.ghostlmm.lightMVC.impl
{
	import avmplus.getQualifiedClassName;
	
	import com.ghostlmm.lightMVC.api.IInjector;
	
	import flash.utils.describeType;
	import flash.utils.getDefinitionByName;

	internal class InjectPoint
	{
		private var baseClass:Class;
		private var targetClass:Class;
		private var nodeArray:Array;
		
		private var instanceValue:*;
		
		private var inject:IInjector;
		
		
		public var mapFlag:Boolean;
		public function InjectPoint($inject:IInjector)
		{
			inject=$inject;
		}
		
		
		
		public function mapClass($targetCls:Class,$baseClass:Class=null):void
		{
			mapFlag=true;
			targetClass=$targetCls;
			
			if(baseClass && ($baseClass!=baseClass)){
				nodeArray=null;
			}
			
			baseClass=($baseClass==null)?targetClass:$baseClass;
		}
		
		public function mapValue(value:*):void
		{
			if(value is targetClass){
				instanceValue=value;
			}else{
				trace("mapValue 出错： "+targetClass);
				throw new Error("mapValue 出错： "+targetClass);
			}
		}
		
		public function unmap():void
		{
			mapFlag=false;
			if(instanceValue){
				for each(var injectNode:InjectNode in nodeArray){
					instanceValue[injectNode.attName]=null;
				}
			}
			instanceValue=null;
		}
		
		public function createInstance():*{
			if(instanceValue==null){
				instanceValue=new targetClass();
				if(nodeArray==null){
					initNode();
				}
				
				
				for each(var injectNode:InjectNode in nodeArray){
					instanceValue[injectNode.attName]=inject.getInstance(injectNode.attCls);
				}
			}
			return instanceValue;
		}
		
		public function getInstacne():*
		{
			return instanceValue;
		}
		
		private function initNode():void
		{
			nodeArray=[];
			var description : XML = describeType(targetClass);
			
			var node:XML;
			for each(node in description..metadata.(@name=='Inject'))
			{
				var parent:XML=node.parent();
				var injectNode:InjectNode=new InjectNode();
				injectNode.attName=(String(parent.@name));
				injectNode.attCls=getDefinitionByName(String(parent.@type)) as Class;
				nodeArray.push(injectNode);
//				trace(node);
			}
		}
	}
}

class InjectNode
{
	public var attName:String;
	public var attCls:Class;
}