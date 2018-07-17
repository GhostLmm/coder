package ui.layer
{
	import com.ghostlmm.lightMVC.impl.ViewAssemble;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import util.Util;

	public class WorldLayer extends _LayerBase
	{
		public function WorldLayer()
		{
			super();
			
			_buildingLayer=new Sprite();
			addChild(_buildingLayer);
			
			_buildingLayer.mouseEnabled=false;
			
			_mapLayer=new Sprite();
			addChild(_mapLayer);
			_roleLayer=new Sprite();
			addChild(_roleLayer);
			_bossLayer=new Sprite();
			addChild(_bossLayer);
			
			_effectLayer=new Sprite();
			addChild(_effectLayer);
//			Util.setMouseUnable(_mapLayer);
			_mapLayer.mouseEnabled=false;
			Util.setMouseUnable(_roleLayer);
			Util.setMouseUnable(_effectLayer);
			Util.setMouseUnable(_bossLayer);
		}
		
		
		
		private var _buildingLayer:Sprite;
		private var _mapLayer:Sprite;
		private var _roleLayer:Sprite;
		private var _bossLayer:Sprite;
		private var _effectLayer:Sprite;
		
		
		
		
		public override function destory():void{
			if(_buildingLayer){
				_buildingLayer.removeChildren();
				_buildingLayer=null;
			}
			if(_mapLayer){
				_mapLayer.removeChildren();
				_mapLayer=null;
			}
			if(_roleLayer){
				_roleLayer.removeChildren();
				_roleLayer=null;
			}
			if(_bossLayer){
				_bossLayer.removeChildren();
				_roleLayer=null;
			}
			if(_effectLayer){
				_effectLayer.removeChildren();
				_effectLayer=null;
			}
			ViewAssemble.unBindMediator(this);
			super.destory();
		}
		
		public function get buildingLayer():Sprite{
			return _buildingLayer;
		}
		public function get mapLayer():Sprite{
			return _mapLayer;
		}
//		public function get roleLayer():Sprite{
//			return _roleLayer;
//		}
//		public function get bossLayer():Sprite{
//			return _bossLayer;
//		}
		public function get effectLayer():Sprite{
			return _effectLayer;
		}
		
		
		
	}
}