package snake.gameobj
{
	public class PlayerActionCFG
	{
		public function PlayerActionCFG()
		{
		}
		/** 是否动作捕捉 **/
		public static var isMotionCapture:Boolean=false;
		
		public static var startX:Number=400;
		public static var startY:Number=300;
		
		public static var LeftAction:Array=[ ];
		public static var RigthAction:Array=[ [ 35,81 ],[ 92,93 ] ]
		public static var JumpAction:Array=[ [ 61,73 ] ]
		
		public static var ShotAction:Array=[[100,200]];
		
		public static var TalkAction:Array=[[50,500]];
		
		public static function isActiveFr(fr:int,arr:Array):Boolean{
			for each(var tmp:Array in arr){
				if(tmp.length==2){
					if(fr>=tmp[0] && fr<tmp[1]){
						return true;
					}
				}else{
					if(fr==tmp[0]){
						return true;
					}
				}
			}
			return false;
		}
		
		public static function getControlFrames():int{
			var max:int=0;
			var tmp:Array=LeftAction[LeftAction.length-1];
			if(tmp) max=Math.max(max,tmp[tmp.length-1]);
			
			tmp=RigthAction[RigthAction.length-1];
			if(tmp) max=Math.max(max,tmp[tmp.length-1]);
			
			tmp=JumpAction[JumpAction.length-1];
			if(tmp) max=Math.max(max,tmp[tmp.length-1]);
			
			tmp=ShotAction[ShotAction.length-1];
			if(tmp) max=Math.max(max,tmp[tmp.length-1]);
			return max+1;
		}
	}
}