package ui.window.mail
{
	import com.fish.modules.core.models.MailModel;
	import com.ghostlmm.lightMVC.Context;
	
	import ui.widget.Position;
	import ui.widget.ScrollController;
	
	import view.Panel_Base;
	
	public class Panel_Mail extends Panel_Base
	{
		public var _pos_item_youjian:Position;
		public var _scrollController:ScrollController;
		
		public var mailModel:MailModel;
		
		public function Panel_Mail()
		{
			super();
		}
		protected override function initModule():void
		{
			mailModel=Context.getInjectInstance(MailModel);
			
			_pos_item_youjian=new Position(panelMaterial.pos_item_youjian);
			_scrollController=new ScrollController(_pos_item_youjian);
			_pos_item_youjian.removeChildren();
			_pos_item_youjian.addChild(_scrollController);
			_scrollController.initItemClass(Item_YoujianWindow);
		}
		private function destroyMc():void
		{
			if(_pos_item_youjian){_pos_item_youjian.destory();_pos_item_youjian=null;};
			if(_scrollController){_scrollController.destory();_scrollController=null;};
		}
		protected override function registerEvent():void
		{
			mailModel.MailUpdate_SN.add(updateMailListShow);
		}
		protected function updateMailListShow():void
		{
		}
		protected override function setShow():void
		{
			updateMailListShow();
		}
		protected override function get panelClassName():Class
		{
			return SceneYoujian;
		}
		private function get panelMaterial():SceneYoujian
		{
			return material as SceneYoujian;
		}
		public override function clear():void
		{
			mailModel.MailUpdate_SN.remove(updateMailListShow);
			mailModel=null;
			destroyMc();
			super.clear();
		}
	}
}