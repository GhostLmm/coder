package  Tool.talkingdata
{
	import Tool.talkingdata.TalkingDataConst;
	
	import com.talkingdata.game.TDAccountType;
	import com.talkingdata.game.TDCustomEvent;
	import com.talkingdata.game.TDGAAccount;
	import com.talkingdata.game.TDGAItem;
	import com.talkingdata.game.TDGAMission;
	import com.talkingdata.game.TDGAVirtualCurrency;
	import com.talkingdata.game.TalkingDataGA;

	/**
	 *@author 锋
	 *@version 1.0.0
	 *@创建时间:2013-6-21 上午11:33:12
	 * */
	public class TalkingDataAnalyse
	{
		private static var m_instance:TalkingDataAnalyse;
		private var account:TDGAAccount;
		
		
		private var appId:String;
		private var channelId:String;
		
		public function TalkingDataAnalyse()
		{
		}
		
		public static function getInstance():TalkingDataAnalyse
		{
			if(null==m_instance)
			{
				m_instance=new TalkingDataAnalyse();
			}
			return m_instance;
		}
		
		public function init():void
		{
			appId="BD771C8EC4A3C068D805E59B4A0AFB2A";
//			appId="84233155B59C95CE95685FFD3C815435";
			channelId=TalkingDataConst.QUDAO_neiwang;
			
			start();
		}
		
		public function start():void
		{
			TalkingDataGA.onStart(appId,channelId);
			trace("---------------------talkingdata start...---------------------");
		}
		
		public function deactivate():void
		{
			TalkingDataGA.onDeactivate();
			trace("---------------------talkingdata end...-----------------------");
		}
		
		public function setAccountId(accountId:String):void
		{
			account=TDGAAccount.setAccountID(channelId+"-"+accountId);
			trace("------------------talkingdata set AccountId: "+accountId+"-------------------------");
		}
		
		public function setAccountType(accountType:String):void
		{
			if(accountType=="local")
				account.setAccountType(TDAccountType.ANONYMOUS);
			else if(accountType=="regist")
				account.setAccountType(TDAccountType.REGISTERED);
		}
		
		public function setAccountName(accountName:String):void
		{
			account.setAccountName(accountName);
		}
		
		public function setAccountGameServer(gameServer:String):void
		{
			account.setAccountServer(gameServer);
			
		}
		
		public function setAccountLevel(accountLevel:String):void
		{
			account.setAccountLevel(int(accountLevel));
			
		}
		
		
		public function missionBegin(mid:String):void
		{
			TDGAMission.onMessionBegin(mid);
		}
		
		public function missionComplete(mid:String):void
		{
			TDGAMission.onMissionCompleted(mid);
		}
		
		public function onPay(item:String,num:int,cost:int):void
		{
			TDGAItem.onPurchase(item,num,cost);
		}
		
		public function onEvent(eventId:String,entityKey:Array,entityValue:Array):void
		{
			var ev:TDCustomEvent=new TDCustomEvent();
			for(var i:int=0;i<entityKey.length;i++)
			{
				ev.setEntityString(entityKey[i],entityValue[i]);
			}
			TalkingDataGA.onEvent(eventId,ev);
//			TDGAMission.onMessionBegin(eventId+"-"+entityValue[0]);
		}
		
		public function onChargeRequest(orderID:String,itemName:String,moneyAmount:Number,moneyType:String,creditAmount:Number,paymentType:String):void
		{
			TDGAVirtualCurrency.onChargeRequest(orderID,itemName,moneyAmount,moneyType,creditAmount,paymentType);
//			TDGAVirtualCurrency.onChargeRequest(
		}
		
		public function onChargeSuccess(orderID:String):void
		{
			TDGAVirtualCurrency.onChargeSuccess(orderID);
		}
	}
}