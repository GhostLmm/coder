package snake.ui
{
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	
	import snake.GameManager;
	import snake.gameobj.Player;
	
	import ui.widget.FontField;
	
	import view.Base_Mc;
	
	public class Mc_Battle_PlayerHp extends Base_Mc
	{
		public var _fnt_hp_num:FontField;
		public var _hp_bar:MovieClip;
		
		private var initX:Number;
		private var MaxWidth:Number;
		
		private var timeModel:TimerModel;
		
		public function Mc_Battle_PlayerHp()
		{
			super();
		}
		protected override function initModule():void
		{
			timeModel=Context.getInjectInstance(TimerModel);
			_fnt_hp_num=new FontField(mcMaterial.fnt_hp_num);
			_hp_bar=mcMaterial.hp_bar;
			initX=_hp_bar.x;
			MaxWidth=_hp_bar.width;
		}
		private function destroyMc():void
		{
			if(_fnt_hp_num){_fnt_hp_num.destory();_fnt_hp_num=null;};
			if(_hp_bar){_hp_bar=null;};
		}
		protected override function registerEvent():void
		{
			timeModel.secondTimer_SN.add(update);
			Player.PlayerHp_SN.add(update);
			setShow();
		}
		private function update():void
		{
			var player:Player=GameManager.manager.player;
			if(null==player)
			{
				return;
			}
			_fnt_hp_num.text=player.character_health+"/"+player.character_maxHealth;
			_hp_bar.x=initX-(1-player.character_health/player.character_maxHealth)*MaxWidth;
		}
		protected override function setShow():void
		{
			update();
		}
		protected override function get mcClassName():Class
		{
			return mc_zhandou_hppart;
		}
		private function get mcMaterial():mc_zhandou_hppart
		{
			return m_mc as mc_zhandou_hppart;
		}
		public override function destory():void
		{
			timeModel.secondTimer_SN.remove(update);
			timeModel=null;
			Player.PlayerHp_SN.remove(update);
			Player.PlayerHp_SN.removeAll();
			destroyMc();
			super.destory();
		}
	}
}