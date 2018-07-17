package ui.gonghui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.GonghuiModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_banghui_jianzhulvup;
	
	import flash.display.MovieClip;
	
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ProgressManager;
	import ui.widget.ScrollController;
	
	import util.Util;
	
	import view.Panel_Base;
	
import flash.display.MovieClip
	public class Panel_Chengyuan_ChengyuanWindow extends Panel_Base
	{
		private var _pos:Position;
		private var _scrollController:ScrollController;
		private var _mc_chengyuanshu_tishi:MovieClip;
		private var _fnt_chengyuan_num:FontField;
		private var _prg:ProgressManager;
		
		public function Panel_Chengyuan_ChengyuanWindow()
		{
			super();
		}
		protected override function initModule():void
		{
			_pos=new Position(panelMaterial.pos_chengyuan);
			_scrollController=new ScrollController(_pos);
			_pos.removeChildren();
			_pos.addChild(_scrollController);
			_scrollController.initItemClass(Item_ChengyuanPanel);
			_mc_chengyuanshu_tishi=panelMaterial.mc_chengyuanshu_tishi;
			_fnt_chengyuan_num=new FontField(_mc_chengyuanshu_tishi.fnt_chengyuan_num);
			_prg=new ProgressManager(null,_fnt_chengyuan_num);
		}
		private function destoryMc():void
		{
			if(_pos){_pos.destory();_pos=null;};
			if(_scrollController){_scrollController.destory();_scrollController=null;};
			_mc_chengyuanshu_tishi=null;
			if(_fnt_chengyuan_num){_fnt_chengyuan_num.destory();_fnt_chengyuan_num=null;};
			if(_prg){_prg.destory();_prg=null;};
		}
		public override function clear():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			destoryMc();
			super.clear();
		}
		protected override function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_GetBanghuiPersonHandler)
			{
				if(_code==1)
				{
					setChengyuanListShow();
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
			if(_msgType==C2SEmitter.REQ_DeleteBanghuiChengyuanHandler)
			{
				if(_code==1)
				{
					Util.flow("踢出帮会成员成功");
					setChengyuanListShow();
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
		}
		private function setChengyuanListShow():void
		{
			_scrollController.setData(GameVOManager.getInstance().banghuipersions);
			_prg.progress=GameVOManager.getInstance().banghuipersions.length;
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			var datingNode:Node_banghui_jianzhulvup=GonghuiModel.getJianzhuLevelXmlByLevel(gonghuiModel.gonghuiVo.datingLevel);
			_prg.devider=datingNode.banghui_renshu;
		}
		protected override function setShow():void
		{
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			C2SEmitter.getBanghuiChengyuanList(gonghuiModel.myBanghuiData.bid);
		}
		protected override function get panelClassName():Class
		{
			return panel_chengyuanshenhe; 
		}
		private function get panelMaterial():panel_chengyuanshenhe 
		{
			return material as panel_chengyuanshenhe; 
		}
	}
}
