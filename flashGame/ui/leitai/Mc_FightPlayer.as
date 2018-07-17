package ui.leitai
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.gameVO.LeitaiVO;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.LeitaiModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	
	import snake.PlayerThumb;
	import snake.viewdata.ViewData_LeitaiPlayer;
	
	import ui.widget.FontField;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Mc;
	
	public class Mc_FightPlayer extends Base_Mc
	{
		public static const MyHero:int=1;
		public static const EnemyHero:int=2;
		/**
		 * 1是自己，2是其他
		 */
		private var m_type:int;
		public var _pos_touxiang:Position;
		public var _fnt_player_name:FontField;
		public var _fnt_lv:FontField;
		public var _fnt_paiming_num:FontField;
		public var _fnt_zhanli_num:FontField;
		public var _mc_bg:MovieClip;
		private var _thumb:PlayerThumb;
		
		public function Mc_FightPlayer()
		{
			super();
		}
		protected override function get mcClassName():Class
		{
			return mc_fight_player;
		}
		protected override function initModule():void
		{
			_pos_touxiang=new Position(mcMaterial.pos_touxiang);
			_fnt_player_name=new FontField(mcMaterial.fnt_player_name);
			_fnt_lv=new FontField(mcMaterial.fnt_lv);
			_fnt_paiming_num=new FontField(mcMaterial.fnt_paiming_num);
			_fnt_zhanli_num=new FontField(mcMaterial.fnt_zhanli_num);
			_mc_bg=mcMaterial.mc_bg;
			_thumb=new PlayerThumb();
			
		}
		private function destroyMc():void
		{
			if(_pos_touxiang){_pos_touxiang.destory();_pos_touxiang=null;};
			if(_fnt_player_name){_fnt_player_name.destory();_fnt_player_name=null;};
			if(_fnt_lv){_fnt_lv.destory();_fnt_lv=null;};
			if(_fnt_paiming_num){_fnt_paiming_num.destory();_fnt_paiming_num=null;};
			if(_fnt_zhanli_num){_fnt_zhanli_num.destory();_fnt_zhanli_num=null;};
			if(_mc_bg){_mc_bg=null;};
			if(_thumb){_thumb.destory();_thumb=null;};
		}
		protected override function registerEvent():void
		{
			
		}
		private function setMyHeroShow():void
		{
			var leitaiModel:LeitaiModel=Context.getInjectInstance(LeitaiModel);
			var leitaiInfo:LeitaiVO=leitaiModel._leitaiVo;			
			_fnt_paiming_num.text=leitaiInfo.myRank.toString();
			
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			_fnt_player_name.text=GLBaseData.userName;
			_fnt_lv.text=Util.getLanguage("帮会等级显示",userModel.userVo.userLevel);
			_mc_bg.gotoAndStop(1);
			var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
			_fnt_zhanli_num.text=heroModel.heroZhandouli.toString();
			_thumb.initModule();
			_thumb.loadAppearance(heroModel.appearance,heroModel.color,XMLDataManager.getGunById(heroModel.mainGunId).gun_appearence);
			_pos_touxiang.addChild(_thumb.display);
			_thumb.display.y=_pos_touxiang.rect.bottom;//_pos_man.rect.y+_pos_man.rect.height;
			_thumb.display.x=(_pos_touxiang.rect.left+_pos_touxiang.rect.right)/2;
		}
		private function setEnemyHeroShow():void
		{
			var leitaiModel:LeitaiModel=Context.getInjectInstance(LeitaiModel);
			var data:ViewData_LeitaiPlayer=leitaiModel.otherPlayerData;
			_fnt_player_name.text=data.battlePerson.userName;
			_fnt_paiming_num.text=data.battlePerson.userRank.toString();
			_fnt_zhanli_num.text=data.battlePerson.fightPoint.toString();
			_fnt_lv.text=Util.getLanguage("帮会等级显示",data.battlePerson.userLevel);
			_mc_bg.gotoAndStop(2);
			_thumb.initModule();
			_thumb.loadAppearance(data.moveFrame,data.Colors,XMLDataManager.getGunById(data.gunId).gun_appearence);
			_pos_touxiang.addChild(_thumb.display);
			_thumb.display.y=_pos_touxiang.rect.bottom;//_pos_man.rect.y+_pos_man.rect.height;
			_thumb.display.x=(_pos_touxiang.rect.left+_pos_touxiang.rect.right)/2;
			_thumb.display.scaleX=-1;
		}
		public function setType($dataType:int):void
		{
			m_type=$dataType;
			setShow();
		}
		protected override function setShow():void
		{
			if(m_type==MyHero)
			{
				setMyHeroShow();
			}
			else
			{
				setEnemyHeroShow();
			}
		}
		public override function destory():void
		{
			destroyMc();
			super.destory();
		}
		private function get mcMaterial():mc_fight_player
		{
			return m_mc as mc_fight_player;
		}
	}
}