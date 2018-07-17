package com.fish.modules.core.models
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.ItemVO;
	import com.fish.modules.core.gameVO.UserVO;
	import com.fish.modules.core.models.tempData.ChongzhiData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.Node_item;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import util.Util;

	public class ChongzhiModel extends BaseModel
	{
		private var userVo:UserVO;
		private var chongZhiCount:int;
		private var chongzhiDataArray:Array;
		
		public var hasShowShouchongAfterChongzhi:Boolean=false;
		
		public var chongzhiSuccesXid:int;
		
		public static const ST_UnActive:int=1;
		public static const ST_Active:int=2;
		public static const ST_Complete:int=3;
		public function ChongzhiModel()
		{
			super();
		}
		
		protected override function onGameInitComplete():void
		{
			userVo=GameVOManager.getInstance().user;
			
			setChongzhiData();
			S2CHanlder.instance.message_SN.add(onMessage);
		}
		private function onMessage(msType:String):void{
			if(msType==C2SEmitter.REQ_PayS2SHandler){
				setChongzhiData(true);
			}
		}
		
		private function setChongzhiData(isChange:Boolean=false):void{
			chongzhiDataArray=[];
//			chongZhiCount=0;
			var obj:Object={};
			try{
				obj=JSON.parse(userVo.chongzhiInfo);
			}catch(e:Error){trace("chongzhiInfo error: "+userVo.chongzhiInfo);}
			
			for each(var node:Node_chongzhi in XMLDataManager.Node_chongzhiArray){
				var data:ChongzhiData = new ChongzhiData();
				data.initFromNode(node);
				data.count=int(obj[node.id]);
				chongzhiDataArray.push(data);
//				chongZhiCount+=data.count;
			}
			chongZhiCount=userVo.payCount;
			
			if(isChange){
				chongzhiSuccesXid=GameVOManager.getInstance().extrdata.chongzhiSuccessXid;
				modelUpdata_SN.dispatch();
			}
			
		}
		
		/** 首冲的状态  **/
		public function getShouchongState():int{
			var shouchongState:int;
			if(chongZhiCount==0){
				shouchongState=ST_UnActive;
			}else{
				var itemVo:ItemVO=GameVOManager.getInstance().getItemVOByxid(shouchongLibaoId);
				if(itemVo && itemVo.num>0){
					shouchongState=ST_Active;
				}else{
					shouchongState=ST_Complete;
				}
			}
			return shouchongState;
		}
		
		/** 首冲奖励的数组  **/
		public function getShouchongJiangliArray():Array{
			var pack:RewardsPackData=Util.createPackData(shouchongLibaoId);
			return pack.createItemDatas();
		}
		
		
		
		/** 首冲礼包  **/
		public function get shouchongLibaoId():int{
			return XMLDataManager.getConstById("shouchong_libao").value;
		}
		
		/** 是否是首冲 **/
		public function get isShouchong():Boolean{
			return true;
		}
		
		/** 是否可以领取首冲礼包 **/
		public function couldLingquShouchongLibao():JudgeResult{
			var re:JudgeResult=new JudgeResult();
			if(getShouchongState()!=ST_Active){
				re.success=false;
				return re;
			}
			re.success=true;
			return re;
		}
		
		public function getChongzhiDataArray():Array{
			var re:Array=[];
			for each(var node:Node_chongzhi in XMLDataManager.Node_chongzhiArray){
				/*if(node.id==yuekaId){
					var taskModel:TaskModel=Context.getInjectInstance(TaskModel);
					if(taskModel.hasInYuekaTime()){
						break;
					}
				}*/
				var data:ChongzhiData=new ChongzhiData();
				data.initFromNode(node);
				re.push(data);
			}
			return re;
		}
		
		
		/** 月卡充值id**/
		public function get yuekaId():int{
			return XMLDataManager.getConstById("yueka_chongzhi_id").value;
		}
		
		public override function destory():void
		{
			S2CHanlder.instance.message_SN.remove(onMessage);
			super.destory();
		}
	}
}