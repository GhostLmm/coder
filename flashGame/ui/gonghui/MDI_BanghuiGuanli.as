package ui.gonghui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.models.GonghuiModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.window.JinggaoWindow;
	
	import util.Util;
	
	public class MDI_BanghuiGuanli extends Mediator
	{
		[Inject]
		public var window:BanghuiGuanliWindow;
		
		private var gonghuiModel:GonghuiModel;
		
		public function MDI_BanghuiGuanli()
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
			gonghuiModel=Context.getInjectInstance(GonghuiModel);
		}
		private function registerEvent():void
		{
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._btn_jiesan,TqtEvent.BUTTON_CLICK,onJiesanClicked);
			addViewListener(window._btn_mima,TqtEvent.BUTTON_CLICK,onMimaClicked);
			addViewListener(window._btn_shenhe,TqtEvent.BUTTON_CLICK,onSheheClicked);
			addViewListener(window._btn_tuichu,TqtEvent.BUTTON_CLICK,onTuichuClicked);
			addViewListener(window._btn_xuanyan,TqtEvent.BUTTON_CLICK,onXuanyanClicked);
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function onJiesanClicked(evt:Event):void
		{
			if(!gonghuiModel.checkIfIamHuizhang())
			{
				Util.flow("不具有权限");
				return;
			}
			window.close();
			WindowManager.openOnlyWinodw(BangJiesanWindow);
		}
		private function onMimaClicked(evt:Event):void
		{
			if(!gonghuiModel.checkIfIamHuizhang())
			{
				Util.flow("不具有权限");
				return;
			}
			window.close();
			WindowManager.openOnlyWinodw(MimaXiugaiWindow);
		}
		private function onSheheClicked(evt:Event):void
		{
			window.close();
			WindowManager.openOnlyWinodw(BanghuiChengyuanWindow,MDI_BanghuiChengyuan.Label_Shenhe);
		}
		private function onTuichuClicked(evt:Event):void
		{
			if(gonghuiModel.checkIfIamHuizhang())
			{
				return;
			}
			var alert:JinggaoWindow;
			alert = new JinggaoWindow({data:{msg:Util.getLanguage("确定要退出帮会嘛？")}});
			alert.addEventListener(TqtEvent.ALERT_OK,onConfirmTuichu,false,0,true);
			alert.open();
		}
		private function onConfirmTuichu(evt:Event=null):void
		{
			C2SEmitter.tuichuBanghui(gonghuiModel.myBanghuiData.bid);
		}
		private function onXuanyanClicked(evt:Event):void
		{
			if(!gonghuiModel.checkIfIamHuizhang())
			{
				Util.flow("不具有权限");
				return;
			}
			window.close();
			WindowManager.openOnlyWinodw(BanghuiXuanyanWindow);
		}
		private function setShow():void
		{
			if(gonghuiModel.checkIfIamHuizhang())
			{
				window._btn_jiesan.visible=true;
				window._btn_mima.visible=true;
				window._btn_shenhe.visible=true;
				window._btn_xuanyan.visible=true;
				window._btn_tuichu.visible=false;
			}
			else
			{
				window._btn_jiesan.visible=false;
				window._btn_mima.visible=false;
				window._btn_shenhe.visible=false;
				window._btn_xuanyan.visible=false;
				window._btn_tuichu.visible=true;
			}
		}
		public override function destroy():void
		{
			gonghuiModel=null;
			super.destroy();
		}
	}
}