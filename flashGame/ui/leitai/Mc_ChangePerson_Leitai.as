package ui.leitai
{
	import flash.display.MovieClip;
	
	import view.Base_Mc;
	
	public class Mc_ChangePerson_Leitai extends Base_Mc
	{
		public function Mc_ChangePerson_Leitai()
		{
			super();
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
			return btn_change_leitaiPlayer;
		}
		private function get mcMaterial():btn_change_leitaiPlayer
		{
			return m_mc as btn_change_leitaiPlayer;
		}
		public function get mc():MovieClip
		{
			return m_mc as MovieClip;
		}
	}
}