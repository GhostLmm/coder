package ui.window.huodong
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.HuodongVO;
	import com.fish.modules.core.models.HuoDongModel;
	import com.fish.modules.core.models.RewardsPackData;
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_canbai;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.mc.JiangliMc;
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.window.CommonRewardWindow;
	
	import util.Util;
	
	import view.Base_Item;

	public class Item_Huodong_CanbaiWindow extends Base_Item
	{
		private var _fnt_desc:FontField;
		private var _btn_time:FontField;
		private var _pos_item_image:Position;
		private var _btn_chongxing:Button;
		
		private var _huodongModel:HuoDongModel;
		private var _timerModel:TimerModel;
		
//		private var _lastVO:HuodongVO;
		
		public function Item_Huodong_CanbaiWindow()
		{
			super();
		}
		protected override function get itemClassName():Class
		{
			return ItemHuodongCanbai; 
		}
		private function get itemMaterial():flash.display.MovieClip 
		{
			return m_mc as flash.display.MovieClip; 
		}
		protected override function initModule():void
		{
			_fnt_desc=new FontField(itemMaterial.fnt_desc);
			_btn_time=new FontField(itemMaterial.btn_time);
			_pos_item_image=new Position(itemMaterial.pos_item_image);
			_btn_chongxing=new Button(itemMaterial.btn_chongxing);
			_huodongModel=Context.getInjectInstance(HuoDongModel);
			_timerModel=Context.getInjectInstance(TimerModel);
		}
		private function destoryMc():void
		{
			
		}
		protected override function registerEvent():void
		{
			_timerModel.secondTimer_SN.add(upeateShow);
			
			S2CHanlder.instance.Opt_Message_SN.add(onMessage);
			addTargetEvent(_btn_chongxing,TqtEvent.BUTTON_CLICK,onChongxingClick);
			addTargetEvent(_btn_chongxing,TqtEvent.BUTTON_CLICK_DISABLE,onChongxingDisable);
			setShow();
		}
		
		public override function destory():void
		{
			if(_timerModel){
				_timerModel.secondTimer_SN.remove(upeateShow);
				_timerModel=null;
			}
			if(_huodongModel){
				_huodongModel=null;
			}
			S2CHanlder.instance.Opt_Message_SN.remove(onMessage);
			super.destory();
		}
		
		private function onMessage(msType:String,code:int):void
		{
//			if(_lastVO==null){
//				_lastVO=_huodongModel.huodongVo.clone() as HuodongVO;
//			}
			var node:Node_canbai=XMLDataManager.getCanbaiById(_huodongModel.huodongVo.canbaiXid);
			if(msType==C2SEmitter.REQ_CanBaihandler){
				if(code==1){
					if(_huodongModel.huodongVo.canbaiDay>=node.day){
						var param:RewardsPackData=new RewardsPackData();
						
						param.bonus_money=node.reward_money;
						if(node.item>0){
							param.bouns_itmes={};
							param.bouns_itmes[node.item]=1;
						}
						if(node.equip>0){
							param.bouns_equips={};
							param.bouns_equips[node.equip]=1;
						}
						
//						param.bouns_item_id=node.item;
//						param.bouns_item_num=1;
//						param.bouns_pet_id=node.pet;
//						param.bouns_skill_id=node.skill;
//						param.bouns_equip_id=node.equip;
						WindowManager.openOnlyWinodw(CommonRewardWindow,param);
						
					}else{
						Util.flow("参拜成功",node.reward_money);
					}
				}else{
					Util.flow("已经参拜过了");
				}
				MDI_HuodongNew.updateIcon();
			}
			setShow();
		}
		
		protected override function setShow():void
		{
			var node:Node_canbai=XMLDataManager.getCanbaiById(_huodongModel.huodongVo.canbaiXid);
			var data:Object={};
			if(node.item>0){
				data.key=ResourceConst.R_item;
				data.xid=node.item;
				data.num=1;
			}else if(node.equip>0){
				data.key=ResourceConst.R_equip;
				data.xid=node.equip;
			}
			_pos_item_image.fillWithObject(new JiangliMc().loadData(data));
			
			_fnt_desc.text=node.desc;
			upeateShow();
		}
		
		private function upeateShow():void
		{
			var node:Node_canbai=XMLDataManager.getCanbaiById(_huodongModel.huodongVo.canbaiXid);
			_btn_time.text=_huodongModel.huodongVo.canbaiDay+"/"+node.day;
			_btn_chongxing.isEnabled=_huodongModel.couldCanbai();
		}
		
		private function onChongxingClick(evt:Event):void
		{
			Music.playFX(Music.FX_ChongXing);
			C2SEmitter.canbai();
		}
		private function onChongxingDisable(evt:Event):void
		{
			Util.flow("已经参拜过了");
		}
	}
}
