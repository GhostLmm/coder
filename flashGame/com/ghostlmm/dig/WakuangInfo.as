package com.ghostlmm.dig
{
	import com.fish.modules.core.models.GuankaModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.geom.Point;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.dig.DigJiashuTipWindow;
	import ui.layer.TwoPostionMC;
	import ui.widget.Button;
	import ui.widget.FontField;
	
	import util.Util;

	public class WakuangInfo
	{
		public var TM_Info:TwoPostionMC;
		private var mc_guanjiInfo:McShouyijisuan;
		private var _fnt_money_time:FontField;
		private var _fnt_exp_time:FontField;
		private var _fnt_box_time:FontField;
		
		public var _btn_jiasu:Button;
		
		public function WakuangInfo()
		{
			mc_guanjiInfo=new McShouyijisuan();
			
			
			init();
		}
		
		public function get display():DisplayObject{
			return mc_guanjiInfo;
		}
		
		public function setShow():void{
			var guankaModel:GuankaModel=Context.getInjectInstance(GuankaModel);
			_fnt_money_time.text=Util.getLanguage("挖矿小时收益—money",guankaModel.calcHourGetMoney());
			_fnt_exp_time.text=Util.getLanguage("挖矿小时收益—exp",guankaModel.calcHourGetExp());
			_fnt_box_time.text=Util.getLanguage("挖矿小时收益—equip",guankaModel.caclHourGetBox());
			
			trace("挖矿小时收益—money:\t"+_fnt_money_time.text);
			trace("挖矿小时收益—exp:\t"+_fnt_exp_time.text);
			trace("挖矿小时收益—equip:\t"+_fnt_box_time.text);
		}
		
		
		public function init():void{
			TM_Info=new TwoPostionMC();
			var info_1:Point=new Point();
			info_1.x=GlobalRef.width;
			info_1.y=(GlobalRef.height-mc_guanjiInfo.height)/2;
			var info_2:Point=info_1.clone();
			info_2.x-=mc_guanjiInfo.width;
			TM_Info.init(mc_guanjiInfo,info_1,info_2);
			
			_fnt_money_time=new FontField(mc_guanjiInfo.fnt_money_time);
			_fnt_exp_time=new FontField(mc_guanjiInfo.fnt_exp_time);
			_fnt_box_time=new FontField(mc_guanjiInfo.fnt_box_time);
			_btn_jiasu=new Button(mc_guanjiInfo.btn_jiasu);
			
			_btn_jiasu.addEventListener(TqtEvent.BUTTON_CLICK,onClickJiashu);
		}
		
		private function onClickJiashu(evt:Event):void{
			WindowManager.openOnlyWinodw(DigJiashuTipWindow);
		}
		
		public function destory():void{
			if(TM_Info) {TM_Info.destory(); TM_Info=null;}
			if(_fnt_money_time) {_fnt_money_time.destory(); _fnt_money_time=null;}
			if(_fnt_exp_time) {_fnt_exp_time.destory(); _fnt_exp_time=null;}
			if(_fnt_box_time) {_fnt_box_time.destory(); _fnt_box_time=null;}
			if(_btn_jiasu) {_btn_jiasu.removeEventListener(TqtEvent.BUTTON_CLICK,onClickJiashu);_btn_jiasu.destory(); _btn_jiasu=null;}
		}
		
	}
}