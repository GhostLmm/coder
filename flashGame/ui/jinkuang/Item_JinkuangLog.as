package ui.jinkuang
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.gameVO.JinkuanglogVO;
	import com.fish.modules.core.models.JinkuangModel;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItem;
	
	import view.Base_Item;
	
	public class Item_JinkuangLog extends Base_Item implements IGridItem
	{
		public var _btn_shouhuo:Button;
		public var _fnt_desc1:FontField;
		public var _fnt_desc2:FontField;
		public function Item_JinkuangLog()
		{
			super();
		}
		protected override function initModule():void
		{
			_btn_shouhuo=new Button(itemMaterial.btn_shouhuo);
			_fnt_desc1=new FontField(itemMaterial.fnt_desc1);
			_fnt_desc2=new FontField(itemMaterial.fnt_desc2);
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_shouhuo,TqtEvent.BUTTON_CLICK,onShouhuoClicked);
		}
		private function onShouhuoClicked(evt:Event):void
		{
			if(null!=data)
			{
				C2SEmitter.lingquJinkuangLog(data.id);
			}
		}
		protected override function setShow():void
		{
			if(data.money>0)
			{
				_btn_shouhuo.visible=true;
			}
			else
			{
				_btn_shouhuo.visible=false;
			}
			_fnt_desc1.htmlText=JinkuangModel.convertLogToDesc(data);
			_fnt_desc2.text=JinkuangModel.getLogType(data);
		}
		public override function loadData($data:Object):*
		{
			super.loadData($data);
		}
		protected override function get itemClassName():Class
		{
			return ItemJinkuangLog; 
		}
		private function get itemMaterial():ItemJinkuangLog 
		{
			return m_mc as ItemJinkuangLog; 
		}
		public override function destory():void
		{
			if(_btn_shouhuo){_btn_shouhuo.destory();_btn_shouhuo=null;};
			if(_fnt_desc1){_fnt_desc1.destory();_fnt_desc1=null;};
			if(_fnt_desc2){_fnt_desc2.destory();_fnt_desc2=null;};
			super.destory();
		}
		private function get data():JinkuanglogVO
		{
			return m_data as JinkuanglogVO;
		}
	}
}
