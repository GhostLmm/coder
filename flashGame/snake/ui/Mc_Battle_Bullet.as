package snake.ui
{
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	
	import snake.GameManager;
	import snake.gameobj.Player;
	import snake.guns.GunData;
	
	import ui.widget.FontField;
	
	import view.Base_Mc;
	
	public class Mc_Battle_Bullet extends Base_Mc
	{
		private var timeModel:TimerModel;
		
		public var _fnt_bullet_num:FontField;
		public var _mc_bulletbar:MovieClip;
		
		private var TotalFrame:int;
		
		public function Mc_Battle_Bullet()
		{
			super();
		}
		protected override function initModule():void
		{
			timeModel=Context.getInjectInstance(TimerModel);
			_fnt_bullet_num=new FontField(mcMaterial.fnt_bullet_num);
			_mc_bulletbar=mcMaterial.mc_bulletbar;
			_mc_bulletbar.stop();
			TotalFrame=_mc_bulletbar.totalFrames-1;
		}
		protected override function registerEvent():void
		{
			timeModel.frame_SN.add(update);
			setShow();
		}
		private function update(obj:*=null):void
		{
			var player:Player=GameManager.manager.player;
			if(null==player)
			{
				return;
			}
			var gunData:GunData=player.playerGunData;
			if(null==gunData)
			{
				return;
			}
			_fnt_bullet_num.text=gunData.gun_ammo+"/"+gunData.gun_mag_size;
			var frame:int=Math.ceil(gunData.gun_ammo/gunData.gun_mag_size*TotalFrame)+1;
//			if(frame==1)
//			{
//				trace("子弹数为0");
//			}
			_mc_bulletbar.gotoAndStop(frame);
		}
		protected override function setShow():void
		{
			update();
		}
		protected override function get mcClassName():Class
		{
			return mc_zhandou_bulletpart;
		}
		private function get mcMaterial():mc_zhandou_bulletpart
		{
			return m_mc as mc_zhandou_bulletpart;
		}
		public override function destory():void
		{
			timeModel.frame_SN.remove(update);
			timeModel=null;
			if(_fnt_bullet_num){_fnt_bullet_num.destory();_fnt_bullet_num=null;};
			if(_mc_bulletbar){_mc_bulletbar=null;};
			super.destory();
		}
	}
}