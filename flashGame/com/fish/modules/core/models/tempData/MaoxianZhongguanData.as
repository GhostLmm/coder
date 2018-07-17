package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.gameVO.MaoxianVO;
	import com.fish.modules.core.models.MaoxianModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_copy_maoxian;
	import com.ghostlmm.xmldata.Node_map_maoxian;
	
	import flash.utils.Dictionary;

	public class MaoxianZhongguanData
	{
		public function MaoxianZhongguanData()
		{
		}
		
		public var zhongguanXml:Node_map_maoxian;
		
		private var _xiaoguanArray:Array=[];
		private var _xiaoguanDic:Dictionary=new Dictionary();
		
		
//		public var currentXiaoguanID:int=-1;
		
		public var id:int;
		
		/**  是否激活
		 * */
		public var isActivate:Boolean;
		/**  是否完成
		 * */
		public var isComplete:Boolean;
		
		/**  中关的 索引顺序
		 * */
		public var index:int
		
		public function initWitchCopyNode(node:Node_map_maoxian):void
		{
			id=node.id;
			zhongguanXml=node;
//			index=$index;
		}
		
		public function get xiaoguanDataArray():Array
		{
			return _xiaoguanArray;
		}
		
		/**  新激活关卡
		 * */
		public function setActivity():void
		{
			isActivate=true;
			(_xiaoguanArray[0] as MaoxianXiaoguanData).setAccount(0);
			
			var model:MaoxianModel=Context.getInjectInstance(MaoxianModel);
			model.activityZhongguanSN.dispatch(id);
		}
		
		public function addXiaoguanData(xiaoguan:MaoxianXiaoguanData):void
		{
			_xiaoguanArray.push(xiaoguan);
			_xiaoguanDic[xiaoguan.id]=xiaoguan;
			xiaoguan.index=_xiaoguanArray.length-1;
		}
		
		public function getXiaoguanById(xid:int):MaoxianXiaoguanData
		{
			return _xiaoguanDic[xid];
		}
		
		//选出关低数据
		public function initGuadi():void
		{
			(_xiaoguanArray[_xiaoguanArray.length-1] as MaoxianXiaoguanData).isGuandi=true;
		}
		
		public function get guandi():MaoxianXiaoguanData
		{
			return _xiaoguanArray[_xiaoguanArray.length-1];
		}
		
		public function updateMaoxian(maoxian:MaoxianVO):void
		{
			isActivate=true;
			guandi.updateFlag(maoxian.flag);
			
			for each(var xiaoguanData:MaoxianXiaoguanData in _xiaoguanArray)
			{
				if(xiaoguanData.isGuandi){
					if(xiaoguanData.id==maoxian.currentGuanka){
						xiaoguanData.isActivate=true;
					}
					return ;
				}
				if(xiaoguanData.id<maoxian.currentGuanka){
					xiaoguanData.setMaxAccount();
				}else if(xiaoguanData.id==maoxian.currentGuanka){
					xiaoguanData.setAccount(maoxian.currentAccount);
				}else{
					xiaoguanData.setMinAccount();
				}
					
			}
		}
			
	}
}