package com.ghostlmm.lightMVC.api
{
	public interface IMediatorMap
	{
		function map(viewType:Class,mediatorType:Class):void;
		function unmap(viewType:Class):void;
		function activeMediator(view:Object):void;
		function inactiveMediator(view:Object):void;
	}
}