package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class HuodongdetailVO extends BaseVo
	{
		/**  开始等级
		**/
		private var _levelStart:int;
		/**  开始等级
		**/
		public function get levelStart():int
	 	{
	 		return _levelStart;
	 	}
		/**  开始等级
		**/
		public function set levelStart(value:int):void
		{
			if(initFlag){
				if(_levelStart!=value){
					var old:int=_levelStart;
					_levelStart=value;
					onChangeAttr("levelStart",_levelStart,old);
				}
			}else{
				_levelStart=value;
			}
		}
		/**  当前等级
		**/
		private var _levelCur:int;
		/**  当前等级
		**/
		public function get levelCur():int
	 	{
	 		return _levelCur;
	 	}
		/**  当前等级
		**/
		public function set levelCur(value:int):void
		{
			if(initFlag){
				if(_levelCur!=value){
					var old:int=_levelCur;
					_levelCur=value;
					onChangeAttr("levelCur",_levelCur,old);
				}
			}else{
				_levelCur=value;
			}
		}
		/**  已经领取奖励列表
		**/
		private var _levelRewardList:String;
		/**  已经领取奖励列表
		**/
		public function get levelRewardList():String
	 	{
	 		return _levelRewardList;
	 	}
		/**  已经领取奖励列表
		**/
		public function set levelRewardList(value:String):void
		{
			if(initFlag){
				if(_levelRewardList!=value){
					var old:String=_levelRewardList;
					_levelRewardList=value;
					onChangeAttr("levelRewardList",_levelRewardList,old);
				}
			}else{
				_levelRewardList=value;
			}
		}
		/**  
		**/
		private var _chongzhiStart:int;
		/**  
		**/
		public function get chongzhiStart():int
	 	{
	 		return _chongzhiStart;
	 	}
		/**  
		**/
		public function set chongzhiStart(value:int):void
		{
			if(initFlag){
				if(_chongzhiStart!=value){
					var old:int=_chongzhiStart;
					_chongzhiStart=value;
					onChangeAttr("chongzhiStart",_chongzhiStart,old);
				}
			}else{
				_chongzhiStart=value;
			}
		}
		/**  
		**/
		private var _chongzhiRewardList:String;
		/**  
		**/
		public function get chongzhiRewardList():String
	 	{
	 		return _chongzhiRewardList;
	 	}
		/**  
		**/
		public function set chongzhiRewardList(value:String):void
		{
			if(initFlag){
				if(_chongzhiRewardList!=value){
					var old:String=_chongzhiRewardList;
					_chongzhiRewardList=value;
					onChangeAttr("chongzhiRewardList",_chongzhiRewardList,old);
				}
			}else{
				_chongzhiRewardList=value;
			}
		}
		/**  
		**/
		private var _chongzhiCur:int;
		/**  
		**/
		public function get chongzhiCur():int
	 	{
	 		return _chongzhiCur;
	 	}
		/**  
		**/
		public function set chongzhiCur(value:int):void
		{
			if(initFlag){
				if(_chongzhiCur!=value){
					var old:int=_chongzhiCur;
					_chongzhiCur=value;
					onChangeAttr("chongzhiCur",_chongzhiCur,old);
				}
			}else{
				_chongzhiCur=value;
			}
		}
		/**  laba活动次数
		**/
		private var _labaTimes:int;
		/**  laba活动次数
		**/
		public function get labaTimes():int
	 	{
	 		return _labaTimes;
	 	}
		/**  laba活动次数
		**/
		public function set labaTimes(value:int):void
		{
			if(initFlag){
				if(_labaTimes!=value){
					var old:int=_labaTimes;
					_labaTimes=value;
					onChangeAttr("labaTimes",_labaTimes,old);
				}
			}else{
				_labaTimes=value;
			}
		}
		/**  laba获得元宝数量
		**/
		private var _labaRewardsCash:int;
		/**  laba获得元宝数量
		**/
		public function get labaRewardsCash():int
	 	{
	 		return _labaRewardsCash;
	 	}
		/**  laba获得元宝数量
		**/
		public function set labaRewardsCash(value:int):void
		{
			if(initFlag){
				if(_labaRewardsCash!=value){
					var old:int=_labaRewardsCash;
					_labaRewardsCash=value;
					onChangeAttr("labaRewardsCash",_labaRewardsCash,old);
				}
			}else{
				_labaRewardsCash=value;
			}
		}
		/**  转盘得到的奖励xid
		**/
		private var _zhuanpanRewardid:int;
		/**  转盘得到的奖励xid
		**/
		public function get zhuanpanRewardid():int
	 	{
	 		return _zhuanpanRewardid;
	 	}
		/**  转盘得到的奖励xid
		**/
		public function set zhuanpanRewardid(value:int):void
		{
			if(initFlag){
				if(_zhuanpanRewardid!=value){
					var old:int=_zhuanpanRewardid;
					_zhuanpanRewardid=value;
					onChangeAttr("zhuanpanRewardid",_zhuanpanRewardid,old);
				}
			}else{
				_zhuanpanRewardid=value;
			}
		}
		/**  转盘消耗的元宝数量
		**/
		private var _zhuanpanCost:int;
		/**  转盘消耗的元宝数量
		**/
		public function get zhuanpanCost():int
	 	{
	 		return _zhuanpanCost;
	 	}
		/**  转盘消耗的元宝数量
		**/
		public function set zhuanpanCost(value:int):void
		{
			if(initFlag){
				if(_zhuanpanCost!=value){
					var old:int=_zhuanpanCost;
					_zhuanpanCost=value;
					onChangeAttr("zhuanpanCost",_zhuanpanCost,old);
				}
			}else{
				_zhuanpanCost=value;
			}
		}
		/**  抽卡数据的json数组
		**/
		private var _choukaData:String;
		/**  抽卡数据的json数组
		**/
		public function get choukaData():String
	 	{
	 		return _choukaData;
	 	}
		/**  抽卡数据的json数组
		**/
		public function set choukaData(value:String):void
		{
			if(initFlag){
				if(_choukaData!=value){
					var old:String=_choukaData;
					_choukaData=value;
					onChangeAttr("choukaData",_choukaData,old);
				}
			}else{
				_choukaData=value;
			}
		}
		/**  抽卡消耗的元宝
		**/
		private var _choukaCost:int;
		/**  抽卡消耗的元宝
		**/
		public function get choukaCost():int
	 	{
	 		return _choukaCost;
	 	}
		/**  抽卡消耗的元宝
		**/
		public function set choukaCost(value:int):void
		{
			if(initFlag){
				if(_choukaCost!=value){
					var old:int=_choukaCost;
					_choukaCost=value;
					onChangeAttr("choukaCost",_choukaCost,old);
				}
			}else{
				_choukaCost=value;
			}
		}
		/**  一键抽卡消耗的元宝数
		**/
		private var _choukaAllCost:int;
		/**  一键抽卡消耗的元宝数
		**/
		public function get choukaAllCost():int
	 	{
	 		return _choukaAllCost;
	 	}
		/**  一键抽卡消耗的元宝数
		**/
		public function set choukaAllCost(value:int):void
		{
			if(initFlag){
				if(_choukaAllCost!=value){
					var old:int=_choukaAllCost;
					_choukaAllCost=value;
					onChangeAttr("choukaAllCost",_choukaAllCost,old);
				}
			}else{
				_choukaAllCost=value;
			}
		}
		/**  收藏补齐的次数
		**/
		private var _collectSupplyNum:int;
		/**  收藏补齐的次数
		**/
		public function get collectSupplyNum():int
	 	{
	 		return _collectSupplyNum;
	 	}
		/**  收藏补齐的次数
		**/
		public function set collectSupplyNum(value:int):void
		{
			if(initFlag){
				if(_collectSupplyNum!=value){
					var old:int=_collectSupplyNum;
					_collectSupplyNum=value;
					onChangeAttr("collectSupplyNum",_collectSupplyNum,old);
				}
			}else{
				_collectSupplyNum=value;
			}
		}
		/**  刮刮乐 奖池数组 json id
		**/
		private var _guagualeJiangci:String;
		/**  刮刮乐 奖池数组 json id
		**/
		public function get guagualeJiangci():String
	 	{
	 		return _guagualeJiangci;
	 	}
		/**  刮刮乐 奖池数组 json id
		**/
		public function set guagualeJiangci(value:String):void
		{
			if(initFlag){
				if(_guagualeJiangci!=value){
					var old:String=_guagualeJiangci;
					_guagualeJiangci=value;
					onChangeAttr("guagualeJiangci",_guagualeJiangci,old);
				}
			}else{
				_guagualeJiangci=value;
			}
		}
		/**  刮刮乐 获得的道具 json id
		**/
		private var _guagualeReward:String;
		/**  刮刮乐 获得的道具 json id
		**/
		public function get guagualeReward():String
	 	{
	 		return _guagualeReward;
	 	}
		/**  刮刮乐 获得的道具 json id
		**/
		public function set guagualeReward(value:String):void
		{
			if(initFlag){
				if(_guagualeReward!=value){
					var old:String=_guagualeReward;
					_guagualeReward=value;
					onChangeAttr("guagualeReward",_guagualeReward,old);
				}
			}else{
				_guagualeReward=value;
			}
		}
		/**  今日剩余可以刮奖次数
		**/
		private var _guagualeCount:int;
		/**  今日剩余可以刮奖次数
		**/
		public function get guagualeCount():int
	 	{
	 		return _guagualeCount;
	 	}
		/**  今日剩余可以刮奖次数
		**/
		public function set guagualeCount(value:int):void
		{
			if(initFlag){
				if(_guagualeCount!=value){
					var old:int=_guagualeCount;
					_guagualeCount=value;
					onChangeAttr("guagualeCount",_guagualeCount,old);
				}
			}else{
				_guagualeCount=value;
			}
		}
		public static const Attributes:Array=["levelStart","levelCur","levelRewardList","chongzhiStart","chongzhiRewardList","chongzhiCur","labaTimes","labaRewardsCash","zhuanpanRewardid","zhuanpanCost","choukaData","choukaCost","choukaAllCost","collectSupplyNum","guagualeJiangci","guagualeReward","guagualeCount"];
	}
}