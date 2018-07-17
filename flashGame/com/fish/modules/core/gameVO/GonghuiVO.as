package com.fish.modules.core.gameVO
{

	/** 用户数据
	**/
	public class GonghuiVO extends BaseVo
	{
		/**  公告
		**/
		private var _gonggao:String;
		/**  公告
		**/
		public function get gonggao():String
	 	{
	 		return _gonggao;
	 	}
		/**  公告
		**/
		public function set gonggao(value:String):void
		{
			if(initFlag){
				if(_gonggao!=value){
					var old:String=_gonggao;
					_gonggao=value;
					onChangeAttr("gonggao",_gonggao,old);
				}
			}else{
				_gonggao=value;
			}
		}
		/**  创建时间
		**/
		private var _createTime:Number;
		/**  创建时间
		**/
		public function get createTime():Number
	 	{
	 		return _createTime;
	 	}
		/**  创建时间
		**/
		public function set createTime(value:Number):void
		{
			if(initFlag){
				if(_createTime!=value){
					var old:Number=_createTime;
					_createTime=value;
					onChangeAttr("createTime",_createTime,old);
				}
			}else{
				_createTime=value;
			}
		}
		/**  宣言
		**/
		private var _xuanyan:String;
		/**  宣言
		**/
		public function get xuanyan():String
	 	{
	 		return _xuanyan;
	 	}
		/**  宣言
		**/
		public function set xuanyan(value:String):void
		{
			if(initFlag){
				if(_xuanyan!=value){
					var old:String=_xuanyan;
					_xuanyan=value;
					onChangeAttr("xuanyan",_xuanyan,old);
				}
			}else{
				_xuanyan=value;
			}
		}
		/**  成员数量
		**/
		private var _personNum:int;
		/**  成员数量
		**/
		public function get personNum():int
	 	{
	 		return _personNum;
	 	}
		/**  成员数量
		**/
		public function set personNum(value:int):void
		{
			if(initFlag){
				if(_personNum!=value){
					var old:int=_personNum;
					_personNum=value;
					onChangeAttr("personNum",_personNum,old);
				}
			}else{
				_personNum=value;
			}
		}
		/**  帮会名称
		**/
		private var _banghuiName:String;
		/**  帮会名称
		**/
		public function get banghuiName():String
	 	{
	 		return _banghuiName;
	 	}
		/**  帮会名称
		**/
		public function set banghuiName(value:String):void
		{
			if(initFlag){
				if(_banghuiName!=value){
					var old:String=_banghuiName;
					_banghuiName=value;
					onChangeAttr("banghuiName",_banghuiName,old);
				}
			}else{
				_banghuiName=value;
			}
		}
		/**  帮会等级
		**/
		private var _banghuiLevel:int;
		/**  帮会等级
		**/
		public function get banghuiLevel():int
	 	{
	 		return _banghuiLevel;
	 	}
		/**  帮会等级
		**/
		public function set banghuiLevel(value:int):void
		{
			if(initFlag){
				if(_banghuiLevel!=value){
					var old:int=_banghuiLevel;
					_banghuiLevel=value;
					onChangeAttr("banghuiLevel",_banghuiLevel,old);
				}
			}else{
				_banghuiLevel=value;
			}
		}
		/**  帮会图标
		**/
		private var _banghuiIcon:int;
		/**  帮会图标
		**/
		public function get banghuiIcon():int
	 	{
	 		return _banghuiIcon;
	 	}
		/**  帮会图标
		**/
		public function set banghuiIcon(value:int):void
		{
			if(initFlag){
				if(_banghuiIcon!=value){
					var old:int=_banghuiIcon;
					_banghuiIcon=value;
					onChangeAttr("banghuiIcon",_banghuiIcon,old);
				}
			}else{
				_banghuiIcon=value;
			}
		}
		/**  会长名字
		**/
		private var _huizhangName:String;
		/**  会长名字
		**/
		public function get huizhangName():String
	 	{
	 		return _huizhangName;
	 	}
		/**  会长名字
		**/
		public function set huizhangName(value:String):void
		{
			if(initFlag){
				if(_huizhangName!=value){
					var old:String=_huizhangName;
					_huizhangName=value;
					onChangeAttr("huizhangName",_huizhangName,old);
				}
			}else{
				_huizhangName=value;
			}
		}
		/**  会长uid
		**/
		private var _huizhangUid:int;
		/**  会长uid
		**/
		public function get huizhangUid():int
	 	{
	 		return _huizhangUid;
	 	}
		/**  会长uid
		**/
		public function set huizhangUid(value:int):void
		{
			if(initFlag){
				if(_huizhangUid!=value){
					var old:int=_huizhangUid;
					_huizhangUid=value;
					onChangeAttr("huizhangUid",_huizhangUid,old);
				}
			}else{
				_huizhangUid=value;
			}
		}
		/**  建设度
		**/
		private var _jiangshedu:int;
		/**  建设度
		**/
		public function get jiangshedu():int
	 	{
	 		return _jiangshedu;
	 	}
		/**  建设度
		**/
		public function set jiangshedu(value:int):void
		{
			if(initFlag){
				if(_jiangshedu!=value){
					var old:int=_jiangshedu;
					_jiangshedu=value;
					onChangeAttr("jiangshedu",_jiangshedu,old);
				}
			}else{
				_jiangshedu=value;
			}
		}
		/**  关公庙等级
		**/
		private var _guanggongmiaoLevel:int;
		/**  关公庙等级
		**/
		public function get guanggongmiaoLevel():int
	 	{
	 		return _guanggongmiaoLevel;
	 	}
		/**  关公庙等级
		**/
		public function set guanggongmiaoLevel(value:int):void
		{
			if(initFlag){
				if(_guanggongmiaoLevel!=value){
					var old:int=_guanggongmiaoLevel;
					_guanggongmiaoLevel=value;
					onChangeAttr("guanggongmiaoLevel",_guanggongmiaoLevel,old);
				}
			}else{
				_guanggongmiaoLevel=value;
			}
		}
		/**  大厅等级
		**/
		private var _datingLevel:int;
		/**  大厅等级
		**/
		public function get datingLevel():int
	 	{
	 		return _datingLevel;
	 	}
		/**  大厅等级
		**/
		public function set datingLevel(value:int):void
		{
			if(initFlag){
				if(_datingLevel!=value){
					var old:int=_datingLevel;
					_datingLevel=value;
					onChangeAttr("datingLevel",_datingLevel,old);
				}
			}else{
				_datingLevel=value;
			}
		}
		/**  商城等级
		**/
		private var _shangchengLevel:int;
		/**  商城等级
		**/
		public function get shangchengLevel():int
	 	{
	 		return _shangchengLevel;
	 	}
		/**  商城等级
		**/
		public function set shangchengLevel(value:int):void
		{
			if(initFlag){
				if(_shangchengLevel!=value){
					var old:int=_shangchengLevel;
					_shangchengLevel=value;
					onChangeAttr("shangchengLevel",_shangchengLevel,old);
				}
			}else{
				_shangchengLevel=value;
			}
		}
		/**  帮会id
		**/
		private var _bid:int;
		/**  帮会id
		**/
		public function get bid():int
	 	{
	 		return _bid;
	 	}
		/**  帮会id
		**/
		public function set bid(value:int):void
		{
			if(initFlag){
				if(_bid!=value){
					var old:int=_bid;
					_bid=value;
					onChangeAttr("bid",_bid,old);
				}
			}else{
				_bid=value;
			}
		}
		/**  真品刷新时间
		**/
		private var _zhenpingRefreshTime:Number;
		/**  真品刷新时间
		**/
		public function get zhenpingRefreshTime():Number
	 	{
	 		return _zhenpingRefreshTime;
	 	}
		/**  真品刷新时间
		**/
		public function set zhenpingRefreshTime(value:Number):void
		{
			if(initFlag){
				if(_zhenpingRefreshTime!=value){
					var old:Number=_zhenpingRefreshTime;
					_zhenpingRefreshTime=value;
					onChangeAttr("zhenpingRefreshTime",_zhenpingRefreshTime,old);
				}
			}else{
				_zhenpingRefreshTime=value;
			}
		}
		/**  真品列表 json
		**/
		private var _zhenpingList:String;
		/**  真品列表 json
		**/
		public function get zhenpingList():String
	 	{
	 		return _zhenpingList;
	 	}
		/**  真品列表 json
		**/
		public function set zhenpingList(value:String):void
		{
			if(initFlag){
				if(_zhenpingList!=value){
					var old:String=_zhenpingList;
					_zhenpingList=value;
					onChangeAttr("zhenpingList",_zhenpingList,old);
				}
			}else{
				_zhenpingList=value;
			}
		}
		/**  捐献记录 json
		**/
		private var _juanxianRecord:String;
		/**  捐献记录 json
		**/
		public function get juanxianRecord():String
	 	{
	 		return _juanxianRecord;
	 	}
		/**  捐献记录 json
		**/
		public function set juanxianRecord(value:String):void
		{
			if(initFlag){
				if(_juanxianRecord!=value){
					var old:String=_juanxianRecord;
					_juanxianRecord=value;
					onChangeAttr("juanxianRecord",_juanxianRecord,old);
				}
			}else{
				_juanxianRecord=value;
			}
		}
		/**  今日已经参拜次数
		**/
		private var _canbaiCout:int;
		/**  今日已经参拜次数
		**/
		public function get canbaiCout():int
	 	{
	 		return _canbaiCout;
	 	}
		/**  今日已经参拜次数
		**/
		public function set canbaiCout(value:int):void
		{
			if(initFlag){
				if(_canbaiCout!=value){
					var old:int=_canbaiCout;
					_canbaiCout=value;
					onChangeAttr("canbaiCout",_canbaiCout,old);
				}
			}else{
				_canbaiCout=value;
			}
		}
		/**  添加的Buff
		**/
		private var _coinBuff:Number;
		/**  添加的Buff
		**/
		public function get coinBuff():Number
	 	{
	 		return _coinBuff;
	 	}
		/**  添加的Buff
		**/
		public function set coinBuff(value:Number):void
		{
			if(initFlag){
				if(_coinBuff!=value){
					var old:Number=_coinBuff;
					_coinBuff=value;
					onChangeAttr("coinBuff",_coinBuff,old);
				}
			}else{
				_coinBuff=value;
			}
		}
		/**  各种开始时间
		**/
		private var _coinBuffEndTime:Number;
		/**  各种开始时间
		**/
		public function get coinBuffEndTime():Number
	 	{
	 		return _coinBuffEndTime;
	 	}
		/**  各种开始时间
		**/
		public function set coinBuffEndTime(value:Number):void
		{
			if(initFlag){
				if(_coinBuffEndTime!=value){
					var old:Number=_coinBuffEndTime;
					_coinBuffEndTime=value;
					onChangeAttr("coinBuffEndTime",_coinBuffEndTime,old);
				}
			}else{
				_coinBuffEndTime=value;
			}
		}
		/**  各种开始时间
		**/
		private var _banghuizhanBaomingTime:Number;
		/**  各种开始时间
		**/
		public function get banghuizhanBaomingTime():Number
	 	{
	 		return _banghuizhanBaomingTime;
	 	}
		/**  各种开始时间
		**/
		public function set banghuizhanBaomingTime(value:Number):void
		{
			if(initFlag){
				if(_banghuizhanBaomingTime!=value){
					var old:Number=_banghuizhanBaomingTime;
					_banghuizhanBaomingTime=value;
					onChangeAttr("banghuizhanBaomingTime",_banghuizhanBaomingTime,old);
				}
			}else{
				_banghuizhanBaomingTime=value;
			}
		}
		/**  各种开始时间
		**/
		private var _banghuizhanBattleTime:Number;
		/**  各种开始时间
		**/
		public function get banghuizhanBattleTime():Number
	 	{
	 		return _banghuizhanBattleTime;
	 	}
		/**  各种开始时间
		**/
		public function set banghuizhanBattleTime(value:Number):void
		{
			if(initFlag){
				if(_banghuizhanBattleTime!=value){
					var old:Number=_banghuizhanBattleTime;
					_banghuizhanBattleTime=value;
					onChangeAttr("banghuizhanBattleTime",_banghuizhanBattleTime,old);
				}
			}else{
				_banghuizhanBattleTime=value;
			}
		}
		/**  各种开始时间
		**/
		private var _banghuizhanRewardTime:Number;
		/**  各种开始时间
		**/
		public function get banghuizhanRewardTime():Number
	 	{
	 		return _banghuizhanRewardTime;
	 	}
		/**  各种开始时间
		**/
		public function set banghuizhanRewardTime(value:Number):void
		{
			if(initFlag){
				if(_banghuizhanRewardTime!=value){
					var old:Number=_banghuizhanRewardTime;
					_banghuizhanRewardTime=value;
					onChangeAttr("banghuizhanRewardTime",_banghuizhanRewardTime,old);
				}
			}else{
				_banghuizhanRewardTime=value;
			}
		}
		/**  持续时间（天）
		**/
		private var _banghuizhanDurationTime:int;
		/**  持续时间（天）
		**/
		public function get banghuizhanDurationTime():int
	 	{
	 		return _banghuizhanDurationTime;
	 	}
		/**  持续时间（天）
		**/
		public function set banghuizhanDurationTime(value:int):void
		{
			if(initFlag){
				if(_banghuizhanDurationTime!=value){
					var old:int=_banghuizhanDurationTime;
					_banghuizhanDurationTime=value;
					onChangeAttr("banghuizhanDurationTime",_banghuizhanDurationTime,old);
				}
			}else{
				_banghuizhanDurationTime=value;
			}
		}
		/**  是否包名参加帮会战 0没有 1有
		**/
		private var _hasBaomingBanghuizhan:int;
		/**  是否包名参加帮会战 0没有 1有
		**/
		public function get hasBaomingBanghuizhan():int
	 	{
	 		return _hasBaomingBanghuizhan;
	 	}
		/**  是否包名参加帮会战 0没有 1有
		**/
		public function set hasBaomingBanghuizhan(value:int):void
		{
			if(initFlag){
				if(_hasBaomingBanghuizhan!=value){
					var old:int=_hasBaomingBanghuizhan;
					_hasBaomingBanghuizhan=value;
					onChangeAttr("hasBaomingBanghuizhan",_hasBaomingBanghuizhan,old);
				}
			}else{
				_hasBaomingBanghuizhan=value;
			}
		}
		public static const Attributes:Array=["gonggao","createTime","xuanyan","personNum","banghuiName","banghuiLevel","banghuiIcon","huizhangName","huizhangUid","jiangshedu","guanggongmiaoLevel","datingLevel","shangchengLevel","bid","zhenpingRefreshTime","zhenpingList","juanxianRecord","canbaiCout","coinBuff","coinBuffEndTime","banghuizhanBaomingTime","banghuizhanBattleTime","banghuizhanRewardTime","banghuizhanDurationTime","hasBaomingBanghuizhan"];
	}
}