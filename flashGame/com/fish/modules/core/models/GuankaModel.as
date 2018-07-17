package com.fish.modules.core.models
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.DiginfoVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.ghostlmm.dig.GameConstConfig;
	import com.ghostlmm.dig.LineData;
	import com.ghostlmm.dig.TileData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.tool.ProbabilityTool;
	import com.ghostlmm.xmldata.Node_dig_item;
	import com.ghostlmm.xmldata.Node_dig_lv;
	import com.ghostlmm.xmldata.Node_dig_map;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TweenLite;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.net.SharedObject;
	import flash.utils.Dictionary;
	
	import org.osflash.signals.Signal;
	
	import r1.deval.D;
	
	import ui.dig.AutoDigInfoData;
	
	import util.Util;

	public class GuankaModel extends BaseModel
	{
//		private var local:SharedObject;
		public var digItemRewardCom_SN:Signal=new Signal();
//		private var curLocalKey:String;
//		private var offsetLayer:int;
//		private var commuciationState:Object;
		
		
		public var curDigLevel:int;
		private var curMoneyNum:int;
		public var curMoneyPrice:int;
		private var curExpNum:int;
		public var curExpPrice:int;
		
		public var baseMoneyPrice:int;
		public var baseExpPrice:int;
		
		public var recyleLines:int;
		
		public var startDigMessageCompleteSn:Signal=new Signal();
		public var endDigMessageCompleteSn:Signal=new Signal();
		
		public var vo:DiginfoVO;
		
		public var lastCycle:int;
		private var arriveLayerNum:int;
		public static const UnionCycle:int=5;
		public static const GETDataCycle:int=20;
		
		public var needShowGuide:Boolean=false;
		public var firstGetWakangData:Boolean=true;
		
		
		public var UselessLine:int=4;
		
		public var wakangJieshuang_SN:Signal=new Signal(AutoDigInfoData);
		
		public var wakuangShengji_SN:Signal=new Signal();
		
		public function GuankaModel()
		{
			super();
		}
		public override function destory():void{
			startDigMessageCompleteSn.removeAll();
			endDigMessageCompleteSn.removeAll();
			wakangJieshuang_SN.removeAll();
//			S2CHanlder.instance.message_SN.remove(onMsg);
			S2CHanlder.instance.messageMax_SN.remove(onMessageMax);
			digItemRewardCom_SN.removeAll();
			TweenLite.killDelayedCallsTo(startDigMessageCompleteSn.dispatch);
			wakuangShengji_SN.removeAll();
			super.destory();
		}
		
		protected override function onGameInitComplete():void
		{
			var map:Node_dig_map=XMLDataManager.getDig_mapById(1);
			baseMoneyPrice=map.money_price;
			baseExpPrice=map.exp_price;
			
			vo=GameVOManager.getInstance().diginfo;
			S2CHanlder.instance.messageMax_SN.add(onMessageMax);
		
			
			
			// 初始化后
			if(vo && vo.hasDiginit>0){
				if(Util.guideIsCompelete()){
					C2SEmitter.wakangJieshuang();
				}
				setCurDigLevel(vo.digLevel);
			}
			
			
			
		}
		public function calcMoveCycleNeedTime():Number{
//			return recyleLines*XMLDataManager.getConstById("zouyihang_time").value;
			return XMLDataManager.getConstById("zouyixunhuan_time").value;
		}
		
		public function calcHourGetMoney(moneyPrice:int=-1):int{
			if(moneyPrice==-1) moneyPrice=curMoneyPrice;
			
			var money:int = int(curMoneyNum*moneyPrice*(60*60/calcMoveCycleNeedTime()));
			return money;
		}
		public function calcHourGetExp(expPrice:int=-1):int{
			if(expPrice==-1) expPrice=curExpPrice;
			return int(curExpNum*expPrice*(60*60/calcMoveCycleNeedTime()));
		}
		public function caclHourGetBox():int{
			var node:Node_dig_map=XMLDataManager.Node_dig_mapArray[0];
			var boxNum:Number=0;
			for (var index:int=1; index<=4; index++){
				var array:Array=JSON.parse(node["star"+index]) as Array;
				if(array.length>=2){
					boxNum+=60*60/calcMoveCycleNeedTime()/(array[0]+array[1])*2;
				}
			}
			return int(boxNum);
		}
		
		
		public function readyDig():void{
			initDropItem();
			lastCycle=0;
			arriveLayerNum=0;
			firstGetWakangData=true;
			
			if(vo && vo.hasDiginit>0 && Util.guideIsCompelete()){
				needShowGuide=false;
				C2SEmitter.startDig(GETDataCycle*2);
			}else{
				needShowGuide=true;
				C2SEmitter.initDig();
			}
			
//			needShowGuide=true;
//			C2SEmitter.initDig();
			
			if(needShowGuide){
				UselessLine=0;
			}else{
				UselessLine=4;
			}
			
			probability=null;
			
		}
		
		
		
		public function endDig():void{
//			int(arriveLayer/recyleLines)-lastCycle;
			var cycle:int=Math.ceil((arriveLayerNum+1)/recyleLines)-lastCycle;
			C2SEmitter.endDig(cycle);
		}
		
		
		
		public function arriveLayer(layer:int):void{
			layer-=UselessLine;
			
//			trace("到达层数： "+layer);
			arriveLayerNum=layer;
			if((layer-1)%recyleLines==0 && int((layer-1)/recyleLines)-lastCycle>=UnionCycle){
//				trace("发送请求： "+new Date().toLocaleString());
				C2SEmitter.digOperate(int((layer-1)/recyleLines)-lastCycle,0);
				lastCycle=int((layer-1)/recyleLines);
				
				
			}
		}
		
		private function setCurDigLevel($level:int):void{
			curDigLevel=$level;
			var node:Node_dig_lv=XMLDataManager.getDig_lvById(curDigLevel);
			
			var map:Node_dig_map=XMLDataManager.getDig_mapById(1);
			curExpNum=map.exp_num;
			curMoneyNum=map.money_num;
			curExpPrice=map.exp_price+node.exp_add;
			curMoneyPrice=map.money_price+node.money_add;
			recyleLines=map.hang;
			
		}
		
		/**
		 *    把后台数据发出去
		 */
		public function flush():void{
			/*for(var key:String in local.data){
				var data:Object=local.data[key];
				if(data && data.hasOwnProperty("infoId") && !commuciationState[key]){
					commuciationState[key]=true;
					C2SEmitter.rewardDigItem(data.infoId,data.guanka,data.rewardGoods,data.rewardMoney,data.rewardCash,data.rewardExp,
						data.curCeng,data.curGrid);
					trace("向后台发送一段获取item的数据：\t"+JSON.stringify(data));
				}
			}*/
		}
		
		private function onMessageMax(type:String,c2sProto:DigC2SProto,code:int):void{
			if(type==C2SEmitter.REQ_DigRewardHandler){
				/*var key:String=c2sProto.digInfo.infoId.toString();
				delete local.data[key];
				delete commuciationState[key];
				checkLocalDig();*/
			}
			if(code>0){
				
				if(type==C2SEmitter.REQ_DigUpgradeHandler){
					setCurDigLevel(vo.digLevel);
					wakuangShengji_SN.dispatch();
				}
				
				if(type==C2SEmitter.REQ_DigInitHandler){
					setCurDigLevel(vo.digLevel);
					C2SEmitter.startDig(GETDataCycle*2);
				}
				
				if(type==C2SEmitter.REQ_DigOperateBeginHandler){
					proccessDropItem();
					startDigMessageCompleteSn.dispatch();
					
					
					
					if(!needShowGuide && firstGetWakangData){
						var digData:AutoDigInfoData=new AutoDigInfoData();
						digData.initFromVo(vo);
						firstGetWakangData=false;
						TweenLite.delayedCall(1,wakangJieshuang_SN.dispatch,[digData]);
						
					}
				}
				if(type==C2SEmitter.REQ_DigOperateEndHandler){
					endDigMessageCompleteSn.dispatch();
				}
				if(type==C2SEmitter.REQ_DigC2SChargeHandler){
					var digData:AutoDigInfoData=new AutoDigInfoData();
					digData.initFromVo(vo);
					wakangJieshuang_SN.dispatch(digData);
				}
			}
			
		}
		
		
		
		
		/** 检测是否本地缓存已经发送完毕 **/
		private function checkLocalDig():void{
			/*for (var key:String in local.data){
				var data:Object=local.data[key];
				if(data && data.hasOwnProperty("infoId")){
					return;
				}
			}
			digItemRewardCom_SN.dispatch();*/
		}
		
		/**
		 *   当吃到东西了，就要添加到缓存数据中
		 */
		public function addEatItem(tileData:TileData,layer:int,grid:int):void
		{
			var cycle:int=(layer-1)/recyleLines-1-lastCycle;
			if(cycle<0) cycle=0;
			
			C2SEmitter.digOperate(cycle,tileData.xid);
			if(cycle>0){
				lastCycle+=cycle;
			}
		}
		
		private static const ExtrBossWall:int=2;
		
		
		
		private var _gailvTotal:int;
		private var probability:ProbabilityTool;
		
		public function goFight():void{
			_continueMapFlag=true;
		}
		
		private var _continueMapFlag:Boolean=false;
		public function get continueMapFlag():Boolean{
			return _continueMapFlag;
		}
		
		public function get fightResult():Boolean{
			return false;
		}
		
		
		/**
		 *   当前关卡 起始层
		 */
		public var curStartLayer:int=0;
		
		public var layerDataReady_SN:Signal=new Signal(int);
		
	
		
		/**
		 *   当关卡数据到达
		 */
		private function onMapDataArrive():void{
//			setGuanka((Context.getInjectInstance(UserModel) as UserModel).userVo.curGuanka);
			
			var data:Array=[];
//			data.push({type:"cash",xid:0,"num":curGuankaData.node.cash_num,did:0});
//			data.push({type:"money",xid:0,"num":curGuankaData.node.money_num,did:0});
//			data.push({type:"exp",xid:0,"num":curGuankaData.node.exp_num,did:0});
//			data.push({type:"zhuantou",xid:0,"num":curGuankaData.node.zhuantou_num,did:0});
//			data.push({type:"zhadan",xid:0,"num":curGuankaData.node.zhadan_num,did:0});
			
			var items:Object={};
			try{
				items=JSON.parse(GameVOManager.getInstance().diginfo.dropItems);
			}catch(e:Error){
				trace("解析json失败:\t"+GameVOManager.getInstance().diginfo.dropItems);
			}
			
			for (var xid:String in items){
				var dropItemNode:Node_dig_item=XMLDataManager.getDig_itemById(int(xid));
				if(dropItemNode){
					data.push({type:dropItemNode.type,xid:dropItemNode.type_id,"num":items[xid],did:int(xid)});
				}else{
					trace("error: 丢失drop——item\t"+xid);
				}
			}
//			setProbability(data);
			
//			layerDataReady_SN.dispatch(curGuanka);
		}
		
		
		private function createProbality():void{
			createCycle++;
			var data:Array=[];
			data.push({type:ResourceConst.R_money,xid:0,"num":curMoneyNum});
			data.push({type:ResourceConst.R_exp,xid:0,"num":curExpNum});
			var dropEquips:Array=getCycleDropItem(createCycle);
			for each(var xid:int in dropEquips){
				data.push({type:ResourceConst.R_equip,xid:xid,"num":1});
			}
			var isFirst:Boolean=(probability==null && needShowGuide);
			probability=new ProbabilityTool();
			probability.init(data,GameConstConfig.TileNums*recyleLines);
			if(isFirst){
				var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
				probability.setEquip(guideModel.getGuideEquipId(),GameConstConfig.TileNums/2+1);
			}
			
			
			checkNeedGetNewCycle();
			
		}
		
		
		
		
		
		
		
		
		
		
		public  function  createLineTileData(line:int):LineData{
			GameConstConfig.log("创建行数据：\t"+line);
			trace("创建行数据：\t"+line);
			var lineData:LineData=new LineData();
			var re:Array=[];
			
//			var wallBack:String=_curGuankaData.node.image;
			var wallBack:String="map_1";
			var wallLife:int=10;
			
//			trace(GameConstConfig.TileNums,GameConstConfig.ExtrTileNum,GameConstConfig.ExtrWallNum);
			for (var index:int=0; index<GameConstConfig.TileNums+2*GameConstConfig.ExtrTileNum+2*GameConstConfig.ExtrWallNum; index++){
				var data:TileData=new TileData();
				data.line=line;
				if(line<UselessLine){
					data.back=wallBack;
					data.life=int.MAX_VALUE;
					data.id=TileData.TY_Boundary;
				}else{
					if(index<GameConstConfig.ExtrWallNum || index>=GameConstConfig.ExtrWallNum+2*GameConstConfig.ExtrTileNum+GameConstConfig.TileNums){
						data.back=wallBack;
						data.life=int.MAX_VALUE;
						data.id=TileData.TY_Boundary;
					}else if( (index>=GameConstConfig.ExtrWallNum && index<GameConstConfig.ExtrWallNum+GameConstConfig.ExtrTileNum) ||
						(index>=GameConstConfig.ExtrWallNum+GameConstConfig.ExtrTileNum+GameConstConfig.TileNums && index<GameConstConfig.ExtrWallNum+GameConstConfig.ExtrTileNum*2+GameConstConfig.TileNums)
					)
					{
						data.back=wallBack;
						data.life=wallLife;
						data.id=TileData.TY_BWall;
					}else{
						
						
						data.life=wallLife;
						data.back=wallBack;
						if(probability==null || !probability.isActive()){
							createProbality();
						}
						var obj:Object=probability.createRandom();
						data.type=obj.type;
						data.dropItemId=obj.did;
						if(data.type==ResourceConst.T_Wall){
							data.id=TileData.TY_Wall;
						}
						data.xid=obj.xid;
						
					}
				}
				
				
				
				data.init();
				re.push(data);
			}
			
			lineData.setDatas(re);
			return lineData;
		}
		
		
		public function reset():void{
			
			_continueMapFlag=false;
			curStartLayer=0;
			onMapDataArrive();
		}
		
		
		public var dropItemMap:Dictionary;
		private var maxCycle:int;
		private var getMessageLock:Boolean=false;
		private var createCycle:int;
		
		private function initDropItem():void{
			maxCycle=0;
			createCycle=0;
			dropItemMap=new Dictionary();
		}
		
		private function proccessDropItem():void{
			
			var obj:Object=JSON.parse(vo.dropItems);
			var tempMax:int=0;
			for (var key:String in obj){
				if(tempMax<int(key)+maxCycle){
					tempMax=int(key)+maxCycle;
				}
				dropItemMap[int(key)+maxCycle]=obj[key];
			}
			maxCycle=tempMax;
			getMessageLock=false;
			trace("处理得到的数据： "+maxCycle);
		}
		
		private function checkNeedGetNewCycle():void{
			if(getMessageLock) return ;
			if(maxCycle-createCycle<=GETDataCycle){
				getMessageLock=true;
				C2SEmitter.startDig(GETDataCycle);
				trace("获取新的地图数据："+createCycle+"\t"+maxCycle);
			}
		}
		
		public function getCycleDropItem(cycle:int):Array{
			var re:Array=dropItemMap[cycle];
			delete dropItemMap[cycle];
			return re;
		}
		
		
		public function get MaxDigJiashu():int{
			return XMLDataManager.getConstById("digFastCount").value;
		}
		
		public function get DigJiashuTime():int{
			return XMLDataManager.getConstById("digFastTime").value;
		}
		
		public function getCouldJiashuCount():int{
			var vipModel:VipModel=Context.getInjectInstance(VipModel);
			var re:int=MaxDigJiashu-vo.jiashuCount+vipModel.addCount_wakuangJiashu;
			if(re<0) re=0;
			return re;
		}
		
		public function getDigJiashuCost():int{
			return D.evalToInt(XMLDataManager.getExpressionById("jiasu_cash").expression,{jiasu_cishu:vo.jiashuCount+1});
		}
		
		public function couldDigJiashu():JudgeResult{
			var re:JudgeResult=new JudgeResult();
			
			if(getCouldJiashuCount()<=0){
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc="可用挖矿加速次数已经用完提示";
				return re;
			}
			
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.userVo.userCash<getDigJiashuCost()){
				re.code=JudgeResult.CD_CashNotEnough;
				return re;
			}
			re.success=true;
			return re;
		}
		
		
		
		//  挖矿升级数据 
		
		/** 是否有下一等级  **/
		public function hasNextLevel():Boolean{
			return XMLDataManager.getDig_lvById(curDigLevel+1)!=null;
		}
		
		/** 是否可以升级挖矿  **/
		public function couldShengjiWakuang():JudgeResult{
			var re:JudgeResult=new JudgeResult();
			
			if(!hasNextLevel()){
				re.code=JudgeResult.CD_HasOverLimit;
				re.desc="挖矿等级已经达到上限，无法升级";
				return re;
			}
			
			var mapModel:MapModel=Context.getInjectInstance(MapModel);
			var node:Node_dig_lv=XMLDataManager.getDig_lvById(curDigLevel);
			if(!mapModel.hasPassFuben(node.need_fuben)){
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc=Util.getLanguage("挖矿升级副本提示",XMLDataManager.getFubenById(node.need_fuben).name);
				return re;
			}
			
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.userVo.userMoney<node.need_money){
				re.code=JudgeResult.CD_UserMoneyNotEnough;
				re.desc="铜币不足";
				return re;
			}
			
			var needItemArray:Array=JSON.parse(node.need_item) as Array;
			var needItemNumArray:Array=JSON.parse(node.need_item_num) as Array;
			if(needItemArray.length>0 && needItemArray[0]>0){
				var itemModel:ItemModel=Context.getInjectInstance(ItemModel);
				if(itemModel.getItemNumById(needItemArray[0]) < needItemNumArray[0]){
					re.code=JudgeResult.CD_CailiaoNotEnough;
					re.desc="挖矿升级item不足";
					return re;
				}
			}
			
			re.success=true;
			return re;
		}
		
	}
}
