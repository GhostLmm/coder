package com.fish.modules.core.models
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.ExtrdataVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.TongzhiVO;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_xitonggonggao;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import ui.tongzhi.TongzhiData;

	public class BroadMessageModel extends BaseModel
	{
		public static const MaxMessageNum:int=10;
		private var _areadyBroadIdArray:Array=[];
		private var needFresh:Boolean=false;
		private var timerModel:TimerModel;
		public function BroadMessageModel()
		{
			super();
		}
		protected override function onGameInitComplete():void
		{
			timerModel=Context.getInjectInstance(TimerModel);
			GameVOManager.getInstance().arrayVoOP_SN.add(onMessageChange);
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
		}
		private function onOptMessage(_mesType:String,_code:int):void
		{
			if(_mesType==C2SEmitter.REQ_GetServerNoticeHandler)
			{
				var extrdata:ExtrdataVO=GameVOManager.getInstance().extrdata;
				var chatModel:ChatModel=Context.getInjectInstance(ChatModel);
				chatModel.hasNewChat=Boolean(extrdata.hasNewChat);
			}
		}
		private function onMessageChange(cls:Class,array:Array):void
		{
			if(cls==TongzhiVO)
			{
				needFresh=true;
				modelUpdata_SN.dispatch();
			}
		}
		private var m_broadDataArray:Array;
		public function get broadDataArray():Array
		{
			if((null==m_broadDataArray)||(needFresh))
			{
				updateBroadData();
			}
			return m_broadDataArray;
		}
		public static const CanRepeatId:int=-10000;
		private function updateBroadData():void
		{
			if(null==m_broadDataArray)
			{
				m_broadDataArray=[];
			}
			var tongzhiArray:Array=GameVOManager.getInstance().tongzhis;
			var index:int;
			for(index=0;index<tongzhiArray.length;index++)
			{
				var tongzhiVo:TongzhiVO=tongzhiArray[index] as TongzhiVO;
				if(-1!=_areadyBroadIdArray.indexOf(tongzhiVo.id))
				{
					if(tongzhiVo.id!=CanRepeatId)
					{
						continue;
					}
				}
				var tongzhiData:TongzhiData=new TongzhiData(tongzhiVo);
				_areadyBroadIdArray.push(tongzhiVo.id);
				if(_areadyBroadIdArray.length>MaxMessageNum)
				{
					_areadyBroadIdArray.shift();
				}
				m_broadDataArray.push(tongzhiData);
			}
			m_broadDataArray.sortOn("type");
			needFresh=false;
		}
		public var XitongType:int=2;
		private static const QQGonggao:int=5;
		
		private var fixMessageXmllist:Array;
		private function getFixMessageXmlList():Array
		{
			if(null==fixMessageXmllist)
			{
				fixMessageXmllist=[];
				var nodeArray:Array=XMLDataManager.Node_xitonggonggaoArray;
				var index:int;
				for(index=0;index<nodeArray.length;index++)
				{
					var node:Node_xitonggonggao=nodeArray[index] as Node_xitonggonggao;
					if(node.type==XitongType && node.id!=QQGonggao)
					{
						fixMessageXmllist.push(node);
					}
				}
			}
			return fixMessageXmllist;
		}
		private static const KefuMessage_Xid:int=3;
		private static const HuodongMessage_Xid:int=4;
		public function setFadeData():void
		{
			if(m_broadDataArray.length<=0)
			{
				var xitongList:Array=getFixMessageXmlList();
				var index:int;
				for(index=0;index<xitongList.length;index++)
				{
					var xml:Node_xitonggonggao=xitongList[index] as Node_xitonggonggao;
					m_broadDataArray.push(createFade(xml.id));
				}
				modelUpdata_SN.dispatch();
			}
		}
		private function createFade(_xid:int):TongzhiData
		{
			var kefuVo:TongzhiVO=new TongzhiVO();
			kefuVo.args="[]";
			kefuVo.xid=_xid;
			kefuVo.id=CanRepeatId;
			var tongzhiData:TongzhiData=new TongzhiData(kefuVo);
			return tongzhiData;
		}
		public function startTimeTick():void
		{
			requestData();
			m_timeTick=0;
			timerModel.secondTimer_SN.add(onTick);
		}
		private function requestData():void
		{
			C2SEmitter.RequstNotice();
		}
		public static const UpdateTime:int=120;
		private var m_timeTick:int;
		private function onTick(evt:Event=null):void
		{
			m_timeTick++;
			if(m_timeTick>=UpdateTime)
			{
				m_timeTick=0;
				requestData();
			}
		}
		public function stopTimeTick():void
		{
			m_timeTick=0;
			timerModel.secondTimer_SN.remove(onTick);
		}
	}
}