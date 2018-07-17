package com.ghostlmm.notificationAir
{
	import org.osflash.signals.Signal;

	public interface INotification
	{
		function init():void;
		function get token():String;
		function get registerCom_SN():Signal;
		function scheduleLocalNotification(deltaSeconds:int,alertBody:String,badge:int):void;
		function clearLocalNotification():void;
	}
}