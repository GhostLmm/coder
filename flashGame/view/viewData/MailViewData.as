package view.viewData
{
	import com.fish.modules.core.gameVO.MailVO;
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.RewardsPackData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_equip;
	import com.ghostlmm.xmldata.Node_mail;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import util.Util;
	
	import view.CommonControlFun;

	public class MailViewData
	{
		/**
		 * 基础邮件
		 */
		public static const BasicMailTypes:Array=[1001,1002];
		
		/**
		 * 好友邮件
		 */
		public static const HaoyouMailTypes:Array=[1003];
		
		/**
		 * 金矿邮件
		 */
		public static const JinkuangMailTypes:Array=[1004,1005,1006,1007];
		
		/**
		 * 系统邮件
		 */
		public static const Type_System:int=1001;
		/**
		 * 系统发放奖励邮件
		 */
		public static const Type_System_HasReward:int=1002;
		/**
		 * 玩家邮件
		 */
		public static const Type_User:int=1003;
		
		private static const ShowDescNum:int=36;
		
		public var vo:MailVO;	
		
		public var _typeXml:Node_mail;
		public function MailViewData(_vo:MailVO)
		{
			vo=_vo;
			_typeXml=XMLDataManager.getMailById(vo.type);
		}
		public function get rewardsObj():Object
		{
			var rewardsObj:Object=JSON.parse(vo.rewards);
			return rewardsObj;
		}
		public function get id():Number
		{
			return vo.id;
		}
		public function get type():int
		{
			return vo.type;
		}
		public function get typeXml():Node_mail
		{
			return _typeXml;
		}
		public function get mailTitle():String
		{
			var result:String;
			if(checkIfSenderIsUser())
			{
				result=Util.getLanguage("来自玩家名字的邮件",vo.sender);
			}
			else if(checkIfJinkuangMail())
			{
				result=Util.getLanguage("金矿邮件Title_"+vo.type);
			}
			else
			{
				result=vo.title;
			}
			return result;
		}
		public function get mailDate():String
		{
			return CommonControlFun.timeToMRHM(vo.sendTime);
		}
		public function get mailItemShowDesc():String
		{
			var result:String;
			var str:String=vo.cotent;
			if(checkIfJinkuangMail())
			{
				str=convertLogToDesc(vo);
			}
			if(str.length>ShowDescNum)
			{
				result=str.substr(0,ShowDescNum)+"...";
			}
			else
			{
				result=str;
			}
			return result;
		}
		public function get mailChakanShowDesc():String
		{
			var result:String;
			result=vo.cotent;
			if(checkIfJinkuangMail())
			{
				result=convertLogToDesc(vo);
			}
			return result;
		}
		public function checkIfSenderIsUser():Boolean
		{
			if(vo.type==Type_User)
			{
				return true;
			}
			return false;
		}
		public function checkIfJinkuangMail():Boolean
		{
			if(-1==JinkuangMailTypes.indexOf(vo.type))
			{
				return false;
			}
			return true;
		}
		public function checkIfHasRewards():Boolean
		{
			if(vo.type==Type_System_HasReward)
			{
				return true;
			}
			if(-1!=JinkuangMailTypes.indexOf(vo.type))
			{
				var money:int=rewardsObj.money;
				if(money>0)
				{
					return true;
				}
			}
			return false;
		}
		
		public function couldLingqu():JudgeResult{
			var re:JudgeResult=new JudgeResult();
			if(checkIfHasRewards()){
				var needGrid:int;
				if(rewardsObj.equip){
					for(var key:String in rewardsObj.equip){
						var node:Node_equip=XMLDataManager.getEquipById(int(key));
						if(node){
							if(!EquipModel.isGun(node) && node.type){
								needGrid+=int(rewardsObj.equip[key]);
							}
						}
					}
				}
				
				var bagModel:BagModel=Context.getInjectInstance(BagModel);
				var idleNum:int=bagModel.getIdleEquipGridNum();
				if(needGrid>idleNum){
					re.code=JudgeResult.CD_BagGridNotEnough;
					re.desc="装备格子不够";
					return re;
				}
			}
			re.success=true;
			return re;
		}
		
		
		public function createRewardpackData():RewardsPackData
		{
			var result:RewardsPackData=new RewardsPackData();
			var data:Object=rewardsObj;
			result.initFromData(data);
//			result.bonus_money=data.money;
//			result.bouns_cash=data.cash;
//			result.bouns_yongqi=data.yongqi;
//			result.bouns_shengwang=data.shengwang;
//			result.bouns_tili=data.tili;
//			result.bouns_itmes=data.item;
//			result.bouns_equips=data.equip;
//			result.bouns_baoshis=data.baoshi;
			return result;
		}
		
		public static const REWARD_LVEDUO:int=1004;
		public static const REWARD_QUGAN:int=1005;
		public static const REWARD_ZIDONGJIESUAN:int=1006;
		public static const REWARD_ZHUKUANG_CHEDUI_JIESUAN:int=1007;
		
		public  function convertLogToDesc(_vo:MailVO):String
		{
			var result:String=Util.getLanguage("金矿邮件内容_"+_vo.type);
			var paramArray:Array=[];
			paramArray.push(CommonControlFun.timeToYMRHMS(_vo.sendTime));
			var userName:String=rewardsObj.user_name;
			var lostMoney:String=rewardsObj.lost_money; 
			var money:String=rewardsObj.money; 
			switch(_vo.type)
			{
				case REWARD_LVEDUO:				
					paramArray.push(userName);
					paramArray.push(lostMoney);
					paramArray.push(money);
					break;
				case REWARD_QUGAN:
					paramArray.push(userName);
					paramArray.push(money);
					break;
				case REWARD_ZIDONGJIESUAN:
					paramArray.push(money);
					break;
				case REWARD_ZHUKUANG_CHEDUI_JIESUAN:
					paramArray.push(money);
					break;
			}
			var index:int;
			for(index=0;index<paramArray.length;index++)
			{
				var param:String=paramArray[index];
				result=result.replace("{"+(index)+"}",param);
			}
			return result;
		}
	}
}