package com.fish.modules.core.models
{
	import com.fish.modules.core.gameVO.ExtrdataVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.MailVO;
	
	import org.osflash.signals.Signal;
	
	import view.viewData.MailViewData;

	public class MailModel extends BaseModel
	{
		public var cacheRewardsData:RewardsPackData;
		public var hasRewards:Boolean=false;
		
		public function MailModel()
		{
			super();
		}
		protected override function onGameInitComplete():void
		{
			GameVOManager.getInstance().arrayVoOP_SN.add(onVoOPArrayChange);
		}
		public var MailUpdate_SN:Signal=new Signal();
		private var needUpdate:Boolean=false;
		private function onVoOPArrayChange(cls:Class,array:Array):void
		{
			if(cls==MailVO)
			{
				needUpdate=true;
				MailUpdate_SN.dispatch();
			}
		}
		private var mailDataList:Array;
		public function get mailList():Array
		{
			if((null==mailDataList)||(needUpdate))
			{
				updateMailData();
			}
			return mailDataList;
		}
		private var basicMailList:Array;
		/**
		 * 基础邮件列表
		 */
		public function getBasicMailList():Array
		{
			if((null==mailDataList)||(needUpdate))
			{
				updateMailData();
			}
			return basicMailList;
		}
		
		private var haoyouMailList:Array;
		/**
		 * 好友邮件列表
		 */
		public function getHaoMailList():Array
		{
			if((null==mailDataList)||(needUpdate))
			{
				updateMailData();
			}
			return haoyouMailList;
		}
		
		private var jinkuangMailList:Array;
		/**
		 * 好友邮件列表
		 */
		public function getJinkuangMailList():Array
		{
			if((null==mailDataList)||(needUpdate))
			{
				updateMailData();
			}
			return jinkuangMailList;
		}
		
		private function updateMailData():void
		{
			if(null==mailDataList)
			{
				mailDataList=[];
				basicMailList=[];
				haoyouMailList=[];
				jinkuangMailList=[];
			}
			mailDataList.length=0;
			basicMailList.length=0;
			haoyouMailList.length=0;
			jinkuangMailList.length=0;
			var voList:Array=GameVOManager.getInstance().mails;
			var index:int;
			for(index=0;index<voList.length;index++)
			{
				var vo:MailVO=voList[index] as MailVO;
				if(vo.modifyType>0)
				{
					var viewData:MailViewData=new MailViewData(vo);
					mailDataList.push(viewData);
					if(-1!=MailViewData.BasicMailTypes.indexOf(viewData.type))
					{
						basicMailList.push(viewData);
					}
					if(-1!=MailViewData.HaoyouMailTypes.indexOf(viewData.type))
					{
						haoyouMailList.push(viewData);
					}
					if(-1!=MailViewData.JinkuangMailTypes.indexOf(viewData.type))
					{
						jinkuangMailList.push(viewData);
					}
				}
			}
			basicMailList.sortOn("id",Array.NUMERIC|Array.DESCENDING);
			haoyouMailList.sortOn("id",Array.NUMERIC|Array.DESCENDING);
			jinkuangMailList.sortOn("id",Array.NUMERIC|Array.DESCENDING);
			mailDataList.sortOn("id",Array.NUMERIC|Array.DESCENDING);
			needUpdate=false;
		}
		public function getAllEmailRewards():RewardsPackData
		{
			var computeArray:Array=[];
			var allMailList:Array=mailDataList;
			var index:int;
			for(index=0;index<allMailList.length;index++)
			{
				var mailData:MailViewData=allMailList[index] as MailViewData;
				if(mailData.checkIfHasRewards())
				{
					var rewardsObj:RewardsPackData=mailData.createRewardpackData();
					computeArray.push(rewardsObj);
				}
			}
			var result:RewardsPackData=RewardsPackData.computeTotalRewards(computeArray);
			return result;
		}
		public function checkIfHasRewards():Boolean
		{
			var result:Boolean=false;
			var allMailList:Array=mailDataList;
			var index:int;
			for(index=0;index<allMailList.length;index++)
			{
				var mailData:MailViewData=allMailList[index] as MailViewData;
				if(mailData.checkIfHasRewards())
				{
					result=true;
					break;
				}
			}
			return result;
		}
		public static function checkIfHasNewMail():int
		{
			var extraData:ExtrdataVO=GameVOManager.getInstance().extrdata;
			return extraData.mailCount;
		}
	}
}