package com.ghostlmm.tool
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import r1.deval.parser.ExprParser;

	public class MathHelper
	{
		public function MathHelper()
		{
			/*var exp:ExprParser=new ExprParser();
			exp.*/
		}
		
		/** 计算 **/
		public static function localToGlobal(cx:Number,cy:Number,lx:Number,ly:Number,reslut:Point,rotation:Number=0,reversal:Boolean=false):void{
			if(rotation==0){
				reslut.y=cy+ly;
				if(reversal){
					reslut.x=cx-lx;
				}else{
					reslut.x=cx+lx;
				}
			}else{
				var r:Number=Math.sqrt(lx*lx+ly*ly);
				var sa:Number=ly/r;
				var ca:Number=lx/r;
//				var rr:Number=rotation*Math.PI/1800;
				var sb:Number=Math.sin(rotation);
				var cb:Number=Math.cos(rotation);
				reslut.x=r*(sa*cb+ca*sb);
				reslut.y=r*(ca*cb-sa*sb)+cy;
				if(reversal){
					reslut.x=cx-reslut.x;
				}else{
					reslut.x=cx+reslut.x;
				}
			}
		}
		
		public static function calcRotation(px:Number,py:Number):Number{
			return Math.atan2(py,px)*180/Math.PI;;
		}
		
		/**
		 *   计算两个 rect 的差值, 均使用 int值
		 */
		public static function retctDiff(source:Rectangle,target:Rectangle):Array{
			var re:Array=[];
			
//			source.i
			var xs:Array=[source.left,source.right,target.left,target.right];
			var ys:Array=[source.top,source.bottom,target.top,target.bottom];
			xs=xs.sort(Array.NUMERIC);
			ys=ys.sort(Array.NUMERIC);
			var left:int;
			var right:int;
			var top:int;
			var bottom:int;
			for(var ix:int=0; ix<xs.length-1; ix++){
				for(var iy:int=0; iy<ys.length-1; iy++){
					left=xs[ix];
					right=xs[ix+1];
					top=ys[iy];
					bottom=ys[iy+1];
					if(right>left && bottom>top){
						var rect:Rectangle=new Rectangle(left,top,right-left,bottom-top);
						if(source.containsRect(rect) && !target.containsRect(rect)){
							re.push(rect);
						}
					}
					
					
				}
			}
			return re;
		}
		

	}
}