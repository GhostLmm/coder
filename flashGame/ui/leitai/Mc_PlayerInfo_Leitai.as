package ui.leitai
{
	import com.fish.modules.core.models.LeitaiModel;
	import com.ghostlmm.lightMVC.Context;
	
	import ui.widget.FontField;
	
	import view.Base_Mc;
	
	public class Mc_PlayerInfo_Leitai extends Base_Mc
	{
		public var leitaiModel:LeitaiModel;
		
		public var _fnt_paiming:FontField;
		public var _fnt_paiming_num:FontField;
		public var _fnt_challenge_times:FontField;
		public var _fnt_challenge_times_num:FontField;
		
		public function Mc_PlayerInfo_Leitai()
		{
			super();
		}
		protected override function initModule():void
		{
			leitaiModel=Context.getInjectInstance(LeitaiModel);
			
			_fnt_paiming=new FontField(mcMaterial.fnt_paiming);
			_fnt_paiming_num=new FontField(mcMaterial.fnt_paiming_num);
			_fnt_challenge_times=new FontField(mcMaterial.fnt_challenge_times);
			_fnt_challenge_times_num=new FontField(mcMaterial.fnt_challenge_times_num);
		}
		private function destroyMc():void
		{
			if(_fnt_paiming){_fnt_paiming.destory();_fnt_paiming=null;};
			if(_fnt_paiming_num){_fnt_paiming_num.destory();_fnt_paiming_num=null;};
			if(_fnt_challenge_times){_fnt_challenge_times.destory();_fnt_challenge_times=null;};
			if(_fnt_challenge_times_num){_fnt_challenge_times_num.destory();_fnt_challenge_times_num=null;};
		}
		public override function destory():void
		{
			leitaiModel.leitaiVoArrayChange_SN.remove(onLeitaiInfoChange);
			leitaiModel=null;
			destroyMc();
			super.destory();
		}
		protected override function registerEvent():void
		{
			leitaiModel.leitaiVoArrayChange_SN.add(onLeitaiInfoChange);
			setShow();
		}
		private function onLeitaiInfoChange():void
		{
			updateShow();
		}
		private function updateShow():void
		{
			var timesLeft:int=LeitaiModel.getLeitaiFreeFightLimit()-leitaiModel._leitaiVo.tiaozhanCount;
			if(timesLeft<0)
			{
				timesLeft=0;
			}
			_fnt_challenge_times_num.text=timesLeft+"/"+LeitaiModel.getLeitaiFreeFightLimit();
			_fnt_paiming_num.text=leitaiModel._leitaiVo.myRank.toString();
		}
		protected override function setShow():void
		{
			updateShow();
		}
		protected override function get mcClassName():Class
		{
			return playerInfo;
		}
		private function get mcMaterial():playerInfo
		{
			return m_mc as playerInfo;
		}
	}
}