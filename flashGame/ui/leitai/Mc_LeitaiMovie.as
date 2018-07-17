package ui.leitai
{
	import ui.widget.Position;
	
	import view.Base_Mc;
	
	public class Mc_LeitaiMovie extends Base_Mc
	{
		public var _POS_A:Position;
		public var _POS_B:Position;
		public var _fightPlayerA:Mc_FightPlayer;
		public var _fightPlayerB:Mc_FightPlayer;
		
		public function Mc_LeitaiMovie()
		{
			super();
		}
		protected override function initModule():void
		{
			_POS_A=new Position(mcMaterial.POS_A);
			_POS_B=new Position(mcMaterial.POS_B);
		}
		protected override function registerEvent():void
		{
			setShow();
		}
		protected override function setShow():void
		{
			_fightPlayerA=new Mc_FightPlayer();
			_fightPlayerA.setType(Mc_FightPlayer.MyHero);
			_fightPlayerA.x=_POS_A.rect.x;
			_fightPlayerA.y=_POS_A.rect.y;
			_POS_A.addChild(_fightPlayerA);
			_fightPlayerB=new Mc_FightPlayer();
			_fightPlayerB.setType(Mc_FightPlayer.EnemyHero);
			_fightPlayerB.x=_POS_B.rect.x;
			_fightPlayerB.y=_POS_B.rect.y;
			_POS_B.addChild(_fightPlayerB);
		}
		private function destroyMc():void
		{
			if(_fightPlayerA){_fightPlayerA.destory();_fightPlayerA=null;};
			if(_fightPlayerB){_fightPlayerB.destory();_fightPlayerB=null;};
			if(_POS_A){_POS_A.destory();_POS_A=null;};
			if(_POS_B){_POS_B.destory();_POS_B=null;};
		}
		protected override function get mcClassName():Class
		{
			return LeitaiMovie;
		}
		private function get mcMaterial():LeitaiMovie
		{
			return m_mc as LeitaiMovie;
		}
		
		public override function destory():void
		{
			destroyMc();
			super.destory();
		}
	}
}