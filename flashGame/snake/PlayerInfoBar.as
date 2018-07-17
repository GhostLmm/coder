package snake
{
	import flash.display.BitmapData;
	
	import ui.widget.Position;

	public class PlayerInfoBar
	{
		public static const TY_Self:int=1;
		public static const TY_Npc:int=2;
		
		public var bitdata:BitmapData;
		public var mc:McPlayerInfo;
		
		public function PlayerInfoBar()
		{
			
		}
		
		public function setInfo(level:int, name:String, type:int):void{
			mc=new McPlayerInfo();
			mc.bg_diban.gotoAndStop(type);
			mc.fnt_name.text=name;			
			mc.bg_diban.width=mc.fnt_name.textWidth+4;	
			bitdata=new BitmapData(mc.bg_diban.width,mc.height,true,0);
			var pos:Position=new Position(mc.pos_chenghao);
			bitdata.draw(mc);
		}
		
		public function destory():void
		{
			mc=null;
			bitdata.dispose();
			bitdata=null;
		}
	}
}