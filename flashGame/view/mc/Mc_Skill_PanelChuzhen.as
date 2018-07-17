package view.mc
{
	import com.fish.modules.core.models.ItemData;
	import com.ghostlmm.xmldata.Node_skill;
	
	import flash.display.MovieClip;
	
	import ui.mc.ItemMc;
	import ui.widget.FontField;
	import ui.widget.Position;
	
	import view.Base_Mc;
	
import flash.display.MovieClip
	public class Mc_Skill_PanelChuzhen extends Base_Mc
	{
		private var _pos:Position;
		public var _mc_suozi:MovieClip;
		public var _fnt_lv:FontField;
		public var _mc_wenzidi:MovieClip;
		
		public function Mc_Skill_PanelChuzhen()
		{
			super();
		}
		protected override function initModule():void
		{
			_pos = new Position(mcMaterial.pos_wuqi);
			_mc_suozi=mcMaterial.mc_suozi;
			_fnt_lv=new FontField(mcMaterial.fnt_lv);
			_mc_wenzidi=mcMaterial.mc_wenzidi;
		}
		public function loadData(_node_skill:Node_skill=null):void
		{
			_pos.removeChildren();
			if(_node_skill){
				var itemData:ItemData=new ItemData();
				itemData.icon=_node_skill.icon;
				itemData.star=_node_skill.star;
				_pos.fillWithObject(new ItemMc().loadData(itemData));
			}
		}
		protected override function get mcClassName():Class
		{
			return (AssetManager.getAssetClass("McSkillZhuangpei") as Class); 
		}
		private function get mcMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
		public override function destory():void
		{
			if(_pos){_pos.destory();_pos=null};
			if(_fnt_lv){_fnt_lv.destory();_pos=null;};
			_mc_wenzidi=null;
			_mc_suozi=null;
			super.destory();
		}
	}
}
