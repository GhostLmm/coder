package Tool.talkingdata
{
	import Tool.PersistentObj;


	/**
	 *@author 锋
	 *@version 1.0.0
	 *@创建时间:2013-7-2 下午1:35:51
	 * */
	public class TalkingDataManager
	{
		private static var m_instance:TalkingDataManager;

		private var isDebug:Boolean=true;
		
		public static function getInstance():TalkingDataManager
		{
			if(null==m_instance)
			{
				m_instance=new TalkingDataManager();
			}
			return m_instance;
		}
		public function TalkingDataManager()
		{
			_perObj=new PersistentObj("purchaseConfig");
		}
		
		private var _perObj:PersistentObj;
		
		public function addPurcheConfig(itemArray:Array):void{
			for each(var obj:Object in itemArray){
				_perObj.setVaule(obj.itemId,obj);
			}
		}
		
		public function init():void
		{

			CONFIG::TalkingData{
				TalkingDataAnalyse.getInstance().init();
			}
		}
		
		public function setAccount(type:String,content:String):void
		{
			trace(content,"talking");

			CONFIG::TalkingData{
				switch(type)
				{
					case TalkingDataConst.account_id:
						TalkingDataAnalyse.getInstance().setAccountId(content);
						break;
					case TalkingDataConst.account_type:
						TalkingDataAnalyse.getInstance().setAccountType(content);
						break;
					case TalkingDataConst.account_name:
						TalkingDataAnalyse.getInstance().setAccountName(content);
						break;
					case TalkingDataConst.account_gameServer:
						TalkingDataAnalyse.getInstance().setAccountGameServer(content);
						break;
					case TalkingDataConst.account_level:
						TalkingDataAnalyse.getInstance().setAccountLevel(content);
						break;
				}
			}
		}
		
		public function setMission(type:String,content:String):void
		{
			trace(content,"mission");
			return;
			
			CONFIG::TalkingData{
				switch(type)
				{
					case TalkingDataConst.mission_begin:
						TalkingDataAnalyse.getInstance().missionBegin(content);
						break;
					case TalkingDataConst.mission_complete:
						TalkingDataAnalyse.getInstance().missionComplete(content);
						break;
				}
			}
		}
		
		public function setPay(item:String,num:int,cost:int):void
		{
			trace(item,num,cost,"pay");

			CONFIG::TalkingData{
				TalkingDataAnalyse.getInstance().onPay(item,num,cost);
			}
		}
		
		public function setEvent(eventId:String,entityKey:Array,entityValue:Array):void
		{
			
			trace(eventId,entityKey,entityValue,"event");

			
			CONFIG::TalkingData{
				TalkingDataAnalyse.getInstance().onEvent(eventId,entityKey,entityValue);
			}
		}
		
		public function setChargeRequestAdapt(orderID:String,itemId:String,creditAmount:Number,moneyType:String,paymentType:String):void{
			
//			trace(orderID,itemId,Number(itemData.salePrice),moneyType,creditAmount,paymentType,"charge");

			
			CONFIG::TalkingData{
				var itemData:Object=_perObj.getValueByKey(itemId);
				if(itemData==null){
					trace("没有记录");
				}else{
					TalkingDataAnalyse.getInstance().onChargeRequest(orderID,itemId,Number(itemData.salePrice),moneyType,creditAmount,paymentType);
				}
			}
		}
		
		public function setChargeSuccess(orderID:String):void
		{
			
			trace(orderID,"chargeSuccess");

			
			CONFIG::TalkingData{
				TalkingDataAnalyse.getInstance().onChargeSuccess(orderID);
			}
		}
		
		
		
	}
}