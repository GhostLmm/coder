package com.fish.modules.core
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.models.BattleModel;
	import com.fish.modules.core.models.JinkuangModel;
	import com.fish.modules.core.models.MapModel;
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.socketCommunication.Transport;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.BagC2S;
	import com.mutou.tqt.BanghuiBuy;
	import com.mutou.tqt.BanghuiChatC2S;
	import com.mutou.tqt.BanghuiInfoC2S;
	import com.mutou.tqt.BanghuiJianshe;
	import com.mutou.tqt.BanghuiShenqingC2S;
	import com.mutou.tqt.BanghuiTirenC2S;
	import com.mutou.tqt.BattleC2S;
	import com.mutou.tqt.BuyInfoC2S;
	import com.mutou.tqt.ChaonengInfoC2S;
	import com.mutou.tqt.ChatC2S;
	import com.mutou.tqt.DigC2SProto;
	import com.mutou.tqt.DigInfoC2S;
	import com.mutou.tqt.EquipInfoC2S;
	import com.mutou.tqt.FriendC2S;
	import com.mutou.tqt.FubenC2S;
	import com.mutou.tqt.HeroInfoC2S;
	import com.mutou.tqt.HonorListC2S;
	import com.mutou.tqt.ItemC2S;
	import com.mutou.tqt.JinKuangInfoC2S;
	import com.mutou.tqt.LeitaiC2S;
	import com.mutou.tqt.LingquJihua;
	import com.mutou.tqt.MailInfoC2S;
	import com.mutou.tqt.OtherInfoC2S;
	import com.mutou.tqt.RongyuC2S;
	import com.mutou.tqt.ServerNoticeC2S;
	import com.mutou.tqt.TaskInfoC2S;
	import com.mutou.tqt.XinshouYinDaoC2S;
	import com.mutou.tqt.YunYingC2S;
	import com.netease.protobuf.Int64;
	
	import flash.utils.Dictionary;
	
	import Tool.platform.PlatformManager;
	
	import org.osflash.signals.Signal;
	
	import util.GameTime;

	public class C2SEmitter
	{
		/** 影响人物战斗力的消息  **/
		public static const HeroAttrChangeREQS:Array=[
			REQ_EquipBaoshiJinhuaHandler,REQ_ChaonengFireHandler,REQ_EquipArmhandler,REQ_EquipBaoshiArmHandler,REQ_EquipEhanceHandler,REQ_EquipUpStarHandler,
			REQ_EquipNbExtendHandler,REQ_EquipNbLvupHandler,REQ_EquipEhanceBatchHandler,REQ_EquipGunArmhandler
		];
		
		
		/** 断网后需要重连的协议  **/
		private static const NeedReloadProto:Array=[];
		
		private static var _needRoloadDic:Dictionary;
		public static function isNeedReloadProto(msType:String):Boolean{
			if(_needRoloadDic==null){
				_needRoloadDic=new Dictionary();
				for each(var ms:String in NeedReloadProto){
					_needRoloadDic[ms]=true;
				}
			}
			return _needRoloadDic.hasOwnProperty(msType);
		}
		
		public function C2SEmitter()
		{
		}
		private static var c2sFlag:int=10000;
		/**   初始化
		 * */
		public static const REQ_Initgame:String="GetUserInitHandler";
		
		/**
		 *   挖矿地图初始信息
		 */
		public static const REQ_DigMapGetHandler:String="DigMapGetHandler";
		
		/**
		 *   获取挖矿道具
		 */
		public static const REQ_DigRewardHandler:String="DigRewardHandler";
		
		/**
		 *   初始化战斗信息
		 */
		public static const REQ_DigBossGetHandler:String="DigBossGetHandler";
		
		
		//神秘商店
		public static const REQ_SpecialShopBuyHandler:String="SpecialShopBuyHandler";
		public static const REQ_SpecialShopRefreshHandler:String="SpecialShopRefreshHandler";
		public static const REQ_SpecialShopBuyAllHandler:String="SpecialShopBuyAllHandler";
		public static const REQ_SpecialShopGetHandler:String="SpecialShopGetHandler";
		//礼包
		public static const REQ_ItemBuyHandler:String="ItemBuyHandler";
		public static const REQ_ItemBuyAndUseHandler:String="ItemBuyAndUseHandler";
		public static const REQ_ItemUseHandelr:String="ItemUseHandelr";
		
		//邮件相关
		public static const REQ_GetMailHandler:String="MailGetHandler";
		public static const REQ_HandleMailHandler:String="MailHandleHandler";
		public static const REQ_SendMailHandler:String="MailSendHandler";
		public static const REQ_MailHandleAllHandler:String="MailHandleAllHandler";
		
		//擂台相关
		public static const REQ_LeitaiListGetHandler:String="LeitaiListGetHandler";
		public static const REQ_LeitaiBattlePreHandler:String="LeitaiBattlePreHandler";
		public static const REQ_LeitaiBattleIngHandler:String="LeitaiBattleIngHandler";
		public static const REQ_LeitaiBattleRewardHandler:String="LeitaiBattleRewardHandler";
		
		//超能力
		public static const REQ_ChaonengFireHandler:String="ChaonengFireHandler";
		public static const REQ_ChaonengUpHandler:String="ChaonengUpHandler";
		
		
		public static const REQ_FubenBattlePreHandler:String="FubenBattlePreHandler";
		public static const REQ_FubenClearCountHandler:String="FubenClearCountHandler";
		public static const REQ_FubenBattleingHandler:String="FubenBattleingHandler";
		public static const REQ_FubenSaodangHandler:String="FubenSaodangHandler";
		public static const REQ_FubenBettleRewardHandler:String="FubenBettleRewardHandler";
		public static const REQ_FubenNameGetHandler:String="FubenNameGetHandler";
		public static const REQ_FubenNameSmallGetHandler:String="FubenNameSmallGetHandler";
		public static const REQ_FubenNamedRewardHandler:String="FubenNamedRewardHandler";
		public static const REQ_FubenStoryHandler:String="FubenStoryHandler";
		
		public static const REQ_TiliBuyHandler:String="TiliBuyHandler";
		
		
		public static const REQ_TiliGetHandler:String="TiliGetHandler";
		
		
		public static const REQ_EquipArmhandler:String="EquipArmhandler";
		
		public static const REQ_EquipUnlockHandler:String="EquipUnlockHandler";
		
		public static const REQ_EquipEhanceHandler:String="EquipEhanceHandler";
		public static const REQ_EquipEhanceBatchHandler:String="EquipEhanceBatchHandler";
		
		public static const REQ_EquipUpStarHandler:String="EquipUpStarHandler";
		
		public static const REQ_EquipBaoshiArmHandler:String="EquipBaoshiArmHandler";
		
		public static const REQ_EquipBaoshiJinhuaHandler:String="EquipBaoshiJinhuaHandler";
		
		public static const REQ_EquipRonglianHandler:String="EquipRonglianHandler";
		
		public static const REQ_EquipNbLvupHandler:String="EquipNbLvupHandler";
		
		public static const REQ_EquipNbExtendHandler:String="EquipNbExtendHandler";
		
		public static const REQ_EquipGunArmhandler:String="EquipGunArmhandler";
		
		public static const REQ_TaskRewardHandler:String="TaskRewardHandler";
		public static const REQ_DailyTaskRewardHandler:String="DailyTaskRewardHandler";
		
		
		// 挖矿
		public static const REQ_DigInitHandler:String="DigInitHandler";
		public static const REQ_DigOperateBeginHandler:String="DigOperateBeginHandler";
		public static const REQ_DigOperatingHandler:String="DigOperatingHandler";
		public static const REQ_DigOperateEndHandler:String="DigOperateEndHandler";
		public static const REQ_DigSetterHandler:String="DigSetterHandler";
		public static const REQ_DigFastGuajiHandler:String="DigFastGuajiHandler";
		public static const REQ_DigC2SChargeHandler:String="DigC2SChargeHandler";
		public static const REQ_DigUpgradeHandler:String="DigUpgradeHandler";

		
		//** 抽奖  */		
		public static const REQ_ChoujiangInitHandler:String="ChoujiangInitHandler";
		
		public static const REQ_HaixuanChooseHandler:String="HaixuanChooseHandler";
		
		public static const REQ_HaixuanBatchChooseHandler:String="HaixuanBatchChooseHandler";
		
		public static const REQ_JingxuanBatchChooseHandler:String="JingxuanBatchChooseHandler";
		
		public static const REQ_JingxuanChooseHandler:String="JingxuanChooseHandler";
		///** 抽奖  */
		
		
		public static const REQ_MoneyBuyHandler:String="MoneyBuyHandler";
		
		public static const REQ_SyncUserActiveHandler:String="SyncUserActiveHandler";
		
		//排行榜
		public static const REQ_GetLevelHonorListHandler:String="LevelHonorGetHandler";
		public static const REQ_GetLeitaiHonorListHandler:String="LeitaiHonorGetHandler";
		public static const REQ_GetLianshengHonorListHandler:String="ZhanliHonorGetHandler";
		public static const REQ_GetPayHonorListHandler:String="PayHonorGetHandler";
		
		public static const REQ_ChongbaiLevelHonorHandler:String="LevelHonorChongbaiHandler";
		public static const REQ_ChongbaiLeitaiHonorHandler:String="LeitaiHonorChongbaiHandler";
		public static const REQ_ChongbaiLianshengHonorHandler:String="ZhanliHonorChongbaiHandler";
		public static const REQ_ChongbaiChongzhiHonorHandler:String="PayHonorChongbaiHandler";
		public static const REQ_BishiChonzhiHonorHandler:String="PayHonorBishiHandler";		
		public static const REQ_HideChongzhiHonorHandler:String="PayHonorHideHandler";
		
		//好友
		public static const REQ_AddFriendHandler:String="FriendAddHandler";		
		public static const REQ_DeleteFriendHandler:String="FriendDeleteHandler";
		public static const REQ_GetFriendNameHandler:String="FriendNameGetHandler";
		
		//世界聊天
		public static const REQ_RefreshChatHandler:String="ChatRefreshHandler";
		public static const REQ_FirstChatHandler:String="ChatFirstHandler";
		public static const REQ_ActionChatHandler:String="ChatActionHandler";
		//帮会聊天
		public static const REQ_BanghuiActionChatHandler:String="BanghuiActionChatHandler";
		public static const REQ_BanghuiRefreshChatHandler:String="BanghuiRefreshChatHandler";
		public static const REQ_BanghuiFirstChatHandler:String="BanghuiFirstChatHandler";
		
		//系统广播
		public static const REQ_GetServerNoticeHandler:String="GetServerNoticeHandler";
		
		public static const REQ_YindaoHandler:String="YindaoHandler";
		
		/** 充值推送消息 **/
		public static const REQ_PayS2SHandler:String="PayS2SHandler";
		
		//  抽卡活动
		public static const REQ_ChoukaHandler:String="ChoukaHandler";
		/**
		 *   一键抽取所有卡牌
		 */
		public static const REQ_YijianChouka:String="ChoukaAllHandler";
		
		
		
		// 收集活动
		public static const REQ_ShoujiBuqi:String="YunyingCollectSupplyHandler";
		public static const REQ_ShoujiDuihuan:String="YunyingCollectExchangeHandler";
		
		/**
		 *   刮刮乐
		 */
		public static const REQ_GuagualeHandler:String="YunyingGuagualeRewardHandler";
		
		public static const REQ_ZhuanpanHandler:String="ZhuanpanHandler";
		
		public static const REQ_CanBaihandler:String="HuodongCanBaihandler";
		public static const REQ_GetHuodongListHandler:String="YunyingGetHuodongListHandler";
		public static const REQ_OpenServerLvHandler:String="YunyingOpenServerLvHandler";
		public static const REQ_OpenServerPayHandler:String="YunyingOpenServerPayHandler";
		public static const REQ_CaishenRewardhandler:String="YunyingCaishenRewardhandler";
		public static const REQ_BuyChengzhangJihuaHandler:String="ChengzhangJihuaBuyHandler";
		public static const REQ_Lingquhandler:String="HuodongLingquhandler";
		public static const REQ_LingquChengzhangJihuaHandler:String="ChengzhangJihuaLingquHandler";
		
		//金矿相关
		public static const REQ_GetServerKuangInfoHandler:String="GetServerKuangInfoHandler";
		public static const REQ_GetTargetKuangInfoHandler:String="GetTargetKuangInfoHandler";
		public static const REQ_RetreatKuangHandler:String="RetreatKuangHandler";
		public static const REQ_GainKuangHandler:String="GainKuangHandler";
		public static const REQ_FushuKuangHandler:String="FushuKuangHandler";
		public static const REQ_GetUserInfoKuangHandler:String="GetUserInfoKuangHandler";
		public static const REQ_GatherUserInfoKuangHandler:String="GatherUserInfoKuangHandler";
		public static const REQ_GetUserKuangHandler:String="GetUserKuangHandler";
		public static const REQ_OccupyKuangHandler:String="OccupyKuangHandler";
		public static const REQ_NEWCDKeyRewardHandler:String="YunyingCDKeyRewardHandler";
		
		
		public static const REQ_KuangLveduoPreHandler:String="KuangLveduoPreHandler";
		public static const REQ_KuangLveduoBattleHandler:String="KuangLveduoBattleHandler";
		public static const REQ_KuangLveduoRewardHandler:String="KuangLveduoRewardHandler";
		public static const REQ_KuangQuganPreHandler:String="KuangQuganPreHandler";
		public static const REQ_KuangQuganBattleHandler:String="KuangQuganBattleHandler";
		public static const REQ_KuangQuganRewardHandler:String="KuangQuganRewardHandler";
		
		/**
		 * 荣誉兑换
		 */
		public static const REQ_RongyuShangdianBuyHandler:String="RongyuShangdianBuyHandler";
		
		
		/** 主城聊天推送  **/
		public static const REQ_ActiveSpeakHandler:String="ActiveSpeakHandler";
		
		
		//工会
		public static const REQ_BanghuiChuangjianHandler:String="BanghuiChuangjianHandler";
		public static const REQ_GetBanghuiListHandler:String="BanghuiListGetHandler";
		public static const REQ_GetBanghuiInfoHandler:String="BanghuiInfoGetHandler";
		public static const REQ_BanghuiJiesanHandler:String="BanghuiJiesanHandler";
		public static const REQ_BanghuiShenqingHandleHandler:String="BanghuiShenqingHandleHandler";
		public static const REQ_GetBanghuiShenqingHandler:String="BanghuiShenqingGetHandler";
		public static const REQ_JoinBanghuiHandler:String="BanghuiJoinHandler";
		public static const REQ_JoinCancelBanghuiHandler:String="BanghuiJoinCancelHandler";
		public static const REQ_SearchBanghuiHandler:String="BanghuiSearchHandler";
		public static const REQ_GetBanghuiInitHandler:String="BanghuiInitGetHandler";
		public static const REQ_DeleteBanghuiChengyuanHandler:String="BanghuiChengyuanDeleteHandler";
		public static const REQ_QuitBanghuiHandler:String="BanghuiQuitHandler";
		public static const REQ_GetBanghuiPersonHandler:String="BanghuiPersonGetHandler";
		public static const REQ_GetBanghuiShopHandler:String="BanghuiShopGetHandler";
		public static const REQ_BuyBanghuiZhenpinHandler:String="BanghuiZhenpinBuyHandler";
		public static const REQ_BuyBanghuiItemHandler:String="BanghuiItemBuyHandler";
		
		public static const REQ_GetBanghuiDatingHandler:String="BanghuiDatingGetHandler";
		public static const REQ_JiansheBanghuiDatingHandler:String="BanghuiDatingJiansheHandler";
		public static const REQ_GetBanghuiMiaoHandler:String="BanghuiMiaoGetHandler";
		public static const REQ_CanbaiBanghiuMiaoHandler:String="BanghiuMiaoCanbaiHandler";
		
		public static const REQ_LvupBanghuiShopHandler:String="BanghuiShopLvupHandler";
		public static const REQ_LvupBanghuiMiaoHandler:String="BanghuiMiaoLvupHandler";
		public static const REQ_LvupBanghuiDating:String="BanghuiDatingLvupHandler";
		public static const REQ_ChangeBanghuiPasswordHandler:String="BanghuiPasswordChangeHandler";
		public static const REQ_ChangeBanghuiGonggaoHandler:String="BanghuiGonggaoChangeHandler";
		public static const REQ_ChangeBanghuiXuanyanHandler:String="BanghuiXuanyanChangeHandler";
		
		// 帮会红包
		public static const REQ_BanghuiRedPacketListHandler:String="BanghuiRedPacketListHandler";
		public static const REQ_BanghuiRedPacketGetHandler:String="BanghuiRedPacketGetHandler";
		
		//帮会战相关
		public static const REQ_banghuiBaomingListHandler:String="BanghuiBaomingListHandler";
		public static const REQ_banghuiBaomingHandler:String="BanghuiBaomingHandler";
		public static const REQ_banghuiCanzhanHandler:String="BanghuiCanzhanHandler";
		public static const REQ_banghuiBattleListHandler:String="BanghuiBattleListHandler";
		public static const REQ_banghuiDetailListHandler:String="BanghuiDetailListHandler";
		public static const REQ_banghuiGetRewardHandler:String="BanghuiGetRewardHandler";
		public static const REQ_banghuiPlayerListHandler:String="BanghuiPlayerListHandler";
		public static const REQ_BanghuiResultListHandler:String="BanghuiResultListHandler";
		
		/**
		 * 获取其他用户信息
		 */
		public static const REQ_OtherPersonInfoGetHandler:String="OtherPersonInfoGetHandler";
		
		
		public static var connectCom_SN:Signal=new Signal();
		public static var connectError_SN:Signal=new Signal(int);
		
		public static function startConectSocket(ip:String,port:int):void{
			Transport.connectComplete_SN.add(onConnectSuccess);
			Transport.connectError_SN.add(onConnectError);
			Transport.Connect(ip,port);
		}
		public static function onConnectSuccess():void{
			connectCom_SN.dispatch();
		}
		public static function onConnectError(errCode:int):void{
			connectError_SN.dispatch(errCode);
		}
		
		
		public static function sendMessage(req:String,c2sProto:DigC2SProto,_isNeedLoading:Boolean=true,_isNeedLog:Boolean=true):void
		{
			c2sFlag++;
			c2sProto.protoId=c2sFlag;
			c2sProto.authkey=GLBaseData.author;
			c2sProto.accountId=GLBaseData.accountId;
			c2sProto.req=req;
			c2sProto.userId=int(GLBaseData.userId);
			if(null!=UrlConfig.huodongXmlVersion)
			{
				c2sProto.huodongVersion=UrlConfig.huodongXmlVersion;
			}
			if(c2sProto.yunying==null){
				c2sProto.yunying=new YunYingC2S();
			}
			c2sProto.yunying.platname=PlatformManager.getInstance().getOnlyPlatName();
			/**进入玩家帐号  */
//			c2sProto.authkey="this-is-a-test-auth-key";
//			c2sProto.accountId="4184034930284438quick";
//			c2sProto.userId=24321;
			/**进入玩家帐号  */
			Transport.Send(c2sProto,_isNeedLoading);
		}
		
		
		public static function startInitGame():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_Initgame,c2s);
		}
		
		/**
		 *   获取当前地图得到的物品
		 */
		public static function getDigmapInfo(guanka:int):void{
//			var c2s:DigC2SProto=new DigC2SProto();
//			c2s.digInfo=new DigInfoC2S();
//			c2s.digInfo.curGuangka=guanka;
//			sendMessage(REQ_DigMapGetHandler,c2s);
		}
		
		/**
		 *   向后台发送获取信息
		 */
		public static function rewardDigItem(infoId:Number,guanka:int,rewardGoods:Object,rewardMoney:int,rewardCash:int,rewardExp:int,
											 curCeng:int,curGrid:int):void{
			if(rewardGoods==null) rewardGoods={};
			var c2s:DigC2SProto=new DigC2SProto();
			var digInfo:DigInfoC2S=new DigInfoC2S();
			c2s.digInfo=digInfo;
			digInfo.curGuangka=guanka;
			digInfo.rewardGoods=JSON.stringify(rewardGoods);
			digInfo.rewardMoney=rewardMoney;
			digInfo.rewardExp=rewardExp;
			digInfo.rewardCash=rewardCash;
			digInfo.curCeng=curCeng;
			digInfo.curGrid=curGrid;
			digInfo.infoId=Int64.fromNumber(infoId);
			
			sendMessage(REQ_DigRewardHandler,c2s);
		}
		
		/**
		 *   获取当前boss信息
		 */
		public static function initBattleInfo(guanka:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.digInfo=new DigInfoC2S();
			c2s.digInfo.curGuangka=guanka;
			sendMessage(REQ_DigBossGetHandler,c2s);
		}
		
		/**
		 * 战斗结束一起发送副本战斗信息
		 */
		public static function sendFubenBattleInfoTotal(_array:Array):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.battleBatch=_array;
			
			var mapModel:MapModel=Context.getInjectInstance(MapModel);
			c2s.fuben=new FubenC2S();
			c2s.fuben.xid=mapModel.currentChallengeFubenId;
			sendMessage(REQ_FubenBattleingHandler,c2s);
		}
		/**
		 *   战斗前发送的准备消息
		 */
		public static function sendBattlePre(fubenId:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.fuben=new FubenC2S();
			c2s.fuben.xid=fubenId;
			sendMessage(REQ_FubenBattlePreHandler,c2s);
		}
		
		/** 
		 *  清除副本挑战次数
		 */
		public static function clearTiaozhancishu(fubenId:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.fuben=new FubenC2S();
			c2s.fuben.xid=fubenId;
			sendMessage(REQ_FubenClearCountHandler,c2s);
		}
		
		public static function saodang(fubenId:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.fuben=new FubenC2S();
			c2s.fuben.xid=fubenId;
			sendMessage(REQ_FubenSaodangHandler,c2s);
			
		}
		
		public static function getFubenReward(fubenId:int,_isRetreat:int=0):void{
			
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.fuben=new FubenC2S();
			c2s.fuben.xid=fubenId;
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			var timeModel:TimerModel=Context.getInjectInstance(TimerModel);
			var gameTime:GameTime=new GameTime(battleModel.battleBase.battleMustEndTime-timeModel.serverTime);
			c2s.battle=new BattleC2S();
			c2s.battle.timeOut=int(gameTime.miliSecond<0);
			c2s.battle.retreat=_isRetreat;
			if(c2s.battle.timeOut==0)
			{
				trace("时间错误");
			}
			sendMessage(REQ_FubenBettleRewardHandler,c2s);			
		}
		/**  刷新神秘商店
		 * */
		public static function refreshShenmiShangdian():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_SpecialShopRefreshHandler,c2s);
		}
		/**  获取神秘商店数据
		 * */
		public static function getShengmiShangdianData():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_SpecialShopGetHandler,c2s);
		}
		
		/**  购买神秘商店的物品
		 * */
		public static function buyShenmiShangdianItem(xid:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.buy=new BuyInfoC2S();
			c2s.buy.heidianId=xid;
			sendMessage(REQ_SpecialShopBuyHandler,c2s);
		}
		
		/**  购买所有神秘商店物品
		 * */
		public static function buyAllShengmiShangdianItem():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_SpecialShopBuyAllHandler,c2s);
		}
		
		/**
		 *   体力刷新
		 */
		public static function tiliRefresh():void{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_TiliGetHandler,c2s,false,false);
		}
		/**
		 *   购买礼包并且使用
		 */
		public static function buyItemAndUse(itemId:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			var item:ItemC2S=new ItemC2S();
			item.xid=itemId;
			item.num=1;
			c2s.item=item;
			sendMessage(REQ_ItemBuyAndUseHandler,c2s);			
		}
		/**
		 * 获取邮件列表
		 */
		public static function getMailList():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_GetMailHandler,c2s);
		}
		/**
		 * 发送邮件
		 */
		public static function sendMail(_info:String,_userName:String,_uid:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.mail=new MailInfoC2S();
			c2s.mail.receiveUserName=_userName;
			c2s.mail.vars=_info;
			c2s.mail.receiveUserId=_uid;
			sendMessage(REQ_SendMailHandler,c2s);
		}
		/**
		 * 处理邮件
		 */
		public static function handleMail(_mailId:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.mail=new MailInfoC2S();
			c2s.mail.mailId=_mailId;
			c2s.mail.hanleStatus=1;
			sendMessage(REQ_HandleMailHandler,c2s);
		}
		/**
		 * 批量处理邮件
		 */
		public static function handleAllMail():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.mail=new MailInfoC2S();
			c2s.mail.hanleStatus=1;
			sendMessage(REQ_MailHandleAllHandler,c2s);
		}
		public static function buyTili():void{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_TiliBuyHandler,c2s);
		}
		
		/** 装备武器 **/
		public static function armyEquip(equipId:Number,hero:int):void{
			
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.equipInfo=new EquipInfoC2S();
			c2s.equipInfo.equipId=Int64.fromNumber(equipId);
			c2s.heroInfo=new HeroInfoC2S();
			c2s.heroInfo.heroId=hero;
			sendMessage(REQ_EquipArmhandler,c2s);
		}
		
		public static function armyWuqi(mainXid:int,wuqiXids:Array,heroId:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.equipInfo=new EquipInfoC2S();
			c2s.equipInfo.mainGunXid=mainXid;
			c2s.equipInfo.armGunXidList=JSON.stringify(wuqiXids);
			c2s.heroInfo=new HeroInfoC2S();
			c2s.heroInfo.heroId=heroId;
			sendMessage(REQ_EquipGunArmhandler,c2s);
		}
		
		/**
		 *   解锁背包
		 */
		public static function unlockBag(lockNum:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.bag=new BagC2S();
			c2s.bag.unlockNum=lockNum;
			sendMessage(REQ_EquipUnlockHandler,c2s);
		}
		/**
		 * 获取擂玩家列表
		 */
		public static function getLeitaiPersonList():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_LeitaiListGetHandler,c2s);
		}
		/**
		 * 挑战擂台玩家
		 */
		public static function challengeLeitaiPerson(_userId:int,_userRank:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.leitai=new LeitaiC2S();
			c2s.leitai.userId=_userId;
			c2s.leitai.rank=_userRank;
			sendMessage(REQ_LeitaiBattlePreHandler,c2s);
		}

		/**
		 * 战斗结束一起发送擂台战斗信息
		 */
		public static function sendLeitaiBattleInfoTotal(_array:Array):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.battleBatch=_array;
			sendMessage(REQ_LeitaiBattleIngHandler,c2s);
		}
		/**
		 * 获取擂台奖励
		 */
		public static function GetLeitaiReward(_userId:int,_isRetreat:int=0):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.leitai=new LeitaiC2S();
			c2s.leitai.userId=_userId;
			
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			var timeModel:TimerModel=Context.getInjectInstance(TimerModel);
			var gameTime:GameTime=new GameTime(battleModel.battleBase.battleMustEndTime-timeModel.serverTime);
			c2s.battle=new BattleC2S();
			c2s.battle.timeOut=int(gameTime.miliSecond<0);
			c2s.battle.retreat=_isRetreat;
			if(c2s.battle.timeOut==0)
			{
				trace("时间错误");
			}
			sendMessage(REQ_LeitaiBattleRewardHandler,c2s);
		}
		
		/** 强化装备  **/
		public static function enhanceEquip(equipId:Number,gridPos:int,heroId:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.equipInfo=new EquipInfoC2S();
			c2s.equipInfo.equipId=Int64.fromNumber(equipId);
			c2s.equipInfo.gridPos=gridPos;
			c2s.heroInfo=new HeroInfoC2S();
			c2s.heroInfo.heroId=heroId;
			sendMessage(REQ_EquipEhanceHandler,c2s);
		}
		
		public static function enhanceEquip10(equipId:Number,gridPos:int,heroId:int):void{
			
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.equipInfo=new EquipInfoC2S();
			c2s.equipInfo.equipId=Int64.fromNumber(equipId);
			c2s.equipInfo.gridPos=gridPos;
			c2s.heroInfo=new HeroInfoC2S();
			c2s.heroInfo.heroId=heroId;
			sendMessage(REQ_EquipEhanceBatchHandler,c2s);
		}
		
		/** 装备升星  **/
		public static function updateStarEquip(equipId:Number,gridPos:int,heroId:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.equipInfo=new EquipInfoC2S();
			c2s.equipInfo.equipId=Int64.fromNumber(equipId);
			c2s.equipInfo.gridPos=gridPos;
			c2s.heroInfo=new HeroInfoC2S();
			c2s.heroInfo.heroId=heroId;
			sendMessage(REQ_EquipUpStarHandler,c2s);
		}
		
		/** 宝石镶嵌 **/
		public static function baoshiArmy(baoshiXid:int,equipId:Number,gridPos:int,baoshiStateObj:Object,heroId:int):void{
			
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.equipInfo=new EquipInfoC2S();
			c2s.equipInfo.equipId=Int64.fromNumber(equipId);
			c2s.equipInfo.gridPos=gridPos;
			
			for (var key:String in baoshiStateObj){
				baoshiStateObj[key]=baoshiStateObj[key]+"";
			}
			
			c2s.equipInfo.baoshiArmStr=JSON.stringify(baoshiStateObj);
			c2s.equipInfo.baoshiXid=baoshiXid;
			c2s.heroInfo=new HeroInfoC2S();
			c2s.heroInfo.heroId=heroId;
			
			sendMessage(REQ_EquipBaoshiArmHandler,c2s);
		}
		/** 宝石升级 **/
		public static function baoshiUpdate(bxid:int,equipId:Number=0,equipType:int=0,gridIndex:int=0):void{
			
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.equipInfo=new EquipInfoC2S();
			c2s.equipInfo.baoshiXid=bxid;
			c2s.equipInfo.equipId=Int64.fromNumber(equipId);
			c2s.equipInfo.equipType=equipType;
			c2s.equipInfo.equipBaoshiGrid=gridIndex;
			sendMessage(REQ_EquipBaoshiJinhuaHandler,c2s);
		}
		
		/** 武器熔炼  **/
		public static function ronglianWuqi(equipIdList:Array):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.equipInfo=new EquipInfoC2S();
			c2s.equipInfo.idList=JSON.stringify(equipIdList);
			sendMessage(REQ_EquipRonglianHandler,c2s);
		}
		/** 装备吞噬  **/
		public static function shenzhuangTunshi(sourceEquipId:Number,equipIdList:Array):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.equipInfo=new EquipInfoC2S();
			c2s.equipInfo.idList=JSON.stringify(equipIdList);
			c2s.equipInfo.equipId=Int64.fromNumber(sourceEquipId);
			sendMessage(REQ_EquipNbLvupHandler,c2s);
		}
		
		/** 神装继承 **/
		public static function shenzhuangChuancheng(sourceEid:Number,targetEid:Number):void{
			
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.equipInfo=new EquipInfoC2S();
			c2s.equipInfo.extendEquipId=Int64.fromNumber(sourceEid);
			c2s.equipInfo.equipId=Int64.fromNumber(targetEid);
			sendMessage(REQ_EquipNbExtendHandler,c2s);
		}
		
		/**
		 * 解锁超能力
		 */
		public static function chaonengliJieSuo(_id:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.chaonengInfo=new ChaonengInfoC2S();
			c2s.chaonengInfo.chaonengXid=_id;
			sendMessage(REQ_ChaonengFireHandler,c2s);
		}
		/**
		 * 进化超能力
		 */
		public static function chaonengliJinhua():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_ChaonengUpHandler,c2s);
		}
		/**
		 *  领取任务奖励
		 */
		public static function getTaskReward(taskId:int):void{
			
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.task=new TaskInfoC2S();
			c2s.task.rewardXid=taskId;
			sendMessage(REQ_TaskRewardHandler,c2s);
		}
		
		/**
		 *   领取每日任务
		 */
		public static function getDailyTaskReward(taskId:int):void{
			
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.task=new TaskInfoC2S();
			c2s.task.rewardXid=taskId;
			sendMessage(REQ_DailyTaskRewardHandler,c2s);
		}
		
		/**
		 *   初始化挖矿，新手引导
		 */
		public static function initDig():void{
			
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_DigInitHandler,c2s,false);
		}
		/**
		 *   挖矿开始向后台发送消息
		 */
		public static function startDig(cycle:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.digInfo=new DigInfoC2S();
			c2s.digInfo.digCount=cycle;
//			c2s.digInfo.
			sendMessage(REQ_DigOperateBeginHandler,c2s,false);
		}
		/** 挖矿退出向后台发送的消息  **/
		public static function endDig(cycle:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.digInfo=new DigInfoC2S();
			c2s.digInfo.digCount=cycle;
			c2s.digInfo.rewardGoods="{}";
			sendMessage(REQ_DigOperateEndHandler,c2s,false);
		}
		/** 挖矿周期 **/
		public static function digOperate(cycle:int,equipXid:int=0):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.digInfo=new DigInfoC2S();
			c2s.digInfo.digCount=cycle;
			if(equipXid>0){
				var map:Object={};
				map[equipXid]=1;
				c2s.digInfo.rewardGoods=JSON.stringify(map);
			}
			
			sendMessage(REQ_DigOperatingHandler,c2s,false);
			trace("%%%% 挖了好多层: "+cycle);
		}
		
		/** 挖矿加速 **/
		public static function jaishuWakang():void{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_DigFastGuajiHandler,c2s);
		}
		
		/** 挖矿出售设置  **/
		public static function setWakangDigInfo(sellStar:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.digInfo=new DigInfoC2S();
			c2s.digInfo.equipSellStar=sellStar;
			sendMessage(REQ_DigSetterHandler,c2s);
		}
		
		/** 挖矿结算操作  **/
		public static function wakangJieshuang():void{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_DigC2SChargeHandler,c2s);
			
		}
		
		/** 挖矿升级 **/
		public static function wakuangShengji():void{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_DigUpgradeHandler,c2s);
		}
		/**
		 *   大副本冠名信息
		 */
		public static function getBigFubenGuanming(mapId:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.fuben=new FubenC2S();
			c2s.fuben.mapId=mapId;
			sendMessage(REQ_FubenNameGetHandler,c2s);
		}
		
		/**
		 *   小副本冠名详细信息
		 */
		public static function getSmallFunbenGuanming(fubenId:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.fuben=new FubenC2S();
			c2s.fuben.xid=fubenId;
			c2s.fuben.mapId=XMLDataManager.getFubenById(fubenId).fuben_map;
			sendMessage(REQ_FubenNameSmallGetHandler,c2s);
		}
		
		/**
		 *   冠名副本领取奖励
		 */
		public static function getGuanmingReward(fubenId:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.fuben=new FubenC2S();
			c2s.fuben.xid=fubenId;
			c2s.fuben.mapId=XMLDataManager.getFubenById(fubenId).fuben_map;
			sendMessage(REQ_FubenNamedRewardHandler,c2s);
		}
		
		//抽奖相关
		/**   抽奖数据初始化
		 * */
		public static function choujiangInit(needLoading:Boolean=false):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_ChoujiangInitHandler,c2s,needLoading);
		}
		
		/**  海选
		 * */
		public static function choujiang_haixuan():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_HaixuanChooseHandler,c2s);
		}
		/**  精选
		 * */
		public static function choujiang_jingxuan():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_JingxuanChooseHandler,c2s);
		}				
		/**  海选十连
		 * */
		public static function choujiang_haixuan_shilian():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_HaixuanBatchChooseHandler,c2s);
		}
		/**  精选十连
		 * */
		public static function choujiang_jingxuan_shilian():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_JingxuanBatchChooseHandler,c2s);
		}
		//新的选秀数据
		/**  
		 *   购买金币
		 */
		public static function buyMoney():void{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_MoneyBuyHandler,c2s);
		}
		
		/** 获取npc 人物数据 **/
		public static function getNpcerData():void{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_SyncUserActiveHandler,c2s);
		}
		
		/**
		 * 土豪排行
		 */
		public static function sendTuhaoRank():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_GetPayHonorListHandler,c2s);
		}
		/**
		 * 等级排行
		 */
		public static function sendLevelRank():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_GetLevelHonorListHandler,c2s);
		}
		/**
		 * 擂台排行
		 */
		public static function sendLeitaiRank():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_GetLeitaiHonorListHandler,c2s);
		}
		/**
		 * 连胜排行
		 */
		public static function sendLianshengRank():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_GetLianshengHonorListHandler,c2s);
		}
		/**
		 * 排行榜崇拜
		 */
		public static function RankList_chongbai(_userId:int,_optMsg:String):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.hornorList=new HonorListC2S();
			c2s.hornorList.userId=_userId;
			sendMessage(_optMsg,c2s);
		}
		/**
		 * 排行榜鄙视
		 */
		public static function Ranklist_bishi(_userId:int,_optMsg:String):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.hornorList=new HonorListC2S();
			c2s.hornorList.userId=_userId;
			sendMessage(_optMsg,c2s);
		}
		/**
		 * 隐藏或者排行榜排名
		 */
		public static function PaimingOpt():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_HideChongzhiHonorHandler,c2s);
		}
		
		/** 副本剧情处理  **/
		public static function fubenStoryComplete(fubenId:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.fuben=new FubenC2S();
			c2s.fuben.xid=fubenId;
			sendMessage(REQ_FubenStoryHandler,c2s);
		}
		
		/**
		 * 添加好友
		 */
		public static function addFriend(_name:String):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.friend=new FriendC2S();
			c2s.friend.name=_name
			sendMessage(REQ_AddFriendHandler,c2s);
		}
		
		/**
		 * 删除好友
		 */
		public static function removeFriend(_uid:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.friend=new FriendC2S();
			c2s.friend.id=_uid
			sendMessage(REQ_DeleteFriendHandler,c2s);
		}
		
		/**  随机获取一个好友名字
		 * */
		public static function getRandomFriend():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_GetFriendNameHandler,c2s);
		}
		
		/**
		 * 刷新聊天信息
		 */
		public static function refreshChatInfo(_isNeedLoading:Boolean=false):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_RefreshChatHandler,c2s,_isNeedLoading);
		}
		/**
		 * 初始化聊天信息
		 */
		public static function initChatInfo(_isNeedLoading:Boolean=false):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_FirstChatHandler,c2s,_isNeedLoading);
		}
		/**
		 * 发送聊天信息
		 */
		public static function sendChatInfo(_info:String):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.chat=new ChatC2S();
			c2s.chat.info=_info;
			sendMessage(REQ_ActionChatHandler,c2s);
		}
		
		/**
		 * 刷新聊天信息
		 */
		public static function refreshBanghuiChatInfo(_isNeedLoading:Boolean=false):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_BanghuiRefreshChatHandler,c2s,_isNeedLoading);
		}
		/**
		 * 初始化聊天信息
		 */
		public static function initBanghuiChatInfo(_isNeedLoading:Boolean=false):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_BanghuiFirstChatHandler,c2s,_isNeedLoading);
		}
		/**
		 * 发送聊天信息
		 */
		public static function sendBanghuiChatInfo(_info:String):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiChat=new BanghuiChatC2S();
			c2s.banghuiChat.info=_info;
			sendMessage(REQ_BanghuiActionChatHandler,c2s);
		}
		
		/**
		 * 请求系统通知
		 */
		public static function RequstNotice():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.serverNotice=new ServerNoticeC2S();
			c2s.serverNotice.zoneId=int(GLBaseData.serverId);
			sendMessage(REQ_GetServerNoticeHandler,c2s,false);
		}
		
		/** 设置新手引导  **/
		public static function setGuideStep(step:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.yinDao=new XinshouYinDaoC2S();
			c2s.yinDao.step=step;
			sendMessage(REQ_YindaoHandler,c2s,false);
		}
		
		/** 道具使用**/
		public static function useItem(itemId:int,useNum:int=1):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.item=new ItemC2S();
			c2s.item.xid=itemId;
			c2s.item.num=useNum;
			sendMessage(REQ_ItemUseHandelr,c2s);
		}
		
		/**
		 * 购买成长计划
		 */
		public static function buyChengzhangjihua():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_BuyChengzhangJihuaHandler,c2s);
		}
		/**
		 * 领取成长计划奖励
		 */
		public static function lingquChengzhangReward(_id:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.lingqu=new LingquJihua();
			c2s.lingqu.jihuaXid=_id;
			sendMessage(REQ_LingquChengzhangJihuaHandler,c2s);
		}
		/**
		 *  活动领取
		 */
		public static function lingquHuodong():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_Lingquhandler,c2s);
		}
		/**
		 * 获取开启活动列表
		 */
		public static function requestHuodongInfo(showWait:Boolean=true):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.huodongVersion="12345";
//			c2s.huodong.platname=PlatformManager.getInstance().getOnlyPlatName();
			sendMessage(REQ_GetHuodongListHandler,c2s,showWait);
		}
		/**
		 *   刮刮乐
		 */
		public static function huodongGuaguale():void{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_GuagualeHandler,c2s);
		}
		/**
		 * 财神下注
		 */
		public static function caishenXiazhu():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_CaishenRewardhandler,c2s);
		}
		/**  参拜
		 * */
		public static function canbai():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_CanBaihandler,c2s);
		}
		/**
		 *   收集活动的 补齐
		 */
		public static function shoujiBuqiItem(shoujiXid:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.yunying=new YunYingC2S();
			c2s.yunying.collectId=shoujiXid;
			sendMessage(REQ_ShoujiBuqi,c2s);
		}
		/**
		 *   收集活动的兑换
		 */
		public static function shoujiDuihuanItem(shoujiXid:int):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.yunying=new YunYingC2S();
			c2s.yunying.collectId=shoujiXid;
			sendMessage(REQ_ShoujiDuihuan,c2s);
		}
		
		/**
		 * 获取等级奖励
		 */
		public static function GetLevelReward_Huodong(_id:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.yunying=new YunYingC2S();
			c2s.yunying.lvHuodongRewardId=_id;
			sendMessage(REQ_OpenServerLvHandler,c2s);
		}
		/**
		 * 获取充值奖励
		 */
		public static function GetChongzhiReward_Huodong(_id:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.yunying=new YunYingC2S();
			c2s.yunying.payHuodongRewardId=_id;
			sendMessage(REQ_OpenServerPayHandler,c2s);
		}
		
		/**
		 *  获取server矿列表
		 */
		public static function requestServerKuang(_type:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.jinkuang=new JinKuangInfoC2S();
			c2s.jinkuang.type=_type;
			sendMessage(REQ_GetServerKuangInfoHandler,c2s);
		}
		/**
		 *  获取当前矿信息
		 */
		public static function getKuangDetail(_xid:int,_type:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.jinkuang=new JinKuangInfoC2S();
			c2s.jinkuang.kuangXid=_xid;
			c2s.jinkuang.type=_type;
			sendMessage(REQ_GetTargetKuangInfoHandler,c2s);
		}

		/**
		 *  附属矿区
		 */
		public static function fushuKuang(_xid:int,_type:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.jinkuang=new JinKuangInfoC2S();
			c2s.jinkuang.kuangXid=_xid;
			c2s.jinkuang.type=_type;
			sendMessage(REQ_FushuKuangHandler,c2s);
		}
		/**
		 *  收获矿区
		 */
		public static function shouhuoKuang(_xid:int,_type:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.jinkuang=new JinKuangInfoC2S();
			c2s.jinkuang.kuangXid=_xid;
			c2s.jinkuang.type=_type;
			sendMessage(REQ_GainKuangHandler,c2s);
		}
		/**
		 *  撤退矿区
		 */
		public static function chetuiKuang(_xid:int,_type:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.jinkuang=new JinKuangInfoC2S();
			c2s.jinkuang.kuangXid=_xid;
			c2s.jinkuang.type=_type;
			sendMessage(REQ_RetreatKuangHandler,c2s);
		}
		/**
		 * 获取用户金矿记录信息
		 */
		public static function getJinkuangLog():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.jinkuang=new JinKuangInfoC2S();
			sendMessage(REQ_GetUserInfoKuangHandler,c2s);
		}
		/**
		 * 领取用户金矿信息
		 */
		public static function lingquJinkuangLog(_logId:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.jinkuang=new JinKuangInfoC2S();
			c2s.jinkuang.infoId=_logId;
			sendMessage(REQ_GatherUserInfoKuangHandler,c2s);
		}
		public static function getUserKuangInfo():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_GetUserKuangHandler,c2s);			
		}
		
		/**
		 *  占领矿区
		 */
		public static function zhanlingKuang(_xid:int,_type:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.jinkuang=new JinKuangInfoC2S();
			c2s.jinkuang.kuangXid=_xid;
			c2s.jinkuang.type=_type;
			sendMessage(REQ_OccupyKuangHandler,c2s);
		}
		
		/**
		 *  驱赶矿区
		 */
		public static function occupyKuangPre(_xid:int,_type:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.jinkuang=new JinKuangInfoC2S();
			c2s.jinkuang.kuangXid=_xid;
			c2s.jinkuang.type=_type;
			sendMessage(REQ_KuangQuganPreHandler,c2s);
		}


		/**
		 * 驱赶矿区一起发送战斗信息
		 */
		public static function occupyKuangIng(_array:Array):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.battleBatch=_array;
			c2s.jinkuang=new JinKuangInfoC2S();
			c2s.jinkuang.kuangXid=JinkuangModel.cacheJinkuangXid;
			var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
			c2s.jinkuang.type=jinkuangModel.cacheRukouData.type;
			sendMessage(REQ_KuangQuganBattleHandler,c2s);
		}
		
		/**
		 * 驱赶矿区获取战斗结果
		 */
		public static function GetOccupyKuangReward(_isRetreat:int=0):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.jinkuang=new JinKuangInfoC2S();
			c2s.jinkuang.kuangXid=JinkuangModel.cacheJinkuangXid;
			var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
			c2s.jinkuang.type=jinkuangModel.cacheRukouData.type;
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			var timeModel:TimerModel=Context.getInjectInstance(TimerModel);
			var gameTime:GameTime=new GameTime(battleModel.battleBase.battleMustEndTime-timeModel.serverTime);
			c2s.battle=new BattleC2S();
			c2s.battle.timeOut=int(gameTime.miliSecond<0);
			c2s.battle.retreat=_isRetreat;
			if(c2s.battle.timeOut==0)
			{
				trace("时间错误");
			}
			sendMessage(REQ_KuangQuganRewardHandler,c2s);
		}
		/**
		 *  掠夺矿区
		 */
		public static function lveduoKuangPre(_xid:int,_type:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.jinkuang=new JinKuangInfoC2S();
			c2s.jinkuang.kuangXid=_xid;
			c2s.jinkuang.type=_type;
			sendMessage(REQ_KuangLveduoPreHandler,c2s);
		}
		
		/**
		 * 掠夺矿区一起发送战斗信息
		 */
		public static function lveduoKuangIng(_array:Array):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.battleBatch=_array;
			c2s.jinkuang=new JinKuangInfoC2S();
			c2s.jinkuang.kuangXid=JinkuangModel.cacheJinkuangXid;
			var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
			c2s.jinkuang.type=jinkuangModel.cacheRukouData.type;
			sendMessage(REQ_KuangLveduoBattleHandler,c2s);
		}
		
		/**
		 * 掠夺矿区获取战斗结果
		 */
		public static function GetLveduoKuangReward(_isRetreat:int=0):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.jinkuang=new JinKuangInfoC2S();
			c2s.jinkuang.kuangXid=JinkuangModel.cacheJinkuangXid;
			var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
			c2s.jinkuang.type=jinkuangModel.cacheRukouData.type;
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			var timeModel:TimerModel=Context.getInjectInstance(TimerModel);
			var gameTime:GameTime=new GameTime(battleModel.battleBase.battleMustEndTime-timeModel.serverTime);
			c2s.battle=new BattleC2S();
			c2s.battle.timeOut=int(gameTime.miliSecond<0);
			c2s.battle.retreat=_isRetreat;
			if(c2s.battle.timeOut==0)
			{
				trace("时间错误");
			}
			sendMessage(REQ_KuangLveduoRewardHandler,c2s);
		}
		/**
		 *   领取新版本的cdkey礼包
		 */
		public static function getNewCdKeyReward(cdkey:String):void{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.yunying=new YunYingC2S();
			c2s.yunying.cdkey=cdkey;
			sendMessage(REQ_NEWCDKeyRewardHandler,c2s);
		}
		
		/**
		 * 荣誉购买
		 */
		public static function shengwangBuy(_xid:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.rongyu=new RongyuC2S();
			c2s.rongyu.buyXid=_xid;
			sendMessage(REQ_RongyuShangdianBuyHandler,c2s);			
		}
		
		/**
		 * 帮会创建
		 */
		public static function banghuiChuanjian(_banghuiName:String,_iconId:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiInfo=new BanghuiInfoC2S();
			c2s.banghuiInfo.banghuiName=_banghuiName;
			c2s.banghuiInfo.iconId=_iconId;
			sendMessage(REQ_BanghuiChuangjianHandler,c2s);
		}
		/**
		 * 获取帮会列表
		 */
		public static function getBanghuiList():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_GetBanghuiListHandler,c2s);
		}
		/**
		 * 获得帮会详细信息
		 */
		public static function getBanghuiDetail(_banghuiId:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiInfo=new BanghuiInfoC2S();
			c2s.banghuiInfo.banghuiId=_banghuiId;
			sendMessage(REQ_GetBanghuiInfoHandler,c2s);
		}
		/**
		 * 帮会解散
		 */
		public static function jiesanBanghui(_bid:int,_passWord:String):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiInfo=new BanghuiInfoC2S();
			c2s.banghuiInfo.password=_passWord;
			c2s.banghuiInfo.banghuiId=_bid;
			sendMessage(REQ_BanghuiJiesanHandler,c2s);			
		}
		/**
		 * 获取自己的帮会信息
		 */
		public static function getBanghuiInitInfo():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_GetBanghuiInitHandler,c2s);
		}
		/**
		 * 申请帮会
		 */
		public static function shenQingBanghui(_bid:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiShenqing=new BanghuiShenqingC2S();
			c2s.banghuiShenqing.banghuiId=_bid;
			sendMessage(REQ_JoinBanghuiHandler,c2s);
		}
		/**
		 * 取消申请帮会
		 */
		public static function quxiaoShenqingBanghui(_bid:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiShenqing=new BanghuiShenqingC2S();
			c2s.banghuiShenqing.banghuiId=_bid;
			sendMessage(REQ_JoinCancelBanghuiHandler,c2s);
		}
		/**
		 * 获取帮会成员列表
		 */
		public static function getBanghuiChengyuanList(_bid:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiInfo=new BanghuiInfoC2S();
			c2s.banghuiInfo.banghuiId=_bid;
			sendMessage(REQ_GetBanghuiPersonHandler,c2s);
		}
		/**
		 * 获取帮会申请加入成员的列表
		 */
		public static function getBanghuishenqingPersionList(_bid:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiInfo=new BanghuiInfoC2S();
			c2s.banghuiInfo.banghuiId=_bid;
			sendMessage(REQ_GetBanghuiShenqingHandler,c2s);
		}
		/**
		 * 踢出帮会成员
		 */
		public static function tichuBanghuiChengyuan(_uid:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiTiren=new BanghuiTirenC2S();
			c2s.banghuiTiren.userId=_uid;			
			sendMessage(REQ_DeleteBanghuiChengyuanHandler,c2s);
		}
		/**
		 * 同意加入帮会申请
		 */
		public static function tongyiBanghuiShenqing(_uid:int,_bid:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiShenqing=new BanghuiShenqingC2S();
			c2s.banghuiShenqing.userId=_uid;
			c2s.banghuiShenqing.accept=1;
			c2s.banghuiShenqing.banghuiId=_bid;
			sendMessage(REQ_BanghuiShenqingHandleHandler,c2s);
		}
		/**
		 * 拒绝加入帮会申请
		 */
		public static function jujueBanghuiShenqing(_uid:int,_bid:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiShenqing=new BanghuiShenqingC2S();
			c2s.banghuiShenqing.userId=_uid;
			c2s.banghuiShenqing.accept=0;
			c2s.banghuiShenqing.banghuiId=_bid;
			sendMessage(REQ_BanghuiShenqingHandleHandler,c2s);
		}
		/**
		 * 打开帮会商城
		 */
		public static function getShangchengInfo():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_GetBanghuiShopHandler,c2s);
		}
		/**
		 * 购买珍品
		 */
		public static function buyBanghuishangcheng_zhenpin(_xid:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiBuy=new BanghuiBuy();
			c2s.banghuiBuy.xid=_xid;
			sendMessage(REQ_BuyBanghuiZhenpinHandler,c2s);
		}
		/**
		 * 购买珍品
		 */
		public static function buyBanghuishangcheng_daoju(_xid:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiBuy=new BanghuiBuy();
			c2s.banghuiBuy.xid=_xid;
			sendMessage(REQ_BuyBanghuiItemHandler,c2s);
		}
		/**
		 * 个人退出帮会
		 */
		public static function tuichuBanghui(_bid:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiInfo=new BanghuiInfoC2S();
			c2s.banghuiInfo.banghuiId=_bid;
			sendMessage(REQ_QuitBanghuiHandler,c2s);
		}
		/**
		 * 获取帮会大厅信息
		 */
		public static function getBanghuiDatingInfo():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_GetBanghuiDatingHandler,c2s);
		}
		/**
		 * 帮会大厅建设
		 */
		public static function jiansheDating(_id:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiJianshe=new BanghuiJianshe();
			c2s.banghuiJianshe.xid=_id;
			sendMessage(REQ_JiansheBanghuiDatingHandler,c2s);
		}
		/**
		 * 获取关公庙信息
		 */
		public static function getGuangongmiaoInfo():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_GetBanghuiMiaoHandler,c2s);
		}
		/**
		 * 参拜关公庙
		 */
		public static function canbaiGuangongmiao():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_CanbaiBanghiuMiaoHandler,c2s);
		}
		/**
		 * 升级帮会商城
		 */
		public static function levelupBanghuiShangcheng():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_LvupBanghuiShopHandler,c2s);
		}
		/**
		 * 升级帮会大厅
		 */
		public static function levelupBanghuiDating():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_LvupBanghuiDating,c2s);
		}
		/**
		 * 升级帮会关公庙
		 */
		public static function levelupBanghuiGuangongmiao():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_LvupBanghuiMiaoHandler,c2s);
		}
		/**
		 * 修改帮会密码
		 */
		public static function changeBanghuiPassWord(_bid:int,_old:String,_new:String):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiInfo=new BanghuiInfoC2S();
			c2s.banghuiInfo.banghuiId=_bid;
			c2s.banghuiInfo.password=_old;
			c2s.banghuiInfo.newpassword=_new;
			sendMessage(REQ_ChangeBanghuiPasswordHandler,c2s);
		}
		/**
		 * 修改帮会宣言
		 */
		public static function changeBanghuiXuanyan(_bid:int,_xuanyan:String):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiInfo=new BanghuiInfoC2S();
			c2s.banghuiInfo.banghuiId=_bid;
			c2s.banghuiInfo.xuanyan=_xuanyan;
			sendMessage(REQ_ChangeBanghuiXuanyanHandler,c2s);
		}
		/**
		 * 修改帮会公告
		 */
		public static function changeBanghuiGonggao(_bid:int,_gonggao:String):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiInfo=new BanghuiInfoC2S();
			c2s.banghuiInfo.banghuiId=_bid;
			c2s.banghuiInfo.gonggao=_gonggao;
			sendMessage(REQ_ChangeBanghuiGonggaoHandler,c2s);
		}
		/**
		 * 请求帮会战报名帮会列表
		 */
		public static function BaomingBanghuiList():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_banghuiBaomingListHandler,c2s);
		}
		/**
		 * 帮会战帮会报名
		 */
		public static function banghuizhanBanghuiBaoming():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_banghuiBaomingHandler,c2s);
		}
		/**
		 * 帮会成员报名参加帮会战
		 */
		public static function banghuichengyuanBaoming():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_banghuiCanzhanHandler,c2s);
		}
		/**
		 * 获取帮会战各个帮会积分
		 */
		public static function banghuizhanJifenList():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_banghuiBattleListHandler,c2s);
		}
		/**
		 * 获取帮会战各个帮会积分
		 */
		public static function banghuizhanResultJifenList():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_BanghuiResultListHandler,c2s);
		}
		/**
		 * 每个帮会积分详细信息
		 */
		public static function banghuiJifenDetail():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_banghuiDetailListHandler,c2s);
		}
		/**
		 * 获取帮会战个人奖励
		 */
		public static function HuoquBanghuizhanJiangli():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_banghuiGetRewardHandler,c2s);
		}
		/**
		 * 获取帮会战帮会成员信息
		 */
		public static function banghuizhanGerenList():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_banghuiPlayerListHandler,c2s);
		}
		/**
		 * 打开帮会红包窗口
		 */
		public static function openBanghuiHongbaoList():void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			sendMessage(REQ_BanghuiRedPacketListHandler,c2s);
		}
		/**
		 * 领取 帮会红包
		 */
		public static function LingquBanghuiHongbaoList(_id:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.banghuiInfo=new BanghuiInfoC2S();
			c2s.banghuiInfo.redPacketId=_id;
			sendMessage(REQ_BanghuiRedPacketGetHandler,c2s);
		}
		/**
		 * 获取其他玩家装备信息
		 */
		public static function getOtherPersonInfo(_userId:int):void
		{
			var c2s:DigC2SProto=new DigC2SProto();
			c2s.ohter=new OtherInfoC2S();
			c2s.ohter.otherUserId=_userId;
			sendMessage(REQ_OtherPersonInfoGetHandler,c2s);
		}
	}
}