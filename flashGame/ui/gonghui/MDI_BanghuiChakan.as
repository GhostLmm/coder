package ui.gonghui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.BanghuixiangqingVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.GonghuiModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_banghui_icon;
	import com.ghostlmm.xmldata.Node_banghui_jianzhulvup;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_BanghuiChakan extends Mediator
	{
		[Inject]
		public var window:BanghuiChakanWindow;
		
		public function MDI_BanghuiChakan()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			initModule();
			registerEvent();
			setShow();
		}
		private var banghuiId:int;
		private function initModule():void
		{
			banghuiId=int(window._params);
		}
		private function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._btn_queding,TqtEvent.BUTTON_CLICK,onShenqingClicked);
			addViewListener(window._btn_queding,TqtEvent.BUTTON_CLICK_DISABLE,onShenqingClicked);
		}
		private function onShenqingClicked(evt:Event):void
		{
			var xiangqingVo:BanghuixiangqingVO=GameVOManager.getInstance().banghuixiangqing;
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			var result:JudgeResult=gonghuiModel.judgeShenqing(xiangqingVo.bid);
			if(result.success)
			{
				GonghuiModel.shenqingGonghui(xiangqingVo.bid);
			}
			else if(result.code==JudgeResult.CD_HasOverLimit)
			{
				Util.flow("最多同时申请帮会数量",GonghuiModel.MaxShenqingGonghuiNum);
			}
			else
			{
				Util.flow(result.desc);
			}
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(C2SEmitter.REQ_GetBanghuiInfoHandler==_msgType)
			{
				if(_code==1)
				{
					setGonghuiXiangqingShow();
				}
			}
		}
		private function setGonghuiXiangqingShow():void
		{
			var xiangqingVo:BanghuixiangqingVO=GameVOManager.getInstance().banghuixiangqing;
			window._fnt_BanghuiName.text=xiangqingVo.banghuiName;
			window._fnt_banghuidengji.text=Util.getLanguage("帮会等级显示",xiangqingVo.banghuiLevel);
			window._fnt_bangzhu.text=xiangqingVo.huizhangName;
			window._prg.progress=xiangqingVo.personNum;
			var xml:Node_banghui_jianzhulvup=XMLDataManager.getBanghui_jianzhulvupById(xiangqingVo.banghuiLevel) as Node_banghui_jianzhulvup;
			window._prg.devider=xml.banghui_renshu;
			var iconXml:Node_banghui_icon=GonghuiModel.getIconXMl(xiangqingVo.banghuiIcon);
			if(null!=iconXml)
			{
				window._pos_banghui_icon.fillWithBitmapByClassName(iconXml.img_name);
			}
			window._fnt_banghuixuanyan_value.text=xiangqingVo.xuanyan;
			
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			if(gonghuiModel.areadyHaveBanghui())
			{
				window._btn_queding.isEnabled=false;
			}
			else if(gonghuiModel.checkIfAreadyShenqing(xiangqingVo.bid))
			{
				window._btn_queding.isEnabled=false;
			}
			else
			{
				window._btn_queding.isEnabled=true;
			}
			window._fnt_chuangjiantime.text=CommonControlFun.timeToYMR(xiangqingVo.createTime);
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void
		{
			C2SEmitter.getBanghuiDetail(banghuiId);
		}
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			super.destroy();
		}
	}
}