package com.fish.modules.core.models
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.HuodongdetailVO;
	import com.fish.modules.core.gameVO.HuodongswitchVO;
	import com.fish.modules.core.models.tempData.ItemData;
	import com.fish.modules.core.models.tempData.ShoujiItemData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_huodong_shouji_duihuan;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import org.osflash.signals.Signal;
	
	import util.Util;

	public class ShoujiModel extends BaseModel
	{
		public static const ShoujiHuodongId:int=6;
		/**
		 *   1 没有发送消息  2 正在发送消息 3 已经完成消息
		 */
		private var requestInfoStatus:int=1;
		
		private var huodongSwitchVO:HuodongswitchVO;
		private var huodongDeatial:HuodongdetailVO;
		
		private var MaxBuqiCount:int=10;
		
		public var initComplete_SN:Signal=new Signal();
		
		private var _hasInit:Boolean=false;
		public function ShoujiModel()
		{
			super();
		}
		public override function destory():void{
			S2CHanlder.instance.message_SN.remove(onMessage);
			initComplete_SN.removeAll();
			super.destory();
		}
		private var _activeNodes:Array;
		public function getActiveShoujiNodes():Array{
			if(_activeNodes==null){
				_activeNodes=[];
				for each(var node:Node_huodong_shouji_duihuan in XMLDataManager.Node_huodong_shouji_duihuanArray){
					if(node.active>0){
						_activeNodes.push(node);
					}
				}
			}
			return _activeNodes;
		}
		
		protected override function onGameInitComplete():void
		{
			MaxBuqiCount=XMLDataManager.getConstById("buqi_limit_count").value;
			S2CHanlder.instance.message_SN.add(onMessage);
		}
		private function onMessage(msType:String):void{
			if(msType==C2SEmitter.REQ_GetHuodongListHandler){
				huodongSwitchVO=GameVOManager.getInstance().getHuodongswitchVOByid( ShoujiHuodongId);
				huodongDeatial=GameVOManager.getInstance().huodongdetail;
				requestInfoStatus=3;
				_hasInit=true;
				initComplete_SN.dispatch();
			}
		}
		
		public function hasInit():Boolean{
			return _hasInit;
		}
		
		/**
		 *   初始化收集商人
		 */
		public function initSeller(showWait:Boolean=false):void{
			huodongSwitchVO=GameVOManager.getInstance().getHuodongswitchVOByid( ShoujiHuodongId);
			if(huodongSwitchVO==null){
				if(requestInfoStatus==1){
					requestInfoStatus=2;
					C2SEmitter.requestHuodongInfo(showWait);
				}
			}else{
				
			}
			
		}
		
		/**
		 *   商人是否激活
		 */
		public function sellerIsActive():Boolean{
			if(huodongSwitchVO==null){
				return false;
			}
			var  serverTime:Number=TimerModel.instance.serverTime;
			if(serverTime>=huodongSwitchVO.startTime && serverTime<=huodongSwitchVO.endTime){
				return true;
			}
			return false;
		}
		
		/**
		 *   商人离开时间 
		 */
		public function get sellerLeaveTime():Number{
			if(huodongSwitchVO){
				return huodongSwitchVO.endTime;
			}
			return 0;
		}
		
		/**
		 *   今日可以补齐的剩余次数
		 */
		public function getBuqiCount():int{
			return MaxBuqiCount- huodongDeatial.collectSupplyNum;
		}
		
		/**
		 *   是否可以兑换
		 */
		public function couldDuihuan(item:ShoujiItemData):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			
			// 兑换是否关闭
			
			if(item.collect_num<item.node.shouji_num){
				re.success=false;
				re.code=JudgeResult.CD_CailiaoNotEnough;
				// 翻译
				re.desc=Util.getLanguage("收集不足提示",item.shouji_name);
				return re;
			}
			
			re.success=true;
			return re;
		}
		
		/**
		 *   是否可以补齐
		 */
		public function couldBuqi(item:ShoujiItemData):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			
			if(getBuqiCount()<=0){
				re.success=false;
				re.code=JudgeResult.CD_OutOfRange;
				
				re.desc="今日补齐次数已经用完";
				return re;
			}
			
			// 收集满了，不需要补齐
			if(item.collect_num>=item.node.shouji_num){
				re.success=false;
				re.code=JudgeResult.CD_OtherHanlder;
				
				re.desc="已经收集";
				return re;
			}
			
			// 判断金钱不够
			if( (Context.getInjectInstance(UserModel) as UserModel).userVo.userCash < item.calcBuqiUseCash() ){
				re.success=false;
				re.code=JudgeResult.CD_CashNotEnough;
				return re;
			}
			re.success=true;
			return re;
		}
		
		public function getShoujiItemData():Array{
			var re:Array=[];
			var itemModel:ItemModel=Context.getInjectInstance(ItemModel);
			for each(var node:Node_huodong_shouji_duihuan in XMLDataManager.Node_huodong_shouji_duihuanArray){
				if(node.active>0){
					var itemData:ShoujiItemData=new ShoujiItemData();
					itemData.setData(node);
					//				itemData.collect_num=int(Math.random()*15);
					var data:ItemData = itemModel.getItemDataByXid(itemData.sourceItemNode.id);
					itemData.collect_num=0;
					if(data!=null && data.num>0){
						itemData.collect_num=data.num;
					}
					
					re.push(itemData);
				}
				
			}
			return re;
		}
		
	}
}