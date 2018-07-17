package com.fish.modules.core.models
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.gameVO.BanghuiliebiaoVO;
	import com.fish.modules.core.gameVO.BanghuiselfdataVO;
	import com.fish.modules.core.gameVO.BanghuizhandetailVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.GerenzhanjiVO;
	import com.fish.modules.core.gameVO.GonghuiVO;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_banghui_chuangjian;
	import com.ghostlmm.xmldata.Node_banghui_guangong_reward;
	import com.ghostlmm.xmldata.Node_banghui_icon;
	import com.ghostlmm.xmldata.Node_banghui_jianzhulvup;
	import com.ghostlmm.xmldata.Node_banghui_juanxian;
	import com.ghostlmm.xmldata.Node_banghui_shangcheng;
	import com.ghostlmm.xmldata.Node_banghui_shangchengzhenpin;
	import com.ghostlmm.xmldata.Node_banghuizhan_reward;
	import com.ghostlmm.xmldata.Node_const;
	import com.ghostlmm.xmldata.Node_item;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import org.osflash.signals.Signal;
	
	import util.Util;
	
	import view.CommonControlFun;
	import view.viewData.BanghuiChongzhiData;
	import view.viewData.BanghuiHongbaoData;
	import view.viewData.BanghuiHongbaoLingquLog;
	import view.viewData.RecordData_BanghuiJianshe;

	public class GonghuiModel extends BaseModel
	{
		public static const TONGYI_SHENQING_MAX:int = 4001;
		public static const ALREADY_SHENQING:int = 4002;
		public static const SHENQING_LIST_MAX:int = 4003;
		public static const BANGHUI_JIESAN:int = 4004;
		public static const NOT_YOUR_BANGHUI:int = 4005;
		public static const BANGHUI_NOT_EXIST:int = 4006;
		public static const NOT_BANGHUI_SHENQING:int = 4007;
		public static const BANGHUI_PERSONS_FULL:int = 4008;
		public static const USER_JOIN_OTHER:int = 4009;
		public static const SHENQING_ALREADY_CANCEL:int = 4010;
		public static const ALREADY_IN_BANGHUI:int = 4011;
		public static const NOT_BANGHUI:int = 4012;
		public static const BE_QUITED:int = 4013;
		public static const BANGHUI_PASSWORD_ERROR:int = 4014;
		public static const ALREADY_NOT_IN_BANGHUI:int = 4015;
		public static const NOT_IN_SHENQINGLIST:int = 4016;
		public static const ITEM_NOT_FOUND:int = 4017;
		public static const ITEM_NOT_ENOUGH:int = 4018;
		public static const USER_GONGXIAN_LOW:int = 4019;
		public static const JIANSHE_NOT_ENOUGH:int = 4020;
		public static const NOT_IS_HUIZHANG:int = 4021;
		public static const ARCHIVE_MAX_LV:int = 4022;
		public static const SHOP_LV_LOW:int = 4023;
		public static const ALREADY_JIANSHE:int = 4024;
		public static const ALREADEY_CANBAI:int = 4025;
		public static const ARCHIVE_MAX_COUNT:int = 4026;
		public static const CANBAI_TIME_WRONG:int = 4027;
		public static const TICHU_ZIJI:int = 4028;
		public static const ARCHIVE_DATING_LV:int = 4029;
		public static const BanghuiChongming:int=4030;
		public static const BANGHUI_LEVEL_NOT_ENOUGH:int = 4031;
		public static const BANGHUI_BAOMINGED:int = 4032;
		public static const BANGHUI_NOT_BAOMING:int = 4033;
		public static const BANGHUI_CANZHAN_NOT_LEITAI_RANK:int = 4034;
		public static const BANGHUI_BATTLE_NOT_RANK:int = 4035;
		public static const BANGHUI_BATTLE_REWARD_GETED:int = 4036;
		public static const BANGHUI_NOT_IN_BAOMING_TIME:int = 4037;
		public static const BANGHUI_REDPACKET_NOT_EXIST:int = 4038;
		public static const BANGHUI_REDPACKET_GET_OVER:int = 4039;
		public static const BANGHUI_REDPACKET_GETED:int = 4040;
		public static const BANGHUI_REDPACKET_CANNOT_GET_SELF:int = 4041;
		public static const BANGHUI_CANZHANED:int = 4042;
		public static const BANGHUI_NOT_IN_REWARD_TIME:int = 4043;
		public static const CANNOT_CHAT:int = 2;
		
		public var LingquHongbaoCash_Before:int;
		
		public static function dealWithErrorCode(_code:int):void
		{
			switch(_code)
			{
				case TONGYI_SHENQING_MAX://该帮会的申请人数已经超过上限
					Util.flow("该帮会的申请人数已经超过上限");
					break;
				case ALREADY_SHENQING://已经申请过此工会了
					Util.flow("已经申请过此工会了");
					break;
				case SHENQING_LIST_MAX://达到个人最大申请帮会个数
					Util.flow("最多同时申请帮会数量",GonghuiModel.MaxShenqingGonghuiNum);
					break;
				case BANGHUI_JIESAN://帮会已经解散了
					Util.flow("帮会已经解散了");
					CommonControlFun.banghuiJiesanSucDo();
					break;
				case NOT_YOUR_BANGHUI://不是会长，没有权限
					Util.flow("不具有权限");
					break;
				case BANGHUI_NOT_EXIST://查看帮会详情时，帮会不存在
					Util.flow("指定帮会不存在");
					break;
				case NOT_BANGHUI_SHENQING://没用到
				
					break;
				case BANGHUI_PERSONS_FULL://帮会成员已满
					Util.flow("帮会成员已满");
					break;
				case USER_JOIN_OTHER://申请人已经加入其他帮会了
					Util.flow("申请人已经加入其他帮会了");
					break;
				case SHENQING_ALREADY_CANCEL://申请人已经取消申请了
					Util.flow("申请人已经取消申请了");
					break;
				case ALREADY_IN_BANGHUI://已经加入帮会
					Util.flow("你已经在帮会中了");
					break;
				case NOT_BANGHUI://帮会已经没了
					Util.flow("没有帮会");
					break;
				case BE_QUITED://您已经被踢出帮会了
					Util.flow("您已经被踢出帮会了");
					CommonControlFun.banghuiJiesanSucDo();
					break;
				case BANGHUI_PASSWORD_ERROR://帮会密码错误
					Util.flow("帮会密码错误");
					break;
				case ALREADY_NOT_IN_BANGHUI://成员已经不在帮会中了
					Util.flow("成员已经不在帮会中了");
					break;
				case NOT_IN_SHENQINGLIST://申请人不在申请列表
					Util.flow("申请人不在申请列表");
					break;
				case ITEM_NOT_FOUND://商城物品不存在
					Util.flow("指定物品不存在");
					break;
				case ITEM_NOT_ENOUGH://物品数量不足
					Util.flow("兑换次数超过上限");
					break;
				case USER_GONGXIAN_LOW://贡献不足
					Util.flow("个人贡献不足");
					break;
				case JIANSHE_NOT_ENOUGH://建设度不足
					Util.flow("帮会建设度不足");
					break;
				case NOT_IS_HUIZHANG://不是会长
					Util.flow("不具有权限");
					break;
				case ARCHIVE_MAX_LV://到达最高等级
					Util.flow("建筑已经升至最高等级");
					break;
				case SHOP_LV_LOW://商城等级不足，无法购买
					Util.flow("商城等级不足");
					break;
				case ALREADY_JIANSHE://已经建设过了
					Util.flow("今日已经捐献过了");
					break;
				case ALREADEY_CANBAI://已经参拜过了
					Util.flow("今日已经参拜过了");
					break;
				case ARCHIVE_MAX_COUNT://参拜达到上限，不能参拜
					Util.flow("参拜次数被抢光啦，下次早点来吧！");
					break;
				case CANBAI_TIME_WRONG://参拜时间错误
					Util.flow("参拜时间错误");
					break;
				case TICHU_ZIJI://不能踢出自己
					Util.flow("不能踢出自己");
					break;
				case ARCHIVE_DATING_LV://建筑不能超过大厅等级
					Util.flow("不能超过大厅等级");
					break;
				case BanghuiChongming://已经存在相同名字的帮会
					Util.flow("已经存在相同名字的帮会");
					break;
				case CANNOT_CHAT:
					CommonControlFun.JinyanDo();
					break;
				case BANGHUI_LEVEL_NOT_ENOUGH:
					Util.flow("帮会战报名需要帮会等级",NeedBanghuiLevel_Banghuizhan);
					break;
				case BANGHUI_BAOMINGED:
					Util.flow("帮会已经报名帮会战");
					break;
				case BANGHUI_NOT_BAOMING:
					Util.flow("你所在帮会尚未报名帮会战");
					break;
				case BANGHUI_CANZHAN_NOT_LEITAI_RANK:
					Util.flow("您还没有擂台排名，不能出战");
					break;
				case BANGHUI_BATTLE_NOT_RANK:
					Util.flow("个人帮会战排名不符合要求,不能领取");
					break;
				case BANGHUI_BATTLE_REWARD_GETED:
					Util.flow("帮会战奖励已领取");
					break;
				case BANGHUI_NOT_IN_BAOMING_TIME:
					Util.flow("不在帮会战报名时间段");
					break;
				case BANGHUI_REDPACKET_NOT_EXIST:
					Util.flow("红包不存在");
					break;
				case BANGHUI_REDPACKET_GET_OVER:
					Util.flow("下次早点来吧，红包已经被抢光了");
					break;
				case BANGHUI_REDPACKET_GETED:
					Util.flow("该红包已经领取过了");
					break;
				case BANGHUI_REDPACKET_CANNOT_GET_SELF:
					Util.flow("不能领取自己发放的红包");
					break;	
				case BANGHUI_CANZHANED:
					Util.flow("您已经出战帮会战");
					break;
				case BANGHUI_NOT_IN_REWARD_TIME:
					Util.flow("不在领奖时间段内");
					break;
			}
		}
		
		public var gonghuiVo:GonghuiVO;
		public var myBanghuiData:BanghuiselfdataVO;
		
		public function GonghuiModel()
		{
			super();
		}
		protected override function onGameInitComplete():void
		{
			gonghuiVo=GameVOManager.getInstance().gonghui;
			myBanghuiData=GameVOManager.getInstance().banghuiselfdata;
			gonghuiVo.update_SN.add(onGonghuiInfoChange);
			myBanghuiData.update_SN.add(onBanghuiSelfDataChange);
		}
		public function getJiansheJilu():String
		{		
			var recordDataArray:Array=[];
			if(null==gonghuiVo.juanxianRecord)
			{
				return "";
			}
			var recordObj:Object=JSON.parse(gonghuiVo.juanxianRecord);
			for(var key:String in recordObj)
			{
				var viewData:RecordData_BanghuiJianshe=new RecordData_BanghuiJianshe();
				viewData.name=key;
				viewData.xid=int((recordObj[key] as Array)[0]);
				viewData.time=Number((recordObj[key] as Array)[1]);
				recordDataArray.push(viewData);
			}
			recordDataArray.sortOn("time",Array.NUMERIC|Array.DESCENDING);
			
			var result:String="";
			var index:int;
			for(index=0;index<recordDataArray.length;index++)
			{
				var data:RecordData_BanghuiJianshe=recordDataArray[index] as RecordData_BanghuiJianshe;
				result+=Util.getLanguage("帮会捐献记录",data.name,data.BanghuiJianshe)+"\n"
			}
			return result;
		}
		public var GonghuiInfo_SN:Signal=new Signal();
		public var GonghuiSelf_SN:Signal=new Signal();
		private function onGonghuiInfoChange():void
		{
			GonghuiInfo_SN.dispatch();
		}
		private function onBanghuiSelfDataChange():void
		{
			GonghuiSelf_SN.dispatch();
		}
		/**
		 * 是否已经拥有工会
		 */
		public function areadyHaveBanghui():Boolean
		{
			if(myBanghuiData.bid>0)
			{
				return true;
			}
			return false;
		}
		public static function getIconsXmlList():Array
		{
			return XMLDataManager.Node_banghui_iconArray;
		}
		public static function getChuangjianXMl():Node_banghui_chuangjian
		{
			if(XMLDataManager.Node_banghui_chuangjianArray.length>0)
			{
				return XMLDataManager.Node_banghui_chuangjianArray[0];
			}
			return null;
		}
		/**
		 * 能否创建工会
		 */
		public static function couldChuangjianGonghui(_xml:Node_banghui_chuangjian):JudgeResult
		{
			var je:JudgeResult=new JudgeResult();
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.userVo.userLevel<_xml.lv)
			{
				je.success=false;
				je.desc="error_等级不够";
				return je;
			}
			if(!userModel.couldUseMoneyBuy(_xml.money))
			{
				je.success=false;
				je.desc="error_铜钱不够";
				return je;
			}
			if(!userModel.cashCouldAfford(_xml.cash))
			{
				je.success=false;
				je.desc="error_元宝不够";
				je.code=JudgeResult.CD_CashNotEnough;
				return je;
			}
			je.success=true;
			return je;
		}
		public static function getJuanxianXMllist():Array
		{
			return XMLDataManager.Node_banghui_juanxianArray;
		}
		/**
		 * 是否已经捐献过了
		 */
		public function checkIfAreadyJuanxian():Boolean
		{
			if(myBanghuiData.juanxian>0)
			{
				return true;
			}
			return false;
		}
		/**
		 * 资源是否足够捐献
		 */
		public static function couldJuanxian(_node:Node_banghui_juanxian):JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if("cash"==_node.type)
			{
				if(!userModel.cashCouldAfford(_node.cost))
				{
					re.success=false;
					re.code=JudgeResult.CD_CashNotEnough;
					return re;
				}
			}
			else if("money"==_node.type)
			{
				if(!userModel.couldUseMoneyBuy(_node.cost))
				{
					re.success=false;
					re.desc="error_铜钱不够";
					return re;
				}
			}
			re.success=true;
			return re;
		}
		/**
		 * 检查自己是不是会长
		 */
		public function checkIfIamHuizhang():Boolean
		{
			if(checkHuizhangByUid(int(GLBaseData.userId)))
			{
				return true;
			}
			return false;
		}
		/**
		 * 根据uid判断是否是会长
		 */
		public function checkHuizhangByUid(_uid:int):Boolean
		{
			if(gonghuiVo.huizhangUid==_uid)
			{
				return true;
			}
			return false;
		}
		public function get daojuItemList():Array
		{
			var array:Array=XMLDataManager.Node_banghui_shangchengArray.concat([]);
			return array;
		}
		public function get zhenpinItemList():Array
		{
			var zhenpinItemList:Array=[];
			var zhenpinObj:Object=JSON.parse(gonghuiVo.zhenpingList);
			for(var Id:String in zhenpinObj)
			{
				var xml:Node_banghui_shangchengzhenpin=XMLDataManager.getBanghui_shangchengzhenpinById(int(Id));
				if(null!=xml)
				{
					zhenpinItemList.push(xml);
				}
			}
			zhenpinItemList.sortOn("id",Array.NUMERIC);		
			return zhenpinItemList;
		}
		private function compare(A:Node_banghui_shangcheng,B:Node_banghui_shangcheng):int
		{
			var weightA:int=0;
			var weightB:int=0;
			if(!checkIfReachLimit(A))
			{
				weightA+=1000;
			}
			if(!checkIfReachLimit(B))
			{
				weightB+=1000;
			}
			return weightB-weightA;
		}
		private function checkIfReachLimit(_xml:Node_banghui_shangcheng):Boolean
		{
			return true;
		}
		public static function computeDaojuCouldBuyNum(_xml:Node_banghui_shangcheng):int
		{
			var result:int;
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			var daojuObj:Object=JSON.parse(gonghuiModel.myBanghuiData.banghuiDaoju);
			if(null!=daojuObj[_xml.id])
			{
				result=_xml.limit-int(daojuObj[_xml.id]);
			}
			else
			{
				result=_xml.limit;
			}
			return result;
		}
		/**
		 * 计算珍品可以买的数量
		 */
		public static function computeZhenpinCouldBuyNum(_xml:Node_banghui_shangchengzhenpin):int
		{
			var result:int;
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			var zhenpinObj:Object=JSON.parse(gonghuiModel.gonghuiVo.zhenpingList);
			if(null!=zhenpinObj[_xml.id])
			{
				result=_xml.limit-int(zhenpinObj[_xml.id]);
			}
			else
			{
				result=_xml.limit;
			}
			return result;
		}
		public static function getGuangongRewardList():Array
		{
			return XMLDataManager.Node_banghui_guangong_rewardArray;
		}
		public static function getBanghuiList():Array
		{
			return GameVOManager.getInstance().banghuiliebiaos;
		}
		public static function getIconXMl(_iconId:int):Node_banghui_icon
		{
			var xmlList:Array=getIconsXmlList();
			var index:int;
			for(index=0;index<xmlList.length;index++)
			{
				var xml:Node_banghui_icon=xmlList[index] as Node_banghui_icon;
				if(xml.type==_iconId)
				{
					return xml;
				}
			}
			return null;
		}
		/**
		 * 判断是否可以申请该帮会
		 */
		public function judgeShenqing(_bid:int):JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			if(areadyHaveBanghui())
			{
				re.success=false;
				re.desc="已经拥有工会了";
				return re;
			}
			if(checkIfAreadyShenqing(_bid))
			{
				re.success=false;
				re.desc="已经申请过了";
				return re;
			}
			if(checkIfReachMaxShenqingNum())
			{
				re.success=false;
				re.code=JudgeResult.CD_HasOverLimit;
				return re;
			}
			re.success=true;
			return re;
		}
		public static function get MaxShenqingGonghuiNum():int
		{
			return XMLDataManager.getConstById("MaxShenqingGonghuiNum").value;
		}
		public function checkIfReachMaxShenqingNum():Boolean
		{
			var bidArray:Array=JSON.parse(myBanghuiData.shengqingList) as Array;
			if(bidArray.length>=MaxShenqingGonghuiNum)
			{
				return true;
			}
			return false;
		}
		/**
		 * 是否申请过这个工会
		 */
		public function checkIfAreadyShenqing(_bid:int):Boolean
		{
			var bidArray:Array=JSON.parse(myBanghuiData.shengqingList) as Array;
			if(-1==bidArray.indexOf(_bid))
			{
				return false;
			}
			return true;
		}
		/**
		 * 申请工会
		 */
		public static function shenqingGonghui(_bid:int):void
		{
			C2SEmitter.shenQingBanghui(_bid);
		}
		/**
		 * 取消申请工会
		 */
		public static function quxiaoShenqing(_bid:int):void
		{
			C2SEmitter.quxiaoShenqingBanghui(_bid);
		}
		/**
		 * 工会红包负概率
		 */
		public static function get HongbaoNegativeNum():Number
		{
			return XMLDataManager.getConstById("HongbaoNegativeNum").value;
		}
		/**
		 * 工会红包正概率
		 */
		public static function get HongbaoPositiveNum():Number
		{
			return XMLDataManager.getConstById("HongbaoPositiveNum").value;
		}
		/**
		 * 红包分成的份数
		 */
		public static function get HongbaoCouldLingquNum():int
		{
			return XMLDataManager.getConstById("HongbaoCouldLingquNum").value;
		}
		/**
		 * 系统赠送充值比例
		 */
		public static function get XitongZengsongNum():Number
		{
			return 0.1;
			return XMLDataManager.getConstById("HongbaoBili").value;
		}
		/**
		 * 红包可以获得的值(注意与后台同步)
		 */
		public static function getHongbaoRewardMinMaxDesc(_chongzhiNum:int):String
		{
			var perNum:int=_chongzhiNum/HongbaoCouldLingquNum;
			var maxNum:int=perNum*(1+HongbaoPositiveNum);
			var minNum:int=perNum*(1-HongbaoNegativeNum);
			return Util.getLanguage("红包可以获得数量显示",minNum,maxNum);
		}
		/**
		 * 工会红包可以领取的比例
		 */
		public static function get HongbaoTotalPercent():Number
		{
			return XMLDataManager.getConstById("HongbaoTotalPercent").value;
		}
		/**
		 * 同一工会最多申请的人的个数
		 */
		public static function get tongyiBanghuiShenqingNum():int
		{
			return XMLDataManager.getConstById("MaxTongyibanghuiNum").value;
		}
		/**
		 * 每天最多参拜次数
		 */
		public static function get MaxCanbaiNum():int
		{
			return XMLDataManager.getConstById("MaxCanbaiNum").value;
		}
		/**
		 * 计算当前剩余参拜次数
		 */
		public function computeCurrentCanbaiLeft():int
		{
			var areadyCount:int=gonghuiVo.canbaiCout;
			return MaxCanbaiNum-areadyCount;
		}
		/**
		 * 得到建筑升级xml
		 */
		public static function getJianzhuLevelXmlByLevel(_buildLevel:int):Node_banghui_jianzhulvup
		{
			return XMLDataManager.Node_banghui_jianzhulvupDic[_buildLevel];
		}
		/**
		 * 创建帮会
		 */
		public static function chuanjianBanghui(_banghuiName:String,_iconId:int):void
		{
			C2SEmitter.banghuiChuanjian(_banghuiName,_iconId);
		}
		/**
		 *  搜索带有名字的帮会列表
		 */
		public static function getBanghuiListByNameKey(_name:String=null):Array
		{
			var banghuiList:Array=GonghuiModel.getBanghuiList();
			var result:Array=[];
			if(_name==null)
			{
				return banghuiList;
			}			
			var index:int;
			for(index=0;index<banghuiList.length;index++)
			{
				var banghuiVo:BanghuiliebiaoVO=banghuiList[index] as BanghuiliebiaoVO;
				if(-1!=banghuiVo.banghuiName.indexOf(_name))
				{
					result.push(banghuiVo);
				}
			}
			return result;
		}
		/**
		 * 将成员踢出工会
		 */
		public static function tichuGonghui(_uid:int):void
		{
			C2SEmitter.tichuBanghuiChengyuan(_uid);
		}
		/**
		 * 同意申请
		 */
		public static function tongyiShenqing(_uid:int,_bid:int):void
		{
			C2SEmitter.tongyiBanghuiShenqing(_uid,_bid);
		}
		/**
		 * 拒绝申请
		 */
		public static function jujueShenqing(_uid:int,_bid:int):void
		{
			C2SEmitter.jujueBanghuiShenqing(_uid,_bid);
		}
		/**
		 * 解散帮会
		 */
		public static function jiesanBanghui(_bid:int,_passWord:String):void
		{
			C2SEmitter.jiesanBanghui(_bid,_passWord);
		}
		/**
		 * 能否兑换珍品
		 */
		public static function couldDuihuanZhenpin(_xml:Node_banghui_shangchengzhenpin):JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			var couldBuyNum:int=computeZhenpinCouldBuyNum(_xml);
			if(couldBuyNum<=0)
			{
				re.success=false;
				re.desc="兑换次数超过上限";
				return re;
			}
			var shangchengLv:int=(Context.getInjectInstance(GonghuiModel) as GonghuiModel).gonghuiVo.shangchengLevel;
			if(shangchengLv<_xml.shangchen_lv)
			{
				re.success=false;
				re.desc="商城等级未达到要求";
				return re;
			}
			var costNum:int=_xml.price;
			if(_xml.price_type=="cash")
			{
				var userModel:UserModel=Context.getInjectInstance(UserModel);
				if(!userModel.cashCouldAfford(costNum))
				{
					re.success=false;
					re.code=JudgeResult.CD_CashNotEnough;
					re.desc="元宝不足";
					return re;
				}
			}
			else if(_xml.price_type=="gongxian")
			{
				var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
				if(gonghuiModel.myBanghuiData.curGongxian<costNum)
				{
					re.success=false;
					re.desc="个人贡献不足";
					return re;
				}
			}
			re.success=true;
			return re;
		}
		public static function couldDuihuanDaoju(_xml:Node_banghui_shangcheng):JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			var couldBuyNum:int=computeDaojuCouldBuyNum(_xml);
			if(couldBuyNum<=0)
			{
				re.success=false;
				re.desc="兑换次数超过上限";
				return re;
			}
			var shangchengLv:int=(Context.getInjectInstance(GonghuiModel) as GonghuiModel).gonghuiVo.shangchengLevel;
			if(shangchengLv<_xml.shangchen_lv)
			{
				re.success=false;
				re.desc="商城等级未达到要求";
				return re;
			}
			var costNum:int=_xml.price;
			if(_xml.price_type=="cash")
			{
				var userModel:UserModel=Context.getInjectInstance(UserModel);
				if(!userModel.cashCouldAfford(costNum))
				{
					re.success=false;
					re.code=JudgeResult.CD_CashNotEnough;
					re.desc="元宝不足";
					return re;
				}
			}
			else if(_xml.price_type=="gongxian")
			{
				var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
				if(gonghuiModel.myBanghuiData.curGongxian<costNum)
				{
					re.success=false;
					re.desc="个人贡献不足";
					return re;
				}
			}
			re.success=true;
			return re;
		}
		/**
		 * 今日是否已经参拜过了
		 */
		public function checkIfAreadyCanbai():Boolean
		{
			if(myBanghuiData.canbaiCount>0)
			{
				return true;
			}
			return false;
		}
		/**
		 * 能否参拜
		 */
		public static function judgeCouldCanbai():JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			if(gonghuiModel.checkIfAreadyCanbai())
			{
				re.success=false;
				re.desc="今日已经参拜过了";
				return re;
			}
			if(gonghuiModel.computeCurrentCanbaiLeft()<=0)
			{
				re.success=false;
				re.desc="参拜次数被抢光啦，下次早点来吧！";
				return re;
			}
			var guangongReward:Node_banghui_guangong_reward=XMLDataManager.getBanghui_guangong_rewardById(gonghuiModel.gonghuiVo.guanggongmiaoLevel);   
			if(gonghuiModel.myBanghuiData.curGongxian<guangongReward.cost_gongxian)
			{
				re.success=false;
				re.desc="个人贡献不足";
				return re;
			}
			var timerCouldCanbai:JudgeResult=gonghuiModel.timeCouldCanbai();
			re.success=timerCouldCanbai.success;
			re.code=timerCouldCanbai.code;
			if(re.code==JudgeResult.CD_AreadyEnd)
			{
				re.desc="已经结束";
			}
			else if(re.code==JudgeResult.CD_NotBegin)
			{
				re.desc="尚未开始";
			}
			return re;
		}
		public function timeCouldCanbai():JudgeResult
		{
			var TimeList:Array=XMLDataManager.getConstById("Canbai_time").desc.toString().split("~");
			var _begainTimeStr:String=TimeList[0];
			var _endTimeStr:String=TimeList[1];
			var re:JudgeResult=new JudgeResult();
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
			var date:Date=new Date(timerModel.serverTime);
			var endHours:int=_endTimeStr.split(":")[0];
			var endMinites:int=_endTimeStr.split(":")[1];
			if((date.hours>endHours)||(date.hours==endHours&&date.minutes>endMinites))
			{
				re.success=false;
				re.code=JudgeResult.CD_AreadyEnd;
				return re;
			}
			var beginHours:int=_begainTimeStr.split(":")[0];
			var beginMinites:int=_begainTimeStr.split(":")[1];
			if((date.hours>beginHours)||(date.hours==beginHours&&date.minutes>=beginMinites))
			{
				re.success=true;
				return re;
			}
			re.success=false;
			re.code=JudgeResult.CD_NotBegin;
			return re;
		}
		/**
		 * 获得建筑的最高等级
		 */
		public static function get JianzhuMaxLevel():int
		{
			var maxLevel:int=(XMLDataManager.Node_banghui_jianzhulvupArray[XMLDataManager.Node_banghui_jianzhulvupArray.length-1] as Node_banghui_jianzhulvup).id;
			return maxLevel;
		}
		/**
		 * 帮会大厅能否升级
		 */
		public function judgeBanghuiDatingCouldLevelUp():JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			if(!checkIfIamHuizhang())
			{
				re.success=false;
				re.desc="不具有权限";
				return re;
			}
			var datingLevel:int=gonghuiVo.datingLevel;
			if(datingLevel>=JianzhuMaxLevel)
			{
				re.success=false;
				re.desc="建筑已经升至最高等级";
				return re;
			}
			var datingNode:Node_banghui_jianzhulvup=XMLDataManager.getBanghui_jianzhulvupById(datingLevel);
			if(gonghuiVo.jiangshedu<datingNode.banghui_dating)
			{
				re.success=false;
				re.desc=Util.getLanguage("帮会建筑升级建设度不足提示",datingNode.banghui_dating,gonghuiVo.jiangshedu);
				re.code=JudgeResult.CD_CailiaoNotEnough;
				return re;
			}
			re.success=true;
			re.desc=Util.getLanguage("帮会建筑可以升级提示",datingNode.banghui_dating,gonghuiVo.jiangshedu);
			return re;
		}
		/**
		 * 帮会商城能否升级
		 */
		public function judgeBanghuiShangchengCouldLevelUp():JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			if(!checkIfIamHuizhang())
			{
				re.success=false;
				re.desc="不具有权限";
				return re;
			}
			var shangchengLevel:int=gonghuiVo.shangchengLevel;
			if(shangchengLevel>=JianzhuMaxLevel)
			{
				re.success=false;
				re.desc="建筑已经升至最高等级";
				return re;
			}
			var datingLevel:int=gonghuiVo.datingLevel;
			if(shangchengLevel>=datingLevel)
			{
				re.success=false;
				re.desc="不能超过大厅等级";
				return re; 
			}
			var shangchengNode:Node_banghui_jianzhulvup=XMLDataManager.getBanghui_jianzhulvupById(shangchengLevel);
			if(gonghuiVo.jiangshedu<shangchengNode.banghui_dating)
			{
				re.success=false;
				re.desc=Util.getLanguage("帮会建筑升级建设度不足提示",shangchengNode.banghui_dating,gonghuiVo.jiangshedu);
				re.code=JudgeResult.CD_CailiaoNotEnough;
				return re;
			}
			re.success=true;
			re.desc=Util.getLanguage("帮会建筑可以升级提示",shangchengNode.banghui_dating,gonghuiVo.jiangshedu);
			return re;
		}
		/**
		 * 关公庙能否升级
		 */
		public function judgeGuangongmiaoCouldLevelUp():JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			if(!checkIfIamHuizhang())
			{
				re.success=false;
				re.desc="不具有权限";
				return re;
			}
			var guangongLevel:int=gonghuiVo.guanggongmiaoLevel;
			if(guangongLevel>=JianzhuMaxLevel)
			{
				re.success=false;
				re.desc="建筑已经升至最高等级";
				return re;
			}
			var datingLevel:int=gonghuiVo.datingLevel;
			if(guangongLevel>=datingLevel)
			{
				re.success=false;
				re.desc="不能超过大厅等级";
				return re; 
			}
			var guangongNode:Node_banghui_jianzhulvup=XMLDataManager.getBanghui_jianzhulvupById(guangongLevel);
			if(gonghuiVo.jiangshedu<guangongNode.banghui_dating)
			{
				re.success=false;
				re.desc=Util.getLanguage("帮会建筑升级建设度不足提示",guangongNode.banghui_dating,gonghuiVo.jiangshedu);
				re.code=JudgeResult.CD_CailiaoNotEnough;
				return re;
			}
			re.success=true;
			re.desc=Util.getLanguage("帮会建筑可以升级提示",guangongNode.banghui_dating,gonghuiVo.jiangshedu);
			return re;
		}
		/**
		 * 帮会功能开启等级
		 */
		public static function get BanghuiKaiqiLevel():int
		{
			if(null!=XMLDataManager.getConstById("Banghui_kaiqi_lv"))
			{
				return XMLDataManager.getConstById("Banghui_kaiqi_lv").value;
			}
			return 0;
		}
		/**
		 * 获取帮会红包
		 */
		public function get hongbaoDataArray():Array
		{
			var result:Array=[];
			var voArray:Array=GameVOManager.getInstance().hongbaos;
			var index:int;
			for(index=0;index<voArray.length;index++)
			{
				var hongbaoData:BanghuiHongbaoData=new BanghuiHongbaoData();
				hongbaoData.vo=voArray[index];
				result.push(hongbaoData);
			}
			return result;
		}
		/**
		 * 获取充值记录
		 */
		public function get chongzhiDataArray():Array
		{
			var result:Array=[];
			var voArray:Array=GameVOManager.getInstance().chongzhijilus;
			var index:int;
			for(index=0;index<voArray.length;index++)
			{
				var chongzhiData:BanghuiChongzhiData=new BanghuiChongzhiData();
				chongzhiData.vo=voArray[index];
				result.push(chongzhiData);
			}
			return result;
		}
		/**
		 * 获取红包领取记录
		 */
		public function get hongbaoLingquLog():Array
		{
			var result:Array=[];
			var voArray:Array=GameVOManager.getInstance().lingqujilus;
			var index:int;
			for(index=0;index<voArray.length;index++)
			{
				var jiluData:BanghuiHongbaoLingquLog=new BanghuiHongbaoLingquLog();
				jiluData.vo=voArray[index];
				result.push(jiluData);
			}
			return result;
		}
		/**
		 *  能否报名帮会战
		 */
		public function checkCouldBaomingBanghuizhan():JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			if(gonghuiVo.hasBaomingBanghuizhan)
			{
				re.success=false;
				re.desc="帮会已经报名帮会战";
				return re;
			}
			if(!checkIfIamHuizhang())
			{
				re.success=false;
				re.desc="不具有权限";
				return re;
			}
			if(gonghuiVo.banghuiLevel<NeedBanghuiLevel_Banghuizhan)
			{
				re.success=false;
				re.desc=Util.getLanguage("帮会战报名需要帮会等级",NeedBanghuiLevel_Banghuizhan);
				return re;
			}
			if(!checkIfIsInBaomingTime())
			{
				re.success=false;
				re.desc="不在帮会战报名时间段";
				return re;
			}
			re.success=true;
			return re;
		}
		/**
		 * 是否在报名的时间段
		 */
		public function checkIfIsInBaomingTime():Boolean
		{
			var beginTime:Number=gonghuiVo.banghuizhanBaomingTime*1000;
			var endTime:Number=(gonghuiVo.banghuizhanBaomingTime+BaomingLastTime*3600)*1000;
			var re:JudgeResult=CommonControlFun.checkIfIsInTime(beginTime,endTime);
			return re.success;
		}
		/**
		 * 是否在出战时间段内
		 */
		public function checkIfIsInChuzhanTime():Boolean
		{
			var beginTime:Number=gonghuiVo.banghuizhanBaomingTime*1000;
			var endTime:Number=(gonghuiVo.banghuizhanBaomingTime+BaomingLastTime*3600)*1000;
			var re:JudgeResult=CommonControlFun.checkIfIsInTime(beginTime,endTime);
			return re.success;
		}
		/**
		 * 是否在领奖时间段内
		 */
		public function checkIfIsInLingjiangTime():Boolean
		{
			var beginTime:Number=gonghuiVo.banghuizhanRewardTime*1000;
			var endTime:Number=(gonghuiVo.banghuizhanRewardTime+BanghuizhanLingjiangLastTime*3600)*1000;
			var re:JudgeResult=CommonControlFun.checkIfIsInTime(beginTime,endTime);
			return re.success;
		}
		/**
		 * 帮会成员是否可以领奖
		 */
		public function checkCouldLingjiang_Banghuizhan():JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			var geren:GerenzhanjiVO=GameVOManager.getInstance().getGerenzhanjiVOByuid(int(GLBaseData.userId));
			if((null!=geren)&&(geren.lingjiangStatus>0))
			{
				re.success=false;
				re.desc="帮会战奖励已领取";
				return re;
			}
			if(!checkIfIsInLingjiangTime())
			{
				re.success=false;
				re.desc="不在领奖时间段内";
				return re;
			}
			re.success=true;
			return re;
		}
		/**
		 * 帮会成员是否可以报名帮会战
		 */
		public function checkCouldChuzhan_Banghuizhan():JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			if(checkIfAreadyChuzhan())
			{
				re.success=false;
				re.desc="您已经出战帮会战";
				return re;
			}
			if(!gonghuiVo.hasBaomingBanghuizhan)
			{
				re.success=false;
				re.desc="你所在帮会尚未报名帮会战";
				return re;
			}
			if(!checkIfIsInChuzhanTime())
			{
				re.success=false;
				re.desc="不在出战时间段内";
				return re;
			}
			re.success=true;
			return re;
		}
		/**
		 * 是否已经出战帮会战
		 */
		public function checkIfAreadyChuzhan():Boolean
		{
			return myBanghuiData.hasChuzhan;
		}
		/**
		 *  帮会战包名最低帮会等级
		 */
		public static function get NeedBanghuiLevel_Banghuizhan():int
		{
			return XMLDataManager.getConstById("banghuizhan_need_lv").value;
		}
		
		/**
		 *  帮会战报名的帮会列表
		 */
		public function get banghuizhanBaomingVolist():Array
		{
			return GameVOManager.getInstance().baomingbanghuis;
		}
		/**
		 *  获取帮会战积分列表
		 */
		public function get banghuizhanJifenList():Array
		{
			return GameVOManager.getInstance().banghuizhanjifens;
		}
		/**
		 *  帮会战积分详情
		 */
		public function get banghuizhanDetailList():Array
		{
			return GameVOManager.getInstance().banghuizhandetails;
		}
		/**
		 * 报名阶段
		 */
		public static const Baoming_Phase:String="Baoming_Phase";
		/**
		 * 比赛阶段
		 */
		public static const Bisai_Phase:String="Bisai_Phase";
		/**
		 * 领奖阶段
		 */
		public static const Lingjiang_Phase:String="Lingjiang_Phase";
		/**
		 * 检查当前帮会战处于的阶段(报名，比赛，领奖)
		 */
		public function checkBanghuizhanPhase():String
		{
			var baomingBeginTime:Number=gonghuiVo.banghuizhanBaomingTime*1000;
			var battleBeginTime:Number=gonghuiVo.banghuizhanBattleTime*1000;
			var lingjiangBeginTime:Number=gonghuiVo.banghuizhanRewardTime*1000;
			var serverTime:Number;
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
			serverTime=timerModel.serverTime;
			var re_baoming:JudgeResult=CommonControlFun.checkIfIsInTime(baomingBeginTime,battleBeginTime);
			if(re_baoming.success)
			{
				return Baoming_Phase;
			}
			var re_battle:JudgeResult=CommonControlFun.checkIfIsInTime(battleBeginTime,lingjiangBeginTime);
			if(re_battle.success)
			{
				return Bisai_Phase;
			}
			return Lingjiang_Phase;
		}
		/**
		 * 帮会战报名持续时间(小时)
		 */
		public function get BaomingLastTime():int
		{
			var xml:Node_const=XMLDataManager.getConstById("banghuizhan_baoming_days");
			if(xml)
			{
				return xml.value;
			}
			else
			{
				return 24;
			}
		}
		/**
		 * 帮会战战斗持续时间
		 */
		public function get BanghuizhanLastTime():int
		{
			var xml:Node_const=XMLDataManager.getConstById("banghuizhan_zhandou_time");
			if(xml)
			{
				return xml.value;
			}
			else
			{
				return 24;
			}
		}
		/**
		 * 帮会战战斗持续时间
		 */
		public function get BanghuizhanLingjiangLastTime():int
		{
			var xml:Node_const=XMLDataManager.getConstById("banghuizhan_reward_time");
			if(xml)
			{
				return xml.value;
			}
			else
			{
				return 24;
			}
		}
		/**
		 * 帮会战报名的时间段
		 */
		public function getBanghuizhanBaomingTimeDesc():String
		{
			var startStr:String=CommonControlFun.timeToMRHM(gonghuiVo.banghuizhanBaomingTime*1000);
			var endStr:String=CommonControlFun.timeToMRHM((gonghuiVo.banghuizhanBaomingTime+3600*BaomingLastTime)*1000);
			return Util.getLanguage("时间段",startStr,endStr);
		}
		/**
		 * 帮会战战斗的时间段
		 */
		public function getBanghuizhanZhandouTimeDesc():String
		{
			var startStr:String=CommonControlFun.timeToMRHM(gonghuiVo.banghuizhanBattleTime*1000);
			var endStr:String=CommonControlFun.timeToMRHM((gonghuiVo.banghuizhanBattleTime+3600*BanghuizhanLastTime)*1000);
			return Util.getLanguage("时间段",startStr,endStr);
		}
		/**
		 * 帮会战领奖的时间段
		 */
		public function getBanghuizhanLingjiangTimeDesc():String
		{
			var startStr:String=CommonControlFun.timeToMRHM(gonghuiVo.banghuizhanRewardTime*1000);
			var endStr:String=CommonControlFun.timeToMRHM((gonghuiVo.banghuizhanRewardTime+3600*BanghuizhanLingjiangLastTime)*1000);
			return Util.getLanguage("时间段",startStr,endStr);
		}
		/**
		 * 帮会战斗积分详情
		 */
		public function getZhanbaoDetailDesc():String
		{
			var result:String="";
			var myBanghuiName:String=gonghuiVo.banghuiName;
			var voArray:Array=GameVOManager.getInstance().banghuizhandetails.concat([]);
			voArray.sortOn("order");
			var index:int;
			for(index=0;index<voArray.length;index++)
			{
				var vo:BanghuizhandetailVO=voArray[index] as BanghuizhandetailVO;
				var re:int=vo.result;
				var oneDesc:String="";
				switch(re)
				{
					case 0:
						oneDesc=Util.getLanguage("帮会战帮会战斗详情未开始",myBanghuiName,vo.banghuiName);
						break;
					case 1:
						oneDesc=Util.getLanguage("帮会战帮会战斗详情胜利",myBanghuiName,vo.banghuiName);
						break;
					case 2:
						oneDesc=Util.getLanguage("帮会战帮会战斗详情失败",myBanghuiName,vo.banghuiName);
						break;
				}
				result+=oneDesc+"\n";
			}
			return result;
		}
		/**
		 *  根据排名，获取帮会战奖励Xml
		 */
		public function getNodeBanghuizhanRewardByRank(_rank:int):Node_banghuizhan_reward
		{
			var result:Node_banghuizhan_reward;
			var lastPaiming:int=_rank;
			var rankXmlList:Array=XMLDataManager.Node_banghuizhan_rewardArray;
			var index:int;
			for(index=0;index<rankXmlList.length;index++)
			{
				var xml:Node_banghuizhan_reward=rankXmlList[index] as Node_banghuizhan_reward;
				if(lastPaiming<=xml.id)
				{
					result=xml;
					break;
				}
			}
			return result;
		}
		/**
		 * 获得自己的帮会战排名
		 */
		public function getBanghuizhanPaiming():int
		{
			var result:int;
			var bid:int=gonghuiVo.bid;
			result=GameVOManager.getInstance().getBanghuizhanjifenVOBybid(bid).rank;
			return result;
		}
		/**
		 * 获得自己的帮会战奖励
		 */
		public function getMyRewardXml():Node_banghuizhan_reward
		{
			var rank:int=getBanghuizhanPaiming();
			var xml:Node_banghuizhan_reward=getNodeBanghuizhanRewardByRank(rank);
			return xml;
		}
		/**
		 * 获得帮会战规则显示
		 */
		public static function getBanghuizhanGuize():String
		{
			var result:String="";
			result+=Util.getLanguage("帮会周期");
			result+="\n";
			result+=Util.getLanguage("战斗规则");
			result+="\n";
			result+=Util.getLanguage("战斗奖励");
			result+="\n";
			var banghuiBuff:String=getBanghuiBuffDesc();
			result+=Util.getLanguage("帮会奖励",banghuiBuff);
			var gerenJiangli:String=getGerenJiangliDesc();
			result+=Util.getLanguage("个人奖励",gerenJiangli);
			return result;
		}
		public static function getBanghuiBuffDesc():String
		{
			var result:String="";
			var xmlList:Array=XMLDataManager.Node_banghuizhan_rewardArray;
			var index:int;
			for(index=0;index<xmlList.length;index++)
			{
				var desc:String="";				
				var xml:Node_banghuizhan_reward=xmlList[index] as Node_banghuizhan_reward;
				var mingci:String=xml.desc;
				var jiangliDesc:String=Util.getLanguage("铜钱BUFF加成",int(xml.banghuizhan_buff_percent*100)+"%");			
				desc=Util.getLanguage("名次奖励",mingci,jiangliDesc);
				result+=desc;
				result+="\n";
			}
			return result;
		}
		public static function getGerenJiangliDesc():String
		{
			var result:String="";
//			var xmlList:Array=XMLDataManager.Node_banghuizhan_rewardArray;
//			var index:int;
//			for(index=0;index<xmlList.length;index++)
//			{
//				var desc:String="";				
//				var xml:Node_banghuizhan_reward=xmlList[index] as Node_banghuizhan_reward;
//				var mingci:String=xml.desc;
//				var jiangliDesc:String="";
//				var tongqian:int=xml.reward_money;				
//				if(tongqian>0)
//				{
//					jiangliDesc+=Util.getLanguage("money")+"x"+tongqian;
//					jiangliDesc+="，";
//				}				
//				var cash:int=xml.reward_cash;	
//				if(cash>0)
//				{
//					jiangliDesc+=Util.getLanguage("cash")+"x"+cash;
//					jiangliDesc+="，";
//				}				
//				var shengwang:int=xml.reward_shengwang;	
//				if(shengwang>0)
//				{
//					jiangliDesc+=Util.getLanguage("shengwang")+"x"+shengwang;
//					jiangliDesc+="，";
//				}				
//				var itemObj:Object=JSON.parse(xml.reward_item);
//				for(var itemId:String in itemObj)
//				{
//					var itemXml:Node_item=XMLDataManager.getItemById(int(itemId));
//					var itemNum:int=int(itemObj[itemId]);
//					jiangliDesc+=itemXml.name+"x"+itemNum;
//					jiangliDesc+="，";
//				}
//				var cardObj:Object=JSON.parse(xml.reward_card);
//				for(var cardId:String in cardObj)
//				{
//					var cardXml:Node_kapai=XMLDataManager.getKapaiById(int(cardId));
//					var cardNum:int=int(cardObj[cardId]);
//					jiangliDesc+=cardXml.name+"x"+cardNum;
//					jiangliDesc+="，";
//				}
//				jiangliDesc+="，";
//				jiangliDesc=jiangliDesc.split("，，")[0];
//				desc=Util.getLanguage("名次奖励",mingci,jiangliDesc);
//				result+=desc;
//				result+="\n";
//			}
			return result;
		}
	}
}