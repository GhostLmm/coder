package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.gameVO.MaoxianVO;
	import com.ghostlmm.xmldata.Node_copy_maoxian;
	import com.ghostlmm.xmldata.Node_map_maoxian;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.utils.Dictionary;

	public class MaoxianGuankaControl
	{
		private var _daguanArray:Array=[];
		private var _daguanDic:Dictionary=new Dictionary();
		
		/**  当前激活的最大 的 大关关卡
		 * */
//		private var _maxDaguanID:int=1;
		public function getMaxDaguanId():int
		{
			
			for each(var daguan:MaoxianDaguanData in _daguanArray){
				if(!daguan.isActivite){
					return daguan.id;
					
				}
			}
			if(_daguanArray.length==0){
				return 0;
			}
			return _daguanArray[_daguanArray.length-1].id;
		}
		
		public function destory():void
		{
//			for each(var daguan 
		}
		
		public function MaoxianGuankaControl()
		{
			initMaoxianDaguang();
		}
		
		public function getDaguanByID(bid:int):MaoxianDaguanData
		{
			return _daguanDic[bid];
		}
		
		public function initMaoxian(maoxian:MaoxianVO):void
		{
			var info:MaoxianInfo;
			info=getInfoByZhongguanID(maoxian.tag);
			info.zhongguanData.updateMaoxian(maoxian);
			info.daguanData.isActivite=true;
		}
		
		public function updateMaoxian(maoxian:MaoxianVO):void
		{
			
			var info:MaoxianInfo;
			if(maoxian.currentGuanka>0){
				info=getInfoByXiaoguanID(maoxian.currentGuanka);
			}else{
				info=getInfoByZhongguanID(maoxian.tag);
			}
			
//			if(info.xiaoguanData){
//				info.xiaoguanData.updateMaoxian(maoxian);
//			}
			info.daguanData.isActivite=true;
			info.zhongguanData.updateMaoxian(maoxian);
			
			//如果是刚 通关了一个关低
			if(maoxian.flag==1){
				checkUp(info)
			}
		}
		
		private function checkUp(info:MaoxianInfo):void
		{
			info.daguanData.checkOrFreshZhongguan(info.mid+1);
			
			//如果 该大关完成
			if(info.daguanData.isComplete){
				checkOrFreshDagguan(info.bid+1);
			}
		}
		/**  检测 或 激活大关
		 * */
		public function checkOrFreshDagguan(bid:int):void
		{
			var daguan:MaoxianDaguanData=getDaguanByID(bid);
			if(daguan==null){
				//没有下个大关
			}else{
				//大关没有激活
				if(daguan.isActivite==false){
					daguan.setActivite();
				}
			}
		}
		
		/**  获取大关 数组， 最大值便宜
		 * */
		public function getUseDaguanArray(offset:int):Array
		{
			var array:Array=[];
//			var index:int=0;
			var maxId:int=getMaxDaguanId();
			for each(var daguan:MaoxianDaguanData in _daguanArray){
				if(daguan.id<=maxId+offset)
				{
					array.push(daguan);
				}
			}
			return array;
		}
		
		private function getInfoByXiaoguanID(xid:int):MaoxianInfo
		{
			var info:MaoxianInfo=new MaoxianInfo();
			info.xid=xid;
			info.mid=XMLDataManager.getCopy_maoxianById(xid).tag;
			info.bid=XMLDataManager.getMap_maoxianById(info.mid).tag;
			
			info.daguanData=_daguanDic[info.bid];
			info.zhongguanData=info.daguanData.getZhongguanById(info.mid);
			info.xiaoguanData=info.zhongguanData.getXiaoguanById(info.xid);
			return info;
		}
		
		private function getInfoByZhongguanID(mid:int):MaoxianInfo
		{
			var info:MaoxianInfo=new MaoxianInfo();
			info.mid=mid;
			info.bid=XMLDataManager.getMap_maoxianById(info.mid).tag;
			
			info.daguanData=_daguanDic[info.bid];
			info.zhongguanData=info.daguanData.getZhongguanById(info.mid);
			return info;
		}
		private function initMaoxianDaguang():void
		{
			var nodeArrray:Array=XMLDataManager.Node_map_maoxianArray;
			
			var currentDaguan:MaoxianDaguanData;
			
			for each(var mapNode:Node_map_maoxian in XMLDataManager.Node_map_maoxianArray)
			{
				//				mapNode.
				if(currentDaguan==null || currentDaguan.id!=mapNode.tag){
					currentDaguan=new MaoxianDaguanData();
					
					currentDaguan.initWithMapMaoxian(mapNode);
					
					_daguanArray.push(currentDaguan);
					_daguanDic[currentDaguan.id]=currentDaguan;
				}
				var zhongguan:MaoxianZhongguanData=new MaoxianZhongguanData();
				zhongguan.initWitchCopyNode(mapNode);
				currentDaguan.addZhongguan(zhongguan);
			}
			
			for each(var copyNode:Node_copy_maoxian in XMLDataManager.Node_copy_maoxianArray){
				//中关
				var big:int=XMLDataManager.getMap_maoxianById(copyNode.tag).tag;
				
				var da:MaoxianDaguanData=_daguanDic[big];
				
				var zhong:MaoxianZhongguanData=da.getZhongguanById(copyNode.tag);
				
				var xiaoguan:MaoxianXiaoguanData=new MaoxianXiaoguanData();
				xiaoguan.initWithCopyMaoxian(copyNode);
				zhong.addXiaoguanData(xiaoguan);
			}
			
			/**   操作关低
			 * */
			for each(var daguan:MaoxianDaguanData in _daguanArray){
				for each (var zhong:MaoxianZhongguanData in daguan._zhongGuanArray){
					zhong.initGuadi();
				}
			}
		}
	}
}