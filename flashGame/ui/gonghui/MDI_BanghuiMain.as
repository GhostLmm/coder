package ui.gonghui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GonghuiVO;
	import com.fish.modules.core.models.GonghuiModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_banghui_icon;
	import com.ghostlmm.xmldata.Node_banghui_jianzhulvup;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.liaotian.LiaotianMC;
	import ui.window.JinggaoWindow;
	
	import util.Util;
	
	import view.CommonControlFun;

	public class MDI_BanghuiMain extends Mediator
	{
		[Inject]
		public var window:BanghuiMainWindow;
		
		private var gonghuiModel:GonghuiModel;
		
		public function MDI_BanghuiMain()
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
		private function setBanghuiShow():void
		{
			var gonghuiVo:GonghuiVO=gonghuiModel.gonghuiVo;
			window._fnt_banghuidengji.text=Util.getLanguage("帮会等级显示",gonghuiVo.banghuiLevel);
			if(null!=gonghuiVo.banghuiName)
			{
				window._fnt_banghuiming.text=gonghuiVo.banghuiName;
			}
			var totalNum:int=GonghuiModel.getJianzhuLevelXmlByLevel(gonghuiVo.datingLevel).banghui_renshu;
			window._fnt_bangpairenshu.text=Util.getLanguage("帮会人数显示",gonghuiVo.personNum,totalNum);
			//个人贡献度放在个人数据里面
			window._fnt_gerengongxian.text=gonghuiModel.myBanghuiData.curGongxian.toString();
			
			window._fnt_bangpaijianshedu.text=gonghuiVo.jiangshedu.toString();
			if(null!=gonghuiVo.gonggao)
			{
				window._fnt_banghuixuanyan_value.text=gonghuiVo.gonggao;
			}
			
			window._fnt_guangongdian_lv.text=Util.getLanguage("帮会等级显示",gonghuiVo.guanggongmiaoLevel);
			window._fnt_juntuandating_lv.text=Util.getLanguage("帮会等级显示",gonghuiVo.datingLevel);
			window._fnt_juntuanshangcheng_lv.text=Util.getLanguage("帮会等级显示",gonghuiVo.shangchengLevel);
			
			var iconXml:Node_banghui_icon=GonghuiModel.getIconXMl(gonghuiVo.banghuiIcon);
			if(null!=iconXml)
			{
				window._pos_banghui_icon.fillWithBitmapByClassName(iconXml.img_name);
			}
			setBuildingShengjiShow();
		}
		/**
		 * 升级显示(目前所有人都可见)
		 */
		private function setBuildingShengjiShow():void
		{
			return;
			if(!gonghuiModel.checkIfIamHuizhang())
			{
				window._btn_juntuandating_lvup.visible=false;
				window._btn_juntuanshangcheng_lvup.visible=false;
				window._btn_guangongdian_lvup.visible=false;
				return;
			}
			var gonghuiVo:GonghuiVO=gonghuiModel.gonghuiVo;
			var datingNode:Node_banghui_jianzhulvup=GonghuiModel.getJianzhuLevelXmlByLevel(gonghuiVo.datingLevel);
			if(gonghuiVo.jiangshedu>=datingNode.banghui_dating)
			{
				window._btn_juntuandating_lvup.visible=true;
			}
			else
			{
				window._btn_juntuandating_lvup.visible=false;
			}
			var shangchengNode:Node_banghui_jianzhulvup=GonghuiModel.getJianzhuLevelXmlByLevel(gonghuiVo.shangchengLevel);
			if(gonghuiVo.jiangshedu>=shangchengNode.banghui_shangcheng)
			{
				window._btn_juntuanshangcheng_lvup.visible=true;
			}
			else
			{
				window._btn_juntuanshangcheng_lvup.visible=false;
			}
			var guangongmiaoNode:Node_banghui_jianzhulvup=GonghuiModel.getJianzhuLevelXmlByLevel(gonghuiVo.guanggongmiaoLevel);
			if(gonghuiVo.jiangshedu>=guangongmiaoNode.banghui_guangongmiao)
			{
				window._btn_guangongdian_lvup.visible=true;
			}
			else
			{
				window._btn_guangongdian_lvup.visible=false;
			}
		}
		private function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			gonghuiModel.GonghuiInfo_SN.add(setShow);
			gonghuiModel.GonghuiSelf_SN.add(setShow);
			
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);			
			addViewListener(window._btn_guanli,TqtEvent.BUTTON_CLICK,onGuanliClicked);			
			addViewListener(window._btn_shenqing,TqtEvent.BUTTON_CLICK,onShenqingClicked);			
			addViewListener(window._btn_chengyuan,TqtEvent.BUTTON_CLICK,onChengyuanClicked);
			addViewListener(window._btn_qita,TqtEvent.BUTTON_CLICK,onQitaClicked);
			addViewListener(window._btn_hongbao,TqtEvent.BUTTON_CLICK,onHongbaoClicked);
			
			addViewListener(window._btn_juntuandating_lvup,TqtEvent.BUTTON_CLICK,onDatingShengjiClicked);
			addViewListener(window._btn_juntuanshangcheng_lvup,TqtEvent.BUTTON_CLICK,onShangchengShengjiClicked);
			addViewListener(window._btn_guangongdian_lvup,TqtEvent.BUTTON_CLICK,onGuangongShengjiClicked);
			
			addViewListener(window._btn_juntuandating,MouseEvent.CLICK,onJuntuandatingClicked);
			addViewListener(window._btn_juntuanshangcheng,MouseEvent.CLICK,onJuntuanshangchengClicked);
			addViewListener(window._btn_guangongdian,MouseEvent.CLICK,onGuangongdianClicked);
			addViewListener(window._btn_banghuizhan,MouseEvent.CLICK,onBanghuiZhanClicked);
			
			addViewListener(window._btn_tuichu,TqtEvent.BUTTON_CLICK,onTuichuClicked);
			addViewListener(window._btn_liaotian,TqtEvent.BUTTON_CLICK,onLiaotianClicked);
		}
		private function onBanghuiZhanClicked(evt:Event):void
		{
			Util.openBanghuizhan();
//			WindowManager.getWindowByClass(BanghuizhanBaomingWindow).open();
		}
		private function onLiaotianClicked(evt:Event):void
		{
			CommonControlFun.gotoChat(LiaotianMC.TP_Gonghui);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_QuitBanghuiHandler)
			{
				if(_code==1)
				{
					Util.flow("退出帮会成功");
					CommonControlFun.banghuiJiesanSucDo();
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
			if(_msgType==C2SEmitter.REQ_LvupBanghuiShopHandler)
			{
				if(_code==1)
				{
					Util.flow("帮会商城升级成功");
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
			if(_msgType==C2SEmitter.REQ_LvupBanghuiMiaoHandler)
			{
				if(_code==1)
				{
					Util.flow("关公庙升级成功");
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
			if(_msgType==C2SEmitter.REQ_LvupBanghuiDating)
			{
				if(_code==1)
				{
					Util.flow("帮会大厅升级成功");
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
		}
		/**
		 * 退出工会（非会长）
		 */
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
		/**
		 * 工会红包
		 */
		private function onHongbaoClicked(evt:Event):void
		{
//			Util.flow("功能尚未开启，敬请期待");
//			return;
			WindowManager.openOnlyWinodw(BanghuiHongbaoWindow);
		}
		private function onDatingShengjiClicked(evt:Event):void
		{
			var re:JudgeResult=gonghuiModel.judgeBanghuiDatingCouldLevelUp();
			if(re.success)
			{
				var confirmFunc:Function=function():void
				{
					C2SEmitter.levelupBanghuiDating();
				};
				CommonControlFun.confirmDoSth(re.desc,confirmFunc);				
			}
			else if(re.code==JudgeResult.CD_CailiaoNotEnough)
			{
				CommonControlFun.confirmDoSth(re.desc,null);
			}
			else
			{
				Util.flow(re.desc);
			}
		}
		private function onShangchengShengjiClicked(evt:Event):void
		{
			var re:JudgeResult=gonghuiModel.judgeBanghuiShangchengCouldLevelUp();	
			if(re.success)
			{
				var confirmFunc:Function=function():void
				{
					C2SEmitter.levelupBanghuiShangcheng();
				};
				CommonControlFun.confirmDoSth(re.desc,confirmFunc);	
			}
			else if(re.code==JudgeResult.CD_CailiaoNotEnough)
			{
				CommonControlFun.confirmDoSth(re.desc,null);
			}
			else
			{
				Util.flow(re.desc);
			}
		}
		private function onGuangongShengjiClicked(evt:Event):void
		{
			var re:JudgeResult=gonghuiModel.judgeGuangongmiaoCouldLevelUp();	
			if(re.success)
			{
				var confirmFunc:Function=function():void
				{
					C2SEmitter.levelupBanghuiGuangongmiao();
				};
				CommonControlFun.confirmDoSth(re.desc,confirmFunc);	
			}
			else if(re.code==JudgeResult.CD_CailiaoNotEnough)
			{
				CommonControlFun.confirmDoSth(re.desc,null);
			}
			else
			{
				Util.flow(re.desc);
			}
		}
		/**
		 * 关公殿
		 */
		private function onGuangongdianClicked(evt:Event):void
		{
			WindowManager.openOnlyWinodw(GuangongdianWindow);
		}
		private function onQitaClicked(evt:Event):void
		{
			WindowManager.openOnlyWinodw(BanghuiShenqingWindow);
		}
		/**
		 * 帮会成员
		 */
		private function onChengyuanClicked(evt:Event):void
		{
			WindowManager.openOnlyWinodw(BanghuiChengyuanWindow);
		}
		/**
		 * 军团商城
		 */
		private function onJuntuanshangchengClicked(evt:Event):void
		{
			WindowManager.openOnlyWinodw(BanghuiShangchengWindow);
		}
		/**
		 * 帮会公告
		 */
		private function onShenqingClicked(evt:Event):void
		{
			WindowManager.openOnlyWinodw(BanghuiGonggaoWindow);
		}
		/**
		 * 帮会管理
		 */
		private function onGuanliClicked(evt:Event):void
		{
			WindowManager.openOnlyWinodw(BanghuiGuanliWindow);
		}
		private function onJuntuandatingClicked(evt:Event):void
		{
			WindowManager.openOnlyWinodw(GonghuidatingWindow);
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void 
		{
			setBanghuiShow();
			setHuizhangShow();
			setBuildingShengjiShow();
			setBuffShow();
		}
		private function setBuffShow():void
		{
			window._fnt_buff_num.text=gonghuiModel.gonghuiVo.coinBuff+"%";
		}
		private function setHuizhangShow():void
		{
			if(gonghuiModel.checkIfIamHuizhang())
			{
				window._btn_tuichu.visible=false;
				window._btn_guanli.visible=true;
				window._btn_shenqing.visible=true;
			}
			else
			{
				window._btn_tuichu.visible=true;
				window._btn_guanli.visible=false;
				window._btn_shenqing.visible=false;
			}
		}
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			gonghuiModel.GonghuiInfo_SN.remove(setShow);
			gonghuiModel.GonghuiSelf_SN.remove(setShow);
			gonghuiModel=null;
			super.destroy();
		}
	}
}
