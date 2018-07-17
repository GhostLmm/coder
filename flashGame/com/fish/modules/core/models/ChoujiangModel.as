package com.fish.modules.core.models
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.ChoujiangVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_choujiang;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TweenLite;
	
	import org.osflash.signals.Signal;
	
	import util.GameTime;
	import util.Util;

	public class ChoujiangModel extends BaseModel
	{
		public static const TP_Jingxuan:String="Jingxuan";
		public static const TP_Haixuan:String="Haixuan";
		public var choujiangVo:ChoujiangVO;
		
		public var initComplete_SN:Signal;
		
		private var _freshState:Boolean=false;
		
		private var _firstInitFlag:Boolean=false;
		
		public function ChoujiangModel()
		{
			super();
		}
		public static function get Haixuan_chouquCost():int
		{
			return XMLDataManager.getConstById("haixuan_chouqu").value;
		}
		public static function get Haixuan_shilianchouCost():int
		{
			return XMLDataManager.getConstById("haixuan_shilianchou").value;
		}
		public static function get Cash_chouqu():int
		{
			return XMLDataManager.getConstById("cash_chouqu").value;
		}
		public static function get Cash_shilianchou():int
		{
			return XMLDataManager.getConstById("cash_shilianchou").value;
		}
		public static function get NeedMaxChouquNum():int
		{
			return XMLDataManager.getConstById("jingxuan_cishu_all").value;
		}
		public function couldJingxuanShilian():JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			var cost:int=XMLDataManager.getConstById("cash_shilianchou").value;
			if(choujiangVo.jingxuanShilianCount<=0){
				cost=int(cost/2);
			}
			if(userModel.userVo.userCash<cost)
			{
				re.success=false;
				re.code=JudgeResult.CD_CashNotEnough;
			}
			else{
				re.success=true;
			} 
			return re;
		}
		protected override function onGameInitComplete():void
		{
			initComplete_SN=new Signal();
			choujiangVo=GameVOManager.getInstance().choujiang;
			S2CHanlder.instance.message_SN.add(onMessage);
			
			TweenLite.delayedCall(5,init,[false]);
			
		}
		public function couldHaixuanShilian():JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(!userModel.ronglianzhiCouldAfford(ChoujiangModel.Haixuan_shilianchouCost)){
				re.success=false;
				re.desc="熔炼值不足";
			}else{
				re.success=true;
			}
			return re;
		}
		public function couldHaixuan():JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			var timeModel:TimerModel=Context.getInjectInstance(TimerModel);
			var time:GameTime=new GameTime(choujiangVo.haixuanFreshTime-timeModel.serverTime);
			if(time.miliSecond<0)
			{
				re.success=true;
				return re;
			}
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.ronglianzhiCouldAfford(ChoujiangModel.Haixuan_chouquCost))
			{
				re.success=true;
				return re;
			}
			re.success=false;
			re.desc="熔炼值不足";
			return re;
		}
		public function couldJinxuan():JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			var timeModel:TimerModel=Context.getInjectInstance(TimerModel);
			var time:GameTime=new GameTime(choujiangVo.jingxuanFreshTime-timeModel.serverTime);
			if(time.miliSecond<0)
			{
				re.success=true;
				return re;
			}
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.userVo.userCash>=ChoujiangModel.Cash_chouqu)
			{
				re.success=true;
				return re;
			}
			re.success=false;
			re.code=JudgeResult.CD_CashNotEnough
			return re;
		}
		private function onMessage(type:String):void
		{
			if(type==C2SEmitter.REQ_ChoujiangInitHandler)
			{
				if(_firstInitFlag==false){
					initComplete_SN.dispatch();
					var timer:TimerModel=Context.getInjectInstance(TimerModel);
					timer.secondTimer_SN.add(onTick);
				}else{
					_firstInitFlag=false;
				}
				_freshState=false;
			}
		}
		private function onTick():void
		{
			var timer:TimerModel=Context.getInjectInstance(TimerModel);
			if(_freshState==false){
				if(choujiangVo.haixuanFreshTime!=0 && choujiangVo.haixuanFreshTime<timer.serverTime){
					_freshState=true;
					init();
					return ;
				}
				if(choujiangVo.jingxuanFreshTime!=0&&choujiangVo.jingxuanFreshTime<timer.serverTime){
					_freshState=true;
					init();
					return ;
				}
				
			}
		}
		public function isNeedFenjie(_node:Node_choujiang):Boolean
		{
			if(null==choujiangVo.fenjieXids)
			{
				return false;
			}
			var fenjieArray:Array=JSON.parse(choujiangVo.fenjieXids) as Array;
			if(-1==fenjieArray.indexOf(_node.item_id))
			{
				return false;
			}
			return true;
		}
		public function hasInitVO():Boolean
		{
			if( choujiangVo.hasInit()){
				return true;
			}
			return false;
		}		
		public function init(needLoading:Boolean=true):void
		{
			C2SEmitter.choujiangInit(needLoading);
		}
		public override function destory():void
		{
			if(initComplete_SN) {initComplete_SN.removeAll(); initComplete_SN=null;}
			TweenLite.killDelayedCallsTo(init);
			super.destory();
		}
	}
}