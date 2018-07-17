package ui.window.huodong
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.RewardsPackData;
	import com.fish.modules.core.models.ShoujiModel;
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_huodong_shouji_duihuan;
	import com.ghostlmm.xmldata.Node_huodong_shouji_npc;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.window.CommonRewardWindow;
	import ui.window.huodong.items.IHuodongItem;
	import ui.window.huodong.items.Item_shoujiDuihuan;
	
	import util.GameTime;
	import util.Util;
	
	import view.Base_Item;

	public class Item_Huodong_Shouji extends Base_Item implements IHuodongItem
	{
//		public var _btn_close:Button;
		public var _fnt_talk:FontField;
		public var _pos_duihuan_item:Position;
		public var _fnt_buqi_num:FontField;
		public var _scr_duihuan:ScrollControllerMax;
		public var _fnt_time:FontField;
		
		public var shoujiModel:ShoujiModel;
		public var timerModel:TimerModel;
		
		public function Item_Huodong_Shouji()
		{
			super();
		}
		
		private var _type:String;
		public function get type():String
		{
			return _type;
		}
		
		public function set type(value:String):void
		{
			_type=value;
		}
		
		protected override function initModule():void{
			shoujiModel=Context.getInjectInstance(ShoujiModel);
			timerModel=Context.getInjectInstance(TimerModel);
			
			var wm:flash.display.MovieClip=material; 
//			_btn_close=new Button(material.btn_close);
			_fnt_talk=new FontField(material.fnt_talk);
			_pos_duihuan_item=new Position(material.pos_duihuan_item);
			_fnt_buqi_num=new FontField(material.fnt_buqi_num);
			_scr_duihuan=new ScrollControllerMax(_pos_duihuan_item);
			_fnt_time=new FontField(material.fnt_time);
			
			
			_scr_duihuan.initClass(Item_shoujiDuihuan);
			
			
			
			
			
			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		
		protected override function registerEvent():void{
//			addTargetEvent(_btn_close,TqtEvent.BUTTON_CLICK,close);
			timerModel.secondTimer_SN.add(showLeaveTime);
			addTargetEvent(_fnt_talk,TQTTouchEvent.TOUCH_TAP,changeTalk);
		}
		
		protected override function setShow():void{
			showLeaveTime();
			
			
			changeTalk();
			
			_fnt_talk.mouseEnabled=true;
			setItemsData();
			setStaticInfo();
		}
		
		
		private function changeTalk(evt:Event=null):void{
			_fnt_talk.text=getRandomTalk();
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(code<0) return ;
			if(msType==C2SEmitter.REQ_ShoujiBuqi || msType==C2SEmitter.REQ_ShoujiDuihuan){
				setItemsData();
				setStaticInfo();
				changeTalk();
				MDI_HuodongNew.updateIcon();
			}
			if(msType==C2SEmitter.REQ_ShoujiBuqi){
				Util.flow("补齐成功");
				MDI_HuodongNew.updateIcon();
			}
			if(msType==C2SEmitter.REQ_ShoujiDuihuan){
				Util.flow("兑换成功");
				var collectId:int=c2s.yunying.collectId;
				showDuihuanReward(collectId);
				MDI_HuodongNew.updateIcon();
			}
		}
		
		private function setStaticInfo():void{
			_fnt_buqi_num.text=shoujiModel.getBuqiCount().toString();
		}
		
		private function setItemsData():void{
			_scr_duihuan.setData(shoujiModel.getShoujiItemData());
		}
		
		private function getRandomTalk():String{
			var talkArray:Array=XMLDataManager.Node_huodong_shouji_npcArray;
			var ran:int=(int(Math.random()*1000000))%talkArray.length;
			return (talkArray[ran] as Node_huodong_shouji_npc).desc;
		}
		
		/**
		 *   显示兑换结果 窗口
		 */
		public function showDuihuanReward(duihuanId:int):void{
			var node:Node_huodong_shouji_duihuan=XMLDataManager.getHuodong_shouji_duihuanById(duihuanId);
			if(node){
				var rewardData:RewardsPackData=new RewardsPackData();
				rewardData.itemObjArray=[{key:node.duihuan_type,num:node.duihuan_num,xid:node.duihuan_id}];
				WindowManager.openOnlyWinodw(CommonRewardWindow,rewardData);
			}
		}
		
		private function showLeaveTime():void{
			var gameTime:GameTime=new GameTime(shoujiModel.sellerLeaveTime-timerModel.serverTime);
			if(gameTime.miliSecond<0){
				gameTime.setMiliSeconds(0);
			}
			_fnt_time.text=gameTime.toStringDHMOrHMS();
		}
		
		
		public override function destory():void{
//			if(_btn_close) {_btn_close.destory();_btn_close=null;}
			timerModel.secondTimer_SN.remove(showLeaveTime);
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			
			if(_fnt_talk) {_fnt_talk.destory();_fnt_talk=null;}
			if(_pos_duihuan_item) {_pos_duihuan_item.destory();_pos_duihuan_item=null;}
			if(_fnt_buqi_num) {_fnt_buqi_num.destory();_fnt_buqi_num=null;}
			if(_scr_duihuan) {_scr_duihuan.destory();_scr_duihuan=null;}
			if(_fnt_time) {_fnt_time.destory();_fnt_time=null;}
			super.destory();
		}
		
		private function get material():flash.display.MovieClip{ 
			return m_mc as flash.display.MovieClip; 
		}
		protected override function get itemClassName():Class
		{
			return Scene_Huodong_Shouji; 
		}
		
	}
}
