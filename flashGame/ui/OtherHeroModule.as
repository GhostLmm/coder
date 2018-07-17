package ui
{
	import com.fish.modules.core.gameVO.PersondetailVO;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	
	import snake.PlayerThumb;
	
	import ui.widget.NumFontScroll;
	import ui.widget.Position;
	
	public class OtherHeroModule
	{
		public static const MaxNum:int=6;
		private var mc:MovieClip;
		private var _scn_zhanli:NumFontScroll;
		private var _scn_lv:NumFontScroll;
		private var _bodyPosArray:Array;
		private var _pos_man:Position;
		
		
		private var _bodyParts:Array;
		
		private var _thumb:PlayerThumb;
		
		private var _pos_item:Position;
		
		public function OtherHeroModule($mc:MovieClip)
		{
			mc=$mc;
			_scn_zhanli=new NumFontScroll(mc.scn_zhanli);
			_scn_lv=new NumFontScroll(mc.scn_lv);
			_bodyPosArray=[];
			_bodyParts=[];
			for(var index:int=1; index<=6; index++){
				var pos:Position=new Position(mc["pos_"+index]);
				_bodyPosArray.push(pos);
				var bodyPart:BodyPartItemOther=new BodyPartItemOther(pos);
				_bodyParts.push(bodyPart);
			}
			
			_pos_man=new Position(mc.pos_man);
			_pos_item=new Position(mc.pos_item);
			
			_thumb=new PlayerThumb();
			_thumb.initModule();
			_pos_man.addChild(_thumb.display);
			_thumb.display.y=_pos_man.rect.bottom;
			_thumb.display.x=(_pos_man.rect.left+_pos_man.rect.right)/2;
		}
		
		public function getPartyItemByGridId(gid:int):DisplayObject{
			if(gid<=6 && gid>0){
				return (_bodyParts[gid-1] as BodyPartItemOther).display;
			}
			return null;
		}
		
		private function setShowWuqi():void{
			_pos_item.fillWithObject(new OtherGunSuo().loadData(_data.gunData));
		}
		
		private var _data:PersonDetailData;
		public function loadData($data:PersondetailVO):void{
			_data=new PersonDetailData($data);
			setShow();
		}
		private function setShow():void{
			_scn_lv.num=_data.userLevel;
			_scn_zhanli.num=_data.fightPoint;
			setImageShow();
			showEquip();
			setShowWuqi();
		}
		private function setImageShow():void
		{
			_thumb.loadAppearance(_data.moveFrame,_data.Colors,XMLDataManager.getGunById(_data.gunId).gun_appearence);
		}
		private function showEquip():void
		{
			var weaps:Array=_data.equipArray;
			for(var index:int=1; index<=6; index++){
				var equipData:OtherEquipData=weaps[index-1];
				var bodyPart:BodyPartItemOther=_bodyParts[index-1];
				bodyPart.loadData(index,equipData);
			}
		}
		
		public function destory():void{
			if(_scn_zhanli) {_scn_zhanli.destory(); _scn_zhanli=null;};
			if(_scn_lv) {_scn_lv.destory(); _scn_lv=null;};
			if(_pos_man) {_pos_man.destory(); _pos_man=null;};
			if(_pos_item) {_pos_item.destory(); _pos_item=null;};
			if(_bodyPosArray){
				for each(var pos:Position in _bodyPosArray){
					pos.destory();
				}
				_bodyPosArray=null;
			}
			if(_bodyParts){
				for each(var part:BodyPartItemOther in _bodyParts){
					part.destory();
				}
				_bodyParts=null;
			}
			if(_pos_item) {_pos_item.destory();_pos_item=null;};
		}
		
		
		
	}
}
import com.ghostlmm.xmldata.Node_gun;

import snake.ui.Mc_Gun;

import view.Base_Item;

internal class OtherGunSuo extends Base_Item{
	private var _pos_item:Position;
	private var _mc_suo:MovieClip;
	
	private var _fnt_qianghua:FontField;
	private var _fnt_star:FontField;
	private var _mc_star:MovieClip;
	
	
	public function OtherGunSuo()
	{
		
	}
	protected override function initModule():void
	{
		_pos_item=new Position(itemMaterial.pos_item);
		_mc_suo=itemMaterial.mc_suo;
		_fnt_qianghua=new FontField(itemMaterial.fnt_qianghua);
		_fnt_star=new FontField(itemMaterial.fnt_star);
		_mc_star=itemMaterial.mc_star;
		
	}
	private function destroyMc():void
	{
		if(_pos_item){_pos_item.destory();_pos_item=null;};
		if(_fnt_qianghua){_fnt_qianghua.destory();_fnt_qianghua=null;};
		if(_fnt_star){_fnt_star.destory();_fnt_star=null;};
		if(_mc_suo){_mc_suo=null;};
		if(_mc_star){_mc_star=null;};
	}
	protected override function registerEvent():void
	{
		
	}
	protected override function setShow():void
	{
		var nodeGun:Node_gun=XMLDataManager.getGunById(data.xid);
		_pos_item.fillWithObject(new Mc_Gun().loadData(nodeGun));
		_mc_suo.visible=false;
		if(data.star>0){
			_fnt_star.text=data.star+"";
			_mc_star.visible=true;
		}else{
			_fnt_star.text="";
			_mc_star.visible=false;
		}
		if(data.qianghua>0){
			_fnt_qianghua.text="+"+data.qianghua;
			_fnt_qianghua.visible=true;
		}else{
			_fnt_qianghua.visible=false;
		}
	}
	protected override function get itemClassName():Class
	{
		return McSuoGun;
	}
	private function get itemMaterial():McSuoGun
	{
		return m_mc as McSuoGun;
	}
	private function get data():OtherEquipData
	{
		return m_data as OtherEquipData;
	}
	
}


internal class OtherEquipData{
	public var xid:int;
	public var type:int;
	public var qianghua:int;
	public var star:int;
	
	public function OtherEquipData()
	{
		
	}
}

import com.fish.modules.core.gameVO.PersondetailVO;

import snake.GameUtil;

internal class PersonDetailData{
	
	public var vo:PersondetailVO;
	public static const MaxNum:int=6;
	public var equipArray:Array;
	public var gunData:OtherEquipData;
	
	public function PersonDetailData($vo:PersondetailVO)
	{
		vo=$vo;
		var xidObj:Object=JSON.parse(vo.xidStr);
		var qianghuaObj:Object=JSON.parse(vo.qianghuaStr);
		var starObj:Object=JSON.parse(vo.starStr);
		equipArray=[];
		var index:int;
		for(index=1;index<=MaxNum;index++)
		{
			var otherEquip:OtherEquipData=new OtherEquipData();
			otherEquip.type=index;
			otherEquip.xid=xidObj[index];
			otherEquip.qianghua=qianghuaObj[index];
			otherEquip.star=starObj[index];
			equipArray.push(otherEquip);
		}
		gunData=new OtherEquipData();
		gunData.xid=xidObj[vo.userGunId];
		gunData.star=starObj[vo.userGunId];
		gunData.qianghua=qianghuaObj[vo.userGunId];
	}
	public function get moveFrame():Array
	{
		return JSON.parse(vo.userMovieFrame) as Array;
	}
	public function get Colors():Array
	{
		return GameUtil.turnArryStringToUint(vo.userColors) as Array;
	}
	public function get userLevel():int
	{
		return vo.userLevel;
	}
	public function get fightPoint():int
	{
		return vo.fightPoint;
	}
	public function get gunId():int
	{
		return vo.userGunId;
	}
}


import com.ghostlmm.xmldata.Node_equip_type;
import com.ghostlmm.xmldata.XMLDataManager;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import ui.mc.ItemMc;
import ui.widget.FontField;
import ui.widget.Position;
import com.ghostlmm.xmldata.Node_equip;

internal class BodyPartItemOther{
	private var _fnt_qianghua:FontField;
	private var _pos_item:Position;
	private var _mc_fnt:MovieClip;
	private var _pos_buwei:Position;
	private var _fnt_name:FontField;
	private var mc:McEquip;
	private var data:OtherEquipData;
	private var _fnt_star:FontField;
	private var _mc_star:MovieClip;
	
	public function get display():DisplayObject{
		return mc;
	}
	
	public function BodyPartItemOther($pos:Position){
		
		mc=new McEquip();
		$pos.fillWithObject(mc);
		_pos_item=new Position(mc.pos_item);
		_mc_fnt=mc.mc_fnt;
		_fnt_name=new FontField(_mc_fnt.fnt_name);
		_pos_buwei=new Position(_mc_fnt.mc_buwei);
		_fnt_qianghua=new FontField(mc.fnt_qianghua);
		_fnt_star=new FontField(mc.fnt_star);
		_mc_star=mc.mc_star;
	}
	
	public function loadData(bodyType:int,equipData:OtherEquipData):void{
		data=equipData;
		
		var node:Node_equip_type=XMLDataManager.getEquip_typeById(bodyType);

		if(data.xid!=0){
			_mc_fnt.visible=false;
			var nodeEquip:Node_equip=XMLDataManager.getEquipById(data.xid);
			_pos_item.fillWithObject(new ItemMc().loadData(nodeEquip));
			_pos_buwei.removeChildren();
			
			
			if(data.star>0){
				_fnt_star.text=data.star+"";
				_mc_star.visible=true;
			}else{
				_fnt_star.text="";
				_mc_star.visible=false;
			}
			if(data.qianghua>0){
				_fnt_qianghua.text="+"+data.qianghua;
				_fnt_qianghua.visible=true;
			}else{
				_fnt_qianghua.visible=false;
			}
			
		}else{
			_mc_fnt.visible=true;
			_pos_item.removeChildren();
			_pos_buwei.fillWithBitmapByClassName(node.icon);
			_fnt_name.text=node.name;
			
			_fnt_qianghua.visible=false;
			_mc_star.visible=false;
			_fnt_star.text="";
		}
	}
	
	public function destory():void{
		if(_pos_item) {_pos_item.destory();_pos_item=null;}
		if(_fnt_name) {_fnt_name.destory();_fnt_name=null;}
		if(_pos_buwei) {_pos_buwei.destory();_pos_buwei=null;}
		if(_fnt_qianghua) {_fnt_qianghua.destory();_fnt_qianghua=null;}
		if(_fnt_star) {_fnt_star.destory();_fnt_star=null;}
		_mc_fnt=null;
		
	}
}