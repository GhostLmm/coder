package snake.ui
{
	import com.ghostlmm.xmldata.Node_equip;
	import com.ghostlmm.xmldata.Node_gun;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import ui.widget.FontField;
	import ui.widget.Position;
	
	import view.Base_Mc;
	
	public class Mc_Gun extends Base_Mc
	{
		public var _fnt_name:FontField;
		public var _pos_bg:Position;
		public var _pos_gun_image:Position;
		
		public function Mc_Gun()
		{
			super();
		}
		protected override function initModule():void
		{
			_fnt_name=new FontField(itemMaterial.fnt_name);
			_pos_bg=new Position(itemMaterial.pos_bg);
			_pos_gun_image=new Position(itemMaterial.pos_gun_image);
			this.mouseChildren=false;
		
		}
		private function destroyMc():void
		{
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			if(_pos_bg){_pos_bg.destory();_pos_bg=null;};
			if(_pos_gun_image){_pos_gun_image.destory();_pos_gun_image=null;};
		}
		public override function destory():void
		{
			destroyMc();
			super.destory();
		}
		protected override function registerEvent():void
		{
			
		}
		protected override function setShow():void
		{
			_fnt_name.text=node.gun_names;
			var equipNode:Node_equip=XMLDataManager.getEquipById(node.id);
			_pos_gun_image.fillWithBitmapByClassName(equipNode.icon+"b");
			var bgName:String="gun_bg"+equipNode.star;
			_pos_bg.fillWithBitmapByClassName(bgName);
		}
		protected override function get mcClassName():Class
		{
			return McGun;
		}
		private function get itemMaterial():McGun
		{
			return m_mc as McGun;
		}
		public function get node():Node_gun
		{
			return m_data as Node_gun;
		}
	}
}