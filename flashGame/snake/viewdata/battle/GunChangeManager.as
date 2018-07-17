package snake.viewdata.battle
{
	import com.fish.GLBaseData;
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.gameVO.BattlegunVO;
	import com.fish.modules.core.models.BattleModel;
	import com.fish.modules.core.models.HeroModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_gun;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import org.osflash.signals.Signal;
	
	import util.Dict;

	public class GunChangeManager
	{
		public var GunChange_SN:Signal=new Signal();
		public function GunChangeManager()
		{
		}
		private static var m_instance:GunChangeManager;
		public static function getInstance():GunChangeManager
		{
			if(null==m_instance)
			{
				m_instance=new GunChangeManager();
			}
			return m_instance;
		}
		private var m_currentUseGun:int;
		private var m_totalGunCouldUseArray:Array=[];
		private var m_gunAmmoDic:Dict;
		public function startBattle():void
		{
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Copy && battleModel.cur_id3>0) return ;
			resetGunNode();
			m_gunAmmoDic=null;
			
			var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
			m_currentUseGun=battleModel.getBattleHeroByUid(int(GLBaseData.userId)).mainGun;
			m_totalGunCouldUseArray=[];
			var gunArray:Array=battleModel.getBattleGuns(int(GLBaseData.userId));
			for(var index:int=0;index<gunArray.length;index++)
			{
				var vo:BattlegunVO=gunArray[index];
				m_totalGunCouldUseArray.push(vo.xid);
			}
			GunChange_SN.dispatch();
			
		}
		private static function resetGunNode():void
		{
			var xmlList:Array=XMLDataManager.Node_gunArray;
			var index:int;
			for(index=0;index<xmlList.length;index++)
			{
				var node:Node_gun=xmlList[index];
				node.gun_ammo=node.gun_mag_size;
			}
		}
		public function saveGunAmmo(_gunId:int,_ammo:int):void
		{
			if(null==m_gunAmmoDic)
			{
				m_gunAmmoDic=new Dict();
			}
			m_gunAmmoDic[_gunId]=_ammo;
		}
		public function getGunAmmo(_gunId:int):int
		{
			if((null==m_gunAmmoDic)||(null==m_gunAmmoDic[_gunId]))
			{
				return XMLDataManager.getGunById(_gunId).gun_mag_size;
			}
			else
			{
				return m_gunAmmoDic[_gunId];
			}
		}
		public function get currentUseGun():int
		{
			return m_currentUseGun;
		}
		public function get totalGunCouldUse():Array
		{
			return m_totalGunCouldUseArray;
		}
		public function endBattle():void
		{
			
		}
		public function changeGun(_gunId:int):void
		{
			if(_gunId==m_currentUseGun)
			{
				return;
			}
			m_currentUseGun=_gunId;
			GunChange_SN.dispatch();
		}
		public function destroy():void
		{
			
		}
	}
}