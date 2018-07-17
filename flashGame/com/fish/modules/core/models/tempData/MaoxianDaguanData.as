package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.models.MaoxianModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_map_maoxian;
	
	import flash.utils.Dictionary;
	


	public class MaoxianDaguanData
	{
		public function MaoxianDaguanData()
		{
			
		}
		
		
		
		public var name:String;
		public var num:String;
		public var desc:String;
		public var id:int;
		internal var _zhongGuanArray:Array=[];
		private var _zhongGuanDic:Dictionary=new Dictionary();
		
//		private var maxZhongguanID:int=0;
		
		public var isActivite:Boolean;
		internal var isComplete:Boolean;
		
		public function addZhongguan(zhongguan:MaoxianZhongguanData):void
		{
			_zhongGuanArray.push(zhongguan);
			_zhongGuanDic[zhongguan.id]=zhongguan;
			zhongguan.index=_zhongGuanArray.length-1;
		}
		
		/**  获取当前最大激活的中关
		 * */
		public function getMaxActivityZhongguanIndex():int
		{
			for (var index:int; index<_zhongGuanArray.length; index++){
				var zhongguan:MaoxianZhongguanData=_zhongGuanArray[index];
				if(!zhongguan.isActivate){
					return index-1;
				}
			}
			return _zhongGuanArray.length-1;
		}
		
		
		public function getZhongguanById(zhongguanId:int):MaoxianZhongguanData
		{
			return _zhongGuanDic[zhongguanId];
		}
		
		/**  激活一个 大关
		 * */
		public function setActivite():void
		{
			isActivite=true;
			var model:MaoxianModel=Context.getInjectInstance(MaoxianModel);
			model.activityDaguanSN.dispatch(id);
			(_zhongGuanArray[0] as MaoxianZhongguanData).setActivity();
		}
		
		/** 一个中关完成， 检测下一个中关是否在开启状态
		 * */
		public function checkOrFreshZhongguan(mid:int):void
		{
			var nextZhong:MaoxianZhongguanData=getZhongguanById(mid);
			
			if(nextZhong==null)
			{
				isComplete=true;
			}else{
				isComplete=false;
				//如果下一关没有激活， 
				if(nextZhong.isActivate==false){
					nextZhong.setActivity();
				}
			}
		}
		
		public function get zhongguanArray():Array
		{
			return _zhongGuanArray;
		}
		
		public function initWithMapMaoxian(node:Node_map_maoxian):void
		{
			name=node.name1;
			num=node.desc1;
			id=node.tag;
			desc=node.desc2;
		}
		
	}
}