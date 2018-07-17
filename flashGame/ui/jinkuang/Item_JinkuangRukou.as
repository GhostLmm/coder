package ui.jinkuang
{
	import com.fish.modules.core.models.JinkuangModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_jinkuangrukou;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	
	import ui.widget.FontField;
	import ui.widget.IGridItem;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	
	public class Item_JinkuangRukou extends Base_Item implements IGridItem
	{
		public var _fnt_name:FontField;
		public var _fnt_desc:FontField;
		public var _mc_image:Position;
		
		public function Item_JinkuangRukou()
		{
			super();
		}
		protected override function initModule():void
		{
			_fnt_name=new FontField(itemMaterial.fnt_name);
			_fnt_desc=new FontField(itemMaterial.fnt_desc);
			_mc_image=new Position(itemMaterial.mc_image);
			this.mouseChildren=false;
		}
		protected override function registerEvent():void
		{
			addTargetEvent(this,TQTTouchEvent.TOUCH_TAP,onClicked);
		}
		private function onClicked(evt:Event):void
		{
			var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
			if(jinkuangModel.checkCouldJinru(data))
			{
				WindowManager.openOnlyWinodw(JinkuangWindow,data);
				var window:JinkuangRukouWindow=WindowManager.getCurrentOpenedWindowByClass(JinkuangRukouWindow) as JinkuangRukouWindow;
				window.close();
			}
			else
			{
				Util.flow("擂台排名不符合条件");
			}
		}
		protected override function setShow():void
		{
			_fnt_name.text=data.name;
			_fnt_desc.text=data.desc;
			_mc_image.fillWithBitmapByClassName(data.image);
		}
		public override function loadData($data:Object):*
		{
			super.loadData($data);
		}
		protected override function get itemClassName():Class
		{
			return McJinkuangRukou; 
		}
		private function get itemMaterial():McJinkuangRukou 
		{
			return m_mc as McJinkuangRukou; 
		}
		public function get data():Node_jinkuangrukou
		{
			return m_data as Node_jinkuangrukou;
		}
	}
}
