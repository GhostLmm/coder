package com.fish.modules.core
{
	import com.fish.modules.core.commands.CoCnd_InitComplete;
	import com.fish.modules.core.commands.CoCnd_StartInit;
	import com.fish.modules.core.commands.CoCnd_SwitchToBattle;
	import com.fish.modules.core.events.CoreEvent;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.BaoshiModel;
	import com.fish.modules.core.models.BattleModel;
	import com.fish.modules.core.models.BroadMessageModel;
	import com.fish.modules.core.models.BuyItemModel;
	import com.fish.modules.core.models.ChaonengliModel;
	import com.fish.modules.core.models.ChatModel;
	import com.fish.modules.core.models.ChongzhiModel;
	import com.fish.modules.core.models.ChoujiangModel;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.FriendModel;
	import com.fish.modules.core.models.GonghuiModel;
	import com.fish.modules.core.models.GrowthModel;
	import com.fish.modules.core.models.GuankaModel;
	import com.fish.modules.core.models.GuideModel;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.HuoDongModel;
	import com.fish.modules.core.models.HuodongControlModel;
	import com.fish.modules.core.models.ItemModel;
	import com.fish.modules.core.models.JinkuangModel;
	import com.fish.modules.core.models.LeitaiModel;
	import com.fish.modules.core.models.MailModel;
	import com.fish.modules.core.models.MapModel;
	import com.fish.modules.core.models.RankModel;
	import com.fish.modules.core.models.ShengwangModel;
	import com.fish.modules.core.models.ShenmiShangdianModel;
	import com.fish.modules.core.models.ShoujiModel;
	import com.fish.modules.core.models.TaskModel;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.UserModel;
	import com.fish.modules.core.models.VipModel;
	import com.fish.modules.core.models.WalkNpcModel;
	import com.fish.modules.core.models.ZombieModel;
	import com.fish.modules.preloadMD.models.SystemMD;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.api.IModelMap;
	import com.ghostlmm.lightMVC.impl.ModuleCofig;
	
	import ui.AddMoneyWindow;
	import ui.MDI_AddMoney;
	import ui.bag.BagWindow;
	import ui.bag.HeroDetailWidow;
	import ui.bag.MDI_Bag;
	import ui.bag.MDI_HeroDetail;
	import ui.bag.MDI_UseItem;
	import ui.bag.UseItemWindow;
	import ui.baoshi.BaoshiShengjiWindow;
	import ui.baoshi.BaoshiTishiWindow;
	import ui.baoshi.MDI_BaoshiShengji;
	import ui.baoshi.MDI_BaoshiTishi;
	import ui.battle.BianqiangWindow;
	import ui.battle.ExitbattleWindow;
	import ui.battle.MDI_Bianqiang;
	import ui.battle.MDI_Exitbattle;
	import ui.battle.MDI_Shengli;
	import ui.battle.MDI_Shibai;
	import ui.battle.ShengliWindow;
	import ui.battle.ShibaiWindow;
	import ui.chaonengli.ChaonengliJinhuaWindow;
	import ui.chaonengli.ChaonengliWindow;
	import ui.chaonengli.Chaonengli_WeiJiesuo_Window;
	import ui.chaonengli.Chaonengli_YiJiesuo_Window;
	import ui.chaonengli.MDI_Chaonengli;
	import ui.chaonengli.MDI_ChaonengliJinhua;
	import ui.chaonengli.MDI_Chaonengli_WeiJiesuo;
	import ui.chaonengli.MDI_Chaonengli_YiJiesuo;
	import ui.chongzhi.ChongzhiWindow;
	import ui.chongzhi.MDI_Chongzhi;
	import ui.chongzhi.MDI_Shouchong;
	import ui.chongzhi.ShouchongWindow;
	import ui.choujiang.ChoujiangXuanzeWindow;
	import ui.choujiang.ChoujiangfenjieWindow;
	import ui.choujiang.DanchouWindow;
	import ui.choujiang.JingxuanWindow;
	import ui.choujiang.MDI_ChoujiangXuanze;
	import ui.choujiang.MDI_Choujiangfenjie;
	import ui.choujiang.MDI_Danchou;
	import ui.choujiang.MDI_JingXuan;
	import ui.choujiang.MDI_Shilianchou;
	import ui.choujiang.ShilianshouWindow;
	import ui.dig.DigJiashuTipWindow;
	import ui.dig.DigRewardWindow;
	import ui.dig.MDI_DigReward;
	import ui.dig.MDI_DigjiashuTip;
	import ui.dig.MDI_WakangShengji;
	import ui.dig.MDI_ZidongChushou;
	import ui.dig.WakuangShengjiWindow;
	import ui.dig.ZidongChushouWindow;
	import ui.digWindow.JiubaWindow;
	import ui.digWindow.LeitaiWindow;
	import ui.digWindow.LevelUpWindow;
	import ui.digWindow.MDI_Jiuba;
	import ui.digWindow.MDI_Leitai;
	import ui.digWindow.MDI_LevelUp;
	import ui.digWindow.MDI_Renwu;
	import ui.digWindow.RenwuWindow;
	import ui.equip.BaoshiSaixuanWindow;
	import ui.equip.ChuanchengWindow;
	import ui.equip.EquipCaozuoWindow;
	import ui.equip.EquipChuandaiWindow;
	import ui.equip.EquipOpenWindow;
	import ui.equip.EquipRonglianWindow;
	import ui.equip.MDI_BaoshiSaixuan;
	import ui.equip.MDI_Chuancheng;
	import ui.equip.MDI_EquipCaozuo;
	import ui.equip.MDI_EquipChuandai;
	import ui.equip.MDI_EquipOpen;
	import ui.equip.MDI_EquipRonglian;
	import ui.equip.MDI_ShenzhuangTunshi;
	import ui.equip.ShenzhuangTunshiWindow;
	import ui.friend.HaoyouWindow;
	import ui.friend.MDI_HaoyouWindow;
	import ui.friend.MDI_TianjiaHaoyouWindow;
	import ui.friend.TianjiaHaoyouWindow;
	import ui.fuben.FubenCailiaoSelectWindow;
	import ui.fuben.FubenChakanWindow;
	import ui.fuben.FubenPaihangRewardWindow;
	import ui.fuben.GuanmingRewardWindow;
	import ui.fuben.MDI_FubenCailiaoSelect;
	import ui.fuben.MDI_FubenChakan;
	import ui.fuben.MDI_FubenPaihangReward;
	import ui.fuben.MDI_GuanmingReward;
	import ui.fuben.MDI_Saodang;
	import ui.fuben.MDI_TiliGoumai;
	import ui.fuben.SaodangWindow;
	import ui.fuben.TiliGoumaiWindow;
	import ui.gonghui.BangJiesanWindow;
	import ui.gonghui.BanghuiChakanWindow;
	import ui.gonghui.BanghuiChengyuanWindow;
	import ui.gonghui.BanghuiChuangjianWindow;
	import ui.gonghui.BanghuiGonggaoWindow;
	import ui.gonghui.BanghuiGuanliWindow;
	import ui.gonghui.BanghuiHongbaoWindow;
	import ui.gonghui.BanghuiMainWindow;
	import ui.gonghui.BanghuiShangchengWindow;
	import ui.gonghui.BanghuiShenqingWindow;
	import ui.gonghui.BanghuiXuanyanWindow;
	import ui.gonghui.GonghuidatingWindow;
	import ui.gonghui.GuangongRewardChakanWindow;
	import ui.gonghui.GuangongRewardHuodeWindow;
	import ui.gonghui.GuangongdianWindow;
	import ui.gonghui.MDI_BangJiesan;
	import ui.gonghui.MDI_BanghuiChakan;
	import ui.gonghui.MDI_BanghuiChengyuan;
	import ui.gonghui.MDI_BanghuiChuangjian;
	import ui.gonghui.MDI_BanghuiGonggao;
	import ui.gonghui.MDI_BanghuiGuanli;
	import ui.gonghui.MDI_BanghuiHongbao;
	import ui.gonghui.MDI_BanghuiMain;
	import ui.gonghui.MDI_BanghuiShangcheng;
	import ui.gonghui.MDI_BanghuiShenqing;
	import ui.gonghui.MDI_BanghuiXuanyan;
	import ui.gonghui.MDI_Gonghuidating;
	import ui.gonghui.MDI_GuangongRewardChakan;
	import ui.gonghui.MDI_GuangongRewardHuode;
	import ui.gonghui.MDI_Guangongdian;
	import ui.gonghui.MDI_MimaXiugai;
	import ui.gonghui.MimaXiugaiWindow;
	import ui.gun.GenghuanqiangzhiWindow;
	import ui.gun.MDI_GenghuanQiangzhi;
	import ui.jinkuang.JinkuangLogWindow;
	import ui.jinkuang.JinkuangNoOccupiedWindow;
	import ui.jinkuang.JinkuangRukouWindow;
	import ui.jinkuang.JinkuangWindow;
	import ui.jinkuang.JinkuangguizeWindow;
	import ui.jinkuang.MDI_Jinkuang;
	import ui.jinkuang.MDI_JinkuangLog;
	import ui.jinkuang.MDI_JinkuangNoOccupied;
	import ui.jinkuang.MDI_JinkuangRukou;
	import ui.jinkuang.MDI_Jinkuangguize;
	import ui.jinkuang.MDI_Zhanling;
	import ui.jinkuang.ZhanlingWindow;
	import ui.layer.MDI_NewWorld;
	import ui.layer.MDI_UiLayer;
	import ui.layer.UiLayer;
	import ui.layer.WorldLayer;
	import ui.leitai.LeitaiPkWindow;
	import ui.leitai.LeitaiRewardWindow;
	import ui.leitai.MDI_LeitaiPk;
	import ui.leitai.MDI_LeitaiReward;
	import ui.liaotian.LiaotianWindow;
	import ui.liaotian.MDI_Liaotian;
	import ui.paihangbang.MDI_Persondetail;
	import ui.paihangbang.MDI_Ranking;
	import ui.paihangbang.PersondetailWindow;
	import ui.paihangbang.RankingWindow;
	import ui.shezhi.CaidanWindow;
	import ui.shezhi.CdKeyWindow;
	import ui.shezhi.MDI_CaidanWindow;
	import ui.shezhi.Mdi_Cdkey;
	import ui.shop.MDI_Rongyuchakan;
	import ui.shop.MDI_Shop;
	import ui.shop.RongyuchakanWindow;
	import ui.shop.ShopWindow;
	import ui.task.MDI_Task;
	import ui.task.TaskWindow;
	import ui.vip.MDI_Vip;
	import ui.vip.VipWindow;
	import ui.window.CommonRewardWindow;
	import ui.window.MDI_CommonReward;
	import ui.window.huodong.HuodongNewWindow;
	import ui.window.huodong.MDI_HuodongNew;
	import ui.window.mail.HaoyouLiuyanWindow;
	import ui.window.mail.MDI_HaoyouLiuyan;
	import ui.window.mail.MDI_Youjian;
	import ui.window.mail.MDI_YoujianChakan;
	import ui.window.mail.YoujianChakanWindow;
	import ui.window.mail.YoujianWindow;
	
	public class CoreConfig extends ModuleCofig
	{
		public static const NAME:String="coremodule";
		public function CoreConfig()
		{
			super(NAME);
		}
		
		protected override function registerModel():void
		{
			modelMap.map(TimerModel);
			modelMap.map(GuankaModel);
			modelMap.map(UserModel);
			modelMap.map(ItemModel);
			modelMap.map(EquipModel);
			modelMap.map(HeroModel);
			modelMap.map(BattleModel);
			modelMap.map(MapModel);
			modelMap.map(ShenmiShangdianModel);
			modelMap.map(BuyItemModel);
			modelMap.map(MailModel);
			modelMap.map(BagModel);
			modelMap.map(BaoshiModel);
			modelMap.map(LeitaiModel);
			modelMap.map(TaskModel);
			modelMap.map(ChaonengliModel);
			modelMap.map(ZombieModel);
			modelMap.map(ChoujiangModel);
			modelMap.map(WalkNpcModel);
			modelMap.map(RankModel);
			modelMap.map(FriendModel);
			modelMap.map(ChatModel);
			modelMap.map(BroadMessageModel);
			modelMap.map(GuideModel);
			modelMap.map(VipModel);
			modelMap.map(ChongzhiModel);
			modelMap.map(HuoDongModel);
			modelMap.map(HuodongControlModel);
			modelMap.map(GrowthModel);
			modelMap.map(ShoujiModel);
			modelMap.map(JinkuangModel);
			modelMap.map(ShengwangModel);
			modelMap.map(GonghuiModel);
		}
		protected override function registerMediator():void
		{			
			testWindowNameArray=[];
			testWindowClsArray=[];
			mediatorMap.map(UiLayer,MDI_UiLayer);
//			mediatorMap.map(WorldLayer,MDI_World);
			mediatorMap.map(WorldLayer,MDI_NewWorld);
			mediatorMap.map(LeitaiRewardWindow,MDI_Leitai);
			mediatorMap.map(JiubaWindow,MDI_Jiuba);
			mediatorMap.map(RenwuWindow,MDI_Renwu);
			mediatorMap.map(LevelUpWindow,MDI_LevelUp);
			
			mediatorMap.map(BagWindow,MDI_Bag);
			
			mediatorMap.map(FubenChakanWindow,MDI_FubenChakan);
			mediatorMap.map(ShopWindow,MDI_Shop);

			mediatorMap.map(CommonRewardWindow,MDI_CommonReward);
			
			//邮件相关
			mediatorMap.map(YoujianWindow,MDI_Youjian);
			mediatorMap.map(HaoyouLiuyanWindow,MDI_HaoyouLiuyan);
			mediatorMap.map(YoujianChakanWindow,MDI_YoujianChakan);
			
			mediatorMap.map(SaodangWindow,MDI_Saodang);
			mediatorMap.map(TiliGoumaiWindow,MDI_TiliGoumai);
			mediatorMap.map(ShibaiWindow,MDI_Shibai);
			mediatorMap.map(ShengliWindow,MDI_Shengli);
			mediatorMap.map(EquipChuandaiWindow,MDI_EquipChuandai);
			mediatorMap.map(EquipOpenWindow,MDI_EquipOpen);
			mediatorMap.map(EquipCaozuoWindow,MDI_EquipCaozuo);
			mediatorMap.map(BaoshiSaixuanWindow,MDI_BaoshiSaixuan);
			mediatorMap.map(BaoshiTishiWindow,MDI_BaoshiTishi);
			mediatorMap.map(BaoshiShengjiWindow,MDI_BaoshiShengji);
			mediatorMap.map(EquipRonglianWindow,MDI_EquipRonglian);
			mediatorMap.map(ChaonengliWindow,MDI_Chaonengli);
			mediatorMap.map(FubenCailiaoSelectWindow,MDI_FubenCailiaoSelect);
			mediatorMap.map(TaskWindow,MDI_Task);
			mediatorMap.map(Chaonengli_YiJiesuo_Window,MDI_Chaonengli_YiJiesuo);
			mediatorMap.map(Chaonengli_WeiJiesuo_Window,MDI_Chaonengli_WeiJiesuo);
			mediatorMap.map(LeitaiPkWindow,MDI_LeitaiPk);
			
			mediatorMap.map(CaidanWindow,MDI_CaidanWindow);
			mediatorMap.map(ChuanchengWindow,MDI_Chuancheng);
			mediatorMap.map(ShenzhuangTunshiWindow,MDI_ShenzhuangTunshi);
			
			mediatorMap.map(GenghuanqiangzhiWindow,MDI_GenghuanQiangzhi);
			mediatorMap.map(AddMoneyWindow,MDI_AddMoney);
			mediatorMap.map(GuanmingRewardWindow,MDI_GuanmingReward);
			
			mediatorMap.map(ChoujiangXuanzeWindow,MDI_ChoujiangXuanze);
			mediatorMap.map(JingxuanWindow,MDI_JingXuan);
			mediatorMap.map(ShilianshouWindow,MDI_Shilianchou);
			mediatorMap.map(DanchouWindow,MDI_Danchou);
			mediatorMap.map(DigRewardWindow,MDI_DigReward);
			mediatorMap.map(DigJiashuTipWindow,MDI_DigjiashuTip);
			
			mediatorMap.map(ZidongChushouWindow,MDI_ZidongChushou);
			mediatorMap.map(WakuangShengjiWindow,MDI_WakangShengji);
			
			mediatorMap.map(FubenPaihangRewardWindow,MDI_FubenPaihangReward);
			mediatorMap.map(RankingWindow,MDI_Ranking);
			mediatorMap.map(HaoyouWindow,MDI_HaoyouWindow);
			mediatorMap.map(TianjiaHaoyouWindow,MDI_TianjiaHaoyouWindow);
//			mediatorMap.map(LiaotianWindow,MDI_Liaotian);
			mediatorMap.map(VipWindow,MDI_Vip);
			mediatorMap.map(ChongzhiWindow,MDI_Chongzhi);
			mediatorMap.map(ShouchongWindow,MDI_Shouchong);
			mediatorMap.map(HuodongNewWindow,MDI_HuodongNew);
			
			mediatorMap.map(JinkuangWindow,MDI_Jinkuang);
			mediatorMap.map(JinkuangLogWindow,MDI_JinkuangLog);
			mediatorMap.map(JinkuangNoOccupiedWindow,MDI_JinkuangNoOccupied);
			mediatorMap.map(JinkuangRukouWindow,MDI_JinkuangRukou);
			mediatorMap.map(ZhanlingWindow,MDI_Zhanling);
			
			mediatorMap.map(UseItemWindow,MDI_UseItem);
			mediatorMap.map(CdKeyWindow,Mdi_Cdkey);
			mediatorMap.map(HeroDetailWidow,MDI_HeroDetail);
			
			mediatorMap.map(RongyuchakanWindow,MDI_Rongyuchakan);
			mediatorMap.map(ExitbattleWindow,MDI_Exitbattle);
			
			//帮会相关
			mediatorMap.map(BanghuiShenqingWindow,MDI_BanghuiShenqing);
			mediatorMap.map(BanghuiChakanWindow,MDI_BanghuiChakan);
			mediatorMap.map(BanghuiMainWindow,MDI_BanghuiMain);
			mediatorMap.map(GonghuidatingWindow,MDI_Gonghuidating);
			mediatorMap.map(BanghuiGuanliWindow,MDI_BanghuiGuanli);
			mediatorMap.map(BanghuiGonggaoWindow,MDI_BanghuiGonggao);
			mediatorMap.map(BanghuiXuanyanWindow,MDI_BanghuiXuanyan);
			mediatorMap.map(MimaXiugaiWindow,MDI_MimaXiugai);
			mediatorMap.map(BanghuiShangchengWindow,MDI_BanghuiShangcheng);	
			mediatorMap.map(BanghuiChengyuanWindow,MDI_BanghuiChengyuan);
			mediatorMap.map(BanghuiChuangjianWindow,MDI_BanghuiChuangjian);
			mediatorMap.map(BangJiesanWindow,MDI_BangJiesan);
			mediatorMap.map(GuangongRewardChakanWindow,MDI_GuangongRewardChakan);
			mediatorMap.map(GuangongdianWindow,MDI_Guangongdian);	
			mediatorMap.map(BanghuiHongbaoWindow,MDI_BanghuiHongbao);
			mediatorMap.map(GuangongRewardHuodeWindow,MDI_GuangongRewardHuode);
			
			mediatorMap.map(LeitaiRewardWindow,MDI_LeitaiReward);
			mediatorMap.map(PersondetailWindow,MDI_Persondetail);
			mediatorMap.map(BianqiangWindow,MDI_Bianqiang);
			
			mediatorMap.map(ChoujiangfenjieWindow,MDI_Choujiangfenjie);
			
			mediatorMap.map(ChaonengliJinhuaWindow,MDI_ChaonengliJinhua);
			
			mediatorMap.map(JinkuangguizeWindow,MDI_Jinkuangguize);
		}
		
		private function addTestWindow(wmCls:Class,mdCls:Class,clsName:String):void{
			testWindowClsArray.push(wmCls);
			testWindowNameArray.push("WindowZidongChushou");
		}
		private function removeTestWindow():void{
			for each(var cls:Class in testWindowClsArray){
				mediatorMap.unmap(cls);
			}
		}
		public static var testWindowNameArray:Array;
		private static var testWindowClsArray:Array;
		
		protected override function regitserCommand():void
		{
			
			commandMap.map(CoreEvent.StartInitGame,CoreEvent,CoCnd_StartInit);
			commandMap.map(CoreEvent.GameInitComplete,CoreEvent,CoCnd_InitComplete);
//			commandMap.map(CoreEvent.SwitchToBattle,CoreEvent,CoCnd_SwitchToBattle);
			commandMap.map(CoreSwitchEvent.SwitchToBattle,CoreSwitchEvent,CoCnd_SwitchToBattle);
			
		}
		
		protected override function unRegisterCommand():void
		{
			commandMap.unmap(CoreEvent.StartInitGame,CoreEvent);
			commandMap.unmap(CoreEvent.GameInitComplete,CoreEvent);
		}
		protected override function unRegisterMediator():void
		{
			mediatorMap.unmap(UiLayer);
			mediatorMap.unmap(LeitaiRewardWindow);
			mediatorMap.unmap(WorldLayer);
			mediatorMap.unmap(JiubaWindow);
			mediatorMap.unmap(RenwuWindow);
			mediatorMap.unmap(LevelUpWindow);
			
			mediatorMap.unmap(BagWindow);


			mediatorMap.unmap(FubenChakanWindow);
			mediatorMap.unmap(CommonRewardWindow);
			
			//邮件相关
			mediatorMap.unmap(YoujianWindow);
			mediatorMap.unmap(HaoyouLiuyanWindow);
			mediatorMap.unmap(YoujianChakanWindow);
			
			mediatorMap.unmap(SaodangWindow);
			mediatorMap.unmap(TiliGoumaiWindow);
			mediatorMap.unmap(ShibaiWindow);
			mediatorMap.unmap(ShengliWindow);
			mediatorMap.unmap(EquipChuandaiWindow);
			mediatorMap.unmap(EquipOpenWindow);
			mediatorMap.unmap(EquipCaozuoWindow);
			mediatorMap.unmap(BaoshiSaixuanWindow);
			mediatorMap.unmap(BaoshiTishiWindow);
			mediatorMap.unmap(BaoshiShengjiWindow);
			mediatorMap.unmap(EquipRonglianWindow);
			mediatorMap.unmap(ChaonengliWindow);
			mediatorMap.unmap(FubenCailiaoSelectWindow);
			
			mediatorMap.unmap(TaskWindow);
			
			mediatorMap.unmap(Chaonengli_YiJiesuo_Window);
			mediatorMap.unmap(Chaonengli_WeiJiesuo_Window);
			mediatorMap.unmap(LeitaiPkWindow);
			
			mediatorMap.unmap(CaidanWindow);
			mediatorMap.unmap(ChuanchengWindow);
			mediatorMap.unmap(ShenzhuangTunshiWindow);
			mediatorMap.unmap(GenghuanqiangzhiWindow);
			mediatorMap.unmap(AddMoneyWindow);
			mediatorMap.unmap(GuanmingRewardWindow);
			
			mediatorMap.unmap(ChoujiangXuanzeWindow);
			mediatorMap.unmap(DigRewardWindow);
			mediatorMap.unmap(DigJiashuTipWindow);
			mediatorMap.unmap(JingxuanWindow);
			mediatorMap.unmap(ShilianshouWindow);
			mediatorMap.unmap(DanchouWindow);
			
			mediatorMap.unmap(ZidongChushouWindow);
			mediatorMap.unmap(WakuangShengjiWindow);
			
			mediatorMap.unmap(FubenPaihangRewardWindow);
			mediatorMap.unmap(RankingWindow);
			mediatorMap.unmap(HaoyouWindow);
			mediatorMap.unmap(TianjiaHaoyouWindow);
//			mediatorMap.unmap(LiaotianWindow);
			mediatorMap.unmap(VipWindow);
			mediatorMap.unmap(ChongzhiWindow);
			mediatorMap.unmap(ShouchongWindow);
			mediatorMap.unmap(HuodongNewWindow);
			
			mediatorMap.unmap(JinkuangWindow);
			mediatorMap.unmap(JinkuangLogWindow);
			mediatorMap.unmap(JinkuangNoOccupiedWindow);
			mediatorMap.unmap(JinkuangRukouWindow);
			mediatorMap.unmap(ZhanlingWindow);
			
			mediatorMap.unmap(UseItemWindow);
			mediatorMap.unmap(CdKeyWindow);
			mediatorMap.unmap(HeroDetailWidow);
			
			mediatorMap.unmap(RongyuchakanWindow);
			mediatorMap.unmap(ExitbattleWindow);
			
			//帮会相关
			mediatorMap.unmap(BanghuiShenqingWindow);
			mediatorMap.unmap(BanghuiChakanWindow);
			mediatorMap.unmap(BanghuiMainWindow);
			mediatorMap.unmap(GonghuidatingWindow);
			mediatorMap.unmap(BanghuiGuanliWindow);
			mediatorMap.unmap(BanghuiGonggaoWindow);
			mediatorMap.unmap(BanghuiXuanyanWindow);
			mediatorMap.unmap(MimaXiugaiWindow);
			mediatorMap.unmap(BanghuiShangchengWindow);	
			mediatorMap.unmap(BanghuiChengyuanWindow);
			mediatorMap.unmap(BanghuiChuangjianWindow);
			mediatorMap.unmap(BangJiesanWindow);
			mediatorMap.unmap(GuangongRewardChakanWindow);
			mediatorMap.unmap(GuangongdianWindow);	
			mediatorMap.unmap(BanghuiHongbaoWindow);
			mediatorMap.unmap(GuangongRewardHuodeWindow);
			
			mediatorMap.unmap(LeitaiRewardWindow);
			mediatorMap.unmap(PersondetailWindow);
			mediatorMap.unmap(BianqiangWindow);
			
			mediatorMap.unmap(ChoujiangfenjieWindow);
			
			mediatorMap.unmap(ChaonengliJinhuaWindow);
			mediatorMap.unmap(JinkuangguizeWindow);
			
			removeTestWindow();
		}
		protected override function unRegisterModel():void
		{
			
		}
		
		public static function clearModel():void
		{
			var modelMap:IModelMap=Context.getInjectInstance(IModelMap);
			modelMap.unmap(TimerModel);
			modelMap.unmap(GuankaModel);
			modelMap.unmap(UserModel);
			modelMap.unmap(ItemModel);
			modelMap.unmap(EquipModel);
			modelMap.unmap(HeroModel);
			modelMap.unmap(BattleModel);
			modelMap.unmap(MapModel);
			modelMap.unmap(ShenmiShangdianModel);
			modelMap.unmap(BuyItemModel);
			modelMap.unmap(MailModel);
			modelMap.unmap(BagModel);
			modelMap.unmap(BaoshiModel);
			modelMap.unmap(LeitaiModel);
			modelMap.unmap(TaskModel);
			modelMap.unmap(ChaonengliModel);
			modelMap.unmap(ZombieModel);
			modelMap.unmap(ChoujiangModel);
			modelMap.unmap(WalkNpcModel);
			modelMap.unmap(RankModel);
			modelMap.unmap(FriendModel);
			modelMap.unmap(ChatModel);
			modelMap.unmap(BroadMessageModel);
			modelMap.unmap(GuideModel);
			modelMap.unmap(VipModel);
			modelMap.unmap(ChongzhiModel);
			modelMap.unmap(HuoDongModel);
			modelMap.unmap(HuodongControlModel);
			modelMap.unmap(GrowthModel);
			modelMap.unmap(ShoujiModel);
			modelMap.unmap(JinkuangModel);
			modelMap.unmap(ShengwangModel);
			modelMap.unmap(GonghuiModel);
			modelMap.unmap(SystemMD);
		}
		
		
		
	}
}