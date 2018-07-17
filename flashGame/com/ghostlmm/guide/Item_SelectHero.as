package com.ghostlmm.guide
{
	import com.ghostlmm.xmldata.Node_hero;
	
	import flash.display.MovieClip;
	
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.Position;
	
	import view.Base_Item;
	
	public class Item_SelectHero extends Base_Item implements IGridItemMax
	{
		private var _mc_bg:MovieClip;
		private var _pos_touxaing:Position;
		private var _fnt_name:FontField;
		public function Item_SelectHero($mc:MovieClip=null)
		{
			super($mc);
		}
		
		protected override function get itemClassName():Class{
			return McXuanrenTouxiang;
		}
		
		protected override function initModule():void{
			var mc:McXuanrenTouxiang=m_mc as McXuanrenTouxiang;
			_mc_bg=mc.mc_bg;
			_pos_touxaing=new Position(mc.pos_touxaing);
			_fnt_name=new FontField(mc.fnt_name);
		}
		public override function destory():void{
			if(_pos_touxaing) {_pos_touxaing.destory(); _pos_touxaing=null;}
			if(_fnt_name) {_fnt_name.destory(); _fnt_name=null;}
			super.destory();
		}
		
		
		public function set enable(value:Boolean):void
		{
		}
		
		public function get enable():Boolean
		{
			return true;
		}
		private var _selected:Boolean;
		public function set selected(value:Boolean):void
		{
			_selected=value;
			if(_selected){
				_mc_bg.gotoAndStop(2);
			}else{
				_mc_bg.gotoAndStop(1);
			}
		}
		
		protected override function setShow():void{
			var node:Node_hero=m_data as Node_hero;
			_pos_touxaing.fillWithBitmapByClassName(node.touxiang);
			_fnt_name.text=node.name;
		}
		
		public function get selected():Boolean
		{
			return false;
		}
		private var _index:int;
		public function set index(value:int):void
		{
			_index=value;
		}
		
		public function get index():int
		{
			return _index;
		}
		
		public function get data():Object
		{
			return m_data;
		}
		
		public function enterMovie():*
		{
			return null;
		}
	}
}