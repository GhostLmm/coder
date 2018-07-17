package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.gameVO.TaskVO;
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.MapModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_task;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import util.Util;
	
	import view.CommonControlFun;

	public class TaskData
	{
		public static const TP_Tongguan:String="tongguan";
		public static const TP_Allstar:String="allstar";
		public static const TP_Shengxing:String="shengxing";
		public static const TP_Qianghua:String="qianghua";
		public static const TP_Saodang:String="saodang";
		
		
		
		/** 激活状态  **/
		public static const ST_Active:int=2;
		/** 完成状态  **/
		public static const ST_Complete:int=1;
		/** 结束状态  **/
		public static const ST_Finish:int=3;
		
		public function TaskData()
		{
		}
		
		public var node:Node_task;
		public var vo:TaskVO;
		public var arg:Array;
		public var status:int;
		
		public var desc:String;
		
//		public var completeStep:int;
		
		private function setDesc():void{
			desc="";
			if(node.guide_type==TP_Tongguan){
//				checkTongguan();
				desc=Util.getLanguage("任务通关描述",XMLDataManager.getFubenById(arg[0]).name);
			}else
			if(node.guide_type==TP_Allstar){
//				checkStar();
				desc=Util.getLanguage("章节收集星星描述",arg[0]);
			}else
			if(node.guide_type==TP_Shengxing){
//				checkShengxing();
				if(arg[0]>6){
					desc=Util.getLanguage("枪支升星描述",XMLDataManager.getGunById(arg[0]).gun_names,arg[1]);
				}else{
					desc=Util.getLanguage("装备部位升星描述",XMLDataManager.getEquip_typeById(arg[0]).name,arg[1]);
				}
			}else
			if(node.guide_type==TP_Qianghua){
//				checkQianghua();
				if(arg[0]>6){
					desc=Util.getLanguage("枪支强化描述",XMLDataManager.getGunById(arg[0]).gun_names,arg[1]);
				}else{
					desc=Util.getLanguage("装备部位强化描述",XMLDataManager.getEquip_typeById(arg[0]).name,arg[1]);
				}
			}else
			if(node.guide_type==TP_Saodang){
//				checkSaodang();
				desc=Util.getLanguage("扫荡副本描述",XMLDataManager.getFubenById(arg[0]).name,arg[1]);
			}
		}
		
		public function initFromVo($vo:TaskVO):void{
			vo=$vo;
			node=XMLDataManager.getTaskById(vo.id);
			
			if(node){
				arg=JSON.parse(node.guide_value) as Array;
				if(vo.hasComplete){
					status=ST_Finish;
				}else{
					if(node.guide_type==TP_Tongguan){
						checkTongguan();
					}
					if(node.guide_type==TP_Allstar){
						checkStar();
					}
					if(node.guide_type==TP_Shengxing){
						checkShengxing();
					}
					if(node.guide_type==TP_Qianghua){
						checkQianghua();
					}
					if(node.guide_type==TP_Saodang){
						checkSaodang();
					}
					
				}
			}
			setDesc();
		}
		
		private function checkSaodang():void{
			if(hasCompleteStep()>=arg[1]){
				status=ST_Complete;
			}else{
				status=ST_Active;
			}
		}
		
		private function checkQianghua():void{
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			var gridData:EquipGridData=bagModel.getEquipGridById(arg[0]);
			status=ST_Active;
			if(gridData && gridData.lv_bianqiang>=arg[1]){
				status=ST_Complete;
			}
		}
		
		private function checkShengxing():void{
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			var gridData:EquipGridData=bagModel.getEquipGridById(arg[0]);
			status=ST_Active;
			if(gridData && gridData.lv_xing>=arg[1]){
				status=ST_Complete;
			}
		}
		
		private function checkStar():void{
			var mapModel:MapModel=Context.getInjectInstance(MapModel);
			var map:FubenMapData=mapModel.getFubenMapById(arg[0]);
			status=ST_Complete;
			for each(var boxData:FubenBoxData in mapModel.getFubenBoxDataOnMap(map) ){
				if(boxData.getStars()<3){
					status=ST_Active;
					break;
				}
			}
		}
		
		
		private function checkTongguan():void{
			var mapModel:MapModel=Context.getInjectInstance(MapModel);
			if(mapModel.hasPassFuben(arg[0])){
				status=ST_Complete;
			}else{
				status=ST_Active;
			}
		}
		
		public function hasUserLevelActive():Boolean{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.userVo.userLevel>=node.need_lv){
				return true;
			}
			return false;
		}
		
		
		private static const FenbuTypeArray:Array=["saodang"];
		/** 是不是分步骤进行的  **/
		public function isFenbu():Boolean{
			return FenbuTypeArray.indexOf(node.guide_type)!=-1;
		}
		
		public function getTotalStep():int{
			if(TP_Saodang==node.guide_type){
				return arg[1];
			}
			return 1;
		}
		public function hasCompleteStep():int{
//			return int(vo.info);
			var result:Array;
			if(node.guide_type==TP_Saodang){
				try{result=JSON.parse(vo.info) as Array;}catch(e:Error){}
				if(result && result.length>=2){
					var count:int=result[1];
					if(count>getTotalStep()) return getTotalStep();
					return count;
				}
			}
			return 0;
		}
		
		public function guide():void{
			
			if(!CommonControlFun.isInZhucheng()){
				Util.flow("当前不在主城中，无法完成指引");
				return ;
			}
			
			if(node.guide_type==TP_Tongguan){
				CommonControlFun.gotoFuben(arg[0]);
			}
			if(node.guide_type==TP_Qianghua){
				CommonControlFun.gotoQianghua(arg[0]);
			}
			if(node.guide_type==TP_Allstar){
				var mapModel:MapModel=Context.getInjectInstance(MapModel);
				var map:FubenMapData=mapModel.getFubenMapById(arg[0]);
				status=ST_Complete;
				for each(var boxData:FubenBoxData in mapModel.getFubenBoxDataOnMap(map) ){
					if(boxData.getStars()<3){
						CommonControlFun.gotoFuben(boxData.node.id);
						break;
					}
				}
			}
			if(node.guide_type==TP_Shengxing){
				CommonControlFun.gotoShengxing(arg[0]);
			}
			if(node.guide_type==TP_Saodang){
				CommonControlFun.gotoFuben(arg[0]);
			}
			
		}
		
	}
}