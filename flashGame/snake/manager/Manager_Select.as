package snake.manager
{
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import snake.GameManager;
	import snake.gameobj.Player_Select;

	/** 选人的战斗场景 只需要一个player 就可以了  **/
	public class Manager_Select extends ManagerBase
	{
		public function Manager_Select()
		{
			super(GameManager.MG_Select);
		}
		
		public function get playerSelect():Player_Select{
			return player as Player_Select;
		}
		
		protected override function proccessLoadAssetCom():void{
			player=new Player_Select();
			
			playerSelect.startShow(XMLDataManager.Node_heroArray[0].id,level.characterStartPoint.x,level.characterStartPoint.y);
			TopTip.hideBattleWait();
		}
		
		public function resetPlayer(hid:int):void{
			playerSelect.startShow(hid,level.characterStartPoint.x,level.characterStartPoint.y);
		}
			
	}
}