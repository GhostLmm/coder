package ui.layer
{
	import flash.display.DisplayObject;
	
	import ui.widget.FontField;
	import ui.widget.NumFontStatic;

	internal class MapCengshuTip
	{
		private var mc:McCengshu;
		public var _fnt_guanka:FontField;
		public var _num_cengshu:NumFontStatic;
		
		public function MapCengshuTip()
		{
			mc=new McCengshu();
			_fnt_guanka=new FontField(mc.fnt_guanka);
			_num_cengshu=new NumFontStatic(mc.num_cengshu);
			
		}
		
		public function get display():DisplayObject{
			return mc;
		}
		
		public function destory():void{
			if(_fnt_guanka){_fnt_guanka.destory();_fnt_guanka=null;}
			if(_num_cengshu){_num_cengshu.destory();_num_cengshu=null;}
			mc=null;
		}
		
	}
}