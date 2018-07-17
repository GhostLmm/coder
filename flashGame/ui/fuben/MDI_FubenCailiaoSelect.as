package ui.fuben
{
	import com.fish.modules.core.models.MapModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_item;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import core.event.TqtEvent;
	
	import ui.mc.ItemMc;
	
	public class MDI_FubenCailiaoSelect extends Mediator
	{
		[Inject]
		public var wm:FubenCailiaoSelectWindow;
		[Inject]
		public var mapModel:MapModel;
		
		public function MDI_FubenCailiaoSelect()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			var itemId:int=int(wm._params);
			var itemNode:Node_item=XMLDataManager.getItemById(itemId);
			if(itemNode==null ) return ;
			wm._fnt_desc.text=itemNode.desc;
			wm._fnt_name.text=itemNode.name;
			wm._pos_image.fillWithObject(new ItemMc().loadData(itemNode));
			
			wm._scrollController.initClass(Item_CailiaoFubenSelect);
			wm._scrollController.setData(mapModel.getCopyListByItemId(itemId));
			
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			
			
		}
		
		
		
		public override function destroy():void
		{
			// todo
			super.destroy();
		}
	}
}