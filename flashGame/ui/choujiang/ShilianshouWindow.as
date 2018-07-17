package ui.choujiang
{
	import flash.geom.Point;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.window._WindowBase;
	
	import util.Dict;
	
	public class ShilianshouWindow extends _WindowBase
	{
		public static var MaxNum:int=10;
		
		public var _btn_fanhui:Button;
		public var _btn_zaichouyici:Button;
		public var _pos_cost:Position;
		public var _fnt_cost:FontField;
		public var _pos_baoxiang:Position;
		
		public var _posDic:Dict;
		public var _xyDic:Dict;
		
		public function ShilianshouWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowShilianchou);
			initModule();
		}
		private function initModule():void
		{
			_btn_fanhui=new Button(windowMaterial.btn_fanhui);
			_btn_zaichouyici=new Button(windowMaterial.btn_zaichouyici);
			_pos_cost=new Position(windowMaterial.pos_cost);
			_fnt_cost=new FontField(windowMaterial.fnt_cost);
			_pos_baoxiang=new Position(windowMaterial.pos_baoxiang);
			
			initPos();
		}
		private function initPos():void
		{
			_posDic=new Dict();
			_xyDic=new Dict();
			var index:int;
			for(index=1;index<=MaxNum;index++)
			{
				var posName:String="pos_"+index;
				var pos:Position=new Position(windowMaterial[posName]);
				_posDic[index]=pos;
				_xyDic[index]=new Point(pos.rect.x+pos.rect.width/2,pos.rect.y+pos.rect.height/2);
			}
		}
		public function getPositionByIndex(_index:int):Position
		{
			return _posDic[_index] as Position;
		}
		public function getXYPosByIndex(_index:int):Point
		{
			return _xyDic[_index] as Point;
		}
		private function destroyPos():void
		{
			var index:int;
			for(index=1;index<=MaxNum;index++)
			{
				var pos:Position=_posDic[index];
				pos.destory();
				pos=null;
				_posDic[index]=null;
				_xyDic[index]=null;
			}
			_posDic=null;
		}
		private function destroyMc():void
		{
			if(_btn_fanhui){_btn_fanhui.destory();_btn_fanhui=null;};
			if(_btn_zaichouyici){_btn_zaichouyici.destory();_btn_zaichouyici=null;};
			if(_pos_cost){_pos_cost.destory();_pos_cost=null;};
			if(_fnt_cost){_fnt_cost.destory();_fnt_cost=null;};
			if(_pos_baoxiang){_pos_baoxiang.destory();_pos_baoxiang=null};
			destroyPos();
		}
		public override function destory():void
		{
			destroyMc();
			super.destory();
		}
		private function get windowMaterial():WindowShilianchou
		{
			return _scene as WindowShilianchou;
		}
	}
}