package com.ghostlmm.dig
{
	import com.ghostlmm.view.layerMotion.LayerMotionManger;
	import com.ghostlmm.view.layerMotion.ViewLayer;
	
	import flash.display.Sprite;

import flash.display.MovieClip
	public class BuildingMenu
	{
		public function BuildingMenu()
		{
		}
		
		private var _container:Sprite;
		private var layerMotion:LayerMotionManger;
		private var mcTitle:flash.display.MovieClip; 
		
		public var limitWidth:Number;
		
		public function init($conainer:Sprite):void{
			_container=$conainer;
			layerMotion=new LayerMotionManger();
			layerMotion.setContainer(_container);
			mcTitle=new (AssetManager.getAssetClass("McTitle") as Class)(); 
			var layer:ViewLayer=new ViewLayer(mcTitle,1);
			layerMotion.addLayer(layer);
			limitWidth=mcTitle;
		}
		
		
		
	}
}
