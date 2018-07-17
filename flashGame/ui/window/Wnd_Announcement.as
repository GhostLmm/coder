package ui.window
{
	import Tool.ConvertFunc;
	
	import com.greensock.TweenLite;
	
	import core.LayerController;
	import core.event.TqtEvent;
	
	import flash.display.Shape;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.media.StageWebView;
	import flash.system.System;
	
	import ui.widget.Button;
	import ui.widget.Position;
	import ui.window._WindowBase;

import flash.display.MovieClip
	public class Wnd_Announcement extends Wnd_WebPage
	{
		public static var anounceFlag:Boolean=false;
		public function Wnd_Announcement(par:Object=null)
		{
			super();

		}
		
		protected override function getMaterialClass():Class
		{
			return (AssetManager.getAssetClass("WindowGonggao") as Class); 
		}
		protected override function getPageUrl():String{
			return UrlConfig.annoucementUrl;
		}
		
		
	}
}
