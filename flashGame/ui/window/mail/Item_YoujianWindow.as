package ui.window.mail
{
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItem;
	import ui.widget.Position;
	
	import view.Base_Item;
	import view.viewData.MailViewData;
	
import flash.display.MovieClip
	public class Item_YoujianWindow extends Base_Item implements IGridItem
	{
		public var _btn_chakan:Button;
		
		public var _pos_item:Position;
		public var _fnt_name:FontField;
		public var _fnt_desc:FontField;
		public var _fnt_date:FontField;
		
		public function Item_YoujianWindow()
		{
			super();
		}
		
		public override function loadData($data:Object):*
		{
			super.loadData($data);
		}
		protected override function initModule():void
		{
			_btn_chakan=new Button(itemMaterial.Btn_chakan);
			
			_pos_item=new Position(itemMaterial.pos_item);
			_fnt_name=new FontField(itemMaterial.fnt_name);
			_fnt_desc=new FontField(itemMaterial.fnt_desc);
			_fnt_date=new FontField(itemMaterial.fnt_date);
		}
		private function destoryMc():void
		{
			if(_btn_chakan){_btn_chakan.destory();_btn_chakan=null;};
			
			if(_pos_item){_pos_item.destory();_pos_item=null;};
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			if(_fnt_desc){_fnt_desc.destory();_fnt_desc=null;};
			if(_fnt_date){_fnt_date.destory();_fnt_date=null;};
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_chakan,TqtEvent.BUTTON_CLICK,onChakanClicked);
		}
		private function onChakanClicked(evt:Event):void
		{
			WindowManager.openOnlyWinodw(YoujianChakanWindow,viewData);
		}
		protected override function setShow():void
		{
			if(null==viewData)
			{
				return;
			}
			_pos_item.fillWithBitmapByClassName(viewData.typeXml.image);
			_fnt_name.htmlText=viewData.mailTitle;
			_fnt_date.text=viewData.mailDate;		
			_fnt_desc.htmlText=viewData.mailItemShowDesc;
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get itemMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
		protected override function get itemClassName():Class
		{
			return (AssetManager.getAssetClass("Item_youjian") as Class); 
		}
		protected function get viewData():MailViewData
		{
			return m_data as MailViewData;
		}
	}
}
