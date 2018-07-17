package ui.window.huodong
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.HuodongControlModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.RewardsPackData;
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.tool.MovieClipControl;
	import com.ghostlmm.xmldata.Node_huodong_guaguale;
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	
	import ui.widget.FontField;
	import ui.window.CommonRewardWindow;
	import ui.window.huodong.items.IHuodongItem;
	
	import util.GameTime;
	import util.Util;
	
	import view.Base_Item;
	import view.CommonControlFun;
	import view.viewData.HuodongData;
	
	public class Item_Huodong_Guaguale extends Base_Item implements IHuodongItem
	{
		
		private var jiangliArray1:Array;
		private var jiangliArray2:Array;
		
		//		private var _btn_guayigua:Button;
		private var _fnt_cost_num:FontField;
		private var _fnt_cishu:FontField;
		private var _fnt_huodongshijian:FontField;
		private var _mc_guajiang:MovieClip;
		
		private var huodongControlModel:HuodongControlModel;
		
		
		public function Item_Huodong_Guaguale()
		{
			super();
		}
		
		private function onTimeTick():void{
			var huodongData:HuodongData=huodongControlModel.getHuodongData(type);
			var huodongTime:GameTime=new GameTime(huodongData.huodongSwitchVo.endTime-TimerModel.instance.serverTime);
			if(huodongTime.miliSecond<0){
				huodongTime.setMiliSeconds(0);
			}
			_fnt_huodongshijian.text=huodongTime.toStringDHMOrHMS();
		}
		
		protected override function setShow():void{
			GlobalRef.stage.mouseChildren=true;
			var huodongData:HuodongData=huodongControlModel.getHuodongData(type);
			
			onTimeTick();
			
			_fnt_cost_num.text=huodongControlModel.guagualeCost().toString();
			_fnt_cishu.text=huodongControlModel.guagualeCount().toString();
			
			_mc_guajiang.visible=true;
			_mc_guajiang.gotoAndStop(1);
			
			var jaingci:Array=huodongControlModel.getGuagualeJiangciNodes();
			for (var index:int=0; index<jiangliArray1.length; index++){
				var jaingli:GuaguaJiangli=jiangliArray1[index];
				var node:Node_huodong_guaguale=jaingci[index];
				jaingli.setShow(node);
			}
		}
		protected override function registerEvent():void{
			//			addTargetEvent(_btn_guayigua,TqtEvent.BUTTON_CLICK,onGuaka);
			TimerModel.instance.secondTimer_SN.add(onTimeTick);
			addTargetEvent(_mc_guajiang,TQTTouchEvent.TOUCH_TAP,onGuaka);
			S2CHanlder.instance.message_SN.add(onMessage);
		}
		
		private function onMessage(msType:String):void{
			if(msType==C2SEmitter.REQ_GuagualeHandler){
				showGuaka();
				MDI_HuodongNew.updateIcon();
			}
		}
		
		private function onGuaka(evt:Event):void{
			
			var re:JudgeResult=huodongControlModel.couldGuaguale();
			if(re.success==false){
				if(re.code==JudgeResult.CD_CashNotEnough){
					CommonControlFun.cashNotEnoughDo();
				}else{
					Util.flow(re.desc);
					
				}
				
			}else{
				C2SEmitter.huodongGuaguale();
				/*if(huodongControlModel.guagualeCost()>0){
				CommonControlFun.confirmDoSth(
				}else{
				C2SEmitter.huodongGuaguale();
				}*/
				
			}
		}
		
		private function showGuaka():void{
			GlobalRef.stage.mouseChildren=false;
			
			MovieClipControl.controlMovieClip(_mc_guajiang,hideGuajiangMovie,24,1);
			
			var rewards:Array=huodongControlModel.getGuagualeRewardNodes();
			for (var index:int=0; index<1; index++){
				var node:Node_huodong_guaguale=rewards[index];
				var jiangli:GuaguaJiangli=jiangliArray2[index];
				jiangli.setShow(node);
			}
			
			TweenLite.delayedCall(1.5,showRewardWindow);
		}
		
		private function showRewardWindow():void{
			var args:RewardsPackData=new RewardsPackData();
			args.itemObjArray=[];
			var rewards:Array=huodongControlModel.getGuagualeRewardNodes();
			for each(var node:Node_huodong_guaguale in rewards){
				if(node.cash>0){
					args.itemObjArray.push({"key":"cash","num":node.cash,"xid":0});
				}else if(node.money>0){
					args.itemObjArray.push({"key":"money","num":node.money,"xid":0});
				}else{
					args.itemObjArray.push({"key":node.reward_type,"num":node.item_num,"xid":node.item_id});
				}
			}
			WindowManager.openOnlyWinodw(CommonRewardWindow,args);
			setShow();
		}
		
		private function hideGuajiangMovie(movie:MovieClip):void{
			_mc_guajiang.stop();
			_mc_guajiang.visible=false;
		}
		
		protected override function initModule():void{
			huodongControlModel=Context.getInjectInstance(HuodongControlModel);
			
			jiangliArray1=[];
			jiangliArray2=[];
			var index:int;
			for(index=1; index<=7; index++){
				var jiangli:GuaguaJiangli=new GuaguaJiangli(material["mc_"+index]);
				if(index<=6){
					jiangliArray1.push(jiangli);
				}else{
					jiangliArray2.push(jiangli);
				}
			}
			//			_btn_guayigua=new Button(material.btn_guayigua);
			_fnt_cost_num=new FontField(material.fnt_cost_num)
			_fnt_cishu=new FontField(material.fnt_cishu);
			_fnt_huodongshijian=new FontField(material.fnt_huodongshijian);
			_mc_guajiang=material.mc_guajiang;
			_mc_guajiang.gotoAndStop(1);
			
		}
		
		public override function destory():void{
			TimerModel.instance.secondTimer_SN.remove(onTimeTick);
			TweenLite.killDelayedCallsTo(showRewardWindow);
			//			if(_btn_guayigua) {_btn_guayigua.destory(); _btn_guayigua=null;}
			if(_fnt_cost_num) {_fnt_cost_num.destory(); _fnt_cost_num=null;}
			if(_fnt_cishu) {_fnt_cishu.destory(); _fnt_cishu=null;}
			if(_fnt_huodongshijian) {_fnt_huodongshijian.destory(); _fnt_huodongshijian=null;}
			
			if(_mc_guajiang) {MovieClipControl.stopControlMovie(_mc_guajiang);_mc_guajiang=null;}
			
			if(jiangliArray1){
				for each(var jiangli:GuaguaJiangli in jiangliArray1){
					jiangli.destory();
				}
				jiangliArray1.length=0;
				jiangliArray1=null;
			}
			if(jiangliArray2){
				for each(var jiangli:GuaguaJiangli in jiangliArray2){
					jiangli.destory();
				}
				jiangliArray2.length=0;
				jiangliArray2=null;
			}
			S2CHanlder.instance.message_SN.remove(onMessage);
			GlobalRef.stage.mouseChildren=true;
			super.destory();
		}
		
		private function get material():flash.display.MovieClip{
			
			return m_mc as flash.display.MovieClip;
			
		}
		protected override function get itemClassName():Class
		{
			return Scene_Huodong_Guaguale;
			
		}
		
		private var _type:String;
		public function get type():String{
			return _type;
		}
		public function set type(value:String):void
		{
			_type=value;
		}
	}
}
import com.ghostlmm.xmldata.Node_huodong_guaguale;

import flash.display.MovieClip;

import ui.widget.FontField;
import ui.widget.Position;

import util.Util;

class GuaguaJiangli{
	private var _fnt_jiangli:FontField;
	private var _pos_jiangli:Position;
	public function GuaguaJiangli($mc:MovieClip)
	{
		_fnt_jiangli=new FontField($mc.fnt_jiangli);
		_pos_jiangli=new Position($mc.pos_jiangli);
	}
	
	public function setShow(node:Node_huodong_guaguale):void{
		Util.createJiangliIcon(_pos_jiangli,node.reward_type,node.item_id);
		var num:int=node.item_num;
		if(node.cash>0){
			num=node.cash;
		}
		if(node.money>0){
			num=node.money;
		}
		_fnt_jiangli.text=Util.createJiangliDesc(node.reward_type,num,node.item_id);
	}
	
	public function destory():void{
		if(_fnt_jiangli) {_fnt_jiangli.destory(); _fnt_jiangli=null;}
		if(_pos_jiangli) {_pos_jiangli.destory(); _pos_jiangli=null;}
	}
	
}
