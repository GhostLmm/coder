package snake.viewdata
{
	import com.ghostlmm.xmldata.Node_gun;

	public class ViewData_Gun extends ViewData_Base
	{
		public var gunNode:Node_gun;
		public var vo;
		
		public function ViewData_Gun()
		{
			super();
		}
		public function get gun_recoil_rot():Number
		{
			return gunNode.gun_recoil_rot;
		}
		public function get gun_recoil_dampening():Number
		{
			return gunNode.gun_recoil_dampening;
		}
		public function get gun_recoil_xRecover():Number
		{
			return gunNode.gun_recoil_xRecover;
		}
		public function get gun_hasReloadAnim():Number
		{
			return gunNode.gun_hasReloadAnim;
		}
		public function get gun_magDropFrame():Number
		{
			return gunNode.gun_magDropFrame;
		}
		public function get gun_magType():Number
		{
			return gunNode.gun_magType;
		}
		public function get gun_mag_size():Number
		{
			return gunNode.gun_mag_size;
		}
		public function get gun_ammo():Number
		{
			return gunNode.gun_ammo;
		}
		public function get gun_total_ammo():Number
		{
			return gunNode.gun_total_ammo;
		}
		public function get gun_reload_time():Number
		{
			return gunNode.gun_reload_time;
		}
		public function get gun_recoil_x():Number
		{
			return gunNode.gun_recoil_x;
		}
		
		public function get gun_frameToEjectShellOn():Number
		{
			return gunNode.gun_frameToEjectShellOn;
		}
		public function get gun_names():Number
		{
			return gunNode.gun_names;
		}
		public function get gun_sfx():Number
		{
			return gunNode.gun_sfx;
		}
		public function get gun_atp():Number
		{
			return gunNode.gun_atp;
		}
		public function get gun_atp_enemy():Number
		{
			return gunNode.gun_atp_enemy;
		}		
		public function get gun_dist():Number
		{
			return gunNode.gun_dist;
		}
		public function get gun_coolDown():Number
		{
			return gunNode.gun_coolDown;
		}
		public function get gun_auto():Number
		{
			return gunNode.gun_auto;
		}
		public function get gun_casingType():Number
		{
			return gunNode.gun_casingType;
		}
		public function get gun_bulletType():Number
		{
			return gunNode.gun_bulletType;
		}
		public function get gun_isIncindiary():Number
		{
			return gunNode.gun_isIncindiary;
		}
		
	}
}