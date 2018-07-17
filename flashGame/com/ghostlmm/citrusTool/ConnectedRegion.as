package com.ghostlmm.citrusTool
{
	public class ConnectedRegion
	{
		private var _grids:Array;
		private var _flags:Array;
		private var _width:int;
		private var _height:int;
		private var _typeDic:Object;
		private var _rectArray:Array;
		
		private function init($grids:Array,$typeDic:Object):void{
			_grids=$grids;
			_typeDic=$typeDic;
			_rectArray=[];
			_width=_grids[0].length;
			_height=_grids.length;
			_flags=new Array(_height);
			
			for (var y:int=0; y<_height; y++){
				var rowFlag:Array=new Array(_width);
				for(var x:int=0; x<_width; x++){
					rowFlag[x]=false;
				}
				_flags[y]=rowFlag;
			}
		}
		
		private function excute():void{
			for(var y:int=0; y<_height; y++){
				for(var x:int=0; x<_width; x++){
					if(_flags[y][x]) continue;
					var type:int=_grids[y][x];
					if(_typeDic[type]){
						var rect:PlatRegion=new PlatRegion();
						rect.startX=x;
						rect.startY=y;
						rect.type=type;
						rect.id=y*_width+x;
						fleed(x,y,rect);
						_rectArray.push(rect);
					}
				}
			}
			trace("区域大小："+_rectArray.length);
		}
		
		private function fleed(x:int,y:int,rect:PlatRegion):void{
			
			// 横向拓展
			while(true){
				x++;
				if(x>=_width) break;
				if(_flags[y][x]) break;
				if(_grids[y][x]!=rect.type) break;
				
				rect.width++;
			}
			//纵向拓展
			while(true){
				y++;
				if(y>=_height) break;
				if(isFixRow(y,rect)){
					rect.height++;
					
				}else{
					break;
				}
			}
			
			for ( y=rect.startY; y<rect.height+rect.startY; y++){
				for( x=rect.startX; x<rect.width+rect.startX; x++){
					_flags[y][x]=true;
				}
			}
			
		}
		
		private function isFixRow(y:int,rect:PlatRegion):Boolean{
			for(var x:int=rect.startX; x<rect.width+rect.startX; x++){
				if(_flags[y][x]) return false;
				if(_grids[y][x]!=rect.type) return false;
			}
			return true;
		}
		
		
		
		public static function calcRegion($grids:Array,$typeDic:Object,$offsetX:int,$offsetY:int):Array
		{
			var cr:ConnectedRegion=new ConnectedRegion();
			cr.init($grids,$typeDic);
			cr.excute();
			for each(var rect:PlatRegion in  cr._rectArray){
				rect.startX+=$offsetX;
				rect.startY+=$offsetY;
			}
			return cr._rectArray;
		}
	}
}

