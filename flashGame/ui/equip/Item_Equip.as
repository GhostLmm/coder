package ui.equip
{
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.fish.modules.core.models.tempData.EquipGridData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import snake.GameUtil;
	
	import ui.mc.ItemMc;
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.NumFontScroll;
	import ui.widget.Position;
	
	import util.Util;
	
	import view.Base_Item;
	
	public class Item_Equip extends Base_Item implements IGridItemMax
	{
//		public static var showSelect:Boolean=true;
		
		private var _fnt_name:FontField;
		private var _pos_xiangqian:Position;
		private var _fnt_buwei:FontField;
		private var _scn_zhanli:NumFontScroll;
		private var _mc_bg:MovieClip;
		private var _fnt_chushipingfen:FontField;
		
		private var _mc_add_xingxi:MovieClip;
		private var _fnt_qianghua:FontField;
		private var _fnt_star_num:FontField;
		
		private var _pos_stars:Array;
		
		public function Item_Equip($mc:MovieClip=null)
		{
			super($mc);
		}
		protected override function get itemClassName():Class{
			return ItemEquipLeft;
		}
		protected override function initModule():void{
			_fnt_name=new FontField(m_mc.fnt_name);
			_pos_xiangqian=new Position(m_mc.pos_xiangqian);
			_fnt_buwei=new FontField(m_mc.fnt_buwei);
			
			_mc_add_xingxi=m_mc.mc_add_xingxi;
			
			_scn_zhanli=new NumFontScroll(_mc_add_xingxi.scn_zhanli);
			_fnt_qianghua=new FontField(_mc_add_xingxi.fnt_qianghua);
			_fnt_star_num=new FontField(_mc_add_xingxi.fnt_star_num);
			
			_pos_stars=[];
			for (var posIndex:int=1; posIndex<=5; posIndex++){
				var pos:Position=new Position(_mc_add_xingxi["pos_"+posIndex]);
				_pos_stars.push(pos);
			}
			
			_mc_bg=m_mc.mc_bg;
			_fnt_chushipingfen=new FontField(m_mc.fnt_chushipingfen);
			
			(Context.getInjectInstance(HeroModel) as HeroModel).heroAttrUpdate_SN.add(onHeroAttrUpdate);
			
			
		}
		private function onHeroAttrUpdate(oldZhanli:int):void{
			if(m_data && m_data is EquipData){
				_scn_zhanli.num=( m_data as EquipData).zandouliData.zhuangbeiZandouli;
			}
		}
		protected override function setShow():void{
			Util.setDiaplayButtonEffect(m_mc as Sprite,false);
			
			if(m_data is EquipData){
				var euipData:EquipData = m_data as EquipData;
				var equipModel:EquipModel=Context.getInjectInstance(EquipModel);
//				_fnt_name.text=euipData.node.name;
				Util.setItemName(_fnt_name,ResourceConst.R_equip,euipData.node.id);
				_pos_xiangqian.fillWithObject(new ItemMc().loadData(euipData));
				_fnt_buwei.text=Util.getBodyPartLanguage(euipData.node.type);
				_scn_zhanli.num=euipData.zandouliData.zhuangbeiZandouli;
				_fnt_chushipingfen.text=euipData.zandouliData.baseZandouli.toString();
				enable=true;
				
				if(euipData.hasArmy() || euipData.node.type>6){
					_mc_add_xingxi.visible=true;
					var gridData:EquipGridData = (Context.getInjectInstance(BagModel) as BagModel).getEquipGridById(euipData.node.type);
					_fnt_qianghua.text="+"+gridData.lv_bianqiang;
					_fnt_star_num.text=gridData.lv_xing.toString();
					var baoshiState:Object=gridData.getBaoshiStateObj();
					var posId:int=0;
					for each(var baoshiId:int in baoshiState){
						var pos:Position=_pos_stars[posId];
						pos.fillWithObject(new ItemMc().loadData(XMLDataManager.getBaoshiById(baoshiId)));
						posId++;
					}
					while(posId<_pos_stars.length){
						_pos_stars[posId].destory();
						posId++;
					}
				}else{
					_mc_add_xingxi.visible=false;
				}
				
			}
		}
		
		public override function destory():void{
			(Context.getInjectInstance(HeroModel) as HeroModel).heroAttrUpdate_SN.remove(onHeroAttrUpdate);
			Util.killDiaplayButtonEffect(m_mc as Sprite);
			if(_fnt_name) {_fnt_name.destory();_fnt_name=null;}
			if(_pos_xiangqian) {_pos_xiangqian.destory();_pos_xiangqian=null;}
			if(_fnt_buwei) {_fnt_buwei.destory();_fnt_buwei=null;}
			if(_scn_zhanli) {_scn_zhanli.destory();_scn_zhanli=null;}
			if(_fnt_chushipingfen) {_fnt_chushipingfen.destory();_fnt_chushipingfen=null;}
			_mc_add_xingxi=null;
			if(_fnt_qianghua) {_fnt_qianghua.destory();_fnt_qianghua=null;}
			if(_fnt_star_num) {_fnt_star_num.destory();_fnt_star_num=null;}
			if(_pos_stars){
				for each(var pos:Position in _pos_stars){
					pos.destory();
				}
				_pos_stars=null;
			}
			super.destory();
		}
		private var _enable:Boolean=true;
		private function updateState():void{
		
			if(_enable){
				
				if(_selected){
					_mc_bg.gotoAndStop(2);
				}else{
					_mc_bg.gotoAndStop(1);
				}
			}else{
				_mc_bg.gotoAndStop(3);
			}
			
			
		}
		public function set enable(value:Boolean):void
		{
			_enable=value;
			updateState();
		}
		
		public function get enable():Boolean
		{
			return _enable;
		}
		private var _selected:Boolean;
		public function set selected(value:Boolean):void
		{
			_selected=value;
			updateState();
		}
		
		public function get selected():Boolean
		{
			return _selected;
		}
		private var _index:int;
		public function set index(value:int):void
		{
			_index=value;
		}
		
		public function get index():int
		{
			return _index;
		}
		
		public function get data():Object
		{
			return m_data;
		}
		
		public function enterMovie():*
		{
			return null;
		}
	}
}