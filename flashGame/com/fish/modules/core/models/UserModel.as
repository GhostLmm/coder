package com.fish.modules.core.models
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.RefreshCommunication;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.UserVO;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_level;
	import com.ghostlmm.xmldata.Node_vip;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import Tool.platform.PlatformManager;
	
	import org.osflash.signals.Signal;
	
	import r1.deval.D;
	
	import util.Util;
	
	import view.commontools.ServerListManager;

	public class UserModel extends BaseModel
	{
		public var userVo:UserVO;
		private var refreshTili:RefreshCommunication;
		
		public var levelUp_SN:Signal=new Signal(int);
		public function UserModel()
		{
			super();
		}
		
		public function cashCouldAfford(_cashNum:int):Boolean
		{
			if(_cashNum>userVo.userCash)
			{
				return false;
			}
			return true;
		}
		
		protected override function onGameInitComplete():void
		{
			userVo=GameVOManager.getInstance().user;
			userVo.changAttr_SN.add(onAttrChange);
			refreshTili=new RefreshCommunication("tili");
			refreshTili.init(C2SEmitter.REQ_TiliGetHandler,C2SEmitter.tiliRefresh,getTiliRefreshTime);
		}
		private function getTiliRefreshTime():Number{
			return userVo.tiliRefreshTime;
		}
		public override function destory():void
		{
			if(userVo) {userVo.changAttr_SN.remove(onAttrChange);}
			if(levelUp_SN) {levelUp_SN.removeAll();}
			if(refreshTili) {refreshTili.destory();refreshTili=null;}
			super.destory();
		}
		private var isUserLevelChange:Boolean=false;
		private function onAttrChange(attrName:String,newValue:*,oldValue:*,vo:*):void{
			if(attrName=="userLevel"){
				isUserLevelChange=true;
				levelUp_SN.dispatch(userVo.userLevel);
				try{
					(PlatformManager.getInstance().platformObj as Object).logLevelUp(GLBaseData.userId,GLBaseData.userName,
						GLBaseData.serverId,ServerListManager.getInstance().getServerDataById(int(GLBaseData.serverId)).zoneName,
						this.userVo.userLevel,this.userVo.userCash,this.userVo.vipLevel);
				}catch(e:Error){}
			}
		}
		
		public function addCash(value:int):void{
			userVo.userCash+=value;
			Context.getInsance().logger.fatal("[addCash]: {0}/{1}",[userVo.userCash,value]);
		}
		public function addExp(value:int):void{
//			userVo.userExp+=value;
			var newExp:int=userVo.userExp+value;
			while(true){
				var levelNode:Node_level=XMLDataManager.getLevelById(userVo.userLevel);
				if(levelNode && newExp>=levelNode.exp){
					userVo.userLevel++;
					newExp-=levelNode.exp;
				}else{
					break;
				}
			}
			userVo.userExp=newExp;
			Context.getInsance().logger.fatal("[addExp]: {0}/{1}",[userVo.userExp,value]);
		}
		public function addMoney(value:int):void{
			userVo.userMoney+=value;
			Context.getInsance().logger.fatal("[addMoney]: {0}/{1}",[userVo.userMoney,value]);
		}
		
		/** 
		 *   是否可以购买money
		 */
		public function couldBuyMoney():JudgeResult{
			var re:JudgeResult=new JudgeResult();
			
			if(getCouldBuyMoneyCount()==0){
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc="今日购买金币次数已经用完";
				return re;
			}
			if(userVo.userCash<buyMoneyCost()){
				re.code=JudgeResult.CD_CashNotEnough;
				return re;
			}
			
			re.success=true;
			return re;
		}
		
		/**
		 *   是否可以购买体力
		 */
		public function couldBuyTili():JudgeResult{
			var re:JudgeResult=new JudgeResult();
			re.success=false;
			if(userVo.currentTili >= userVo.tiliLimit){
				re.code=JudgeResult.CD_HasOverLimit;
				re.desc=Util.getLanguage("体力已满");
				return re;
			}
			
			if(getCouldBuyTiliCount()==0){
				re.code=JudgeResult.CD_HasOverLimit;
				re.desc=Util.getLanguage("体力购买次数上限");
				return re;
			}
			
			if(userVo.userCash<buyTiliCost()){
				re.code=JudgeResult.CD_CashNotEnough;
				return re;
			}
			re.success=true;
			return re;
		}
		
		public function get tiliBuyMax():int{
			return XMLDataManager.getConstById("tiliBuyMax").value;
		}
		
		public function buyTiliCost():int{
			return D.evalToInt(XMLDataManager.getExpressionById("tili_cost").expression,{tili_cishu:(userVo.tiliBuyNum+1)});
		}
		
		public function get buyTiliAddNum():int{
			return  XMLDataManager.getConstById("tiliBuyNum").value;
		}
		
		public function getCouldBuyTiliCount():int{
//			userVo.tiliBuyNum
			var vipModel:VipModel=Context.getInjectInstance(VipModel);
			var n:int=tiliBuyMax-userVo.tiliBuyNum+vipModel.addCount_buyTili;
			if(n<0) n=0;
			return n;
		}
		
		public function get moneyBuyMax():int{
			return XMLDataManager.getConstById("buy_money_limit").value;
		}
		
		public function getCouldBuyMoneyCount():int{
			var vipModel:VipModel=Context.getInjectInstance(VipModel);
			var n:int=moneyBuyMax-userVo.moneyBuyNum+vipModel.addCount_buyMoney;
			if(n<0) n=0;
			return n;
		}
		
		public function buyMoneyCost():int{
			return D.evalToInt(XMLDataManager.getExpressionById("buy_money").expression,{buy_cishu:userVo.moneyBuyNum+1});
		}
		
		public function ronglianzhiCouldAfford(_useNum:int):Boolean
		{
			if(userVo.userRonglian>=_useNum)
			{
				return true;
			}
			return false;
		}
		
		/**
		 *  能否显示升级窗口
		 */
		public function couldShowLevelUp():Boolean
		{
			if(isUserLevelChange)
			{
				return true;
			}
			return false;
		}
		public function resetUserLevelChange():void
		{
			isUserLevelChange=false;
		}
		public function get MaxFriendsNum():int
		{
			var result:int=0;
			var currentXml:Node_level=XMLDataManager.getLevelById(userVo.userLevel);
			if(null!=currentXml)
			{
				result=currentXml.friend;
			}		
			return result;
		}
		public function friendNumCouldAfford(_friendNum:int):Boolean
		{
			if(_friendNum>=MaxFriendsNum)
			{
				return false;
			}
			return true;
		}
		
		
		
		// ------------  vip 相关
		public function get vipLevel():int{
			return userVo.vipLevel;
		}
		public function get vipExp():int{
			return userVo.vipExp;
		}
		
		public function getCurVipNode():Node_vip{
			return XMLDataManager.getVipById(userVo.vipLevel);
		}
		
		/**
		 * 荣誉是否可以购买
		 */
		public function couldRongyuBuy(_num:int):Boolean
		{
			if(userVo.userRongyu>=_num)
			{
				return true;
			}
			return false;
		}
		/**
		 * 能否使用money买
		 */
		public function couldUseMoneyBuy(_useNum:int):Boolean
		{
			if(userVo.userMoney>=_useNum)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}
}