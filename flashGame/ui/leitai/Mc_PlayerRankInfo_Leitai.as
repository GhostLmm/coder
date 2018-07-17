package ui.leitai
{
	import ui.widget.FontField;
	
	import view.Base_Mc;
	
	public class Mc_PlayerRankInfo_Leitai extends Base_Mc
	{
		public var _fnt_zhanli:FontField;
		public var _fnt_paiming:FontField;
		public var _fnt_zhanli_num:FontField;
		public var _fnt_paiming_num:FontField;
		
		public function Mc_PlayerRankInfo_Leitai()
		{
			super();
		}
		protected override function initModule():void
		{
			_fnt_zhanli=new FontField(mcMaterial.fnt_zhanli);
			_fnt_paiming=new FontField(mcMaterial.fnt_paiming);
			
			_fnt_zhanli_num=new FontField(mcMaterial.fnt_zhanli_num);
			_fnt_paiming_num=new FontField(mcMaterial.fnt_paiming_num);
			
			this.mouseChildren=false;
			this.mouseEnabled=false;
		}
		private function destroyMc():void
		{
			if(_fnt_zhanli){_fnt_zhanli.destory();_fnt_zhanli=null;};
			if(_fnt_paiming){_fnt_paiming.destory();_fnt_paiming=null;};
			if(_fnt_zhanli_num){_fnt_zhanli_num.destory();_fnt_zhanli_num=null;};
			if(_fnt_paiming_num){_fnt_paiming_num.destory();_fnt_paiming_num=null;};
		}
		protected override function registerEvent():void
		{
			
		}
		protected override function setShow():void
		{
			
		}
		protected override function get mcClassName():Class
		{
			return leitaiInfo;
		}
		private function get mcMaterial():leitaiInfo
		{
			return m_mc as leitaiInfo;
		}
		public override function destory():void
		{
			destroyMc();
			super.destory();
		}
	}
}