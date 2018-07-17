package view.module
{	
	import com.fish.modules.core.models.BroadMessageModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	import ui.tongzhi.TongzhiData;
	
	public class BroadCastView
	{
		private static const DerWidth:int=22;
		private static const UpdateTimer:int=30;
		private static const MoveSpeed:int=3;
		private var m_mc:MovieClip;
		private var broadCastModel:BroadMessageModel;
		
		public function BroadCastView(_mc:MovieClip)
		{
			m_mc=_mc;
			initModule();
			registerEvent();
			setShow();
		}
		private function setShow():void
		{
			broadCastModel.startTimeTick();
			_msgTimer.start();
			messageChange_hd();
		}
		private function initModule():void
		{
			broadCastModel=Context.getInjectInstance(BroadMessageModel);
			messageArray=broadCastModel.broadDataArray;
			initMsgTF();
			initTimer();
			m_mc.mouseChildren=false;
			m_mc.mouseEnabled=false;
		}
		private var _msgTF:TextField;
		private function initMsgTF():void
		{
			_msgTF = new TextField();
			_msgTF.mask = m_mc.broadcast_mask;
			_msgTF.antiAliasType = AntiAliasType.ADVANCED;
			var tm:TextFormat = new TextFormat();
			tm.color = 0xffffff;
			tm.size = 20;
			_msgTF.defaultTextFormat = tm;
			_msgTF.embedFonts=false;
			_msgTF.autoSize = TextFieldAutoSize.LEFT;
			m_mc.addChild(_msgTF);
		}
		private var _msgTimer:Timer;
		private function initTimer():void
		{
			_msgTimer=new flash.utils.Timer(UpdateTimer);
		}
		private function registerEvent():void
		{
			broadCastModel.modelUpdata_SN.add(onMessageChange);
			_msgTimer.addEventListener(TimerEvent.TIMER,onTimer);
		}
		private function onMessageChange():void
		{
			messageArray=broadCastModel.broadDataArray;
			if(_msgTimer && !_msgTimer.running)
			{
				messageChange_hd();
			}
		}
		private function onTimer(evt:TimerEvent):void
		{
			_msgTF.x-=MoveSpeed;
			if(_msgTF.x<=-_msgTF.textWidth+DerWidth)
			{
				if(_msgTimer && _msgTimer.running)
				{
					_msgTimer.stop();
				}
				messageChange_hd();
			}
		}
		private var messageArray:Array=[];
		private function messageChange_hd(e:Event = null):void 
		{
			if(messageArray.length == 0)
			{
				if(_msgTimer && !_msgTimer.running)
				{				
					broadCastModel.setFadeData();
				}
			}
			else
			{
				if(_msgTimer && !_msgTimer.running)
				{
					_msgTimer.start();
					var str:String=(messageArray.shift() as TongzhiData).message;
					_msgTF.htmlText = str;
					reLocateMsgTF();
				}				
			}
		}
		/**
		 *  重新定位消息文本框
		 * */
		private function reLocateMsgTF():void
		{
			_msgTF.x = m_mc.width;
		}
		public function destroy():void
		{
			_msgTimer.removeEventListener(TimerEvent.TIMER,onTimer);
			_msgTimer.stop();
			_msgTimer=null;
			broadCastModel.modelUpdata_SN.remove(onMessageChange);
			broadCastModel.stopTimeTick();
			broadCastModel=null;
			m_mc.removeChildren();
			m_mc=null;
			_msgTF=null;
		}
	}
}