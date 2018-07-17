package view.login
{
	import ui.widget.Position;
	import ui.widget.ScrollController;
	
	import view.Base_Mc;
	
import flash.display.MovieClip
	public class MC_Xuanqu extends Base_Mc
	{
		private var _pos_scroll_v_xuanqu:Position;
		private var _pos_zuijin_xuanqu:Position;
		private var _scrollController:ScrollController;
		
		public function MC_Xuanqu()
		{
			super();
			_pos_scroll_v_xuanqu = new Position(mcMaterial.pos_scroll_v_xuanqu);
			_scrollController = new ScrollController(_pos_scroll_v_xuanqu);
			_pos_scroll_v_xuanqu.addChild(_scrollController);
			_pos_zuijin_xuanqu = new Position(mcMaterial.pos_zuijin_xuanqu);
		}
		protected override function initModule():void
		{
			
		}
		protected override function registerEvent():void
		{
			
		}
		protected override function setShow():void
		{
			
		}
		protected override function get mcClassName():Class
		{
			return (AssetManager.getAssetClass("SceneXuanqu") as Class); 
		}
		private function get mcMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
	}
}
