package com.fish.modules.core.models
{
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.HuodongdetailVO;
	import com.fish.modules.core.gameVO.HuodongswitchVO;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_huodong;
	import com.ghostlmm.xmldata.Node_huodong_caishenxiafan;
	import com.ghostlmm.xmldata.Node_huodong_chongzhi;
	import com.ghostlmm.xmldata.Node_huodong_lv;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.utils.Dictionary;
	
	import util.Util;
	
	import view.CommonControlFun;
	import view.viewData.HuodongData;
	
	public class HuodongControlModel extends BaseModel
	{
		public var huodongDetail:HuodongdetailVO;
		public var cacheLvLingquId:int;
		public var cacheChongzhiLinquId:int;
		
		/**
		 *    可用的活动 id 
		 */
		public static const AcitiveHuodong:Array=[1,2,3,4,5,6,7,8];
		
		public function HuodongControlModel()
		{
			super();
		}
		
		protected override function onGameInitComplete():void
		{
			huodongDetail=GameVOManager.getInstance().huodongdetail;
//			huodongDetail.changAttr_SN.add(onHuodongAttrChange);
			GameVOManager.getInstance().arrayVoOP_SN.add(onArrayChange);
		}
		private var needFreshHuodongSwitch:Boolean=false;
		private function onArrayChange(cls:Class,array:Array):void
		{
			if(cls==HuodongswitchVO)
			{
				needFreshHuodongSwitch=true;
			}
		}
		public function get huodongArray():Array
		{
			if((null==_huodongArray)||(needFreshHuodongSwitch))
			{
				updateHuodongArray();
			}
			return _huodongArray;
		}
		public static const Tili_ID:int=1;
		public static const Canbai_ID:int=2;
		public static const Growth_ID:int=13;
		
		private var _huodongArray:Array;
		private var _huodongDic:Dictionary;
		private function updateHuodongArray():void
		{
			if(null==_huodongArray)
			{
				_huodongArray=[];
			}
			_huodongArray.length=0;
			_huodongDic=new Dictionary();
			var huodongSwitchArray:Array=GameVOManager.getInstance().huodongswitchs;
			var index:int;
			for(index=0;index<huodongSwitchArray.length;index++)
			{
				var huodongSwitch:HuodongswitchVO=huodongSwitchArray[index] as HuodongswitchVO;
				if(huodongSwitch.huodongFlag>0)
				{
					if(XMLDataManager.getHuodongById(huodongSwitch.id)==null){
						continue;
					}
					if(AcitiveHuodong.indexOf(huodongSwitch.id)==-1){
						continue;
					}
					
					
					var huodongData:HuodongData=new HuodongData();
					huodongData.initFromVo(huodongSwitch);
//					huodongData.huodongSwitchVo=huodongSwitch;
//					
//					
//					huodongData.xml=XMLDataManager.Node_huodongDic[huodongSwitch.id];
					if(!checkHuodongComplete(huodongData))
					{
						_huodongArray.push(huodongData);
						_huodongDic[huodongData.xml.type]=huodongData;
					}
				}
			}
			/*var tiliData:HuodongData=new HuodongData();
			tiliData.xml=XMLDataManager.Node_huodongDic[Tili_ID];
			_huodongArray.push(tiliData);
			_huodongDic[tiliData.xml.type]=tiliData;
			
			var canbaiData:HuodongData=new HuodongData();
			canbaiData.xml=XMLDataManager.Node_huodongDic[Canbai_ID];
			_huodongArray.push(canbaiData);
			_huodongDic[canbaiData.xml.type]=canbaiData;
			
			var growthData:HuodongData=new HuodongData();
			growthData.xml=XMLDataManager.Node_huodongDic[Growth_ID];
			_huodongArray.push(growthData);
			_huodongDic[growthData.xml.type]=growthData;*/
			
			//  warning  伪造转盘数据
			//			var zhuanpanData:HuodongData=new HuodongData();
			//			zhuanpanData.xml=XMLDataManager.Node_huodongDic[7];
			//			_huodongArray.push(zhuanpanData);
			//			_huodongDic[zhuanpanData.xml.type]=zhuanpanData;
			//			var switcVo:HuodongswitchVO=new HuodongswitchVO();
			//			switcVo.huodongFlag=1;
			//			switcVo.startTime=0;
			//			switcVo.endTime=4000000000;
			//			zhuanpanData.huodongSwitchVo=switcVo;
			
			// warning 伪造抽卡活动
			//			var choukaData:HuodongData=new HuodongData();
			//			choukaData.xml=XMLDataManager.Node_huodongDic[8];
			//			_huodongArray.push(choukaData);
			//			_huodongDic[choukaData.xml.type]=choukaData;
			//			var switcVo:HuodongswitchVO=new HuodongswitchVO();
			//			switcVo.huodongFlag=1;
			//			switcVo.startTime=152052552;
			//			switcVo.endTime=4000000000;
			//			choukaData.huodongSwitchVo=switcVo;
			
			
			_huodongArray.sortOn("priority",Array.NUMERIC);
			
			for each(var data:HuodongData in _huodongArray){
				trace(data.toString());
			}
			
			needFreshHuodongSwitch=false;
		}
		
		/** 是否可以领取冲级奖励  **/
		public function couldLinquChongjiLVJiangli(data:Node_huodong_lv):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			if(checkIfLevelRewardAreadyLingqu(data.id))
			{
				re.code=JudgeResult.CD_AreadyLingqu;
				re.desc="活动奖励已经领取过了";
				return re;
			}
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
//			var huodongData:HuodongData=huodongControlModel.getHuodongData(HuodongControlModel.HuodongType_Chongji);
			var huodongSwitchVo:HuodongswitchVO=getSwitchVoByType(HuodongControlModel.HuodongType_Chongji);
			var timeResult:JudgeResult=HuodongControlModel.checkHuodongTime(timerModel.serverTime,huodongSwitchVo.startTime,huodongSwitchVo.endTime);
			if(!timeResult.success)
			{
				return timeResult;
			}
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.userVo.userLevel<data.lv)
			{
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc=Util.getLanguage("等级没有达到要求，不能领取冲级奖励",data.lv);
				return re;
			}
			re.success=true;
			return re;
		}
		
		/** 是否可以领取充值奖励 **/
		public function couldLinquChongzhiJiangli(data:Node_huodong_chongzhi):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			if(checkIfChongzhiRewardAreadyLingqu(data.id))
			{
				re.code=JudgeResult.CD_AreadyLingqu;
				re.desc="活动奖励已经领取过了";
				return re;
			}
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
//			var huodongData:HuodongData=getHuodongData(HuodongControlModel.HuodongType_Chongzhi);
			var huodongSwitchVo:HuodongswitchVO=getSwitchVoByType(HuodongControlModel.HuodongType_Chongzhi);
			var timeResult:JudgeResult=HuodongControlModel.checkHuodongTime(timerModel.serverTime,huodongSwitchVo.startTime,huodongSwitchVo.endTime);
			if(!timeResult.success)
			{
				return timeResult;
			}
			if(huodongDetail.chongzhiCur<data.chongzhi_cash)
			{
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc=Util.getLanguage("充值没有达到要求，不能领取充值奖励",data.chongzhi_cash);
				return re;
			}
			re.success=true;
			return re;
		}
		
		public function couldStartZhuanpan():JudgeResult{
			var re:JudgeResult=new JudgeResult();
			if((Context.getInjectInstance(UserModel) as UserModel).userVo.userCash<huodongDetail.zhuanpanCost){
				re.success=false;
				re.code=JudgeResult.CD_CashNotEnough;
				return re;
			}
			re.success=true;
			return re;
		}
		
		
		/** 是否可以进行拉霸   **/
		public function couldLaba():JudgeResult{
			var re:JudgeResult=new JudgeResult();
			if(huodongDetail.labaTimes>=HuodongControlModel.getLabaMaxTimes())
			{
				re.code=JudgeResult.CD_HasOverLimit;
				re.desc=("已经达到最大次数，不能下注");
				return re;
			}
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
//			var huodongData:HuodongData=huodongControlModel.getHuodongData(HuodongControlModel.HuodongType_Laba);
			var huodongSwitchVo:HuodongswitchVO=getSwitchVoByType(HuodongControlModel.HuodongType_Laba);
			var timeResult:JudgeResult=HuodongControlModel.checkHuodongTime(timerModel.serverTime,huodongSwitchVo.startTime,huodongSwitchVo.endTime);
			if(!timeResult.success)
			{
				return timeResult;
			}
			var xml:Node_huodong_caishenxiafan=XMLDataManager.getHuodong_caishenxiafanById(huodongDetail.labaTimes+1);
			var cost:int;
			if(null==xml)
			{
				cost=0;
			}
			else
			{
				cost=xml.cost_cash;
			}
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.userVo.userCash<cost){
				re.code=JudgeResult.CD_CashNotEnough;
				return re;
			}
			re.success=true;
			return re;
		}
		
		
		
		private function checkHuodongComplete(_data:HuodongData):Boolean
		{
			if(_data.xml.type==HuodongType_Laba)
			{
				if(huodongDetail.labaTimes>=getLabaMaxTimes())
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			else
			{
				return false;
			}
		}
		public function checkIfLevelRewardAreadyLingqu(_id:int):Boolean
		{
			if(!huodongDetail.hasInit())
			{
				return false;
			}
			var lingquArray:Array=JSON.parse(huodongDetail.levelRewardList) as Array;
			if(-1==lingquArray.indexOf(_id))
			{
				return false;
			}
			return true;
		}
		public function checkIfChongzhiRewardAreadyLingqu(_id:int):Boolean
		{
			if(!huodongDetail.hasInit())
			{
				return false;
			}
			var lingquArray:Array=JSON.parse(huodongDetail.chongzhiRewardList) as Array;
			if(-1==lingquArray.indexOf(_id))
			{
				return false;
			}
			return true;
		}
		
		
		
		
		// ----------------------------- 抽卡部分 ---------------------------------
		
//		private var _choukaArray:Array;
//		private var _choukaDic:Dictionary;
//		private var _needRefresh:Boolean=true;
//		/**
//		 *    获得活动抽卡
//		 */
//		public function getHuodongChoukaDataArray():Array{
//			initChoukaData();
//			return _choukaArray;
//		}
//		
//		private function onHuodongAttrChange(attrName:String,newValue:*,oldValue:*,vo:BaseVo):void{
//			if(attrName=="choukaData"){
//				_needRefresh=true;
//			}
//		}
//		
//		private function initChoukaData():void{
//			if(_needRefresh){
//				_needRefresh=false;
//				_choukaArray=[];
//				_choukaDic=new Dictionary();
//				
//				var dataArray:Array=JSON.parse(huodongDetail.choukaData) as Array;
//				var index:int=0;
//				for each(var data:Object in dataArray){
//					index++;
//					var choukaData:HuodongChoukaData=new HuodongChoukaData();
//					choukaData.cid=Number(data.cid);
//					choukaData.cardXid=int(data.xid);
//					choukaData.pos=index;
//					choukaData.cardNode=XMLDataManager.getKapaiById(choukaData.cardXid);
//					_choukaArray.push(choukaData);
//					_choukaDic[choukaData.pos]=choukaData;
//				}
//				
//				//				_choukaArray.sortOn("pos",Array.NUMERIC);
//				
//				/*for(var index:int=1; index<=6; index++){
//				var node:Node_huodong_chouka=XMLDataManager.getHuodong_choukaById(index);
//				var data:HuodongChoukaData=new HuodongChoukaData();
//				data.cardXid=node.base_card;
//				data.cardNode=XMLDataManager.getKapaiById(data.cardXid);
//				data.pos=index;
//				//					data.hasReward=(int(Math.random()*1000)%3==0);
//				data.cid=index-2;
//				_choukaArray.push(data);
//				_choukaDic[index]=data;
//				}*/
//			}
//		}
//		
//		public function getChoukaDataByIndex(index:int):HuodongChoukaData{
//			initChoukaData();
//			return _choukaDic[index];
//		}
//		
//		
//		
//		/**
//		 *   是不是可以抽卡
//		 */
//		public function couldChouka():Boolean{
//			return true;
//		}
//		
//		public function couldChoukaByIndex(index:int):JudgeResult{
//			var re:JudgeResult=new JudgeResult();
//			var userModel:UserModel=Context.getInjectInstance(UserModel);
//			if(userModel.userVo.userCash<getChoukaCost()){
//				re.success=false;
//				re.code=JudgeResult.CD_CashNotEnough;
//				return re;
//			}
//			re.success=true;
//			return re;
//		}
//		
//		public function couldShilianChouka():JudgeResult{
//			var re:JudgeResult=new JudgeResult();
//			var cost:int=getShilianCost();
//			var userModel:UserModel=Context.getInjectInstance(UserModel);
//			if(cost>userModel.userVo.userCash){
//				re.success=false;
//				re.code=JudgeResult.CD_CashNotEnough;
//				return re;
//			}
//			re.success=true;
//			return re;
//		}
//		
//		/**
//		 *   抽卡元宝消耗
//		 */
//		public function getChoukaCost():int{
//			//			return 0;
//			return huodongDetail.choukaCost;
//		}
//		
//		/**
//		 *   十连抽卡 消耗元宝
//		 */
//		public function getShilianCost():int{
//			//			return 100;
//			return huodongDetail.choukaAllCost;
//		}
		
		// ----------------------------- 抽卡部分 ---------------------------------
		
		//----------------------- 刮刮乐-----------------------------
		
		/**
		 *   今日剩余刮卡次数
		 */
		public function guagualeCount():int{
			return Math.max(0,int(XMLDataManager.getConstById("guagualeCount").value)-huodongDetail.guagualeCount);
		}
		/**
		 *   刮卡消耗元宝
		 */
		public function guagualeCost():int{
			return int(XMLDataManager.getConstById("guagualeCostCash").value);
		}
		
		
		/**
		 *   获取奖池 node 数据
		 */
		public function getGuagualeJiangciNodes():Array
		{
			var re:Array=[];
			var json:Array=JSON.parse(huodongDetail.guagualeJiangci) as Array;
			for each(var id:int in json){
				re.push(XMLDataManager.getHuodong_guagualeById(id));
			}
			return re;
		}
		/**
		 *   获得 刮卡奖励数据 
		 */
		public function getGuagualeRewardNodes():Array
		{
			var re:Array=[];
			var json:Array=JSON.parse(huodongDetail.guagualeReward) as Array;
			for each(var id:int in json){
				re.push(XMLDataManager.getHuodong_guagualeById(id));
			}
			return re;
		}
		
		/**
		 *   是否可以进行刮刮乐
		 */
		public function couldGuaguale():JudgeResult{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			var re:JudgeResult=new JudgeResult();
			if(guagualeCount()<=0){
				re.success=false;
				re.code=JudgeResult.CD_OutOfRange;
				re.desc="今日刮卡次数已经用完，请明日再来";
				return re;
			}
			if(userModel.userVo.userCash<guagualeCost()){
				re.success=false;
				re.code=JudgeResult.CD_CashNotEnough;
				return re;
			}
			re.success=true;
			return re;
		}
		
		
		//----------------------- 刮刮乐-----------------------------
		
		
		public static const HuodongType_Tili:String="tili";
		public static const HuodongType_Canbai:String="canbai";
		public static const HuodongType_Chongji:String="chongji";
		public static const HuodongType_Chongzhi:String="chongzhi";
		public static const HuodongType_Laba:String="laba";
		public static const HuodongType_Zhuanpan:String="zhuanpan";
		public static const HuodongType_Chouka:String="fanpai";
		public static const HuodongType_Guaguale:String="guaguale";
		public static const HuodongType_Shouji:String="shouji";
		public static const HuodongType_Growth:String="growth";
		
		
		private var _typeToHuodongId:Dictionary;
		public function getHuodongIdByType(type:String):int{
			if(_typeToHuodongId==null){
				_typeToHuodongId=new Dictionary();
				for each(var node:Node_huodong in XMLDataManager.Node_huodongArray){
					_typeToHuodongId[node.type]=node.id;
				}
			}
			return _typeToHuodongId[type];
		}
		
		public function getSwitchVoByType(type:String):HuodongswitchVO{
			return GameVOManager.getInstance().getHuodongswitchVOByid(getHuodongIdByType(type));
		}
		
		public function getHuodongData(_type:String):HuodongData
		{
			if((null==_huodongArray)||(needFreshHuodongSwitch))
			{
				updateHuodongArray();
			}
			return _huodongDic[_type] as HuodongData
		}
		public static function checkHuodongTime(_curTime:Number,_beginTime:Number,_endTime:Number):JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			if(_curTime<_beginTime)
			{
				re.success=false;
				re.desc="活动还没有开始";
				return re;
			}
			if(_curTime>_endTime)
			{
				re.success=false;
				re.desc="活动已经结束了";
				return re;
			}
			re.success=true;
			return re;
		}
		public static function getLabaMaxTimes():int
		{
			var result:int;
			result=XMLDataManager.Node_huodong_caishenxiafanArray.length;
			return result;
		}
	}
}

