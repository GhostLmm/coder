package ui.equip
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.ErrorCode;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.UserModel;
	import com.fish.modules.core.models.tempData.EquipAttrAttach;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.fish.modules.core.models.tempData.EquipGridData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_equipEnhance;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	import core.event.TqtEvent;
	
	import ui.mc.ItemMc;
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.NumFontStatic;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.widget.TextTipData;
	import ui.widget.TextTipItem;
	
	import util.Util;
	
	import view.CommonControlFun;
	import view.Panel_Base;
	
	public class EquipBianqiangPanel extends Panel_Base
	{
		private var _fnt_lv1:FontField;
		private var _fnt_shuxing1_1:FontField;
		private var _fnt_shuxing2_1:FontField;
		
		private var _fnt_lv2:FontField;
		private var _fnt_shuxing1_2:FontField;
		private var _fnt_shuxing2_2:FontField;
		
		private var _fnt_desc1:FontField;
		private var _fnt_desc2:FontField;
		
//		private var _fnt_gunping:TextField;
		
		private var _fnt_costmoney_num:FontField;
		private var _fnt_costitem_num:FontField;
		
		private var _btn_qianghuashici:Button;
		public var _btn_qianghua:Button;
		
		private var _mc_up1:MovieClip;
		private var _mc_up2:MovieClip;
		
		private var _mc_item:MovieClip;
		
		private var _startLv:int;
		private var _detail:Array;
		private var _datailIndex:int=0;
		
		private var _pos_scroll_fnt:Position;
		private var _scroll_tip:ScrollControllerMax;
		
		private var _tipArray:Array;
		private var _tipTimer:Timer;
		
		
		private var _pos_equip1:Position;
		private var _scn_zhanli:NumFontStatic;
		private var _fnt_limit_qianghua:FontField;
		
		public function EquipBianqiangPanel()
		{
			super();
			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(msType==C2SEmitter.REQ_EquipEhanceHandler){
				update();
				if(code>=0){
					if(GameVOManager.getInstance().equipgrid.modifyType==ErrorCode.CaozuoFailError){
						Util.flow("强化失败");
					}else{
						Util.flow("强化成功");
						Music.playFX(Music.FX_succseqianghua);
					}
				}
//				if(code==ErrorCode.CaozuoFailError){
//					Util.flow("强化失败");
//				}else{
//					Util.flow("强化成功");
//					Music.playFX(Music.FX_succseqianghua);
//				}
			}
			if(msType==C2SEmitter.REQ_EquipEhanceBatchHandler){
				if(code>=0){
					_detail=JSON.parse(GameVOManager.getInstance().extrdata.enhance10Deatial) as Array;
					startShow10Detail();
				}
				
			}
		}
		
		private function startShow10Detail():void{
			GlobalRef.stage.mouseChildren=false;
			_tipArray=[];
			_datailIndex=0;
			if(_tipTimer){
				_tipTimer.reset();
			}else{
				_tipTimer=new Timer(500);
			}
			addTargetEvent(_tipTimer,TimerEvent.TIMER,onTimer);
			onTimer();
			_tipTimer.start();
		}
		private function onTimer(evt:Event=null):void{
			
			if(_datailIndex>=_detail.length){
				stop10DetailShow();
			}else{
				var type:int=_detail[_datailIndex];
				var data:Object={};
				
				if(type==1){
					data.success=true;
					data.lv=_startLv;
					data.baodi=false;
					_startLv++;
				}
				if(type==11){
					data.success=false;
					data.lv=_startLv;
					data.baodi=false;
				}
				if(type==12){
					data.success=true;
					data.lv=_startLv;
					data.baodi=true;
					_startLv++;
				}
				_tipArray.push(data);
				_scroll_tip.setData(changeToTipdataArray(_tipArray));
				_scroll_tip.setSelectIndexOrData(_tipArray.length-1);
				var mdi:MDI_EquipCaozuo=Context.getInjectInstance(MDI_EquipCaozuo);
				showLv(mdi.curEquipData,_startLv);
				_datailIndex++;
				
				_fnt_desc1.visible=false;
				_fnt_desc2.visible=false;
				_scroll_tip.visible=true;
				
			}
		
		}
		
		private function changeToTipdataArray(array:Array):Array{
			var re:Array=[];
			for each(var data:Object in array){
				var success:Boolean=data.success;
				var dataIndex:int=data.index;
				var lv:int=data.lv;
				var baodi:Boolean=data.baodi;
				var tipData:TextTipData=new TextTipData();
				re.push(tipData);
				if(success){
					tipData.color=Util.getChengongColor();
					if(baodi){
						tipData.text=Util.getLanguage("强化十连成功保底提示",dataIndex,lv);
					}else{
						tipData.text=Util.getLanguage("强化十连成功提示",dataIndex,lv);
					}
					
					
				}else{
					tipData.color=Util.getShibaiColor();
					tipData.text=Util.getLanguage("强化十连失败提示",dataIndex,lv);
				}
			}
			return re;
		}
		
		private function stop10DetailShow():void{
			if(_tipTimer){
				_tipTimer.stop();
				_tipTimer=null;
			}
			setHeroLvLimit();
			GlobalRef.stage.mouseChildren=true;
//			setShow();
		}
		
		protected override function get panelClassName():Class{
			return SceneEquipQianghua;
		}
		
		public override function update():void{
			setShow();
		}
		
		private function showLv(equipData:EquipData,curLv:int):void{
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			var equipGrid:EquipGridData=bagModel.getEquipGridById(equipData.node.type);
			_scn_zhanli.text="+"+curLv;
			_fnt_lv1.text=Util.getLanguage("强化等级显示",XMLDataManager.getEquip_typeById(equipData.node.type).name,curLv);
			if(equipGrid.lv_bianqiang>=EquipGridData.maxBianqiangLv){
				_fnt_lv2.text=Util.getLanguage("强化等级显示",XMLDataManager.getEquip_typeById(equipData.node.type).name,curLv);
			}else{
				_fnt_lv2.text=Util.getLanguage("强化等级显示",XMLDataManager.getEquip_typeById(equipData.node.type).name,curLv+1);
			}
			
			
			var baseAttrArray:Array=EquipAttrAttach.getAttrArray(ResourceConst.R_item,equipData.xid);
			for (var index:int=0; index<2; index++){
				var fnt1:FontField=this["_fnt_shuxing"+(index+1)+"_"+1];
				var fnt2:FontField=this["_fnt_shuxing"+(index+1)+"_"+2];
				var mcUp:MovieClip=this["_mc_up"+(index+1)];
				
				if(baseAttrArray.length>index){
					fnt1.visible=true;
					fnt2.visible=true;
					mcUp.visible=true;
					fnt1.text=Util.getLanguage(baseAttrArray[index])+" : +"+EquipGridData.calcAttrAdd_Enhance(baseAttrArray[index],equipData.node[baseAttrArray[index]],curLv);
					if(equipGrid.lv_bianqiang>=EquipGridData.maxBianqiangLv){
						fnt2.text=Util.getLanguageAttrAdd(baseAttrArray[index],EquipGridData.calcAttrAdd_Enhance(baseAttrArray[index],equipData.node[baseAttrArray[index]],curLv));
//						fnt2.text=Util.getLanguage(baseAttrArray[index])+" : +"+EquipGridData.calcAttrAdd_Enhance(baseAttrArray[index],equipData.node[baseAttrArray[index]],curLv);
					}else{
						fnt2.text=Util.getLanguageAttrAdd(baseAttrArray[index],EquipGridData.calcAttrAdd_Enhance(baseAttrArray[index],equipData.node[baseAttrArray[index]],curLv+1));
//						fnt2.text=Util.getLanguage(baseAttrArray[index])+" : +"+EquipGridData.calcAttrAdd_Enhance(baseAttrArray[index],equipData.node[baseAttrArray[index]],curLv+1);
					}
					
				}else{
					fnt1.visible=false;
					fnt2.visible=false;
					mcUp.visible=false;
				}
			}
			
			var node:Node_equipEnhance=XMLDataManager.getEquipEnhanceById(curLv);
			_fnt_costmoney_num.text=node.money_price+"";
			_fnt_costitem_num.text=node.shitou_price+"";
			
			_mc_item.visible = (node.shitou_price>0);
		}
		
		protected override function setShow():void{
			var equipData:EquipData=(Context.getInjectInstance(MDI_EquipCaozuo) as MDI_EquipCaozuo).curEquipData;
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			var equipGrid:EquipGridData=bagModel.getEquipGridById(equipData.node.type);
			
			showLv(equipData,equipGrid.lv_bianqiang);
			
			var node:Node_equipEnhance=equipGrid.node_bianqiang;
			
			_fnt_desc1.text=Util.getLanguage("装备强化成功率提示",Math.round(node.qianghua_success*100));
			_fnt_desc2.text=Util.getLanguage("10次强化成功提示",node.baodi);
			
			_scroll_tip.visible=false;
			_fnt_desc1.visible=true;
			_fnt_desc2.visible=true;
//			_fnt_gunping.visible=false;
			
			_pos_equip1.fillWithObject(new ItemMc().loadData(equipData));
			
			
			setHeroLvLimit();
			
		}
		
		private function setHeroLvLimit():void{
			
			var equipData:EquipData=(Context.getInjectInstance(MDI_EquipCaozuo) as MDI_EquipCaozuo).curEquipData;
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			var equipGrid:EquipGridData=bagModel.getEquipGridById(equipData.node.type);
			_fnt_limit_qianghua.text=Util.getLanguage("强化人物等级限制",equipGrid.node_bianqiang.need_lv);
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			_fnt_limit_qianghua.visible=(userModel.userVo.userLevel<equipGrid.node_bianqiang.need_lv);
		}
		
		
		
		protected override function initModule():void{
			var mc:SceneEquipQianghua=material as SceneEquipQianghua;
			_fnt_lv1=new FontField(mc.fnt_lv1);
			_fnt_shuxing1_1=new FontField(mc.fnt_shuxing1_1);
			_fnt_shuxing2_1=new FontField(mc.fnt_shuxing2_1);
			_fnt_lv2=new FontField(mc.fnt_lv2);
			_fnt_shuxing1_2=new FontField(mc.fnt_shuxing1_2);
			_fnt_shuxing2_2=new FontField(mc.fnt_shuxing2_2);
			
			_fnt_desc1=new FontField(mc.fnt_desc1);
			_fnt_desc2=new FontField(mc.fnt_desc2);
			
			_mc_up1=mc.mc_up1;
			_mc_up2=mc.mc_up2;
			
			_mc_item=mc.mc_item;
			
//			_fnt_gunping=mc.fnt_gunping;
			
			_fnt_costmoney_num=new FontField(mc.fnt_costmoney_num);
			_fnt_costitem_num=new FontField(_mc_item.fnt_costitem_num);
			
			_btn_qianghuashici=new Button(mc.btn_qianghuashici);
			_btn_qianghua=new Button(mc.btn_qianghua);
			_btn_qianghua.name="btn_qianghua2";
			_pos_scroll_fnt=new Position(mc.pos_scroll_fnt);
			_scroll_tip=new ScrollControllerMax(_pos_scroll_fnt);
			_scroll_tip.initClass(TextTipItem);
			
			_pos_equip1=new Position(mc.pos_equip1);
			_scn_zhanli=new NumFontStatic(mc.scn_addnum);
			
			_fnt_limit_qianghua=new FontField(mc.fnt_limit_qianghua);
			
			addTargetEvent(_btn_qianghua,TqtEvent.BUTTON_CLICK,onClickBianqiang);
			addTargetEvent(_btn_qianghuashici,TqtEvent.BUTTON_CLICK,onClilkQianghua10);
		}
		private function onClilkQianghua10(evt:Event):void{
			
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			var equipData:EquipData=(Context.getInjectInstance(MDI_EquipCaozuo) as MDI_EquipCaozuo).curEquipData;
			var re:JudgeResult=bagModel.couldQianghuaEquipGrid10(equipData.node.type);
			
			
//			_startLv=bagModel.getEquipGridById(equipData.node.type).lv_bianqiang;
//			_detail=[1,1,11,12,1,1,1,1,1,1,11];
//			startShow10Detail();
//			return ;
			
			if(re.success){
				_startLv=bagModel.getEquipGridById(equipData.node.type).lv_bianqiang;
				C2SEmitter.enhanceEquip10(equipData.id,equipData.node.type,( (Context.getInjectInstance(HeroModel) as HeroModel).heroId ));
			}else{
				CommonControlFun.proccessJudgeResult(re);
			}
		}
		private function onClickBianqiang(evt:Event):void{
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			var equipData:EquipData=(Context.getInjectInstance(MDI_EquipCaozuo) as MDI_EquipCaozuo).curEquipData;
			var re:JudgeResult=bagModel.couldQianghuaEquipGrid(equipData.node.type);
			if(re.success){
				C2SEmitter.enhanceEquip(equipData.id,equipData.node.type,( (Context.getInjectInstance(HeroModel) as HeroModel).heroId ));
			}else{
				CommonControlFun.proccessJudgeResult(re);
			}
		}
		
		public override function clear():void{
			if(_tipTimer){
				_tipTimer.stop();
				_tipTimer=null;
			}
			_mc_up1=null;
			_mc_up2=null;
			_mc_item=null;
			GlobalRef.stage.mouseChildren=true;
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			if(_fnt_lv1) {_fnt_lv1.destory(); _fnt_lv1=null;}
			if(_fnt_shuxing1_1) {_fnt_shuxing1_1.destory(); _fnt_shuxing1_1=null;}
			if(_fnt_shuxing2_1) {_fnt_shuxing2_1.destory(); _fnt_shuxing2_1=null;}
			if(_fnt_lv2) {_fnt_lv2.destory(); _fnt_lv2=null;}
			if(_fnt_shuxing1_2) {_fnt_shuxing1_2.destory(); _fnt_shuxing1_2=null;}
			if(_fnt_shuxing2_2) {_fnt_shuxing2_2.destory(); _fnt_shuxing2_2=null;}
			if(_fnt_desc1) {_fnt_desc1.destory(); _fnt_desc1=null;}
			if(_fnt_desc2) {_fnt_desc2.destory(); _fnt_desc2=null;}
//			_fnt_gunping=null;
			if(_fnt_costmoney_num) {_fnt_costmoney_num.destory(); _fnt_costmoney_num=null;}
			if(_fnt_costitem_num) {_fnt_costitem_num.destory(); _fnt_costitem_num=null;}
			if(_btn_qianghuashici) {_btn_qianghuashici.destory(); _btn_qianghuashici=null;}
			if(_btn_qianghua) {_btn_qianghua.destory(); _btn_qianghua=null;}
			if(_scroll_tip) {_scroll_tip.destory(); _scroll_tip=null;}
			if(_pos_scroll_fnt) {_pos_scroll_fnt.destory();_pos_scroll_fnt=null;}
			
			if(_pos_equip1) {_pos_equip1.destory(); _pos_equip1=null;}
			if(_scn_zhanli) {_scn_zhanli.destory(); _scn_zhanli=null;}
			if(_fnt_limit_qianghua) {_fnt_limit_qianghua.destory();_fnt_limit_qianghua=null;}
			super.clear();
		}
		
	}
}