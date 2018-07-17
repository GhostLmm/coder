package ui.window.huodong
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.HuoDongModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	
	import util.Util;
	
	import view.Base_Item;
	
import flash.display.MovieClip
	public class Item_HuodongTili_HuodongWindow extends Base_Item
	{
		private var _btn_lingqu1:Button;
		private var _btn_lingqu2:Button;
		private var _fnt_tili:FontField;
		private var _fnt_time1:FontField;
		private var _fnt_time2:FontField;
		private var huodongModel:HuoDongModel;
		private var timerModel:TimerModel;
		
		public function Item_HuodongTili_HuodongWindow()
		{
			super();
		}
		protected override function get itemClassName():Class
		{
			return ItemHuodongTili; 
		}
		private function get itemMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
		
		
		
		
		protected override function initModule():void
		{
			huodongModel=Context.getInjectInstance(HuoDongModel);
			timerModel=Context.getInjectInstance(TimerModel);
			_btn_lingqu1=new Button(itemMaterial.btn_lingqu1);
			_btn_lingqu2=new Button(itemMaterial.btn_lingqu2);
			_fnt_tili=new FontField(itemMaterial.fnt_tili);
			_fnt_time1=new FontField(itemMaterial.fnt_time1);
			_fnt_time2=new FontField(itemMaterial.fnt_time2);
		}
		private function destoryMc():void
		{
			if(_btn_lingqu1){_btn_lingqu1.destory();_btn_lingqu1=null;};
			if(_btn_lingqu2){_btn_lingqu2.destory();_btn_lingqu2=null;};
			if(_fnt_tili){_fnt_tili.destory();_fnt_tili=null;};
			if(_fnt_time1){_fnt_time1.destory();_fnt_time1=null;};
			if(_fnt_time2){_fnt_time2.destory();_fnt_time2=null;};
		}
		protected override function registerEvent():void
		{
			huodongModel.modelUpdata_SN.add(setShow);
			timerModel.secondTimer_SN.add(setShow);
			S2CHanlder.instance.message_SN.add(onMessage);
			addTargetEvent(_btn_lingqu1,TqtEvent.BUTTON_CLICK,onLingqu1Clicked);
			addTargetEvent(_btn_lingqu2,TqtEvent.BUTTON_CLICK,onLingqu2Clicked);
			addTargetEvent(_btn_lingqu1,TqtEvent.BUTTON_CLICK_DISABLE,onLingqu1Clicked);
			addTargetEvent(_btn_lingqu2,TqtEvent.BUTTON_CLICK_DISABLE,onLingqu2Clicked);
			setShow();
		}
		private function onMessage(_message:String):void
		{
			if(_message==C2SEmitter.REQ_Lingquhandler)	
			{
				Util.flow("领取体力成功");
				MDI_HuodongNew.updateIcon();
			}
		}
		private function onLingqu1Clicked(evt:Event):void
		{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
//			if(!userModel.couldLingquTili())
//			{
//				Util.flow("体力已满，不能领取");
//				return;
//			}
			var re:JudgeResult=huodongModel.couldLingqu(1);
			if(!re.success)
			{
				Util.flow(re.desc);
				return;
			}
			huodongModel.lingqu();
		}
		private function onLingqu2Clicked(evt:Event):void
		{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
//			if(!userModel.couldLingquTili())
//			{
//				Util.flow("体力已满，不能领取");
//				return;
//			}
			var re:JudgeResult=huodongModel.couldLingqu(2);
			if(!re.success)
			{
				Util.flow(re.desc);
				return;
			}
			huodongModel.lingqu();
		}
		protected override function setShow():void
		{
			_fnt_tili.text=huodongModel.lingquNum.toString();
			_fnt_time1.text=huodongModel.noonBegainTime+"-"+huodongModel.noonEndTime;
			_fnt_time2.text=huodongModel.afternoonBegainTime+"-"+huodongModel.afternoonEndTime;
			var lingqu1State:JudgeResult=huodongModel.couldLingqu(1);
			if(!lingqu1State.success)
			{
				_btn_lingqu1.isEnabled=false;
			}
			else 
			{
				_btn_lingqu1.isEnabled=true;
			}
			var lingqu2State:JudgeResult=huodongModel.couldLingqu(2);
			if(!lingqu2State.success)
			{
				_btn_lingqu2.isEnabled=false;
			}
			else
			{
				_btn_lingqu2.isEnabled=true;
			}
		}
		public override function destory():void
		{
			huodongModel.modelUpdata_SN.remove(setShow);
			huodongModel=null;
			timerModel.secondTimer_SN.remove(setShow);
			timerModel=null;
			S2CHanlder.instance.message_SN.remove(onMessage);
			destoryMc();
			super.destory();
		}
	}
}
