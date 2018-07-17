package ui.choujiang
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.ChoujiangModel;
	import com.fish.modules.core.models.GuideModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	import flash.geom.Point;
	
	import core.PlayerGuideManager;
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import ui.equip.EquipRonglianWindow;
	
	import util.GameTime;
	import util.Util;
	
	public class MDI_ChoujiangXuanze extends Mediator
	{
		[Inject]
		public var window:ChoujiangXuanzeWindow;
		[Inject]
		public var guideModel:GuideModel;
		
		public var timerModel:TimerModel;
		public var xuanxiuModel:ChoujiangModel;
		
		private var userModel:UserModel;
		
	
		
		public function MDI_ChoujiangXuanze()
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
			userModel=Context.getInjectInstance(UserModel);
			timerModel=Context.getInjectInstance(TimerModel);
			xuanxiuModel=Context.getInjectInstance(ChoujiangModel);
		}
		private function registerEvent():void
		{
			timerModel.secondTimer_SN.add(onTick);
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			userModel.modelUpdata_SN.add(setRonglianzhiShow);
			
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._mc_haixuan,TQTTouchEvent.TOUCH_TAP,onHaixuanClicked);
			addViewListener(window._mc_haixuanshilianchou,TQTTouchEvent.TOUCH_TAP,onHaixuanShilianchouClicked);
			addViewListener(window._mc_jingxuan,TQTTouchEvent.TOUCH_TAP,onJingxuanClicked);
			addViewListener(window._btn_add,TqtEvent.BUTTON_CLICK,onAddRonglianClicked);
		}
		private function onAddRonglianClicked(evt:Event):void
		{
			window.close();
			WindowManager.openOnlyWinodw(EquipRonglianWindow);
		}
		public override function destroy():void
		{
			timerModel.secondTimer_SN.remove(onTick);
			userModel.modelUpdata_SN.remove(setRonglianzhiShow);
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			timerModel=null;
			userModel=null;
			xuanxiuModel=null;
			super.destroy();
		}
		private function setRonglianzhiShow():void
		{
			window._scn_fnt_ronglianzhi.num=userModel.userVo.userRonglian;
		}
		private function onOptMessage(_mesType:String,_code:int):void
		{
			if(null!=WindowManager.getCurrentOpenedWindowByClass(DanchouWindow))
			{
				return;
			}
			if(null!=WindowManager.getCurrentOpenedWindowByClass(ShilianshouWindow))
			{
				return;
			}
			if(_code==1)
			{
				var param:Object={};
				switch(_mesType)
				{
					case C2SEmitter.REQ_HaixuanChooseHandler:
						param["type"]=ChoujiangModel.TP_Haixuan;
						param["pos"]=new Point(window._mc_anim_haixuan.x,window._mc_anim_haixuan.y);
						WindowManager.openOnlyWinodw(DanchouWindow,param);
						break;
					case C2SEmitter.REQ_HaixuanBatchChooseHandler:
						param["type"]=ChoujiangModel.TP_Haixuan;
						param["pos"]=new Point(window._mc_anim_haixuanshilian.x,window._mc_anim_haixuanshilian.y);
						WindowManager.openOnlyWinodw(ShilianshouWindow,param);
						break;
					case C2SEmitter.REQ_JingxuanBatchChooseHandler:
						param["type"]=ChoujiangModel.TP_Jingxuan;
						param["pos"]=new Point(window._mc_anim_jingxuan.x,window._mc_anim_jingxuan.y);
						WindowManager.openOnlyWinodw(ShilianshouWindow,param);
						break;
					case C2SEmitter.REQ_JingxuanChooseHandler:
						param["type"]=ChoujiangModel.TP_Jingxuan;
						param["pos"]=new Point(window._mc_anim_jingxuan.x,window._mc_anim_jingxuan.y);
						WindowManager.openOnlyWinodw(DanchouWindow,param);
						break;
				}
			}
		}
		private function onTick():void
		{			
			setHaixuanTime();
			setJinxuanTime();
			setRonglianzhiShow();
		}
		private function setHaixuanTime():void
		{
			var time:GameTime=new GameTime(xuanxiuModel.choujiangVo.haixuanFreshTime-timerModel.serverTime);
			if(xuanxiuModel.choujiangVo.haixuanChosenid<0 || time.miliSecond<0)
			{
				window._fnt_haixuan_time.text=Util.getLanguage("本次");
				window._fnt_haixuan_mianfei.text=Util.getLanguage("免费");
			}
			else
			{
				window._fnt_haixuan_time.text=time.toString3();	
				window._fnt_haixuan_mianfei.text=Util.getLanguage("后免费");
			}		
		}
		private function setJinxuanTime():void
		{
			var time:GameTime=new GameTime(xuanxiuModel.choujiangVo.jingxuanFreshTime-timerModel.serverTime);
			if(time.miliSecond<0)
			{
				window._fnt_jingxuan_time.text=Util.getLanguage("本次");
				window._fnt_jingxuan_mianfei.text=Util.getLanguage("免费");
			}
			else
			{
				window._fnt_jingxuan_time.text=time.toString3();
				window._fnt_jingxuan_mianfei.text=Util.getLanguage("后免费");
			}
		}
		private function onJingxuanClicked(evt:Event):void
		{
			if(!guideModel.isComplete){
				PlayerGuideManager.getInstance().createFadeButtonClick("mcJingxuan");
			}
			WindowManager.openOnlyWinodw(JingxuanWindow);
		}
		private function onHaixuanShilianchouClicked(evt:Event):void
		{
			var re:JudgeResult=xuanxiuModel.couldHaixuanShilian();
			if(re.success){
				C2SEmitter.choujiang_haixuan_shilian();
			}
			else
			{
				Util.flow(re.desc);
			}
		}
		private function onHaixuanClicked(evt:Event):void
		{
			if(xuanxiuModel.hasInitVO())
			{
				showXuanxiuWindow();
			}
			else
			{
				xuanxiuModel.initComplete_SN.addOnce(showXuanxiuWindow);
				xuanxiuModel.init();
			}
		}
		private function showXuanxiuWindow():void
		{
			var re:JudgeResult=xuanxiuModel.couldHaixuan();
			if(re.success)
			{
				C2SEmitter.choujiang_haixuan();
			}
			else
			{
				Util.flow(re.desc);
			}
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void
		{
			onTick();
			window._fnt_haixuanshilianchou_money.text=ChoujiangModel.Haixuan_shilianchouCost.toString();
			window._fnt_haixuan_money.text=ChoujiangModel.Haixuan_chouquCost.toString();
			window._fnt_jingxuan_money.text=ChoujiangModel.Cash_chouqu.toString();
			setRonglianzhiShow();
		}
	}
}