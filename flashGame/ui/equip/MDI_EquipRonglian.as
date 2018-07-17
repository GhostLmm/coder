package ui.equip
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.RewardsPackData;
	import com.fish.modules.core.models.UserModel;
	import com.fish.modules.core.models.VipModel;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_equip_ronglian;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TimelineMax;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.widget.Position;
	import ui.window.CommonRewardWindow;
	
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_EquipRonglian extends Mediator
	{
		[Inject]
		public var wm:EquipRonglianWindow;
		[Inject]
		public var equipModel:EquipModel;
		[Inject]
		public var userModel:UserModel;
		[Inject]
		public var vipModel:VipModel;
		
		private var equipDatas:Array;
		private var selectDataArray:Array;
		private var selectItems:Array;
		
		private var timeLine:TimelineMax;
		
		private var ronglianResultEids:Array;
		private var getRonglian:int;
		
		
		
		public function MDI_EquipRonglian()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
//			Item_Equip.showSelect=false;
			
//			showRight();
			wm._fnt_ronglianzhi.text="";
			wm._fnt_ronglianzhi_vip.text="";
			
			wm.tweenCom_SN.addOnce(tweenCom);
		}
		
		
		private function tweenCom():void{
			selectItems=[];
			selectDataArray=[];
			for each(var pos:Position in wm._posArray){
				var item:RonglianSelectItem=new RonglianSelectItem(pos);
				item.tapSn.add(onTapItem);
				selectItems.push(item);
				selectDataArray.push(null);
			}
			
			wm._scr_equip.initClass(EquipSelectItem);
			
			equipDatas=getEquipArray_NotArmy_NotShenzhuang();
			
			
			
			sortEquipData();
			wm._scr_equip.setData(equipDatas,0,true);
			
			showRight();
			wm._btn_qianwang.visible=CommonControlFun.isInZhucheng()
			
			
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			//			addViewListener(wm._scr_equip,TqtEvent.SCROLL_SELECTED,onScrSelected);
			addViewListener(wm._btn_queding,TqtEvent.BUTTON_CLICK,onClickOk);
			addViewListener(wm._btn_tianjia,TqtEvent.BUTTON_CLICK,onClickTianjia);
			addViewListener(wm._btn_qianwang,TqtEvent.BUTTON_CLICK,onQianwang);
			
			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		
		private function getEquipArray_NotArmy_NotShenzhuang():Array{
			var re:Array=[];
			for each(var data:EquipData in equipModel.getNotArmyEquipDatas()){
				if(!data.hasShenzhuang()){
					re.push(data);
				}
			}
			return re;
		}
		
		private function resetShow():void{
			for (var index:int=0 ; index<selectDataArray.length; index++){
				selectDataArray[index]=null;
			}
			equipDatas=getEquipArray_NotArmy_NotShenzhuang();
			sortEquipData();
			wm._scr_equip.setData(equipDatas,0,false,true);
			
			showRight();
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(msType==C2SEmitter.REQ_EquipRonglianHandler){
				ronglianResultEids=[];
				if(GameVOManager.getInstance().extrdata && GameVOManager.getInstance().extrdata.ronglianEquipids){
					ronglianResultEids=JSON.parse(GameVOManager.getInstance().extrdata.ronglianEquipids) as Array;
				}
				getRonglian=equipModel.calcEquipRonglian(selectDataArray);
				startShowMovie();
				Music.playFX(Music.FX_ronglian);
			}
			
		}
		
		private function startShowMovie():void{
			clearTimeLine();
			wm.mouseEnabled=false;
			wm.mouseChildren=false;
//			TweenMax.
			timeLine=new TimelineMax({onComplete:showComplete});
			var tweens:Array=[];
			for each(var item:RonglianSelectItem in selectItems){
				if(item.getItemMC()!=null){
					tweens.push(Util.tweenFly(item.getItemMC(),wm._scn_ronglian));
				}
			}
			timeLine.appendMultiple(tweens,0,"normal",0.1);
		}
		
		private function showComplete():void{
			if(wm){
				wm.mouseChildren=true;
				wm.mouseEnabled=true;
				clearTimeLine();
				resetShow();
			}
			if(ronglianResultEids.length>0){
				var pack:RewardsPackData=new RewardsPackData();
				pack.bouns_equips={};
				for each(var xid:int in ronglianResultEids){
//					var data:EquipData=equipModel.getEquipById(eid);
					pack.bouns_equips[xid]=1;
				}
				pack.bouns_ronglian=getRonglian;
				WindowManager.openOnlyWinodw(CommonRewardWindow,pack);
//				Util.flow("熔炼成功并获得装备提示",getRonglian);
			}else{
				Util.flow("熔炼成功提示",getRonglian);
			}
		}
		
		private function clearTimeLine():void{
			if(timeLine){
				timeLine.stop();
				timeLine=null;
			}
		}
		
		private function sortEquipData():void{
			equipDatas.sort(compare);
			for(var index:int=0; index<equipDatas.length; index++){
				(equipDatas[index] as EquipData).tempIndex=index;
				(equipDatas[index] as EquipData).tempSelected=false;
			}
			
		}
		
		private function compare(A:EquipData,B:EquipData):int{
			var va:int;
			var vb:int;
			
			if(A.node.star>B.node.star){
				va+=100;
			}
			if(A.node.star<B.node.star){
				vb+=100;
			}
			if(A.node.id>B.node.id){
				va+=10;
			}
			if(A.node.id<B.node.id){
				vb+=10;
			}
			if(A.zandouliData.baseZandouli>B.zandouliData.baseZandouli){
				va+=1;
			}
			if(A.zandouliData.baseZandouli<B.zandouliData.baseZandouli){
				vb+=1;
			}
			
			return va-vb;
		}
		
		
		private function onTapItem(data:EquipData):void{
			if(data){
				var index:int=selectDataArray.indexOf(data);
				selectDataArray[index]=null;
				data.tempSelected=false;
//				sortEquipData();
				wm._scr_equip.setData(equipDatas);
				showRight();
			}
		}
		
		private function onClickOk(evt:Event):void{
//			startShowMovie();
//			return ;
			if(getIdleNum()==selectItems.length){
				Util.flow("请先选择熔炼装备提示");
			}else{
				var re:JudgeResult=equipModel.couldRonglian(selectDataArray);
				if(re.success){
					var idList:Array=[];
					var hasStar5:Boolean=false;
					for each(var data:EquipData in selectDataArray){
						if(data!=null){
							if(data.node.star>=5){
								hasStar5=true;
							}
							idList.push(data.id);
						}
					}
					// 如果有5星的装备 就提示
					if(hasStar5){
						WindowManager.openAlert(Util.getLanguage("熔炼五星装备提示"),C2SEmitter.ronglianWuqi,[idList]);
					}else{
						C2SEmitter.ronglianWuqi(idList);
					}
					
					
				}else{
					Util.flow(re.desc);
				}
				
			}
		}
		
		
		private function onClickTianjia(evt:Event):void{
			if(getIdleNum()==0){
				trace("选项已经满了，无法再次添加");
				Util.flow("熔炼装备填满提示");
				return ;
			}
			if(getIdleNum()>0){
				selectEquipsToRonglian(equipDatas);
				wm._scr_equip.setData(equipDatas);
				showRight();
			}
		}
		
		private function onQianwang(evt:Event):void{
			
			wm.close();
			CommonControlFun.gotoQiyuanta();
		}
		
		public function onScrSelected(selectIndex:int):void{
			
//			var selectIndex:int=evt.data.index;
			var equipData:EquipData=equipDatas[selectIndex];
			if(!equipData.tempSelected){
				if(getIdleNum()==0){
					trace("选项已经满了，无法再次添加");
					Util.flow("熔炼装备填满提示");
					return ;
				}
				
				var euips:Array=[equipData];
//				equipData.tempSelected=true;
				selectEquipsToRonglian(euips);
				wm._scr_equip.setData(equipDatas);
				showRight();
			}else{
				equipData.tempSelected=false;
				var index:int=selectDataArray.indexOf(equipData);
				if(index>=0){
					selectDataArray[index]=null;
				}
				wm._scr_equip.setData(equipDatas);
				showRight();
			}
			
		}
		
		private function selectEquipsToRonglian(equips:Array):void{
			var equipIndex:int=0;
			for(var index:int=0; index<selectDataArray.length; index++){
				if(selectDataArray[index]==null){
//					if(equips.length>equipIndex){
//						selectDataArray[index]=equips[equipIndex];
//						
//					}else{
//						break;
//					}
					while(true){
						if(equips.length>equipIndex){
							var data:EquipData=equips[equipIndex];
							if(data.tempSelected==false){
								selectDataArray[index]=data;
								data.tempSelected=true;
								equipIndex++;
								break;
							}else{
								equipIndex++;
							}
						}else{
							break;
						}
					}
					
				}
			}
		}
		
		private function getIdleNum():int{
			var re:int=0;
			for(var index:int=0; index<selectDataArray.length; index++){
				if(selectDataArray[index]==null){
					re++;
				}
			}
			return re;
		}
		
		private function showRight():void{
			wm._scn_ronglian.num=userModel.userVo.userRonglian;
			
			var ronglianValue:int=0;
			for(var index:int=0; index<6; index++){
				var item:RonglianSelectItem=selectItems[index];
				var equipData:EquipData=selectDataArray[index];
				item.loadData(selectDataArray[index]);
				if(equipData && equipData.tempSelected ){
					var ronglianNode:Node_equip_ronglian=XMLDataManager.getEquip_ronglianById(equipData.node.star);
					if(ronglianNode){
						ronglianValue+=ronglianNode.rongglian_num;
					}
				}
			}
			
			if(ronglianValue>0){
				wm._mc_ronglianzhi.visible=true;
				wm._fnt_ronglianzhi.text=ronglianValue.toString();
				if(vipModel.couldAddRonglian){
					wm._fnt_ronglianzhi_vip.text="+"+int(ronglianValue*vipModel.ronglianLv).toString();
				}else{
					wm._fnt_ronglianzhi_vip.text="";
				}
			}else{
				wm._mc_ronglianzhi.visible=false;
			}
		}
		
		public override function destroy():void
		{
			// todo
			wm.tweenCom_SN.remove(tweenCom);
			if(selectItems){
				for each(var item:RonglianSelectItem in selectItems){
					item.destory();
				}
				selectItems=null;
			}
//			Item_Equip.showSelect=true;
			
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			super.destroy();
		}
	}
}