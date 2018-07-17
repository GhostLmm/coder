package view.mc
{
	import com.fish.modules.core.models.ItemData;
	import com.ghostlmm.xmldata.Node_equip;
	
	import ui.mc.ItemMc;
	import ui.widget.Position;
	
	import view.Base_Mc;
	
import flash.display.MovieClip
	public class Mc_Equip extends Base_Mc
	{
		private var _pos:Position;
		
		public function Mc_Equip()
		{
			super();
		}
		protected override function initModule():void
		{
			_pos = new Position(mcMaterial.pos_wuqi);
		}
		public override function destory():void
		{
			if(_pos){_pos.destory();_pos=null;};
			super.destory();
		}
		protected override function get mcClassName():Class
		{
			return (AssetManager.getAssetClass("McEquip") as Class); 
		}
		public function loadData(_node_Equip:Node_equip=null):void
		{
			_pos.removeChildren();
			if(_node_Equip){
				var itemData:ItemData=new ItemData();
				itemData.icon=_node_Equip.icon;
				itemData.star=_node_Equip.star;
				_pos.fillWithObject(new ItemMc().loadData(itemData));
			}
		}
		private function get mcMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
		
		
	}
}
