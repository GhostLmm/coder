package com.ghostlmm.citrusTool
{
	import flash.utils.Dictionary;

	public class PlatRegion
	{
		public function PlatRegion()
		{
		}
		public var startX:int;
		public var startY:int;
		public var width:int=1;
		public var height:int=1;
		public var type:int;
		public var id:int;
		
		public function containGrid(gx:int,gy:int):Boolean{
			if(gx>=startX && gx<startX+width && gy>=startY && gy<startY+height){
				return true;
			}
			return false;
		}
		
		public function split($gridX:int,$gridY:int):Array{
			
			if(!containGrid($gridX,$gridY)){
				return null;
			}
			
			var grids:Array=[];
			for(var gy:int=this.startY; gy<this.startY+this.height; gy++){
				var tmp:Array=[];
				grids.push(tmp);
				for(var gx:int=this.startX; gx<this.startX+this.width; gx++){
					if($gridX==gx && $gridY==gy){
						tmp.push(0);
					}else{
						tmp.push(this.type);
					}
				}
			}
			var typeDic:Dictionary=new Dictionary();
			typeDic[this.type]=true;
			return ConnectedRegion.calcRegion(grids,typeDic,this.startX,this.startY);
		}
	}
}