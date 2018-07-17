package snake
{
	import com.fish.modules.core.models.tempData.NpcerData;
	
	import flash.geom.Rectangle;
	
	import snake.npcer.GameNpcer;

	public class GameRolerManager
	{
		public function GameRolerManager()
		{
		}
		
		public static const instance:GameRolerManager=new GameRolerManager();
		
		private var npcVect:Vector.<GameNpcer>=new Vector.<GameNpcer>();
		
		public function getNpcVect():Vector.<GameNpcer>{
			return npcVect;
		}
		
		public function init():void{
			npcVect=new Vector.<GameNpcer>();
		}
		
		public function addNpc(npcerData:NpcerData,rect:Rectangle):void{
			var npc:GameNpcer=new GameNpcer();
			npc.initData(npcerData,1500,675,rect);
			npcVect.push(npc);
		}
		
		
		public function removeAll():void{
			if(npcVect){
				for each(var npc:GameNpcer in npcVect){
					npc.destory();
				}
				npcVect=new Vector.<GameNpcer>();
			}
		}
		
		
		
		public function logic():void{
			for each(var npc:GameNpcer in npcVect){
				npc.logic();
			}
		}
		public function render():void{
			for each(var npc:GameNpcer in npcVect){
				npc.render();
			}
		}
		
	}
}