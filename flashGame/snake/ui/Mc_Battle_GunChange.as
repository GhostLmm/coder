package snake.ui
{
	import com.ghostlmm.xmldata.Node_gun;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import snake.viewdata.battle.GunChangeManager;
	
	import ui.widget.Position;
	
	import view.Base_Mc;
	
	public class Mc_Battle_GunChange extends Base_Mc
	{
		public var _pos_gun_image:Position;
		public var _gunMc:Mc_Gun;
		
		public function Mc_Battle_GunChange()
		{
			super();
		}
		protected override function initModule():void
		{
			_pos_gun_image=new Position(mcMaterial.pos_gun_image);
		}
		public override function destory():void
		{
			GunChangeManager.getInstance().GunChange_SN.remove(update);
			if(_pos_gun_image){_pos_gun_image.destory();_pos_gun_image=null;};
			super.destory();
		}
		protected override function registerEvent():void
		{
			GunChangeManager.getInstance().GunChange_SN.add(update);
			setShow();
		}
		protected override function setShow():void
		{
			update();
		}
		private function update():void
		{
			if(_gunMc){_gunMc.destory();_gunMc=null;};
			var gunId:int=GunChangeManager.getInstance().currentUseGun;
			var gunXMl:Node_gun=XMLDataManager.getGunById(gunId);
			_gunMc=new Mc_Gun();
			_gunMc.loadData(gunXMl);
			_pos_gun_image.fillWithObject(_gunMc);
		}
		protected override function get mcClassName():Class
		{
			return McFightGun
		}
		private function get mcMaterial():McFightGun
		{
			return m_mc as McFightGun;
		}
	}
}