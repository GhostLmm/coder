package com.fish.modules.core.models
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.CopyVO;
	import com.fish.modules.core.gameVO.EquipVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_choujiang;
	import com.ghostlmm.xmldata.Node_equip;
	import com.ghostlmm.xmldata.Node_fuben;
	import com.ghostlmm.xmldata.Node_xinshouyindao;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.geom.Point;
	
	import org.osflash.signals.Signal;
	
	import util.SwitchManager;

	public class GuideModel extends BaseModel
	{
		
		public static const MAXStep:int=10000000;
		
		/** 点击按钮  **/
		public static const TP_ClickBtn:String="click";
		/** 主角走动  **/
		public static const TP_GoPos:String="goPos";
		
		public static const TP_KillAll:String="allKill";
		
		public static const TP_EnterPortal:String="enterPortal";
		
		public static const TP_Interrup:String="interrup";
		
		public static const TP_WaitWindow:String="waitWindow";
		
		public static const TP_ShowStory:String="showStory";
		
		public static const TP_WaitStory:String="waitStory";
		
		public static const TP_WaitTime:String="waitTime";
		
		public static const TP_Hurt:String="hurt";
		
		public static const TP_WaitSuccess:String="waitSuccess";
		
		public static const TP_WaitMessage:String="waitMessage";
		
		public static const TP_TaskLogic:String="taskLogic";
		
		public static const TP_WaitMap:String="waitMap";
		
		public static const TP_EquipJudge:String="equipJudge";
		
		public static const TP_WaitGetEquip:String="waitGetEquip";
		
		public static const TP_InterrupForNext:String="interrupForNext";
		
		public static const TP_IsInmining:String="isInmining";
		
		public static const TP_WaitMovie:String="waitMovie";
		
		public var curGuideNode:Node_xinshouyindao;
		
		public var curGuideStep:int;
		
		private var firstStep:int;
		
		public var showFireBtnStep:int;
		public var showJumpBtnStep:int;
		public var joySticStep:int;
		
		public var changeStep_SN:Signal=new Signal(int);
		
		public function GuideModel()
		{
			super();
		}
		
		protected override function onGameInitComplete():void
		{
			for each(var node:Node_xinshouyindao in XMLDataManager.Node_xinshouyindaoArray){
				if(node.target=="joyStick"){
					joySticStep=node.id;
				}
				if(node.target=="fireBtn"){
					showFireBtnStep=node.id;
				}
				if(node.target=="jumpBtn"){
					showJumpBtnStep=node.id;
					break;
				}
			}
			
			firstStep=XMLDataManager.Node_xinshouyindaoArray[0].id;
			curGuideStep=GameVOManager.getInstance().user.guideStep;
//			curGuideStep=1000000;
			if(SwitchConfig.ST_IngoreGuide){
				curGuideStep=1000000;
			}
//			if(AppstoreVerify.inVerify){
//				curGuideStep=1000000;
//			}
			if(!SwitchManager.getInstance().Switch_Xinshouyindao){
				curGuideStep=1000000;
			}
			if(curGuideStep>=MAXStep){
				return ;
			}
			if(curGuideStep<firstStep){
				curGuideStep=firstStep;
//				curGuideStep=12000;
				curGuideNode=XMLDataManager.getXinshouyindaoById(curGuideStep);
			}else{
				curGuideNode=XMLDataManager.getXinshouyindaoById(curGuideStep);
				if(curGuideNode==null){
					curGuideStep=MAXStep;
					C2SEmitter.setGuideStep(curGuideStep);
					changeStep_SN.dispatch(curGuideStep);
				}else{
//					resetInterrup();
					JudgeGuideStep();
					curGuideNode=XMLDataManager.getXinshouyindaoById(curGuideStep);
					C2SEmitter.setGuideStep(curGuideStep);
					changeStep_SN.dispatch(curGuideStep);
				}
			}
			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		
		public function stopGuide():void{
			curGuideStep=MAXStep;
			C2SEmitter.setGuideStep(curGuideStep);
			changeStep_SN.dispatch(curGuideStep);
		}
		
		/** 是否过来第几关  **/
		public function hasPassFubenIndex(fuben:int):Boolean{
			var fubenId:int=(XMLDataManager.Node_fubenArray[fuben] as Node_fuben).id;
			var vo:CopyVO=GameVOManager.getInstance().getCopyVOByxid(fubenId);
			if(vo && vo.status>0) return true;
			return false;
		}
		
		private function getFirstJinxuanXid():int{
			var choujiangId:int = XMLDataManager.getConstById("first_jingxuan").value;
			var node_choujiang:Node_choujiang=XMLDataManager.getChoujiangById(choujiangId);
			return node_choujiang.item_id;
		}
		
		private function JudgeGuideStep():void{
			if(!hasPassFubenIndex(0)){
				// 第一关没有过
				curGuideStep=XMLDataManager.getConstById("guide_guanka1").value;
				return ;
			}
			var gunEquips:Array=[];
			var zhuangbeiEquips:Array=[];
			var choujiangGunVo:EquipVO;
			var equipVo:EquipVO;
			var equipNode:Node_equip;
			for each(equipVo in GameVOManager.getInstance().equips){
				if(equipVo.modifyType>=0){
					equipNode=XMLDataManager.getEquipById(equipVo.xid);
					if(equipNode){
						if( equipNode.type>6){
							gunEquips.push(equipVo);
						}else{
							zhuangbeiEquips.push(equipVo);
						}
					}
					
				}
				
			}
			if(gunEquips.length==1){
				// 只有一把枪
				curGuideStep=XMLDataManager.getConstById("guide_getWeapon").value;
				return ;
			}
			
			for each(equipVo in gunEquips){
				if(choujiangGunVo==null){
					choujiangGunVo=equipVo;
				}
				if(choujiangGunVo.createTime<equipVo.createTime){
					choujiangGunVo=equipVo;
				}
			}
			
			if(GameVOManager.getInstance().hero.gunId!=choujiangGunVo.xid){
				// 枪支没有装备上 
				curGuideStep=XMLDataManager.getConstById("guide_zhuanbeiWeapon").value;
				return ;
			}
			
			if(!hasPassFubenIndex(1)){
				//如果没有通过第二关的副本
				curGuideStep=XMLDataManager.getConstById("guide_guanka2").value;
				return ;
			}
			
			
			if(zhuangbeiEquips.length==0){
				curGuideStep=XMLDataManager.getConstById("guide_wakuang").value;
				return ;
			}
			
			if(getFirstZhuangbeiVO().heroId<=0){
				curGuideStep=XMLDataManager.getConstById("guide_zhuangbei").value;
				return ;
			}
			
			if(!hasPassFubenIndex(2) ){
				curGuideStep=XMLDataManager.getConstById("guide_guanka3").value;
				return ;
			}
			
			var gridQiang:Object={};
			try{
				gridQiang=JSON.parse(GameVOManager.getInstance().equipgrid.gridQiang);
			}catch(e:Error){};
			var gridType:int=XMLDataManager.getEquipById(first.xid).type;
			if(!gridQiang.hasOwnProperty(gridType) || gridQiang[gridType]<1){
				curGuideStep=XMLDataManager.getConstById("guide_bianqiang").value;
				return ;
			}
			
			if(!hasPassFubenIndex(3) ){
				curGuideStep=XMLDataManager.getConstById("guide_guanka4").value;
				return ;
			}
			curGuideStep=MAXStep;
			
		}
		
		private var first:EquipVO;
		public function getFirstZhuangbeiVO():EquipVO{
			if(first!=null) return first;
			for each(var vo:EquipVO in GameVOManager.getInstance().equips){
				if(vo.modifyType>=0){
					if(XMLDataManager.getEquipById(vo.xid).type<=6){
						if(first==null){
							first=vo;
						}
						if(vo.createTime<first.createTime){
							first=vo;
						}
					}
				}
			}
			return first;
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(msType==C2SEmitter.REQ_FubenBattlePreHandler){
				//				mapModel.currentChallengeFubenId=fubenBox.node.id;
				if(code>0){
					if(curGuideStep==XMLDataManager.Node_xinshouyindaoArray[0].id){
						
						GLBaseData.lastHeroPosition=new Point();
						GLBaseData.lastHeroPosition.x=4650.00;
						GLBaseData.lastHeroPosition.y=550.00;
						var battleModel:BattleModel=Context.getInjectInstance(BattleModel); 
						battleModel.startBattle(c2s.fuben.xid);
					}
				}
			}
		}
		
		public function get isComplete():Boolean{
//			return false;
			return curGuideStep>=MAXStep || curGuideNode==null;
		}
		
		/** 是否是第一次进入游戏的新手引导  **/
		public function get isFirstGuide():Boolean{
//			return true;
			return curGuideStep==firstStep;
		}
		
		
		/**  **/
		public function goFirstGuide():void{
			
			var node:Node_fuben=XMLDataManager.Node_fubenArray[0];
			var mapModel:MapModel=Context.getInjectInstance(MapModel);
			mapModel.currentChallengeFubenId=node.id;
			MapModel.tiaoZhanFuben(node.id);
			
			curGuideNode=XMLDataManager.Node_xinshouyindaoArray[0];
			curGuideStep=curGuideNode.id;
			
			C2SEmitter.setGuideStep(curGuideStep);
			changeStep_SN.dispatch(curGuideStep);
		}
		
		public function goNext():void{
			if(curGuideNode){
				curGuideNode=XMLDataManager.getXinshouyindaoById(curGuideNode.next);
				if(curGuideNode){
					curGuideStep=curGuideNode.id;
					C2SEmitter.setGuideStep(curGuideStep);
					changeStep_SN.dispatch(curGuideStep);
				}else{
					curGuideStep=MAXStep;
					C2SEmitter.setGuideStep(curGuideStep);
					changeStep_SN.dispatch(curGuideStep);
				}
				
			}
		}
		
		public function goSpecialStep(guidId:int):void{
			curGuideNode=XMLDataManager.getXinshouyindaoById(guidId);
			if(curGuideNode){
				curGuideStep=curGuideNode.id;
				C2SEmitter.setGuideStep(curGuideStep);
				changeStep_SN.dispatch(curGuideStep);
			}else{
				curGuideStep=MAXStep;
				C2SEmitter.setGuideStep(curGuideStep);
				changeStep_SN.dispatch(curGuideStep);
			}
		}
		
		public function resetInterrup():void{
			if(!isComplete){
				curGuideStep=curGuideNode.interruptNext;
				curGuideNode=XMLDataManager.getXinshouyindaoById(curGuideStep);
				C2SEmitter.setGuideStep(curGuideStep);
				changeStep_SN.dispatch(curGuideStep);
			}
		}
		
		public function getGuideEquipId():int{
			var tmp:Array=JSON.parse(XMLDataManager.getConstById("first_dig").string_value) as Array;
			return tmp[0];
		}
		
		
		public override function destory():void
		{
			changeStep_SN.removeAll();
			super.destory();
		}
	}
}