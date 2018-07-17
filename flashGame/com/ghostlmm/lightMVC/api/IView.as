package com.ghostlmm.lightMVC.api
{
	public interface IView
	{
		function bindMediator():void;
		function unBindMediator():void;
		function get mediatorData():Object;
	}
}