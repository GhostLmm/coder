package snake.ui
{
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	
	import snake.GameManager;
	import snake.gameEnemys.EnemyCreator;
	
	import ui.widget.FontField;
	
	import view.Base_Mc;
	
	public class Mc_Battle_MonsterLeft extends Base_Mc
	{
		private var timerModel:TimerModel;
		public var _fnt_remain_monster_num:FontField;
		
		public function Mc_Battle_MonsterLeft()
		{
			super();
		}
		protected override function initModule():void
		{
			timerModel=Context.getInjectInstance(TimerModel);
			_fnt_remain_monster_num=new FontField(mcMaterial.fnt_remain_monster_num);
			this.mouseChildren=false;
			this.mouseEnabled=false;
		}
		protected override function registerEvent():void
		{
			timerModel.secondTimer_SN.add(update);
			EnemyCreator.EnemyLeft_SN.add(update);		
		}
		private function update():void
		{
			if(null==GameManager.manager.enemyCreator)
			{
				return;
			}
			_fnt_remain_monster_num.text=GameManager.manager.enemyCreator.monsterLeft.toString();
		}
		protected override function setShow():void
		{
			update();
		}
		protected override function get mcClassName():Class
		{
			return mc_zhandou_shengyu_yeguai;
		}
		private function get mcMaterial():mc_zhandou_shengyu_yeguai
		{
			return m_mc as mc_zhandou_shengyu_yeguai;
		}
		public override function destory():void
		{
			timerModel.secondTimer_SN.remove(update);
			timerModel=null;
			EnemyCreator.EnemyLeft_SN.remove(update);
			if(_fnt_remain_monster_num){_fnt_remain_monster_num.destory();_fnt_remain_monster_num=null;};
			super.destory();
		}
	}
}