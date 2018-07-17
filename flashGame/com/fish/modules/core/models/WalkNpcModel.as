package com.fish.modules.core.models
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.WalknpcVO;
	import com.fish.modules.core.models.tempData.NpcerData;
	import com.ghostlmm.xmldata.Node_monster;
	import com.ghostlmm.xmldata.Node_monster_type;
	import com.ghostlmm.xmldata.Node_npc;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import org.osflash.signals.Signal;
	
	import snake.GameUtil;

	public class WalkNpcModel extends BaseModel
	{
		private var _npcerArray:Array;
		
		public var npcerDataCom_SN:Signal=new Signal(Array);
		public var npcerTalk_SN:Signal=new Signal(Object);
		public function WalkNpcModel()
		{
			super();
		}
		
		private function getMaxNpcerNum():int{
			return 5;
		}
		
		protected override function onGameInitComplete():void
		{
			S2CHanlder.instance.message_SN.add(onMessage);
		}
		private function proccessNpcTalk():void{
			var talkObj:Object={};
			try{
				talkObj=JSON.parse(GameVOManager.getInstance().extrdata.npcTalks);
			}catch(e:Error){}
			npcerTalk_SN.dispatch(talkObj);
		}
		private function onMessage(msType:String):void{
			
			// 如果是 聊天的消息过来 
			if(msType==C2SEmitter.REQ_ActiveSpeakHandler){
				proccessNpcTalk();
			}
			if(msType==C2SEmitter.REQ_SyncUserActiveHandler){
				_npcerArray=[];
				var npcerData:NpcerData
				for each(var vo:WalknpcVO in GameVOManager.getInstance().walknpcs){
					npcerData=new NpcerData();
					if(npcerData.initFromVo(vo)){
						_npcerArray.push(npcerData);
					}
				}
				var maxNum:int=XMLDataManager.getConstById("otherBodyNumAll").value;
				while(_npcerArray.length<=maxNum){
					npcerData=new NpcerData();
					npcerData.initFromNpc(getRandomNpcNode(),-_npcerArray.length);
					_npcerArray.push(npcerData);
				}
				npcerDataCom_SN.dispatch(_npcerArray);
			}
		}
		
		/** 获取npc数据 **/
		public function startGetNpcerData():void{
//			createNpcerData();
			C2SEmitter.getNpcerData();
		}
		
		
		
		private function getRandomNpcNode():Node_npc{
			var index:int=int(Math.random()*1000000)%XMLDataManager.Node_npcArray.length;
			return XMLDataManager.Node_npcArray[index];
		}
		
		
		
		public override function destory():void
		{
			S2CHanlder.instance.message_SN.remove(onMessage);
			npcerDataCom_SN.removeAll();
			npcerTalk_SN.removeAll();
			super.destory();
		}
	}
}