package com.ghostlmm.lightMVC.api
{
	public interface IModelMap
	{
		function map(modelType:Class,interfaceType:Class=null):void;
		function mapValue(modelType:Class,value:*):void;
		function unmap(modelType:Class):void;
	}
}