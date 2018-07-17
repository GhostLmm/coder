package ui.window.huodong
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.HuodongControlModel;
	import com.fish.modules.core.models.RewardsPackData;
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_huodong_lv;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	
	import core.WindowManager;
	
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollController;
	import ui.window.CommonRewardWindow;
	import ui.window.huodong.items.IHuodongItem;
	import ui.window.huodong.items.Item_Chongji_ChongjiHuodongItem;
	
	import util.GameTime;
	import util.Util;
	
	import view.Base_Item;
	import view.CommonControlFun;
	import view.viewData.HuodongData;

	public class Item_Huodong_Chongji_HuodongWindow extends Base_Item implements IHuodongItem
	{
		public var _fnt_daojishi:FontField;
//		public var _fnt_huodongshijian:FontField;
		
		public var _pos_item_jiangli:Position;
		public var _scrollController:ScrollController;
		
		private var timerModel:TimerModel;
		private var huodongControlModel:HuodongControlModel;
		private var huodongData:HuodongData;
		
		public function Item_Huodong_Chongji_HuodongWindow()
		{
			super();
		}
		protected override function initModule():void
		{
			timerModel=Context.getInjectInstance(TimerModel);
			huodongControlModel=Context.getInjectInstance(HuodongControlModel);
			huodongData=huodongControlModel.getHuodongData(HuodongControlModel.HuodongType_Chongji);
			
			_fnt_daojishi=new FontField(itemMaterial.fnt_daojishi);
//			_fnt_huodongshijian=new FontField(itemMaterial.fnt_huodongshijian);
			
			_pos_item_jiangli=new Position(itemMaterial.pos_item_jiangli);
			_scrollController=new ScrollController(_pos_item_jiangli);
			_pos_item_jiangli.removeChildren();
			_pos_item_jiangli.addChild(_scrollController);
			
			_scrollController.initItemClass(Item_Chongji_ChongjiHuodongItem);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_OpenServerLvHandler)
			{
				if(_code==1)
				{
					var id:int=huodongControlModel.cacheLvLingquId;
					var xml:Node_huodong_lv=XMLDataManager.getHuodong_lvById(id);
					var param:RewardsPackData=new RewardsPackData();
					param.bouns_itmes=Util.createArrayJosnToMap(xml.item_id,xml.item_num);
//					param.bouns_item_id=JSON.parse(xml.item_id);
//					param.bouns_item_num=JSON.parse(xml.item_num);
					WindowManager.openOnlyWinodw(CommonRewardWindow,param);
					setShow();
					MDI_HuodongNew.updateIcon();
				}
			}
		}
		private function destoryMc():void
		{
			if(_fnt_daojishi){_fnt_daojishi.destory();_fnt_daojishi=null;};
//			if(_fnt_huodongshijian){_fnt_huodongshijian.destory();_fnt_huodongshijian=null;};
			
			if(_pos_item_jiangli){_pos_item_jiangli.destory();_pos_item_jiangli=null;};
		}
		protected override function registerEvent():void
		{
			timerModel.secondTimer_SN.add(onSecondTick);
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			setShow();
		}
		private function onSecondTick():void
		{
			var gameTime:GameTime=new GameTime(huodongData.huodongSwitchVo.endTime-timerModel.serverTime);
			_fnt_daojishi.text=gameTime.toStringDHMOrHMS();
		}
		protected override function setShow():void
		{
			var xmlList:Array=XMLDataManager.Node_huodong_lvArray;
			_scrollController.setData(xmlList);
			var beginTime:String=CommonControlFun.timeToYMR(huodongData.huodongSwitchVo.startTime);
			var endTime:String=CommonControlFun.timeToYMR(huodongData.huodongSwitchVo.endTime);
//			_fnt_huodongshijian.text=Util.getLanguage("活动开始结束时间",beginTime,endTime);
		}		
		public override function destory():void
		{
			timerModel.secondTimer_SN.remove(onSecondTick);
			timerModel=null;
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			destoryMc();
			super.destory();
		}
		private function get itemMaterial():flash.display.MovieClip  
		{
			return m_mc as flash.display.MovieClip;  
		}
		protected override function get itemClassName():Class
		{
			return Scene_Huodong_Chongji; 
		}
		
		private var _type:String;
		public function get type():String{
			return _type;
		}
		public function set type(value:String):void
		{
			_type=value;
		}
	}
}

