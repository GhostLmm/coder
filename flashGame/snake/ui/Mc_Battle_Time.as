package snake.ui
{
	import com.fish.modules.core.models.BattleModel;
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	
	import snake.BattleLayer;
	import snake.effect.BattleTimeTick;
	
	import ui.widget.FontField;
	
	import util.GameTime;
	
	import view.Base_Mc;
	
	public class Mc_Battle_Time extends Base_Mc
	{
		public var battleModel:BattleModel;
		
		private var timeModel:TimerModel;
		public var _fnt_remain_time:FontField;
		public var _fnt_remain_time_num:FontField;
		
		public var _leftTime:int;
		
		private var _timeTick:BattleTimeTick;
		
		public function Mc_Battle_Time()
		{
			super();
		}
		protected override function initModule():void
		{
			battleModel=Context.getInjectInstance(BattleModel);
			timeModel=Context.getInjectInstance(TimerModel);
			_fnt_remain_time_num=new FontField(mcMaterial.fnt_remain_time_num);
			_fnt_remain_time=new FontField(mcMaterial.fnt_remain_time);
		}
		
		protected override function registerEvent():void
		{
			startTick();
		}
		
		public function stopTick():void{
			timeModel.frame_SN.remove(update);
		}
		private var totalTime:int;
		public function startTick():void{
			_leftTime=battleModel.battleBase.battleMustEndTime-timeModel.serverTime;
			totalTime=int(battleModel.battleBase.battleMustEndTime-battleModel.battleBase.battleBeginTime)/1000;
			setShow();
			timeModel.frame_SN.add(update);
			
		}
		
		public function resumeTick():void{
			timeModel.frame_SN.add(update);
			setShow();
		}
		
		private function update(time:Number=0):void
		{
//			_leftTime-=time;
			
			if(battleModel.isEnded) return ;
			
			_leftTime=battleModel.battleBase.battleMustEndTime-timeModel.serverTime;
			if(_leftTime<=0)
			{
				timeModel.frame_SN.remove(update);
				BattleModel.battleTimeEnd();
			}
			_fnt_remain_time_num.text=int(_leftTime/1000)+"/"+totalTime+"s";
//			var gameTime:GameTime=new GameTime(_leftTime);
//			if(gameTime.miliSecond<0){
//				gameTime.setMiliSeconds(0);
//				timeModel.frame_SN.remove(update);
//				BattleModel.battleTimeEnd();
//			}
//			_fnt_remain_time_num.text=gameTime.toString3();
			
			var timetick:int=_leftTime/1000;
			if(timetick<0) timetick=0;
			if(timetick<=9){
				if(_timeTick==null) _timeTick=new BattleTimeTick(BattleLayer.effectLayer);
				_timeTick.show(timetick);
			}
			
		}
		protected override function setShow():void
		{
			update();
		}
		protected override function get mcClassName():Class
		{
			return mc_zhandou_shengyushijian_part;
		}
		private function get mcMaterial():mc_zhandou_shengyushijian_part
		{
			return m_mc as mc_zhandou_shengyushijian_part;
		}
		public override function destory():void
		{
			if(_timeTick){
				_timeTick.destory();
				_timeTick=null;
			}
			timeModel.frame_SN.remove(update);
			timeModel=null;
			battleModel=null;
			if(_fnt_remain_time_num){_fnt_remain_time_num.destory();_fnt_remain_time_num=null;};
			if(_fnt_remain_time){_fnt_remain_time.destory();_fnt_remain_time=null;};
			super.destory();
		}
	}
}