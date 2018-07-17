package snake
{
	public class GameUtil
	{
		public function GameUtil()
		{
		}
		
		
		public static function turnIntArrayToVect(array:Array):Vector.<int>{
			var re:Vector.<int>=new Vector.<int>(array.length);
			re.fixed=true;
			for(var a:int=0; a<array.length; a++){
				re[a]=array[a];
			}
			return re;
		}
		public static function turnUnitArrayToVect(array:Array):Vector.<uint>{
			var re:Vector.<uint>=new Vector.<uint>(array.length);
			re.fixed=true;
			for(var a:int=0; a<array.length; a++){
				re[a]=array[a];
			}
			return re;
		}
		
		public static function turnArryStringToUint(s:String):Array{
			var t:Array=s.split(/[\[,\]]/);
//			trace(t);
			var r:Array=[];
			for each(var ss:String in t){
				if(ss!=""){
					r.push(uint(ss));
				}
				
			}
//			trace(r);
			return r;
		}
		
	}
}