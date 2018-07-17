package ui.gonghui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GonghuiVO;
	import com.fish.modules.core.models.GonghuiModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_banghui_jianzhulvup;
	import com.ghostlmm.xmldata.Node_banghui_juanxian;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import util.Util;
	
	
	public class MDI_Gonghuidating extends Mediator
	{
		[Inject]
		public var window:GonghuidatingWindow;
		
		private var gonghuiModel:GonghuiModel;
		
		private var userModel:UserModel;
		
		public function MDI_Gonghuidating()
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
			userModel=Context.getInjectInstance(UserModel);
			window._scrollController.initItemClass(Item_Gonghuidating);
		}
		private function registerEvent():void
		{
			userModel.modelUpdata_SN.add(onUserInfoChange);
			gonghuiModel.GonghuiInfo_SN.add(update);
			gonghuiModel.GonghuiSelf_SN.add(update);
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_GetBanghuiDatingHandler)
			{
				if(_code==1)
				{
					update();
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
			if(_msgType==C2SEmitter.REQ_JiansheBanghuiDatingHandler)
			{
				if(_code==1)
				{
					var juanXianXml:Node_banghui_juanxian=XMLDataManager.getBanghui_juanxianById(gonghuiModel.myBanghuiData.juanxian);
					if(juanXianXml)
					{
						var addBanghuijianshe:int=juanXianXml.get_banghuijianshe;
						var addGerengongxian:int=juanXianXml.get_gerengongxian;
						Util.flow("建设帮会成功，增加帮会建设，获取个人贡献",addBanghuijianshe,addGerengongxian);
					}
					update();
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
		}
		private function onUserInfoChange():void
		{
			setBasicShow();
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void
		{
			C2SEmitter.getBanghuiDatingInfo();			
		}
		private function update():void
		{
			setBasicShow();
			setJuanxianItemsShow();
			window._fnt_juanxianjilu.htmlText=gonghuiModel.getJiansheJilu();
		}
		private function setBasicShow():void
		{
			var gonghuiVo:GonghuiVO=gonghuiModel.gonghuiVo;
			window._fnt_lv.text=gonghuiVo.datingLevel.toString();
			window._fnt_jianshedu.text=gonghuiVo.jiangshedu.toString();
			var datingNode:Node_banghui_jianzhulvup=GonghuiModel.getJianzhuLevelXmlByLevel(gonghuiVo.datingLevel);
			window._fnt_shengjiexp.text=datingNode.banghui_dating.toString();
			
			window._fnt_zongganxian.text=gonghuiModel.myBanghuiData.curGongxian.toString();
			window._fnt_money.text=userModel.userVo.userMoney.toString();
			window._fnt_cash.text=userModel.userVo.userCash.toString();
		}
		private function setJuanxianItemsShow():void
		{
			window._scrollController.setData(GonghuiModel.getJuanxianXMllist());
		}
		public override function destroy():void
		{
			userModel.modelUpdata_SN.remove(onUserInfoChange);
			userModel=null;
			gonghuiModel.GonghuiInfo_SN.remove(update);
			gonghuiModel.GonghuiSelf_SN.remove(update);
			gonghuiModel=null;
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			super.destroy();
		}
	}
}