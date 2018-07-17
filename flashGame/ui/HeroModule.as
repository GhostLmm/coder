package ui
{
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.fish.modules.core.models.tempData.WuqiData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import flashx.textLayout.debug.assert;
	
	import snake.PlayerThumb;
	
	import ui.gun.GenghuanqiangzhiWindow;
	import ui.gun.Item_Gun_Suo;
	import ui.widget.Button;
	import ui.widget.NumFontScroll;
	import ui.widget.PageController;
	import ui.widget.PageControllerWithButton;
	import ui.widget.Position;
	import ui.widget.ScrollController;
	import ui.widget.ScrollControllerMax;
	
	import util.Queue;

	public class HeroModule
	{
		private var mc:MovieClip;
		private var _scn_zhanli:NumFontScroll;
		private var _scn_lv:NumFontScroll;
		private var _bodyPosArray:Array;
		private var _pos_man:Position;
//		private var _scroll_gun:ScrollControllerMax;
		
		public var _btn_gunghuanzhuangbei:Button;
		
		
		private var _bodyParts:Array;
		
		private var _thumb:PlayerThumb;
		
		private var heroModel:HeroModel;
		
		private var _pos_item:Position;
//		private var _page_gun:PageControllerWithButton;
		private var _page_gun:PageControllerWithButton;
		
		public function HeroModule($mc:MovieClip)
		{
			mc=$mc;
			_scn_zhanli=new NumFontScroll(mc.scn_zhanli);
			_scn_lv=new NumFontScroll(mc.scn_lv);
			_bodyPosArray=[];
			_bodyParts=[];
			for(var index:int=1; index<=6; index++){
				var pos:Position=new Position(mc["pos_"+index]);
				_bodyPosArray.push(pos);
				var bodyPart:BodyPartItem=new BodyPartItem(pos);
				_bodyParts.push(bodyPart);
			}
			
			_pos_man=new Position(mc.pos_man);
			_pos_item=new Position(mc.pos_item);
			_page_gun=new PageControllerWithButton(_pos_item,mc.btn_left,mc.btn_right,ScrollControllerMax.HORIZONTAL);
//			_pos_item.addChild(_page_gun);
			_page_gun.initItemClass(Item_Gun_Suo);

			
			
			_btn_gunghuanzhuangbei=new Button(mc.btn_gunghuanzhuangbei);
			
			_thumb=new PlayerThumb();
			
			_btn_gunghuanzhuangbei.addEventListener(TqtEvent.BUTTON_CLICK,onClickGenghuan);
		}
		
		public function getPartyItemByGridId(gid:int):DisplayObject{
			if(gid<=6 && gid>0){
				return (_bodyParts[gid-1] as BodyPartItem).display;
			}
			return null;
		}
		
		private function onClickGenghuan(evt:Event):void{
			WindowManager.openOnlyWinodw(GenghuanqiangzhiWindow);
		}
		
		private function setShowWuqi():void{
//			var items:Queue=new Queue();
//			for each(var data:WuqiData in heroModel.getWuqiArray()){
//				var item:Item_Gun_Suo=new Item_Gun_Suo();
//				item.loadData(data);
//				items.push(item);
//			}
//			_page_gun.initItems(items);
			
			var gunArray:Array=heroModel.getWuqiArray().concat();
			gunArray.sort(compare);
			
			_page_gun.setData( gunArray);
			
		}
		
		private function compare(A:WuqiData,B:WuqiData):int{
			var va:int,vb:int;
			if(A.hasOwn()) va-=10000;
			if(B.hasOwn()) vb-=10000;
			
			va+=A.gunState*1000;
			vb+=B.gunState*1000;
			
			if(A.xid>B.xid){
				va+=10;
			}
			if(A.xid<B.xid){
				vb+=10;
			}
			return va-vb;
		}
		
		
		public function loadData():void{
			heroModel=Context.getInjectInstance(HeroModel);
			heroModel.heroAttrUpdate_SN.add(onUpdateHeroAttr);
			setShow();
		}
		
		private function onUpdateHeroAttr(oldZhanli:int):void{
			_scn_zhanli.num=heroModel.heroZhandouli;
		}
		
		public function initHeroThumb():void{
			heroModel.wuqiGenghuan_SN.add(onWuqiGenghuan);
			_thumb.initModule();
			_thumb.loadAppearance(heroModel.appearance,heroModel.color,XMLDataManager.getGunById(heroModel.mainGunId).gun_appearence);
//			TimerModel.instance.frame_SN.add(onFrame);
//			_pos_man.fillWithObject(_thumb.display);
			_pos_man.addChild(_thumb.display);
			_thumb.display.y=_pos_man.rect.bottom;//_pos_man.rect.y+_pos_man.rect.height;
			_thumb.display.x=(_pos_man.rect.left+_pos_man.rect.right)/2;
		}
		
		private function onWuqiGenghuan():void{
			reloadPlayThumb();
			setShowWuqi();
		}
		
		public function reloadPlayThumb():void{
			_thumb.loadAppearance(heroModel.appearance,heroModel.color,XMLDataManager.getGunById(heroModel.mainGunId).gun_appearence);
		}
		
		private function onFrame(v:*):void{
			_thumb.followEye(new Point(GlobalRef.stage.mouseX,GlobalRef.stage.mouseY));
		}
		
		
		private function setShow():void{
			_scn_lv.num=heroModel.heroVo.level;
			_scn_zhanli.num=heroModel.heroZhandouli;
			
			var weaps:Dictionary=heroModel.getEquipDataDic();
			for(var index:int=1; index<=6; index++){
				var equipData:EquipData=weaps[index];
				var bodyPart:BodyPartItem=_bodyParts[index-1];
				bodyPart.loadData(index,equipData);
			}
			
			setShowWuqi();
			
//			_page_gun.setData(heroModel.getWuqiArray());
//			_scroll_gun.setData(heroModel.getGunEquipList());
			
//			_scroll_gun.setData((Context.getInjectInstance(EquipModel) as EquipModel).getGunArray() );
		}
		
		
		public function destory():void{
			heroModel.wuqiGenghuan_SN.remove(onWuqiGenghuan);
			heroModel.heroAttrUpdate_SN.remove(onUpdateHeroAttr);
			if(_scn_zhanli) {_scn_zhanli.destory(); _scn_zhanli=null;}
			if(_scn_lv) {_scn_lv.destory(); _scn_lv=null;}
			if(_pos_man) {_pos_man.destory(); _pos_man=null;}
			if(_pos_item) {_pos_item.destory(); _pos_item=null;}
//			if(_scroll_gun) {_scroll_gun.destory();_scroll_gun=null;}
			if(_bodyPosArray){
				for each(var pos:Position in _bodyPosArray){
					pos.destory();
				}
				_bodyPosArray=null;
			}
			if(_bodyParts){
				for each(var part:BodyPartItem in _bodyParts){
					part.destory();
				}
				_bodyParts=null;
			}
			if(_btn_gunghuanzhuangbei) {_btn_gunghuanzhuangbei.removeEventListener(TqtEvent.BUTTON_CLICK,onClickGenghuan);_btn_gunghuanzhuangbei.destory();_btn_gunghuanzhuangbei=null;}
			if(_pos_item) {_pos_item.destory();_pos_item=null;}
			if(_page_gun) {_page_gun.destory(); _page_gun=null;}
		}
		
		
		
	}
}
import com.fish.modules.core.models.BagModel;
import com.fish.modules.core.models.tempData.EquipData;
import com.fish.modules.core.models.tempData.EquipGridData;
import com.ghostlmm.lightMVC.Context;

import com.ghostlmm.xmldata.Node_equip_type;
import com.ghostlmm.xmldata.XMLDataManager;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.events.Event;

import core.PlayerGuideManager;
import core.WindowManager;
import core.event.TQTTouchEvent;

import ui.equip.EquipOpenWindow;
import ui.mc.ItemMc;
import ui.widget.FontField;
import ui.widget.ImageBitmap;
import ui.widget.Position;

import util.Util;

class BodyPartItem{
//	private var _pos_bg:Position;
	private var _fnt_qianghua:FontField;
	private var _pos_item:Position;
	private var _mc_fnt:MovieClip;
	private var _pos_buwei:Position;
	private var _fnt_name:FontField;
	private var mc:McEquip;
	private var data:EquipData;
	private var _fnt_star:FontField;
	private var _mc_star:MovieClip;
	
	public function get display():DisplayObject{
		return mc;
	}
	
	public function BodyPartItem($pos:Position){
		
		mc=new McEquip();
		$pos.fillWithObject(mc);
//		_pos_bg=new Position(mc.pos_bg);
		_pos_item=new Position(mc.pos_item);
		_mc_fnt=mc.mc_fnt;
		_fnt_name=new FontField(_mc_fnt.fnt_name);
		_pos_buwei=new Position(_mc_fnt.mc_buwei);
		_fnt_qianghua=new FontField(mc.fnt_qianghua);
		_fnt_star=new FontField(mc.fnt_star);
		_mc_star=mc.mc_star;
		mc.addEventListener(TQTTouchEvent.TOUCH_TAP,onClick);
	}
	
	private function onClick(evt:Event):void{
		if(data){
			WindowManager.openOnlyWinodw(EquipOpenWindow,data);
			if(!Util.guideIsCompelete()){
				PlayerGuideManager.getInstance().createFadeButtonClick("bodyPartItem");
			}
		}
		
	}
	
	public function loadData(bodyType:int,equipData:EquipData):void{
		data=equipData;
		var node:Node_equip_type=XMLDataManager.getEquip_typeById(bodyType);
		
		
		
		
		if(equipData){
			if(node.id!=equipData.node.type){
				trace("");
			}
			_mc_fnt.visible=false;
			_pos_item.fillWithObject(new ItemMc().loadData(equipData));
//			_pos_bg.fillWithObject(new ImageBitmap("bg_zhuangbei_"+equipData.node.star));
			_pos_buwei.removeChildren();
			
			var gridData:EquipGridData=(Context.getInjectInstance(BagModel) as BagModel).getEquipGridById(bodyType);
			if(gridData.lv_xing>0){
				_fnt_star.text=gridData.lv_xing+"";
				_mc_star.visible=true;
			}else{
				_fnt_star.text="";
				_mc_star.visible=false;
			}
			if(gridData.lv_bianqiang>0){
				_fnt_qianghua.text="+"+gridData.lv_bianqiang;
				_fnt_qianghua.visible=true;
			}else{
				_fnt_qianghua.visible=false;
			}
			
		}else{
			_mc_fnt.visible=true;
			_pos_item.removeChildren();
//			_pos_bg.removeChildren();
			_pos_buwei.fillWithBitmapByClassName(node.icon);
			_fnt_name.text=node.name;
			
			_fnt_qianghua.visible=false;
			_mc_star.visible=false;
			_fnt_star.text="";
		}
	}
	
	public function destory():void{
//		if(_pos_bg) {_pos_bg.destory();_pos_bg=null;}
		if(_pos_item) {_pos_item.destory();_pos_item=null;}
		if(_fnt_name) {_fnt_name.destory();_fnt_name=null;}
		if(_pos_buwei) {_pos_buwei.destory();_pos_buwei=null;}
		if(_fnt_qianghua) {_fnt_qianghua.destory();_fnt_qianghua=null;}
		if(_fnt_star) {_fnt_star.destory();_fnt_star=null;}
		if(mc){
			mc.removeEventListener(TQTTouchEvent.TOUCH_TAP,onClick);
			mc=null;
		}
		_mc_fnt=null;
		
	}
}