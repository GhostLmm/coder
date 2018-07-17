package ui.gonghui
{
	import com.fish.modules.core.gameVO.BanghuiliebiaoVO;
	import com.fish.modules.core.models.GonghuiModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_banghui_icon;
	import com.ghostlmm.xmldata.Node_banghui_jianzhulvup;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItem;
	import ui.widget.Position;
	import ui.widget.ProgressManager;
	
	import util.Util;
	
	import view.Base_Item;
	
import flash.display.MovieClip
	public class Item_LiebiaoPanel extends Base_Item implements IGridItem
	{
		public var _btn_chakan:Button;
		public var _btn_shenqing:Button;
		public var _btn_quxiao:Button;
		
		public var _pos_zhuangbei:Position;
		
		public var _fnt_name:FontField;
		public var _fnt_lv:FontField;
		public var _fnt_bangzhu:FontField;
		public var _fnt_renshu:FontField;
		public var _prg:ProgressManager;
		
		public function Item_LiebiaoPanel()
		{
			super();
		}
		protected override function initModule():void
		{
			_btn_chakan=new Button(itemMaterial.btn_chakan);
			_btn_shenqing=new Button(itemMaterial.btn_shenqing);
			_btn_quxiao=new Button(itemMaterial.btn_quxiao);
			
			_pos_zhuangbei=new Position(itemMaterial.pos_zhuangbei);
			
			_fnt_name=new FontField(itemMaterial.fnt_name);
			_fnt_lv=new FontField(itemMaterial.fnt_lv);
			_fnt_bangzhu=new FontField(itemMaterial.fnt_bangzhu);
			_fnt_renshu=new FontField(itemMaterial.fnt_renshu);
			_prg=new ProgressManager(null,_fnt_renshu);
		}
		private function destoryMC():void
		{
			if(_btn_chakan){_btn_chakan.destory();_btn_chakan=null;};
			if(_btn_shenqing){_btn_shenqing.destory();_btn_shenqing=null;};
			if(_btn_quxiao){_btn_quxiao.destory();_btn_quxiao=null;};
			
			if(_pos_zhuangbei){_pos_zhuangbei.destory();_pos_zhuangbei=null;};
			
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			if(_fnt_lv){_fnt_lv.destory();_fnt_lv=null;};
			if(_fnt_bangzhu){_fnt_bangzhu.destory();_fnt_bangzhu=null;};
			if(_fnt_renshu){_fnt_renshu.destory();_fnt_renshu=null;};
			if(_prg){_prg.destory();_prg=null;};
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_chakan,TqtEvent.BUTTON_CLICK,onChakanClicked);
			addTargetEvent(_btn_quxiao,TqtEvent.BUTTON_CLICK,onQuxiaoClicked);
			addTargetEvent(_btn_shenqing,TqtEvent.BUTTON_CLICK,onShenqingClicked);
			addTargetEvent(_btn_shenqing,TqtEvent.BUTTON_CLICK_DISABLE,onShenqingClicked);
		}
		private function onChakanClicked(evt:Event):void
		{
			WindowManager.openOnlyWinodw(BanghuiChakanWindow,data.bid);
		}
		private function onQuxiaoClicked(evt:Event):void
		{
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			if(!gonghuiModel.checkIfAreadyShenqing(data.bid))
			{
				Util.flow("没有申请过该工会，不必取消");
				return;
			}
			GonghuiModel.quxiaoShenqing(data.bid);
		}
		private function onShenqingClicked(evt:Event):void
		{
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			var re:JudgeResult=gonghuiModel.judgeShenqing(data.bid);
			if(re.success)
			{
				GonghuiModel.shenqingGonghui(data.bid);
			}
			else if(re.code==JudgeResult.CD_HasOverLimit)
			{
				Util.flow("最多同时申请帮会数量",GonghuiModel.MaxShenqingGonghuiNum);
			}
			else
			{
				Util.flow(re.desc);
			}
		}
		protected override function setShow():void
		{
			_fnt_name.text=data.banghuiName;
			_fnt_lv.text=Util.getLanguage("帮会等级显示",data.banghuiLevel);
			_fnt_bangzhu.text=data.huizhangName;
			_prg.progress=data.personNum;
			var xml:Node_banghui_jianzhulvup=XMLDataManager.getBanghui_jianzhulvupById(data.banghuiLevel) as Node_banghui_jianzhulvup;
			_prg.devider=xml.banghui_renshu;
			var iconXml:Node_banghui_icon=GonghuiModel.getIconXMl(data.banghuiIcon);
			if(null!=iconXml)
			{
				_pos_zhuangbei.fillWithBitmapByClassName(iconXml.img_name);
			}
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			if(gonghuiModel.checkIfAreadyShenqing(data.bid))
			{
				_btn_quxiao.visible=true;
				_btn_shenqing.visible=false;
			}
			else
			{
				_btn_quxiao.visible=false;
				_btn_shenqing.visible=true;
			}
			if(gonghuiModel.myBanghuiData.bid>0)
			{
				_btn_shenqing.isEnabled=false;
			}
			else
			{
				_btn_shenqing.isEnabled=true;
			}
		}
		public override function loadData($data:Object):*
		{
			super.loadData($data);
		}
		protected override function get itemClassName():Class
		{
			return Banghui_item; 
		}
		private function get itemMaterial():Banghui_item 
		{
			return m_mc as Banghui_item; 
		}
		public override function destory():void
		{
			destoryMC();
			super.destory();
		}
		private function get data():BanghuiliebiaoVO
		{
			return m_data as BanghuiliebiaoVO;
		}
	}
}
