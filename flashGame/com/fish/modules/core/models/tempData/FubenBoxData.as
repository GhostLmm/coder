package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.gameVO.CopyVO;
	import com.ghostlmm.xmldata.Node_fuben;

	public class FubenBoxData
	{
		
		public function FubenBoxData($node:Node_fuben)
		{
			node=$node;
		}
		public var node:Node_fuben;
//		public var status:int;
//		public var star:int;
		
		public var isActive:Boolean=false;
		public var hasPass:Boolean=false;
		public var vo:CopyVO;
		public var isLastFuben:Boolean;
		
		public var fubenName:String;
		
		public function setVo($vo:CopyVO):void{
			vo=$vo;
//			star=1;
		}
		
		public function getStars():int{
			if(vo){
				var temp:Array = JSON.parse(vo.stars) as Array;
				return temp.length;
			}
			return 0;
		}
		
		public function getStarArray():Array{
			var re:Array=[0,0,0];
			if(vo){
				var temp:Array = JSON.parse(vo.stars) as Array;
				for each(var index:int in temp){
					re[index-1]=1;
				}
				
			}
			return re;
				
		}
		
		
		public function couldTiaozanCount():int{
			if(vo==null) return node.limit_num;
			var r:int=node.limit_num-vo.count;
			if(r<0) r=0;
			return r;
		}
		
		public function get hasTioazanCount():int{
			if(vo==null) return 0;
			return vo.count;
		}
		
		public static const ST_Unactive:int=3;
		public static const ST_UnPass:int=1;
		public static const st_Pass:int=2;
	}
}