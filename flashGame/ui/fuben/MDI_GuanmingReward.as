package ui.fuben
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.MapModel;
	import com.fish.modules.core.models.RewardsPackData;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_fuben;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.mc.JiangliMc;
	
	import util.Util;
	
	public class MDI_GuanmingReward extends Mediator
	{
		[Inject]
		public var wm:GuanmingRewardWindow;
		[Inject]
		public var mapModel:MapModel;
		
		private var node:Node_fuben;
		
		public function MDI_GuanmingReward()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			node=wm._params as Node_fuben;
			wm._scr_reward.initClass(JiangliMc);
			var pack:RewardsPackData=new RewardsPackData();
			pack.bouns_star=node.guanming_star;
			pack.bonus_money=node.guanming_money;
			pack.bouns_cash=node.guanming_cash;
			pack.bouns_equips=Util.createArrayJosnToMap(node.guanming_item,node.guanming_item_num);
			wm._scr_reward.setData(pack.createItemDatas());
			
			var paiming:int=mapModel.getUserGuanmingPaiming();
			if(paiming==-1){
				wm._fnt_paiming.text=Util.getLanguage("无排名");
			}else{
				wm._fnt_paiming.text=paiming.toString();
			}
			
			addViewListener(wm._btn_lingqu,TqtEvent.BUTTON_CLICK,onClickLingqu);
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			
		}
		
		private function onClickLingqu(evt:Event):void{
			var re:JudgeResult=mapModel.couldLinquGuamingReward(node.id);
			if(re.success){
				C2SEmitter.getGuanmingReward(node.id);
				wm.close();
			}else{
				Util.flow(re.desc);
				wm.close();
			}
		}
		
		
		public override function destroy():void
		{
			// todo
			super.destroy();
		}
	}
}