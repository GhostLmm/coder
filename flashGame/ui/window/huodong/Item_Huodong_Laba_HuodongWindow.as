package ui.window.huodong
{	
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.HuodongdetailVO;
	import com.fish.modules.core.models.HuodongControlModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.RewardsPackData;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_huodong_caishenxiafan;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	import flash.utils.getTimer;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.window.CommonRewardWindow;
	import ui.window.huodong.items.IHuodongItem;
	
	import util.GameTime;
	import util.Util;
	
	import view.Base_Item;
	import view.CommonControlFun;
	import view.viewData.HuodongData;
	public class Item_Huodong_Laba_HuodongWindow extends Base_Item implements IHuodongItem
	{
		private static const ROLLNUMBER_COUNT:int = 5;
		private static const MAX_ROLL_SPEED:Number = 1000;
		private static const DECREASE_SPEED:Number = 200;
		
		private static const STATE_FULL_SPEED:int = 0;
		private static const STATE_DECREASE_SPEED:int = 1;
		private static const STATE_STOPING:int = 2;
		private static const STATE_STOPED:int = 3;
		
		private var _rollNumbers:Array = new Array();
		private var _rollNumberHeight:int = 0;
		private var _rollNumberMinY:int = 0;
		private var _rollSpeed:Vector.<Number> = new Vector.<Number>(ROLLNUMBER_COUNT);
		private var _decreaseDelay:Vector.<Number> = new Vector.<Number>(ROLLNUMBER_COUNT);
		private var _rollState:int = STATE_STOPED;
		private var _rollDestination:Vector.<int> = new Vector.<int>(ROLLNUMBER_COUNT);
		private var _rollDestinatoinNumber:int = 0;
		
		public var _btn_xiazhu:Button;
		
		public var _fnt_cash_xiazhu:FontField;
//		public var _fnt_cash_xianyou:FontField;
		public var _fnt_shengyucishu:FontField;
		public var _fnt_cash_max_get:FontField;
		public var _fnt_daojishi:FontField;
//		public var _fnt_cishu:FontField;
		
		private var timerModel:TimerModel;
		private var huodongControlModel:HuodongControlModel;
		private var huodongData:HuodongData;
		private var userModel:UserModel;
		
		public function Item_Huodong_Laba_HuodongWindow()
		{
		}
		protected override function initModule():void
		{
			timerModel=Context.getInjectInstance(TimerModel);
			huodongControlModel=Context.getInjectInstance(HuodongControlModel);
			huodongData=huodongControlModel.getHuodongData(HuodongControlModel.HuodongType_Laba);
			userModel=Context.getInjectInstance(UserModel);
			
			initRollNum();
			
			_btn_xiazhu=new Button(itemMaterial.btn_xiazhu);
			
			_fnt_cash_xiazhu=new FontField(itemMaterial.fnt_cash_xiazhu);
//			_fnt_cash_xianyou=new FontField(itemMaterial.fnt_cash_xianyou);
			_fnt_shengyucishu=new FontField(itemMaterial.fnt_shengyucishu);
			_fnt_cash_max_get=new FontField(itemMaterial.fnt_cash_max_get);
			_fnt_daojishi=new FontField(itemMaterial.fnt_daojishi);
//			_fnt_cishu=new FontField(itemMaterial.fnt_cishu);			
		}
		private function destoryMc():void
		{
			if(_btn_xiazhu){_btn_xiazhu.destory();_btn_xiazhu=null;};
			
			if(_fnt_cash_xiazhu){_fnt_cash_xiazhu.destory();_fnt_cash_xiazhu=null;};
//			if(_fnt_cash_xianyou){_fnt_cash_xianyou.destory();_fnt_cash_xianyou=null;};
			if(_fnt_shengyucishu){_fnt_shengyucishu.destory();_fnt_shengyucishu=null;};
			if(_fnt_cash_max_get){_fnt_cash_max_get.destory();_fnt_cash_max_get=null;};
			if(_fnt_daojishi){_fnt_daojishi.destory();_fnt_daojishi=null;};
//			if(_fnt_cishu){_fnt_cishu.destory();_fnt_cishu=null;};
		}
		private function initRollNum():void
		{
			
			var numberItem:Object = new Bitmap(AssetManager.getFontBitdata("0",AssetManager.FT_5)); 
			_rollNumberHeight = numberItem.height;
			_rollNumberMinY = -_rollNumberHeight * 9;
			if(_rollNumbers.length == 0){
				for(var i:int=0; i<ROLLNUMBER_COUNT; ++i){
					var itemName:String = "rollNumberItem" + i;
					var rollLayer:Sprite = new Sprite();
					var rollPos:Sprite = itemMaterial[itemName]["Pos_rollNumber"] as Sprite;
					rollPos.addChild(rollLayer);
					_rollNumbers[i] = rollLayer;
					
					for(var j:int = 0; j<10; ++j){
//						numberItem = new Bitmap(AssetManager.getFontBitdata(j.toString(),AssetManager.FT_5));
						numberItem = new Bitmap(AssetManager.getFontBitdata(j.toString(),AssetManager.FT_5),"auto",true);						
						numberItem.y = j * _rollNumberHeight;
						rollLayer.addChild(numberItem as DisplayObject);
					}
//					rollLayer.cacheAsBitmap = true;
//					Util.traceParentScale(numberItem as DisplayObject);
				}
			}
		}
		private var _lastRollTime:int = 0;
		private function playRollNumberAnimation():void{
			GlobalRef.stage.mouseChildren=false;
			if(STATE_STOPED != _rollState) return ;
			_lastRollTime = getTimer();			
			rollNumberState = STATE_FULL_SPEED;
		}
		public function set rollNumberState(state:int):void{
			_rollState = state;
			if(_rollState == STATE_FULL_SPEED){
				for(var i:int =0; i<ROLLNUMBER_COUNT; ++i){
					_rollSpeed[i] = MAX_ROLL_SPEED;
				}
			}
		}
		public function set rollNumberDestination(destination:int):void{
			if(destination < 0) return ;
			if(destination >= Math.pow(10, ROLLNUMBER_COUNT)){
				destination = Math.pow(10, ROLLNUMBER_COUNT);
			}
			var leftNumber:int = destination;
			for(var i:int = 0; i<ROLLNUMBER_COUNT; ++i){
				var rollNumber:int = leftNumber % 10;
				var rollNumberPos:int = -rollNumber * _rollNumberHeight;
				_rollDestination[i] = rollNumberPos;
				_decreaseDelay[i] = i * 200;
				leftNumber /= 10;
			}
			_rollDestinatoinNumber = destination;
			_rollState = STATE_DECREASE_SPEED;
		}
		protected override function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			timerModel.secondTimer_SN.add(onSecondTick);
			addTargetEvent(this,Event.ENTER_FRAME,onEnterFrame);
			addTargetEvent(_btn_xiazhu,TqtEvent.BUTTON_CLICK,onXiazhuClicked);
			addTargetEvent(_btn_xiazhu,TqtEvent.BUTTON_CLICK_DISABLE,onXiazhuClicked);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_CaishenRewardhandler)
			{
				if(_code==1)
				{
					playRollNumberAnimation();
					showResult();
					MDI_HuodongNew.updateIcon();
				}
				else
				{
					setShow();
				}
			}
		}
		private function onSecondTick():void
		{
			var gameTime:GameTime=new GameTime(huodongData.huodongSwitchVo.endTime-timerModel.serverTime);
			_fnt_daojishi.text=gameTime.toStringDHMOrHMS();
		}
		private function onEnterFrame(e:Event):void
		{			
			moveRollNumber();
		}
		private function moveRollNumber():void{
			if(STATE_STOPED == _rollState) return ;
			
			if(_rollNumbers.length == ROLLNUMBER_COUNT){
				var now:int = getTimer();
				var delta:int = now - _lastRollTime;
				_lastRollTime = now;
				
				var isAllRoll:Boolean = true;
				for(var i:int = 0; i<ROLLNUMBER_COUNT; ++i){
					var rollLayer:Sprite = _rollNumbers[i] as Sprite;
					if(_rollState == STATE_STOPING && Math.abs(rollLayer.y - _rollDestination[i]) < 0.01){
						continue;
					}
					isAllRoll = false;
					var oldY:int = rollLayer.y;
					rollLayer.y -= _rollSpeed[i] * delta / 1000;
					if(rollLayer.y < _rollNumberMinY){
						rollLayer.y = 0;
					}
					
					if(_rollState == STATE_STOPING){
						if((_rollDestination[i] == _rollNumberMinY || _rollDestination[i] == 0) && rollLayer.y == 0 && oldY < 0){
							rollLayer.y = _rollDestination[i];
						}
						else if(oldY >= _rollDestination[i] && rollLayer.y <= _rollDestination[i]){
							rollLayer.y = _rollDestination[i];
						}
					}else if(_rollState == STATE_DECREASE_SPEED){
						if(_decreaseDelay[i] > 0){
							_decreaseDelay[i] -= delta;
						}else{
							_rollSpeed[i] *= 0.95;
							if(_rollSpeed[i] < DECREASE_SPEED){
								_rollState = STATE_STOPING;
							}
						}
					}else if(_rollState == STATE_STOPING){
						_rollSpeed[i] -= 10;
						if(_rollSpeed[i] < 20){
							_rollSpeed[i] = 20;
						}
					}
				}				
				if(isAllRoll){
					_rollState = STATE_STOPED;
					this.mouseChildren=false;
					this.mouseEnabled=false;
					TweenLite.delayedCall(1,stopRollNum);
					return ;
				}
			}
		}
		private function onXiazhuClicked(evt:Event):void
		{
			if(STATE_STOPED != _rollState) 
			{
				return ;
			}	
			/*if(checkIfReachMaxTimes())
			{
				Util.flow("已经达到最大次数，不能下注");
				return;
			}
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
			var huodongData:HuodongData=huodongControlModel.getHuodongData(HuodongControlModel.HuodongType_Laba);
			var timeResult:JudgeResult=HuodongControlModel.checkHuodongTime(timerModel.serverTime,huodongData.huodongSwitchVo.startTime,huodongData.huodongSwitchVo.endTime);
			if(!timeResult.success)
			{
				Util.flow(timeResult.desc);
				return;
			}
			var xml:Node_huodong_caishenxiafan=getCurrentXml();
			var cost:int;
			if(null==xml)
			{
				cost=0;
			}
			else
			{
				cost=xml.cost_cash;
			}
			if(!userModel.cashCouldAfford(cost))
			{
				CommonControlFun.cashNotEnoughDo();
				return;
			}		*/
			
			var re:JudgeResult=huodongControlModel.couldLaba();
			if(re.success){
				C2SEmitter.caishenXiazhu();
			}else{
				CommonControlFun.proccessJudgeResult(re);
			}
			
			
		}
		private function checkIfReachMaxTimes():Boolean
		{
			var huodongDetail:HuodongdetailVO=huodongControlModel.huodongDetail;
			if(huodongDetail.labaTimes>=HuodongControlModel.getLabaMaxTimes())
			{
				return true;
			}
			return false;
		}
		private function showResult():void
		{
			var huodongDetail:HuodongdetailVO=huodongControlModel.huodongDetail;
			rollNumberDestination=huodongDetail.labaRewardsCash;	
		}
		private function stopRollNum():void
		{
			GlobalRef.stage.mouseChildren=true;
			var huodongDetail:HuodongdetailVO=huodongControlModel.huodongDetail;			
			var param:Object={};
			var rewardData:RewardsPackData=new RewardsPackData();
			param.data=rewardData;
			param.callBack=reset;
			rewardData.bouns_cash=Math.abs(huodongDetail.labaRewardsCash);
			WindowManager.openOnlyWinodw(CommonRewardWindow,param);	
			
			this.mouseChildren=true;
			this.mouseEnabled=true;
		}
		private function reset():void
		{
			resetRollNumberToZero();
			setShow();
		}
		public function resetRollNumberToZero():void{
			for(var i:int = 0; i<ROLLNUMBER_COUNT; ++i){
				var rollLayer:Sprite = _rollNumbers[i] as Sprite;
				rollLayer && (rollLayer.y = 0);
			}
			_rollState = STATE_STOPED;
		}
		protected override function setShow():void
		{
			var huodongDetail:HuodongdetailVO=huodongControlModel.huodongDetail;
			_fnt_shengyucishu.text=((HuodongControlModel.getLabaMaxTimes()-huodongDetail.labaTimes)+"/"+HuodongControlModel.getLabaMaxTimes()).toString();
//			_fnt_cishu.text=HuodongControlModel.getLabaMaxTimes().toString();
			
			var xml:Node_huodong_caishenxiafan=XMLDataManager.getHuodong_caishenxiafanById(huodongDetail.labaTimes+1);
			if(null!=xml)
			{
				_fnt_cash_max_get.text=xml.reward_max.toString();
//				_fnt_cash_xianyou.text=userModel.userVo.userCash.toString();
				_fnt_cash_xiazhu.text=xml.cost_cash.toString();
			}
			else
			{
				_fnt_cash_max_get.text="0";
				_fnt_cash_max_get.text="0";
//				_fnt_cash_xianyou.text=userModel.userVo.userCash.toString();
			}
			if(checkIfReachMaxTimes())
			{
				_btn_xiazhu.isEnabled=false;
			}
			else
			{
				_btn_xiazhu.isEnabled=true;
			}
		}
		private function getCurrentXml():Node_huodong_caishenxiafan
		{
			var huodongDetail:HuodongdetailVO=huodongControlModel.huodongDetail;
			var xml:Node_huodong_caishenxiafan=XMLDataManager.getHuodong_caishenxiafanById(huodongDetail.labaTimes+1);
			return xml;
		}
		protected override function get itemClassName():Class
		{
			return Scene_Huodong_Caishen; 
		}
		private function get itemMaterial():flash.display.MovieClip  
		{
			return m_mc as flash.display.MovieClip;  
		}
		
		public override function destory():void
		{
			GlobalRef.stage.mouseChildren=true;
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			timerModel.secondTimer_SN.remove(onSecondTick);
			timerModel=null;
			TweenLite.killDelayedCallsTo(stopRollNum);
			destoryMc();
			super.destory();
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

