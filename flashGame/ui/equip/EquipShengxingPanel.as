package ui.equip
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.ItemModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.fish.modules.core.models.tempData.EquipGridData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.mc.ItemMc;
	import ui.mc.JiangliMc;
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.NumFontStatic;
	import ui.widget.Position;
	import ui.widget.ProgressManager;
	
	import util.Util;
	
	import view.CommonControlFun;
	import view.Panel_Base;
	
	public class EquipShengxingPanel extends Panel_Base
	{
		private var shengxingShuxing1:ShengxingShuxingBar;
		private var shengxingShuxing2:ShengxingShuxingBar;
		private var _pos_item:Position;
		private var _num_suipian:NumFontStatic;
		private var _prg_suipian:ProgressManager;
		private var _btn_add:Button;
		private var _btn_shengxing:Button;
		
		private var _pos_equip1:Position;
		private var _scn_addnum:NumFontStatic;
		
		private var _fnt_limit_qianghua:FontField;
		
		public function EquipShengxingPanel()
		{
			super();
		}
		public override function update():void{
			setShow();
		}
		protected override function get panelClassName():Class{
			return WindowEquipShengxing;
		}
		protected override function initModule():void{
			var mc:WindowEquipShengxing=material as WindowEquipShengxing;
			shengxingShuxing1=new ShengxingShuxingBar(mc.mc_shengxing1);
			shengxingShuxing2=new ShengxingShuxingBar(mc.mc_shengxing2);
			_pos_item=new Position(mc.pos_item);
			_num_suipian=new NumFontStatic(mc.num_suipian);
			_prg_suipian=new ProgressManager(mc.prg_suipian,_num_suipian);
			_btn_add=new Button(mc.btn_add);
			_btn_shengxing=new Button(mc.btn_shengxing);
			
			_pos_equip1=new Position(mc.pos_equip1);
			_scn_addnum=new NumFontStatic(mc.scn_addnum);
			_fnt_limit_qianghua=new FontField(mc.fnt_limit_qianghua);
		}
		protected override function registerEvent():void{
			addTargetEvent(_btn_add,TqtEvent.BUTTON_CLICK,onAddItemClick);
			addTargetEvent(_btn_shengxing,TqtEvent.BUTTON_CLICK,onShengxingClick);
			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(msType==C2SEmitter.REQ_EquipUpStarHandler){
				showShengxingMovie();
			}
		}
		
		
		private function showShengxingMovie():void{
			GlobalRef.stage.mouseChildren=false;
			var equipData:EquipData = (Context.getInjectInstance(MDI_EquipCaozuo) as MDI_EquipCaozuo).curEquipData;
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			var gridData:EquipGridData=bagModel.getEquipGridById(equipData.node.type);
			
			var itemObj:Object={};
			itemObj.key=ResourceConst.R_item;
			itemObj.xid=gridData.updateStar_itemId;
				
			Util.tweenFly(new ItemMc().loadData(XMLDataManager.getItemById(gridData.updateStar_itemId)),_scn_addnum,_pos_item,1,0.5,null,onFlyCom);
		}
		private function onFlyCom():void{
			setShow();
			Util.flow("升星成功提示");
			Music.playFX(Music.FX_succseshengxing);
			GlobalRef.stage.mouseChildren=true;
		}
		
		private function onAddItemClick(evt:Event):void{
			var equipData:EquipData = (Context.getInjectInstance(MDI_EquipCaozuo) as MDI_EquipCaozuo).curEquipData;
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			var gridData:EquipGridData=bagModel.getEquipGridById(equipData.node.type);
			
//			var node:Node_equip_star=XMLDataManager.getEquip_starById(gridData.lv_xing+1);
//			if(node==null ){
//				node=XMLDataManager.getEquip_starById(gridData.lv_xing);
//			}
//			var needItem:Array=JSON.parse(node["type_"+gridData.id] ) as Array;
			CommonControlFun.gotoGetItemMapSelectWindow(gridData.updateStar_itemId);
		}
		private var testAdd:int=0;
		private function onShengxingClick(evt:Event):void{
			var equipData:EquipData = (Context.getInjectInstance(MDI_EquipCaozuo) as MDI_EquipCaozuo).curEquipData;
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			var re:JudgeResult=bagModel.couldUpdateStart(equipData.node.type);
			var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
			if(re.success){
				
				C2SEmitter.updateStarEquip(equipData.id,equipData.node.type,heroModel.heroId);
			}else{
				if(re.code==JudgeResult.CD_HasOverLimit || re.code==JudgeResult.CD_OtherHanlder){
					Util.flow(re.desc);
				}else if(re.code==JudgeResult.CD_CailiaoNotEnough){
					WindowManager.openAlert(Util.getLanguage("升星item不足"),CommonControlFun.gotoGetItemMapSelectWindow,[re.data]);
				}
			}
			
		}
		
		private function testShowStar():void{
			testAdd++;
			var equipData:EquipData = (Context.getInjectInstance(MDI_EquipCaozuo) as MDI_EquipCaozuo).curEquipData;
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			var gridData:EquipGridData=bagModel.getEquipGridById(equipData.node.type);
			shengxingShuxing2.loadData(gridData.lv_xing+testAdd,gridData.id,equipData.node);
		}
	
		public override function clear():void{
			if(_fnt_limit_qianghua) {_fnt_limit_qianghua.destory();_fnt_limit_qianghua=null;}
			if(shengxingShuxing1) {shengxingShuxing1.destory(); shengxingShuxing1=null;}
			if(shengxingShuxing2) {shengxingShuxing2.destory(); shengxingShuxing2=null;}
			if(_pos_item) {_pos_item.destory(); _pos_item=null;}
			if(_num_suipian) {_num_suipian.destory(); _num_suipian=null;}
			if(_prg_suipian) {_prg_suipian.destory(); _prg_suipian=null;}
			if(_btn_add) {_btn_add.destory(); _btn_add=null;}
			if(_btn_shengxing) {_btn_shengxing.destory(); _btn_shengxing=null;}
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			
			if(_pos_equip1) {_pos_equip1.destory();_pos_equip1=null;}
			if(_scn_addnum) {_scn_addnum.destory();_scn_addnum=null;}
			GlobalRef.stage.mouseChildren=true;
			super.clear();
		}
		
		
		protected override function setShow():void{
			var equipData:EquipData = (Context.getInjectInstance(MDI_EquipCaozuo) as MDI_EquipCaozuo).curEquipData;
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			var gridData:EquipGridData=bagModel.getEquipGridById(equipData.node.type);
			
			shengxingShuxing1.loadData(gridData.lv_xing,gridData.id,equipData.node);
			
			_pos_equip1.fillWithObject(new ItemMc().loadData(equipData));
			_scn_addnum.text=gridData.lv_xing.toString();
			
			if(gridData.hasNextLevel_star()){
				shengxingShuxing2.loadData(gridData.lv_xing+1,gridData.id,equipData.node);
			}else{
				shengxingShuxing2.loadData(gridData.lv_xing,gridData.id,equipData.node);
			}
			
			var itemObj:Object={};
			itemObj.key=ResourceConst.R_item;
			itemObj.xid=gridData.updateStar_itemId;
			
			_pos_item.fillWithObject(new JiangliMc().loadData(itemObj));
			
			var itemModel:ItemModel=Context.getInjectInstance(ItemModel);
			_prg_suipian.devider=gridData.updateStar_itemNum;
			_prg_suipian.progress=itemModel.getItemNumById(gridData.updateStar_itemId);
			
			
			_fnt_limit_qianghua.text=Util.getLanguage("升星强化等级限制",gridData.node_star.qianghua_limit);
			
			_fnt_limit_qianghua.visible=(gridData.lv_bianqiang<gridData.node_star.qianghua_limit);
			
			
			
		}
		
	}
}