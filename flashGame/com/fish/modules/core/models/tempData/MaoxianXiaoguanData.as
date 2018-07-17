package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.gameVO.MaoxianVO;
	import com.ghostlmm.xmldata.Node_copy_maoxian;

	public class MaoxianXiaoguanData
	{
		public function MaoxianXiaoguanData()
		{
		}
		
		public var node:Node_copy_maoxian;
//		public var 
		public var account:int;
		
		public var id:int;
		
		public var isGuandi:Boolean;
		
		public var isActivate:Boolean;
		
		public var index:int;
		
		public function initWithCopyMaoxian(node:Node_copy_maoxian):void
		{
			this.node=node;
			id=node.id;
		}
		
		public function setMinAccount():void
		{
			isActivate=false;
			account=0;
		}
		public function setAccount(_account:int):void
		{
			account=Math.min(_account,node.step);
			isActivate=true;
		}
		public function setMaxAccount():void
		{
			isActivate=false;
			account=node.step;
		}
		
		internal function updateFlag(flag:int):void
		{
			isActivate=flag>0;
		}
		
		/**   小关 更新冒险
		 * */
		public function updateMaoxian(maoxian:MaoxianVO):void
		{
			
		}
	}
}