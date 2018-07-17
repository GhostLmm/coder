package com.fish.modules.core.models
{
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.ZombieVO;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_fuben;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import org.osflash.signals.Signal;
	
	import snake.viewdata.ViewData_Zombie;

	public class ZombieModel extends BaseModel
	{
		public var ZombieArrayChangeSN:Signal=new Signal();
		public function ZombieModel()
		{
			super();
		}
		protected override function onGameInitComplete():void
		{
			GameVOManager.getInstance().arrayVoOP_SN.add(onVoArrayChange);
		}
		private var needFresh:Boolean=false;
		private var _hasAleardy:Boolean=false;
		private function onVoArrayChange(cls:Class,array:Array):void
		{
			if(cls==ZombieVO)
			{
				needFresh=true;
				_hasAleardy=true;
				ZombieArrayChangeSN.dispatch();
			}
		}
		
		
		public function hasAleardyData():Boolean{
			return _hasAleardy;
		}
		
		public function reset():void
		{
			needFresh=true;
			_hasAleardy=false;
			_zombieDataArray=null;
			GameVOManager.getInstance().resetZombieArray();
		}
		private var _zombieDataArray:Array;
		public function get zombieDataArray():Array
		{
			if(_zombieDataArray==null || needFresh){
				updateZombieData();
			}
			return _zombieDataArray;
		}
		private function updateZombieData():void
		{
			if(null==_zombieDataArray)
			{
				_zombieDataArray=[];
			}
			_zombieDataArray.length=0;
			var mapModel:MapModel=Context.getInjectInstance(MapModel);
			var currentFubenId:int=mapModel.currentChallengeFubenId;
			var nodeFuben:Node_fuben=XMLDataManager.getFubenById(currentFubenId);
			var voArray:Array=GameVOManager.getInstance().zombies;
			var index:int;
			for(index=0;index<voArray.length;index++)
			{
				var vo:ZombieVO=voArray[index];
				if(vo.modifyType<0)
				{
					continue;
				}
				var xid:int=vo.xid;
				var zombieData:ViewData_Zombie=new ViewData_Zombie();
				zombieData.vo=vo;
				zombieData.monsterNode=XMLDataManager.getMonsterById(xid);
				zombieData.monsterTypeNode=XMLDataManager.getMonster_typeById(zombieData.monsterNode.appearance);
				zombieData.param_cri=nodeFuben.cri;
				zombieData.param_renxing=nodeFuben.renxing;
				zombieData.param_hit=nodeFuben.hit;
				zombieData.param_eva=nodeFuben.eva;
				zombieData.setData();
				
				_zombieDataArray.push(zombieData);
			}
			needFresh=false;
		}
		public override function destory():void
		{
			GameVOManager.getInstance().arrayVoOP_SN.remove(onVoArrayChange);
			ZombieArrayChangeSN.removeAll();
			super.destory();
		}
	}
}