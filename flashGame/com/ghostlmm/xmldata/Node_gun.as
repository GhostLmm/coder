package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_gun extends Object
	{
		public var id:int;
		public var gun_dist:int;
		public var gun_coolDown:int;
		public var gun_auto:int;
		public var gun_casingType:int;
		public var gun_bulletType:int;
		public var gun_isIncindiary:int;
		public var gun_frameToEjectShellOn:int;
		public var gun_names:String;
		public var gun_sfx:int;
		public var gun_mag_size:int;
		public var gun_ammo:int;
		public var gun_total_ammo:int;
		public var gun_reload_time:int;
		public var gun_recoil_x:int;
		public var gun_recoil_rot:Number;
		public var gun_recoil_dampening:Number;
		public var gun_recoil_xRecover:Number;
		public var gun_hasReloadAnim:int;
		public var gun_magDropFrame:int;
		public var gun_magType:int;
		public var gun_appearence:int;
		public var gun_color:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			gun_dist=int(String(data.@gun_dist));
			gun_coolDown=int(String(data.@gun_coolDown));
			gun_auto=int(String(data.@gun_auto));
			gun_casingType=int(String(data.@gun_casingType));
			gun_bulletType=int(String(data.@gun_bulletType));
			gun_isIncindiary=int(String(data.@gun_isIncindiary));
			gun_frameToEjectShellOn=int(String(data.@gun_frameToEjectShellOn));
			gun_names=String(String(data.@gun_names));
			gun_sfx=int(String(data.@gun_sfx));
			gun_mag_size=int(String(data.@gun_mag_size));
			gun_ammo=int(String(data.@gun_ammo));
			gun_total_ammo=int(String(data.@gun_total_ammo));
			gun_reload_time=int(String(data.@gun_reload_time));
			gun_recoil_x=int(String(data.@gun_recoil_x));
			gun_recoil_rot=Number(String(data.@gun_recoil_rot));
			gun_recoil_dampening=Number(String(data.@gun_recoil_dampening));
			gun_recoil_xRecover=Number(String(data.@gun_recoil_xRecover));
			gun_hasReloadAnim=int(String(data.@gun_hasReloadAnim));
			gun_magDropFrame=int(String(data.@gun_magDropFrame));
			gun_magType=int(String(data.@gun_magType));
			gun_appearence=int(String(data.@gun_appearence));
			gun_color=String(String(data.@gun_color));

		}
	}
}