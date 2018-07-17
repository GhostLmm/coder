package com.ghostlmm.lightMVC.api
{
	public interface ICommandMap
	{
		function map(evtName:String,evtType:Class,commandType:Class,once:Boolean=false):void;
		function unmap(evtName:String,evtType:Class):void;
	}
}