package ui.gonghui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.GonghuiModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_banghui_chuangjian;
	import com.ghostlmm.xmldata.Node_banghui_icon;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import ui.widget.Position;
	
	import util.Util;
	
	import view.CommonControlFun;
	import view.commontools.CheckBanWords;
	
	public class MDI_BanghuiChuangjian extends Mediator
	{
		[Inject]
		public var window:BanghuiChuangjianWindow;
		
		public function MDI_BanghuiChuangjian()
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
		private function initModule():void
		{
			
		}
		private function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_chuangjian,TqtEvent.BUTTON_CLICK,onChuangjianClicked);
			addViewListener(window._mc_icon_1,TQTTouchEvent.TOUCH_TAP,onGonghuiIconChoosed);
			addViewListener(window._mc_icon_2,TQTTouchEvent.TOUCH_TAP,onGonghuiIconChoosed);
			addViewListener(window._mc_icon_3,TQTTouchEvent.TOUCH_TAP,onGonghuiIconChoosed);
			addViewListener(window._mc_icon_4,TQTTouchEvent.TOUCH_TAP,onGonghuiIconChoosed);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_BanghuiChuangjianHandler)
			{
				if(_code==1)
				{
					Util.flow("恭喜您成功创建工会");
					window.close();
					CommonControlFun.banghuiChuangjianSucDo();
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function onGonghuiIconChoosed(evt:Event):void
		{
			var chooseWay:int=int(evt.target.name.split("mc_icon_")[1]);
			currentGonghuiIcon=GonghuiModel.getIconXMl(chooseWay).type;
			setGonghuiIconChooseShow();
		}
		private function onChuangjianClicked(evt:Event):void
		{
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			if(gonghuiModel.areadyHaveBanghui())
			{
				Util.flow("已经拥有工会了");
				return;
			}
			if(!window._fnt_shuru_banghuiming.isInputed())
			{
				Util.flow("请输入帮会名字");
				return;
			}
			if(CheckBanWords.isBad(window._fnt_shuru_banghuiming.text))
			{
				Util.flow("包含敏感词汇，请重新输入");
				return;
			}
			var xml:Node_banghui_chuangjian=GonghuiModel.getChuangjianXMl();
			if(null==xml)
			{
				return;
			}
			var re:JudgeResult=GonghuiModel.couldChuangjianGonghui(xml);
			if(re.success)
			{
				GonghuiModel.chuanjianBanghui(window._fnt_shuru_banghuiming.text,currentGonghuiIcon);
			}
			else if(re.code==JudgeResult.CD_CashNotEnough)
			{
				CommonControlFun.cashNotEnoughDo();
			}
			else
			{
				Util.flow(re.desc);
			}
		}
		private function setShow():void
		{
			setIconsShow();
			setStaticTextShow();
			setRequireShow();
			setGonghuiIconChooseShow();
		}
		private var currentGonghuiIcon:int=1;
		public static const MaxIconNum:int=4;
		private function setGonghuiIconChooseShow():void
		{
			var index:int;
			for(index=1;index<=MaxIconNum;index++)
			{
				var btn:MovieClip=window["_mc_icon_"+index] as MovieClip;
				if(index==currentGonghuiIcon)
				{
					btn.gotoAndStop(2);
				}
				else
				{
					btn.gotoAndStop(1);
				}
			}
		}
		private function setIconsShow():void
		{
			var iconXMllist:Array=GonghuiModel.getIconsXmlList();
			var index:int;
			for(index=0;index<iconXMllist.length;index++)
			{
				var xml:Node_banghui_icon=iconXMllist[index] as Node_banghui_icon;
				var pos:Position=window["_pos_banghui"+(index+1)] as Position;
				pos.fillWithBitmapByClassName(xml.img_name);
			}
		}
		private function setRequireShow():void
		{
			var xml:Node_banghui_chuangjian=GonghuiModel.getChuangjianXMl();
			if(null==xml)
			{
				return;
			}
			window._fnt_xuqiu1.text=Util.getLanguage("创建条件_1_chuangjianPanel",xml.lv);
			window._fnt_xuqiu2.text=Util.getLanguage("创建条件_2_chuangjianPanel",xml.money);
			window._fnt_xuqiu3.text=Util.getLanguage("创建条件_3_chuangjianPanel",xml.cash);
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.userVo.userLevel>=xml.lv)
			{
				window._mc_queren1.gotoAndStop(1);
			}
			else
			{
				window._mc_queren1.gotoAndStop(2);
			}
			if(userModel.couldUseMoneyBuy(xml.money))
			{
				window._mc_queren2.gotoAndStop(1);
			}
			else
			{
				window._mc_queren2.gotoAndStop(2);
			}
			if(userModel.cashCouldAfford(xml.cash))
			{
				window._mc_queren3.gotoAndStop(1);
			}
			else
			{
				window._mc_queren3.gotoAndStop(2);
			}
		}
		private function setStaticTextShow():void
		{
			window._fnt_iconxuanze.text=Util.getLanguage("选择帮会图标_chuangjianPanel");
			window._fnt_banghuiqiming.text=Util.getLanguage("帮会起名_chuangjianPanel");
			window._fnt_tiaojianxuqiu.text=Util.getLanguage("创建条件_chuangjianPanel");
		}
		public override function destroy():void 
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			super.destroy();
		}
	}
}