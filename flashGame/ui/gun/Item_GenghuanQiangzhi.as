package ui.gun
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.tempData.WuqiData;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import snake.ui.Mc_Gun;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.NumFontScroll;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	
	public class Item_GenghuanQiangzhi extends Base_Item implements IGridItemMax
	{
		private var _pos_mcgun:Position;
		private var _scn_zhanli:NumFontScroll;
		private var _fnt_chushipingfen:FontField;
		public var _btn_zhuqiang:Button;
//		private var _btn_fuqiang:Button;
		
		private var _mc_bg:MovieClip;
		
		
		public function Item_GenghuanQiangzhi($mc:MovieClip=null)
		{
			super($mc);
		}
		
		protected override function get itemClassName():Class{
			return ItemEquipGun;
		}
		
		protected override function setShow():void{
			var wuqiData:WuqiData=m_data as WuqiData;
			_pos_mcgun.fillWithObject(new Mc_Gun().loadData(wuqiData.node_gun));
			_scn_zhanli.num=wuqiData.zandouliData.zhuangbeiZandouli;
			_fnt_chushipingfen.text=wuqiData.zandouliData.baseZandouli.toString();
			_btn_zhuqiang.isSelected=wuqiData.isMainGun();
//			_btn_fuqiang.isSelected=wuqiData.isMinorGun();
			if(wuqiData.isMainGun()){
				_mc_bg.gotoAndStop(1);
			}else{
				_mc_bg.gotoAndStop(2);
			}
		}
		
		protected override function initModule():void{
			_pos_mcgun=new Position(m_mc.pos_mcgun);
			_scn_zhanli=new NumFontScroll(m_mc.scn_zhanli);
			_fnt_chushipingfen=new FontField(m_mc.fnt_chushipingfen);
			_btn_zhuqiang=new Button(m_mc.btn_zhuqiang);
//			_btn_fuqiang=new Button(m_mc.btn_fuqiang);
			_mc_bg=m_mc.mc_bg;
			_mc_bg.stop();
//			addTargetEvent(_btn_fuqiang,TqtEvent.BUTTON_CLICK,onClickFuqiang);
			addTargetEvent(_btn_zhuqiang,TqtEvent.BUTTON_CLICK,onClickZhuqiang);
		}
		
		/*private function onClickFuqiang(evt:Event):void{
			var wuqi:WuqiData = m_data as WuqiData;
			var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
			var re:JudgeResult;
			if(wuqi.isMinorGun()){
				re=heroModel.couldUnloadMinor(wuqi);
			}else{
				re=heroModel.couldArmyToMinor(wuqi);
			}
			
			if(re.success){
				if(re.needAlert){
					WindowManager.openAlert(Util.getLanguage(re.desc),clickFuqiangOk);
				}else{
					clickFuqiangOk();
				}
			}else{
				Util.flow(re.desc);
			}
				
		}*/
		
		/*private function clickFuqiangOk():void{
			var wuqi:WuqiData = m_data as WuqiData;
			var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
			if(wuqi.isMinorGun()){
				heroModel.mockUnload(wuqi);
			}else{
				heroModel.mockArmyMinor(wuqi);
			}
			resetShowGenghuan();
		}*/
		
		private function resetShowGenghuan():void{
			var mdi:MDI_GenghuanQiangzhi=Context.getInjectInstance(MDI_GenghuanQiangzhi);
			if(mdi){
				mdi.resetShow();
			}
		}
		
		private function onClickZhuqiang(evt:Event):void{
			
			var wuqi:WuqiData = m_data as WuqiData;
			if(!wuqi.isMainGun()){
				var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
				C2SEmitter.armyWuqi(wuqi.xid,[],heroModel.heroId);
			}
			/*var wuqi:WuqiData = m_data as WuqiData;
			var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
			var re:JudgeResult;
			if(wuqi.isMainGun()){
				re=heroModel.couldUnLoadMain(wuqi);
			}else{
				re=heroModel.couldArmyToMain(wuqi);
			}
			
			if(re.success){
				if(re.needAlert){
					WindowManager.openAlert(Util.getLanguage(re.desc),clickZhuqiangOK);
				}else{
					clickZhuqiangOK();
				}
			}else{
				Util.flow(re.desc);
			}*/
			
		}
		
		private function clickZhuqiangOK():void{
			/*var wuqi:WuqiData = m_data as WuqiData;
			var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
			if(wuqi.isMainGun()){
				heroModel.mockUnload(wuqi);
			}else{
				heroModel.mockArmyMain(wuqi);
			}
			resetShowGenghuan();*/
		}
		
		public override function destory():void{
			if(_pos_mcgun) {_pos_mcgun.destory(); _pos_mcgun=null;}
			if(_scn_zhanli) {_scn_zhanli.destory(); _scn_zhanli=null;}
			if(_fnt_chushipingfen) {_fnt_chushipingfen.destory(); _fnt_chushipingfen=null;}
			if(_btn_zhuqiang) {_btn_zhuqiang.destory(); _btn_zhuqiang=null;}
//			if(_btn_fuqiang) {_btn_fuqiang.destory(); _btn_fuqiang=null;}
		}
		
		public function set enable(value:Boolean):void
		{
		}
		
		public function get enable():Boolean
		{
			return false;
		}
		
		public function set selected(value:Boolean):void
		{
		}
		
		public function get selected():Boolean
		{
			return false;
		}
		
		public function set index(value:int):void
		{
		}
		
		public function get index():int
		{
			return 0;
		}
		
		public function get data():Object
		{
			return null;
		}
		
		public function enterMovie():*
		{
			return null;
		}
	}
}