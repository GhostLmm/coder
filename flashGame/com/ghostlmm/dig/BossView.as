package com.ghostlmm.dig
{
//	import com.ghostlmm.xmldata.Node_boss;
	
	import com.fish.modules.core.models.tempData.GuankaData;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;

	public class BossView
	{
		public function BossView()
		{
			_container=new Sprite();
		}
		
		private var _container:Sprite;
		private var _bossMc:MovieClip;
		private var _showFlag:Boolean;
		private var _guanka:GuankaData;
		
		public function showBoss($guankaData:GuankaData,$layer:Sprite,$x:Number,$y:Number,$state:int=1):void{
			if(_showFlag){
				return ;
			}
			trace("显示boss");
			_guanka=$guankaData;
			_showFlag=true;
			
//			_bossMc=AssetManager.createAsset(_guanka.bossNode.Anim);
			
			_bossMc.gotoAndStop("idle");
			_container.addChild(_bossMc);
			
			_container.x=$x;
			_container.y=$y;
			$layer.addChild(_container);
		}
		public function hideBoss():void{
			if(_showFlag){
				trace("隐藏boss");
				_showFlag=false;
				_container.removeChildren();
				_bossMc.stop();
				_bossMc=null;
				if(_container.parent){
					_container.parent.removeChild(_container);
				}
			}
		}
		
		public function reset():void{
			hideBoss();
		}
		
		public function destory():void{
			
			
		}
	}
}