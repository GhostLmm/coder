package com.fish.modules.core.models.tempData
{
	import com.ghostlmm.xmldata.Node_qiyuan;

	public class QiyuanData
	{
		public static const ST_Close:int=1;
		public static const ST_Open:int=2;
		public static const ST_VIPClose:int=3;
		public function QiyuanData()
		{
		}
		
		public var posId:int;
		
		/**  位置状态  
		 * */
		public var openState:int;
		
		/**  激活vip等级
		 * */
		public var activeVip:int;
		
		/**  放置的卡牌xid
		 * */
		public var kapaiXid:int;
		
		public function loadXml(node:Node_qiyuan,userVip:int):void
		{
			posId=node.id;
			activeVip=node.vip_limit;
			if(node.kaiqi==0){
				openState=ST_Close;
				return ;
			}
			if(node.vip_limit>userVip){
				openState=ST_VIPClose;
				return ;
			}
			openState=ST_Open;
		}
	}
}