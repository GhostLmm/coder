package ui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.UserModel;
	import com.fish.modules.core.models.VipModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.tool.MovieClipControl;
	import com.ghostlmm.tool.MoviePlayControl;
	import com.ghostlmm.xmldata.Node_level;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.LayerController;
	import core.event.TqtEvent;
	
	import ui.widget.FlowBigText;
	
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_AddMoney extends Mediator
	{
		[Inject]
		public var wm:AddMoneyWindow;
		[Inject]
		public var userModel:UserModel;
		[Inject]
		public var vipModel:VipModel;
		
		public function MDI_AddMoney()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			addViewListener(wm._btn_goumai,TqtEvent.BUTTON_CLICK,onGoumai);
			
			wm._fnt_cishu.text=userModel.getCouldBuyMoneyCount()+"/"+(userModel.moneyBuyMax+vipModel.addCount_buyMoney);
			wm._fnt_num_cash.text=userModel.buyMoneyCost().toString();
			var nodeLv:Node_level=XMLDataManager.getLevelById(userModel.userVo.userLevel);
			wm._fnt_num_money.text=(nodeLv.buy_money+int(nodeLv.buy_money*vipModel.buyMoneyAddNum)).toString();
			
			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(msType==C2SEmitter.REQ_MoneyBuyHandler && code>0){
//				showMoneyFly();
				var nodeLv:Node_level=XMLDataManager.getLevelById(userModel.userVo.userLevel);
//				wm._fnt_num_money.text=nodeLv.buy_money.toString();
//				Util.flow("购买金币成功");
				FlowBigText.flow(nodeLv.buy_money+int(nodeLv.buy_money*vipModel.buyMoneyAddNum),FlowBigText.ST_Money);
				MoviePlayControl.playMovieCls(McTongqianDiaoluo,3,LayerController.instance.floatLayer);
//				LayerController.instance.
//				var flowMovie:MovieClip=new MovieClip();
//				MovieClipControl.controlMovieClip(
				wm.close();
			}
		}
//		
//		private function showMoneyFly():void{
//			
//		}
		
		private function onGoumai(evt:Event):void{
			var re:JudgeResult=userModel.couldBuyMoney();
			if(re.success){
				C2SEmitter.buyMoney();
			}else{
				CommonControlFun.proccessJudgeResult(re);
			}
		}
		
		
		public override function destroy():void
		{
			// todo
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			super.destroy();
		}
	}
}