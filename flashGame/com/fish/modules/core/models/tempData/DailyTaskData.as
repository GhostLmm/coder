package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.gameVO.DailytaskVO;
	import com.fish.modules.core.models.TaskModel;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.VipModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_daily_task;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import core.WindowManager;
	
	import snake.PlayMoveGuide;
	
	import ui.AddMoneyWindow;
	import ui.equip.EquipCaozuoWindow;
	import ui.equip.EquipOpenWindow;
	import ui.equip.EquipRonglianWindow;
	import ui.equip.MDI_EquipCaozuo;
	import ui.vip.VipWindow;
	
	import util.Util;
	
	import view.CommonControlFun;

	public class DailyTaskData
	{
		public static const TP_Fuben:String="fuben";
		public static const TP_Leitai:String="leitai";
		public static const TP_Shop:String="shop";
		public static const TP_Money:String="money";
		public static const TP_Ronglian:String="ronglian";
		public static const TP_Jiashu:String="jiasu";
		public static const TP_ZhuanbeiQianghua:String="zhuanbeiQianghua";
		public static const TP_Yueka:String="yueka";
		public static const TP_Vip:String="vip";
		
		/** 未激活状态 ， 仅有月卡才有 **/
//		public static const ST_UnActive:int=3;
		
		/** 激活状态  **/
		public static const ST_Active:int=2;
		/** 完成状态  **/
		public static const ST_Complete:int=1;
		/** 结束状态  **/
		public static const ST_Finish:int=3;
		
		public function DailyTaskData()
		{
		}
		
		public function needCloseOnGuide():Boolean{
			if(node.guide_type==TP_Money || node.guide_type==TP_Ronglian){
				return false;
			}
			return true;
		}
		
		public var node:Node_daily_task;
		public var completeStep:int;
		public var status:int;
		
		public function isYueka():Boolean{
			return node.guide_type==TP_Yueka;
		}
		public function isVip():Boolean{
			return node.guide_type==TP_Vip;
		}
		
		public function initData($node:Node_daily_task,$completeStep:int,$finish:Boolean):void{
			node=$node;
			completeStep=$completeStep;
			if($finish){
				status=ST_Finish;
			}else{
				if(isVip()){
					var vipModel:VipModel=Context.getInjectInstance(VipModel);
					if(vipModel.couldVipTask){
						completeStep=node.target_num;
						status=ST_Complete;
					}else{
						completeStep=0;
						status=ST_Active;
					}
					return ;
				}
				if(isYueka()){
					var taskModel:TaskModel=Context.getInjectInstance(TaskModel);
					if(taskModel.yuekaEndTime<TimerModel.instance.serverTime){
						status=DailyTaskData.ST_Active;
						completeStep=0;
					}else{
						status=DailyTaskData.ST_Complete;
						completeStep=node.target_num;
					}
				}
				if(completeStep>=node.target_num){
					completeStep=node.target_num;
					status=ST_Complete;
				}else{
					status=ST_Active;
				}
			}
		}
		
		public function hasCompleteStep():int{
//			return int(vo.info);
			return completeStep;
		}
		
		public function guide():void{
			if(!CommonControlFun.isInZhucheng()){
				Util.flow("当前不在主城中，无法完成指引");
				return ;
			}
			if(node.guide_type==TP_Fuben){
				CommonControlFun.gotoFuben();
			}
			if(node.guide_type==TP_Jiashu){
				CommonControlFun.gotoWakuang();
			}
			if(node.guide_type==TP_Leitai){
				PlayMoveGuide.openLeitai();
			}
			if(node.guide_type==TP_Money){
				WindowManager.openOnlyWinodw(AddMoneyWindow);
			}
			if(node.guide_type==TP_Ronglian){
				WindowManager.openOnlyWinodw(EquipRonglianWindow);
			}
			if(node.guide_type==TP_Shop){
				CommonControlFun.gotoShop();
			}
			if(node.guide_type==TP_ZhuanbeiQianghua){
				CommonControlFun.gotoTiejiangpu(EquipCaozuoWindow.LB_Bianqiang);
			}
			if(node.guide_type==TP_Vip){
				WindowManager.openOnlyWinodw(VipWindow);
			}
		}
	}
}