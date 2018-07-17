package com.fish.modules.core.gameVO
{

	/** 故事数据
	**/
	public class ExtrdataVO extends BaseVo
	{
		/**  上次剧情播放的副本id
		**/
		private var _copy:int;
		/**  上次剧情播放的副本id
		**/
		public function get copy():int
	 	{
	 		return _copy;
	 	}
		/**  上次剧情播放的副本id
		**/
		public function set copy(value:int):void
		{
			if(initFlag){
				if(_copy!=value){
					var old:int=_copy;
					_copy=value;
					onChangeAttr("copy",_copy,old);
				}
			}else{
				_copy=value;
			}
		}
		/**  随机筛选好友
		**/
		private var _rndFriend:String;
		/**  随机筛选好友
		**/
		public function get rndFriend():String
	 	{
	 		return _rndFriend;
	 	}
		/**  随机筛选好友
		**/
		public function set rndFriend(value:String):void
		{
			if(initFlag){
				if(_rndFriend!=value){
					var old:String=_rndFriend;
					_rndFriend=value;
					onChangeAttr("rndFriend",_rndFriend,old);
				}
			}else{
				_rndFriend=value;
			}
		}
		/**  扫荡刷新时间
		**/
		private var _saodangFreshTime:Number;
		/**  扫荡刷新时间
		**/
		public function get saodangFreshTime():Number
	 	{
	 		return _saodangFreshTime;
	 	}
		/**  扫荡刷新时间
		**/
		public function set saodangFreshTime(value:Number):void
		{
			if(initFlag){
				if(_saodangFreshTime!=value){
					var old:Number=_saodangFreshTime;
					_saodangFreshTime=value;
					onChangeAttr("saodangFreshTime",_saodangFreshTime,old);
				}
			}else{
				_saodangFreshTime=value;
			}
		}
		/**  是否有新的聊天信息
		**/
		private var _hasNewChat:int;
		/**  是否有新的聊天信息
		**/
		public function get hasNewChat():int
	 	{
	 		return _hasNewChat;
	 	}
		/**  是否有新的聊天信息
		**/
		public function set hasNewChat(value:int):void
		{
			if(initFlag){
				if(_hasNewChat!=value){
					var old:int=_hasNewChat;
					_hasNewChat=value;
					onChangeAttr("hasNewChat",_hasNewChat,old);
				}
			}else{
				_hasNewChat=value;
			}
		}
		/**  是否获得碎片
		**/
		private var _hasRewardSuipian:int;
		/**  是否获得碎片
		**/
		public function get hasRewardSuipian():int
	 	{
	 		return _hasRewardSuipian;
	 	}
		/**  是否获得碎片
		**/
		public function set hasRewardSuipian(value:int):void
		{
			if(initFlag){
				if(_hasRewardSuipian!=value){
					var old:int=_hasRewardSuipian;
					_hasRewardSuipian=value;
					onChangeAttr("hasRewardSuipian",_hasRewardSuipian,old);
				}
			}else{
				_hasRewardSuipian=value;
			}
		}
		/**  0:没有战斗，1：有战斗
		**/
		private var _jingkuangFight:int;
		/**  0:没有战斗，1：有战斗
		**/
		public function get jingkuangFight():int
	 	{
	 		return _jingkuangFight;
	 	}
		/**  0:没有战斗，1：有战斗
		**/
		public function set jingkuangFight(value:int):void
		{
			if(initFlag){
				if(_jingkuangFight!=value){
					var old:int=_jingkuangFight;
					_jingkuangFight=value;
					onChangeAttr("jingkuangFight",_jingkuangFight,old);
				}
			}else{
				_jingkuangFight=value;
			}
		}
		/**  系统矿铜钱
		**/
		private var _xitongkuangMoney:int;
		/**  系统矿铜钱
		**/
		public function get xitongkuangMoney():int
	 	{
	 		return _xitongkuangMoney;
	 	}
		/**  系统矿铜钱
		**/
		public function set xitongkuangMoney(value:int):void
		{
			if(initFlag){
				if(_xitongkuangMoney!=value){
					var old:int=_xitongkuangMoney;
					_xitongkuangMoney=value;
					onChangeAttr("xitongkuangMoney",_xitongkuangMoney,old);
				}
			}else{
				_xitongkuangMoney=value;
			}
		}
		/**  金矿数组是长度是否为0
		**/
		private var _jingkuangLogNull:int;
		/**  金矿数组是长度是否为0
		**/
		public function get jingkuangLogNull():int
	 	{
	 		return _jingkuangLogNull;
	 	}
		/**  金矿数组是长度是否为0
		**/
		public function set jingkuangLogNull(value:int):void
		{
			if(initFlag){
				if(_jingkuangLogNull!=value){
					var old:int=_jingkuangLogNull;
					_jingkuangLogNull=value;
					onChangeAttr("jingkuangLogNull",_jingkuangLogNull,old);
				}
			}else{
				_jingkuangLogNull=value;
			}
		}
		/**  活动开关是不是为空
		**/
		private var _huodongNull:int;
		/**  活动开关是不是为空
		**/
		public function get huodongNull():int
	 	{
	 		return _huodongNull;
	 	}
		/**  活动开关是不是为空
		**/
		public function set huodongNull(value:int):void
		{
			if(initFlag){
				if(_huodongNull!=value){
					var old:int=_huodongNull;
					_huodongNull=value;
					onChangeAttr("huodongNull",_huodongNull,old);
				}
			}else{
				_huodongNull=value;
			}
		}
		/**  未读邮件数量
		**/
		private var _mailCount:int;
		/**  未读邮件数量
		**/
		public function get mailCount():int
	 	{
	 		return _mailCount;
	 	}
		/**  未读邮件数量
		**/
		public function set mailCount(value:int):void
		{
			if(initFlag){
				if(_mailCount!=value){
					var old:int=_mailCount;
					_mailCount=value;
					onChangeAttr("mailCount",_mailCount,old);
				}
			}else{
				_mailCount=value;
			}
		}
		/**  是否需要卡牌升级引导
		**/
		private var _guideUpgrade:int;
		/**  是否需要卡牌升级引导
		**/
		public function get guideUpgrade():int
	 	{
	 		return _guideUpgrade;
	 	}
		/**  是否需要卡牌升级引导
		**/
		public function set guideUpgrade(value:int):void
		{
			if(initFlag){
				if(_guideUpgrade!=value){
					var old:int=_guideUpgrade;
					_guideUpgrade=value;
					onChangeAttr("guideUpgrade",_guideUpgrade,old);
				}
			}else{
				_guideUpgrade=value;
			}
		}
		/**  系统矿数组是否为空
		**/
		private var _xitongkuangNull:int;
		/**  系统矿数组是否为空
		**/
		public function get xitongkuangNull():int
	 	{
	 		return _xitongkuangNull;
	 	}
		/**  系统矿数组是否为空
		**/
		public function set xitongkuangNull(value:int):void
		{
			if(initFlag){
				if(_xitongkuangNull!=value){
					var old:int=_xitongkuangNull;
					_xitongkuangNull=value;
					onChangeAttr("xitongkuangNull",_xitongkuangNull,old);
				}
			}else{
				_xitongkuangNull=value;
			}
		}
		/**  报名帮会数组是否为空
		**/
		private var _baomingbanghuiNull:int;
		/**  报名帮会数组是否为空
		**/
		public function get baomingbanghuiNull():int
	 	{
	 		return _baomingbanghuiNull;
	 	}
		/**  报名帮会数组是否为空
		**/
		public function set baomingbanghuiNull(value:int):void
		{
			if(initFlag){
				if(_baomingbanghuiNull!=value){
					var old:int=_baomingbanghuiNull;
					_baomingbanghuiNull=value;
					onChangeAttr("baomingbanghuiNull",_baomingbanghuiNull,old);
				}
			}else{
				_baomingbanghuiNull=value;
			}
		}
		/**  帮会战积分数组是否为空
		**/
		private var _banghuizhanjifenNull:int;
		/**  帮会战积分数组是否为空
		**/
		public function get banghuizhanjifenNull():int
	 	{
	 		return _banghuizhanjifenNull;
	 	}
		/**  帮会战积分数组是否为空
		**/
		public function set banghuizhanjifenNull(value:int):void
		{
			if(initFlag){
				if(_banghuizhanjifenNull!=value){
					var old:int=_banghuizhanjifenNull;
					_banghuizhanjifenNull=value;
					onChangeAttr("banghuizhanjifenNull",_banghuizhanjifenNull,old);
				}
			}else{
				_banghuizhanjifenNull=value;
			}
		}
		/**  帮会战详细数组是否为空
		**/
		private var _banghuizhandetailNull:int;
		/**  帮会战详细数组是否为空
		**/
		public function get banghuizhandetailNull():int
	 	{
	 		return _banghuizhandetailNull;
	 	}
		/**  帮会战详细数组是否为空
		**/
		public function set banghuizhandetailNull(value:int):void
		{
			if(initFlag){
				if(_banghuizhandetailNull!=value){
					var old:int=_banghuizhandetailNull;
					_banghuizhandetailNull=value;
					onChangeAttr("banghuizhandetailNull",_banghuizhandetailNull,old);
				}
			}else{
				_banghuizhandetailNull=value;
			}
		}
		/**  个人战绩数组是否为空
		**/
		private var _gerenzhanjiNull:int;
		/**  个人战绩数组是否为空
		**/
		public function get gerenzhanjiNull():int
	 	{
	 		return _gerenzhanjiNull;
	 	}
		/**  个人战绩数组是否为空
		**/
		public function set gerenzhanjiNull(value:int):void
		{
			if(initFlag){
				if(_gerenzhanjiNull!=value){
					var old:int=_gerenzhanjiNull;
					_gerenzhanjiNull=value;
					onChangeAttr("gerenzhanjiNull",_gerenzhanjiNull,old);
				}
			}else{
				_gerenzhanjiNull=value;
			}
		}
		/**  随机宝箱获得的物品 json 参考mail
		**/
		private var _rndBaoxiangReward:String;
		/**  随机宝箱获得的物品 json 参考mail
		**/
		public function get rndBaoxiangReward():String
	 	{
	 		return _rndBaoxiangReward;
	 	}
		/**  随机宝箱获得的物品 json 参考mail
		**/
		public function set rndBaoxiangReward(value:String):void
		{
			if(initFlag){
				if(_rndBaoxiangReward!=value){
					var old:String=_rndBaoxiangReward;
					_rndBaoxiangReward=value;
					onChangeAttr("rndBaoxiangReward",_rndBaoxiangReward,old);
				}
			}else{
				_rndBaoxiangReward=value;
			}
		}
		/**  充值记录是否为空
		**/
		private var _chongzhijiluNull:int;
		/**  充值记录是否为空
		**/
		public function get chongzhijiluNull():int
	 	{
	 		return _chongzhijiluNull;
	 	}
		/**  充值记录是否为空
		**/
		public function set chongzhijiluNull(value:int):void
		{
			if(initFlag){
				if(_chongzhijiluNull!=value){
					var old:int=_chongzhijiluNull;
					_chongzhijiluNull=value;
					onChangeAttr("chongzhijiluNull",_chongzhijiluNull,old);
				}
			}else{
				_chongzhijiluNull=value;
			}
		}
		/**  领取记录是否为空
		**/
		private var _lingqujiluNull:int;
		/**  领取记录是否为空
		**/
		public function get lingqujiluNull():int
	 	{
	 		return _lingqujiluNull;
	 	}
		/**  领取记录是否为空
		**/
		public function set lingqujiluNull(value:int):void
		{
			if(initFlag){
				if(_lingqujiluNull!=value){
					var old:int=_lingqujiluNull;
					_lingqujiluNull=value;
					onChangeAttr("lingqujiluNull",_lingqujiluNull,old);
				}
			}else{
				_lingqujiluNull=value;
			}
		}
		/**  红包数组是否为空
		**/
		private var _hongbaoNull:int;
		/**  红包数组是否为空
		**/
		public function get hongbaoNull():int
	 	{
	 		return _hongbaoNull;
	 	}
		/**  红包数组是否为空
		**/
		public function set hongbaoNull(value:int):void
		{
			if(initFlag){
				if(_hongbaoNull!=value){
					var old:int=_hongbaoNull;
					_hongbaoNull=value;
					onChangeAttr("hongbaoNull",_hongbaoNull,old);
				}
			}else{
				_hongbaoNull=value;
			}
		}
		/**  申请帮会数组是否为空
		**/
		private var _shengqingpersionNull:int;
		/**  申请帮会数组是否为空
		**/
		public function get shengqingpersionNull():int
	 	{
	 		return _shengqingpersionNull;
	 	}
		/**  申请帮会数组是否为空
		**/
		public function set shengqingpersionNull(value:int):void
		{
			if(initFlag){
				if(_shengqingpersionNull!=value){
					var old:int=_shengqingpersionNull;
					_shengqingpersionNull=value;
					onChangeAttr("shengqingpersionNull",_shengqingpersionNull,old);
				}
			}else{
				_shengqingpersionNull=value;
			}
		}
		/**  帮会成员数组是否为空
		**/
		private var _banghuiPersoionNull:int;
		/**  帮会成员数组是否为空
		**/
		public function get banghuiPersoionNull():int
	 	{
	 		return _banghuiPersoionNull;
	 	}
		/**  帮会成员数组是否为空
		**/
		public function set banghuiPersoionNull(value:int):void
		{
			if(initFlag){
				if(_banghuiPersoionNull!=value){
					var old:int=_banghuiPersoionNull;
					_banghuiPersoionNull=value;
					onChangeAttr("banghuiPersoionNull",_banghuiPersoionNull,old);
				}
			}else{
				_banghuiPersoionNull=value;
			}
		}
		/**  变强十连详细描述
		**/
		private var _enhance10Deatial:String;
		/**  变强十连详细描述
		**/
		public function get enhance10Deatial():String
	 	{
	 		return _enhance10Deatial;
	 	}
		/**  变强十连详细描述
		**/
		public function set enhance10Deatial(value:String):void
		{
			if(initFlag){
				if(_enhance10Deatial!=value){
					var old:String=_enhance10Deatial;
					_enhance10Deatial=value;
					onChangeAttr("enhance10Deatial",_enhance10Deatial,old);
				}
			}else{
				_enhance10Deatial=value;
			}
		}
		/**  熔炼出新的武器数组
		**/
		private var _ronglianEquipids:String;
		/**  熔炼出新的武器数组
		**/
		public function get ronglianEquipids():String
	 	{
	 		return _ronglianEquipids;
	 	}
		/**  熔炼出新的武器数组
		**/
		public function set ronglianEquipids(value:String):void
		{
			if(initFlag){
				if(_ronglianEquipids!=value){
					var old:String=_ronglianEquipids;
					_ronglianEquipids=value;
					onChangeAttr("ronglianEquipids",_ronglianEquipids,old);
				}
			}else{
				_ronglianEquipids=value;
			}
		}
		/**  今日副本排名
		**/
		private var _fubenPaimingNow:String;
		/**  今日副本排名
		**/
		public function get fubenPaimingNow():String
	 	{
	 		return _fubenPaimingNow;
	 	}
		/**  今日副本排名
		**/
		public function set fubenPaimingNow(value:String):void
		{
			if(initFlag){
				if(_fubenPaimingNow!=value){
					var old:String=_fubenPaimingNow;
					_fubenPaimingNow=value;
					onChangeAttr("fubenPaimingNow",_fubenPaimingNow,old);
				}
			}else{
				_fubenPaimingNow=value;
			}
		}
		/**  昨日副本排名
		**/
		private var _fubenPaimingOld:String;
		/**  昨日副本排名
		**/
		public function get fubenPaimingOld():String
	 	{
	 		return _fubenPaimingOld;
	 	}
		/**  昨日副本排名
		**/
		public function set fubenPaimingOld(value:String):void
		{
			if(initFlag){
				if(_fubenPaimingOld!=value){
					var old:String=_fubenPaimingOld;
					_fubenPaimingOld=value;
					onChangeAttr("fubenPaimingOld",_fubenPaimingOld,old);
				}
			}else{
				_fubenPaimingOld=value;
			}
		}
		/**  主城npc说的话
		**/
		private var _npcTalks:String;
		/**  主城npc说的话
		**/
		public function get npcTalks():String
	 	{
	 		return _npcTalks;
	 	}
		/**  主城npc说的话
		**/
		public function set npcTalks(value:String):void
		{
			if(initFlag){
				if(_npcTalks!=value){
					var old:String=_npcTalks;
					_npcTalks=value;
					onChangeAttr("npcTalks",_npcTalks,old);
				}
			}else{
				_npcTalks=value;
			}
		}
		/**  充值成功的 充值xid
		**/
		private var _chongzhiSuccessXid:int;
		/**  充值成功的 充值xid
		**/
		public function get chongzhiSuccessXid():int
	 	{
	 		return _chongzhiSuccessXid;
	 	}
		/**  充值成功的 充值xid
		**/
		public function set chongzhiSuccessXid(value:int):void
		{
			if(initFlag){
				if(_chongzhiSuccessXid!=value){
					var old:int=_chongzhiSuccessXid;
					_chongzhiSuccessXid=value;
					onChangeAttr("chongzhiSuccessXid",_chongzhiSuccessXid,old);
				}
			}else{
				_chongzhiSuccessXid=value;
			}
		}
		public static const Attributes:Array=["copy","rndFriend","saodangFreshTime","hasNewChat","hasRewardSuipian","jingkuangFight","xitongkuangMoney","jingkuangLogNull","huodongNull","mailCount","guideUpgrade","xitongkuangNull","baomingbanghuiNull","banghuizhanjifenNull","banghuizhandetailNull","gerenzhanjiNull","rndBaoxiangReward","chongzhijiluNull","lingqujiluNull","hongbaoNull","shengqingpersionNull","banghuiPersoionNull","enhance10Deatial","ronglianEquipids","fubenPaimingNow","fubenPaimingOld","npcTalks","chongzhiSuccessXid"];
	}
}