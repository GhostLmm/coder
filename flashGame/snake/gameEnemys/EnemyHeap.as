package snake.gameEnemys
{
	import com.fish.modules.core.models.MapModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_fuben;
	import com.ghostlmm.xmldata.Node_fuben_monster_heap;
	import com.ghostlmm.xmldata.Node_monster;
	import com.ghostlmm.xmldata.Node_monster_type;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import snake.viewdata.ViewData_Zombie;

	public class EnemyHeap
	{
		public function EnemyHeap()
		{
		}
		
		public var id:int;
		public var x:Number;
		public var y:Number;
		
		public var node_heap:Node_fuben_monster_heap;
		
		public var monsterTypes:Array;
		public var monsterNums:Array;
		
		
		public function init($id:int,$info:Object):void{
			id=MapModel.convertIndexToHeapId($id);
			x=$info.x;
			y=$info.y;
			
			node_heap=XMLDataManager.getFuben_monster_heapById(id);
			monsterTypes=JSON.parse(node_heap.monster_id) as Array;
			monsterNums=JSON.parse(node_heap.monster_num) as Array;
			
		}
		public function getTotalMonstNum():int
		{
			var result:int=0;
			var index:int;
			for(index=0;index<monsterNums.length;index++)
			{
				result+=monsterNums[index];
			}	
			return result;
		}
	}
}