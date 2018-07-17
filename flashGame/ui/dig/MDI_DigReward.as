package ui.dig
{
	import com.fish.modules.core.models.GuankaModel;
	import com.ghostlmm.dig.GameTile;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.widget.TextTipItem;
	import ui.widget.TextTipItem2;
	
	import util.GameTime;
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_DigReward extends Mediator
	{
		[Inject]
		public var wm:DigRewardWindow;
		[Inject]
		public var guankaModel:GuankaModel;
		
		private var digInfoData:AutoDigInfoData;
		public function MDI_DigReward()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			digInfoData=wm._params as AutoDigInfoData;
			
			var gameTime:GameTime=new GameTime(digInfoData.digTime*1000);
			if(gameTime.miliSecond<=3000){
				gameTime.setMiliSeconds(3000);
			}
			wm._fnt_time.text=gameTime.toStringDHMS();
			wm._scn_exp.num=digInfoData.exp;
			wm._scn_money.num=digInfoData.money;
			wm._scr_reward.initClass(TextTipItem2);
			wm._scr_reward.setData(digInfoData.equipInfos);
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,closeWindow);
			addViewListener(wm._btn_queding,TqtEvent.BUTTON_CLICK,closeWindow);
		}
		
		private function closeWindow(evt:Event):void{
			Util.showLevelUpWindow();
			wm.close();
		}
		
		public override function destroy():void
		{
			// todo
			super.destroy();
		}
	}
}