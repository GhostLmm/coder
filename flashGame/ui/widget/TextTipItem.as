package ui.widget
{
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	
	import util.Util;
	
	import view.Base_Item;
	
	public class TextTipItem extends Base_Item implements IGridItemMax
	{
		private var _fnt_gunping:FontField;
		public function TextTipItem($mc:MovieClip=null)
		{
			super($mc);
		}
		
		protected override function  get itemClassName():Class{
			return McScrollFnt;
		}
		
		protected override function initModule():void{
			_fnt_gunping=new FontField(m_mc.fnt_gunping);
		}
		
		protected override function setShow():void{
			
			var tipData:TextTipData=m_data as TextTipData;
			if(tipData.autoSize!=null){
				_fnt_gunping.setAutoSize(tipData.autoSize);
			}
			
			
			if(!tipData.useDefaultColor){
				_fnt_gunping.textColor=tipData.color;
			}
			_fnt_gunping.text=tipData.text;
			
		}
		
		public override function destory():void{ 
			if(_fnt_gunping) {_fnt_gunping.destory(); _fnt_gunping=null;}
			super.destory();
		}
		
		public function set enable(value:Boolean):void
		{
		}
		
		public function get enable():Boolean
		{
			return false;
		}
		
		public function set selected(value:Boolean):void
		{
		}
		
		public function get selected():Boolean
		{
			return false;
		}
		
		public function set index(value:int):void
		{
		}
		
		public function get index():int
		{
			return 0;
		}
		
		public function get data():Object
		{
			return null;
		}
		
		public function enterMovie():*
		{
			return null;
		}
	}
}