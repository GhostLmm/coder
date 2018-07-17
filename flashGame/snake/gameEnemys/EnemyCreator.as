package snake.gameEnemys
{
	import com.fish.modules.core.models.BattleModel;
	import com.fish.modules.core.models.ZombieModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_gun;
	import com.ghostlmm.xmldata.Node_monster;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import org.osflash.signals.Signal;
	
	import snake.viewdata.ViewData_Zombie;

	public class EnemyCreator
	{
		public function EnemyCreator()
		{
		}
		private var monsterInfo:Object;
		public var monsterIds:Array;
		public var monsterGunIds:Array;
		public var enemyHeaps:Array;
		/**
		 * 当前地图怪物总数
		 */
		public var totalMonster:int;
		public var monsterLeft:int;
		
		public static var EnemyLeft_SN:Signal=new Signal();
		public function initMapInfo($mapInfo:Object):void{
			monsterInfo=$mapInfo;
			monsterIds=[];
			enemyHeaps=[];
			monsterGunIds=[];
			totalMonster=0;
			for (var key:String in monsterInfo){
				var heap:EnemyHeap=new EnemyHeap();
				heap.init(int(key),monsterInfo[key]);
				enemyHeaps.push(heap);
				for each(var mid:int in heap.monsterTypes){
					var node:Node_monster=XMLDataManager.getMonsterById(mid);
					
					var nodeGun:Node_gun=XMLDataManager.getGunById(node.gun);
					if(nodeGun!=null){
						var type:int=XMLDataManager.getMonster_typeById(node.appearance).id;
						if(monsterGunIds.indexOf(nodeGun.id)==-1)
						{
							monsterGunIds.push(nodeGun.id);
						}
						if(monsterIds.indexOf(type)==-1){
							monsterIds.push(type);
						}
					}
							
				}
				totalMonster+=heap.getTotalMonstNum();
			}
			monsterLeft=totalMonster;
			
			Enemy.EnemyDie_SN.add(onEnemyDie);
		}

		private function onEnemyDie():void
		{
			monsterLeft--;
			if(monsterLeft<=0)
			{
				monsterLeft=0;
				BattleModel.allEnemyDie();
			}
			EnemyLeft_SN.dispatch();
		}
		private function getHeapById(_id:int):EnemyHeap
		{
			for each(var heap:EnemyHeap in enemyHeaps)
			{
				if(heap.id==_id)
				{
					return heap;
				}
			}
			return null;
		}
		public function createEnemy():void{
			var zombieModel:ZombieModel=Context.getInjectInstance(ZombieModel);
			var zombieDataArray:Array=zombieModel.zombieDataArray;
			var index:int;
			var pp:int=0;
			for(index=0;index<zombieDataArray.length;index++)
			{
				
				var zombieData:ViewData_Zombie=zombieDataArray[index] as ViewData_Zombie;
//				var zombieData:ViewData_Zombie=createZombieData((zombieDataArray[index] as ViewData_Zombie).vo);
				var heap:EnemyHeap=getHeapById(zombieData.heapid);
				
				if(null!=heap)
				{
//					Enemy.addEnemy(1,1000000,1000000,1000000,1,heap.x+(50-Math.random()*100),heap.y,zombieData);
//					Enemy.addEnemy(6,1000000,1000000,1000000,1,1000,700,zombieData);
//					return ;
					
					if(zombieData.monsterTypeNode.type=="zombie"){
						Enemy.addEnemy(6,1000000,1000000,1000000, 1,heap.x+(50-Math.random()*100),heap.y,zombieData);
					}else{
						Enemy.addEnemy(1,1000000,1000000,1000000,1,heap.x+(50-Math.random()*100),heap.y,zombieData);
					}
					
				}	
			}
		}
		
		private function createZombieData(vo:*):ViewData_Zombie{
			var xid:int=3001;
			var zombieData:ViewData_Zombie=new ViewData_Zombie();
			zombieData.vo=vo;
			vo.heapid=1;
			//				var zombieData:ViewData_Zombie=new ViewData_Zombie();
			//				zombieData.vo=vo;
			zombieData.monsterNode=XMLDataManager.getMonsterById(xid);
			zombieData.monsterTypeNode=XMLDataManager.getMonster_typeById(zombieData.monsterNode.appearance);
			zombieData.param_cri=0;
			zombieData.param_renxing=0;
			zombieData.param_hit=0;
			zombieData.param_eva=0;
			zombieData.setData();
			return zombieData;
		}
		
		public function destory():void
		{
			Enemy.EnemyDie_SN.remove(onEnemyDie);
		}
	}
}