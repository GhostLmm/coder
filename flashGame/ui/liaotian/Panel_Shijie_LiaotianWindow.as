package ui.liaotian
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.ChatModel;
	import com.fish.modules.core.models.FriendModel;
	import com.fish.modules.core.models.ItemModel;
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.SoftKeyboardEvent;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.InputField;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	
	import util.Util;
	
	import view.CommonControlFun;
	import view.Panel_Base;
	import view.commontools.CheckBanWords;
	public class Panel_Shijie_LiaotianWindow extends Panel_Base
	{
		public static const RefreshTime:int=5;
		
		public static const MaxInputNum:int=50;
		
		public var _btn_fasong:Button;
		
		public var _pos_scroll_v_liaotian:Position;
		public var _scrollController:ScrollControllerMax;
		public var _mc_liaotian:MovieClip;
		public var _fnt_shuru:InputField;
		public var _fnt_cost:FontField;
		
		private var chatModel:ChatModel;
		private var timerModel:TimerModel;
		private var friendModel:FriendModel;
		private var InitY:int;
		private var itemModel:ItemModel;
		private var isInRefresh:Boolean=false;
		
		public function Panel_Shijie_LiaotianWindow()
		{
			super();
		}
		protected override function initModule():void
		{
			_mc_liaotian=panelMaterial.mc_liaotian;
			_btn_fasong=new Button(_mc_liaotian.btn_fasong);
			
			_pos_scroll_v_liaotian=new Position(panelMaterial.pos_scroll_v_liaotian);
			_scrollController=new ScrollControllerMax(_pos_scroll_v_liaotian);
			
			_fnt_cost=new FontField(_mc_liaotian.fnt_cost);
			_fnt_shuru=new InputField(_mc_liaotian.fnt_shuru,MaxInputNum);
			_fnt_shuru.setRestrict(null);
			
			InitY=_mc_liaotian.y;
			timerModel=Context.getInjectInstance(TimerModel);
			chatModel=Context.getInjectInstance(ChatModel);
			friendModel=Context.getInjectInstance(FriendModel);
			itemModel=Context.getInjectInstance(ItemModel);
			_scrollController.initClass(Item_Liaotian);
		}
		private function destoryMc():void
		{
			if(_btn_fasong){_btn_fasong.destory();_btn_fasong=null;};
			if(_pos_scroll_v_liaotian){_pos_scroll_v_liaotian.destory();_pos_scroll_v_liaotian=null;};
			if(_scrollController){_scrollController.destory();_scrollController=null;};
			if(_fnt_shuru){_fnt_shuru.destory();_fnt_shuru=null;};
			if(_fnt_cost){_fnt_cost.destory();_fnt_cost=null;};
			if(_mc_liaotian)_mc_liaotian=null;
		}
		protected override function registerEvent():void
		{
			timerModel.secondTimer_SN.add(onTimer);
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			chatModel.voArrayChange.add(onArrayChange);
			friendModel.modelUpdata_SN.add(onFriendUpdate);
			addTargetEvent(_btn_fasong,TqtEvent.BUTTON_CLICK,onFasongClicked);
//			if(Util.isAndroid()){
//				addTargetEvent(GlobalRef.stage,SoftKeyboardEvent.SOFT_KEYBOARD_ACTIVATE,onSoftKeyBoardActivate);
//				addTargetEvent(GlobalRef.stage,SoftKeyboardEvent.SOFT_KEYBOARD_DEACTIVATE,onSoftKeyBoardDeactivate);
//				addTargetEvent(_fnt_shuru.textField,FocusEvent.FOCUS_OUT,onSoftKeyBoardDeactivate);
//			}
		}
		private function onFasongClicked(evt:Event):void
		{
			if(Util.checkIfShijieliaotianJinyan())
			{
				CommonControlFun.JinyanDo();
				return;
			}
			if((_fnt_shuru.isInputed()==false)||(_fnt_shuru.text==""))
			{
				Util.flow("您还没有输入要说的话");
				return;
			}
			if(CheckBanWords.isBad(_fnt_shuru.text))
			{
				Util.flow("包含敏感词汇，请重新输入");
				return;
			}
			var itemTotalNum:int=itemModel.getItemNumById(chatModel.ChatCostItemId);
			if(itemTotalNum<chatModel.ChatCostItemNum)
			{
				Util.flow("红唇数量不足");
				return;
			}
			chatModel.sendMessage(_fnt_shuru.text);
		}
		private function updateShow(_isMove:Boolean=true):void
		{
			var infoArray:Array=chatModel.chatDataArray;
			_scrollController.setData(infoArray);
			if(_isMove)
			{
				_scrollController.setSelectIndexOrData(infoArray.length-1);
			}
		}
		private function onSoftKeyBoardActivate(evt:Event):void
		{
			trace("软件盘  激活");
			_mc_liaotian.y=InitY-GlobalRef.stage.softKeyboardRect.height;
		}
		private function onSoftKeyBoardDeactivate(evt:Event):void
		{
			trace("软件盘  隐藏");
			_mc_liaotian.y=InitY;
		}
		private function onFriendUpdate():void
		{
			updateShow(false);
		}
		private var timeTick:int;
		private function onTimer():void
		{
			timeTick++;
			if((0==timeTick%RefreshTime)&&(!isInRefresh))
			{
				isInRefresh=true;
				chatModel.refreshChatInfo();
			}
		}
		private function onOptMessage(msType:String,code:int):void
		{
			switch(msType)
			{
				case C2SEmitter.REQ_ActionChatHandler:
					if(code==1)
					{
						_fnt_shuru.text="";
						Util.flow("发送聊天信息成功");
					}
					else
					{
						if(code==ChatModel.CANNOT_CHAT)
						{
							CommonControlFun.JinyanDo();
						}
					}
					break;
				case C2SEmitter.REQ_RefreshChatHandler:
					if(code==1)
					{
						
					}
					isInRefresh=false;
				case C2SEmitter.REQ_FirstChatHandler:
					if(code==1)
					{
						
					}
					isInRefresh=false;
					break;
				case C2SEmitter.REQ_AddFriendHandler:
					if(code==1)
					{
						Util.flow("添加好友成功");
					}
					break;
			}
		}
		private function onArrayChange():void
		{
			updateShow();
		}
		protected override function setShow():void
		{
			timeTick=0;
			chatModel.refreshChatInfo(true);
			updateShow();
			_fnt_cost.text="x"+chatModel.ChatCostItemNum.toString();
		}
		public override function clear():void
		{
			friendModel.modelUpdata_SN.remove(onFriendUpdate);
			friendModel=null;
			timerModel.secondTimer_SN.remove(onTimer);
			timerModel=null;
			chatModel.voArrayChange.remove(onArrayChange);
			chatModel.hasNewChat=false;
			chatModel=null;
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			itemModel=null;
			destoryMc();
			super.clear();
		}
		protected override function get panelClassName():Class
		{
			return ItemShijieLiaotian;
		}
		private function get panelMaterial():ItemShijieLiaotian		{
			return  material as ItemShijieLiaotian;		}
	}
}
