package com.fish.modules.core.gameVO
{
	import com.mutou.tqt.S2C.DigS2CProto;
	import flash.system.ApplicationDomain;
	import com.adobe.utils.StringUtil;
	import com.netease.protobuf.Message;
	import org.osflash.signals.Signal;
	import flash.utils.Dictionary;
	import com.fish.modules.core.S2CHanlder;
	import com.netease.protobuf.Int64;
	import com.netease.protobuf.UInt64;

	/** 
	**/
	public class GameVOManager extends Object
	{
		/**  用户数据
		**/
		private var _user:UserVO;
		/**  用户数据
		**/
		public function get user():UserVO
	 	{
	 		return _user;
	 	}
		/**  用户数据
		**/
		private var _diginfo:DiginfoVO;
		/**  用户数据
		**/
		public function get diginfo():DiginfoVO
	 	{
	 		return _diginfo;
	 	}
		/**  用户数据
		**/
		private var _zombies:Array;
		private var _zombiesDic:Dictionary;
		public function getZombieVOByid(value:int):ZombieVO
		{
			return _zombiesDic[value];
		}
		/**  用户数据
		**/
		public function get zombies():Array
	 	{
	 		return _zombies;
	 	}
		/**  装备数据
		**/
		private var _equips:Array;
		private var _equipsDic:Dictionary;
		public function getEquipVOByid(value:Number):EquipVO
		{
			return _equipsDic[value];
		}
		/**  装备数据
		**/
		public function get equips():Array
	 	{
	 		return _equips;
	 	}
		/**  用户数据
		**/
		private var _hero:HeroVO;
		/**  用户数据
		**/
		public function get hero():HeroVO
	 	{
	 		return _hero;
	 	}
		/**  道具
		**/
		private var _items:Array;
		private var _itemsDic:Dictionary;
		public function getItemVOByxid(value:int):ItemVO
		{
			return _itemsDic[value];
		}
		/**  道具
		**/
		public function get items():Array
	 	{
	 		return _items;
	 	}
		/**  用户数据
		**/
		private var _battleinfo:BattleinfoVO;
		/**  用户数据
		**/
		public function get battleinfo():BattleinfoVO
	 	{
	 		return _battleinfo;
	 	}
		/**  技能数据
		**/
		private var _skills:Array;
		private var _skillsDic:Dictionary;
		public function getSkillVOByid(value:Number):SkillVO
		{
			return _skillsDic[value];
		}
		/**  技能数据
		**/
		public function get skills():Array
	 	{
	 		return _skills;
	 	}
		/**  战斗数据
		**/
		private var _copys:Array;
		private var _copysDic:Dictionary;
		public function getCopyVOByxid(value:int):CopyVO
		{
			return _copysDic[value];
		}
		/**  战斗数据
		**/
		public function get copys():Array
	 	{
	 		return _copys;
	 	}
		/**  神秘商店
		**/
		private var _shenmishangdian:ShenmishangdianVO;
		/**  神秘商店
		**/
		public function get shenmishangdian():ShenmishangdianVO
	 	{
	 		return _shenmishangdian;
	 	}
		/**  战斗数据
		**/
		private var _battleheros:Array;
		private var _battleherosDic:Dictionary;
		public function getBattleheroVOByid(value:int):BattleheroVO
		{
			return _battleherosDic[value];
		}
		/**  战斗数据
		**/
		public function get battleheros():Array
	 	{
	 		return _battleheros;
	 	}
		/**  用户数据
		**/
		private var _saodangresult:SaodangresultVO;
		/**  用户数据
		**/
		public function get saodangresult():SaodangresultVO
	 	{
	 		return _saodangresult;
	 	}
		/**  邮件
		**/
		private var _mails:Array;
		private var _mailsDic:Dictionary;
		public function getMailVOByid(value:Number):MailVO
		{
			return _mailsDic[value];
		}
		/**  邮件
		**/
		public function get mails():Array
	 	{
	 		return _mails;
	 	}
		/**  故事数据
		**/
		private var _extrdata:ExtrdataVO;
		/**  故事数据
		**/
		public function get extrdata():ExtrdataVO
	 	{
	 		return _extrdata;
	 	}
		/**  宝石
		**/
		private var _baoshis:Array;
		private var _baoshisDic:Dictionary;
		public function getBaoshiVOByxid(value:int):BaoshiVO
		{
			return _baoshisDic[value];
		}
		/**  宝石
		**/
		public function get baoshis():Array
	 	{
	 		return _baoshis;
	 	}
		/**  擂台成员数据
		**/
		private var _leitaipersions:Array;
		private var _leitaipersionsDic:Dictionary;
		public function getLeitaipersionVOByuid(value:int):LeitaipersionVO
		{
			return _leitaipersionsDic[value];
		}
		/**  擂台成员数据
		**/
		public function get leitaipersions():Array
	 	{
	 		return _leitaipersions;
	 	}
		/**  擂台主体数据
		**/
		private var _leitai:LeitaiVO;
		/**  擂台主体数据
		**/
		public function get leitai():LeitaiVO
	 	{
	 		return _leitai;
	 	}
		/**  用户数据
		**/
		private var _equipgrid:EquipgridVO;
		/**  用户数据
		**/
		public function get equipgrid():EquipgridVO
	 	{
	 		return _equipgrid;
	 	}
		/**  擂台成员数据
		**/
		private var _battlepersons:Array;
		private var _battlepersonsDic:Dictionary;
		public function getBattlepersonVOByuid(value:int):BattlepersonVO
		{
			return _battlepersonsDic[value];
		}
		/**  擂台成员数据
		**/
		public function get battlepersons():Array
	 	{
	 		return _battlepersons;
	 	}
		/**  故事数据
		**/
		private var _battleresult:BattleresultVO;
		/**  故事数据
		**/
		public function get battleresult():BattleresultVO
	 	{
	 		return _battleresult;
	 	}
		/**  故事数据
		**/
		private var _chaonengli:ChaonengliVO;
		/**  故事数据
		**/
		public function get chaonengli():ChaonengliVO
	 	{
	 		return _chaonengli;
	 	}
		/**  邮件
		**/
		private var _tasks:Array;
		private var _tasksDic:Dictionary;
		public function getTaskVOByid(value:int):TaskVO
		{
			return _tasksDic[value];
		}
		/**  邮件
		**/
		public function get tasks():Array
	 	{
	 		return _tasks;
	 	}
		/**  故事数据
		**/
		private var _heroimage:HeroimageVO;
		/**  故事数据
		**/
		public function get heroimage():HeroimageVO
	 	{
	 		return _heroimage;
	 	}
		/**  故事数据
		**/
		private var _battlebase:BattlebaseVO;
		/**  故事数据
		**/
		public function get battlebase():BattlebaseVO
	 	{
	 		return _battlebase;
	 	}
		/**  战斗数据
		**/
		private var _battleguns:Array;
		private var _battlegunsDic:Dictionary;
		public function getBattlegunVOByid(value:Number):BattlegunVO
		{
			return _battlegunsDic[value];
		}
		/**  战斗数据
		**/
		public function get battleguns():Array
	 	{
	 		return _battleguns;
	 	}
		/**  用户数据
		**/
		private var _funbenguanming:FunbenguanmingVO;
		/**  用户数据
		**/
		public function get funbenguanming():FunbenguanmingVO
	 	{
	 		return _funbenguanming;
	 	}
		/**  选秀数据
		**/
		private var _choujiang:ChoujiangVO;
		/**  选秀数据
		**/
		public function get choujiang():ChoujiangVO
	 	{
	 		return _choujiang;
	 	}
		/**  用户数据
		**/
		private var _dailytask:DailytaskVO;
		/**  用户数据
		**/
		public function get dailytask():DailytaskVO
	 	{
	 		return _dailytask;
	 	}
		/**  擂台成员数据
		**/
		private var _walknpcs:Array;
		private var _walknpcsDic:Dictionary;
		public function getWalknpcVOByuid(value:int):WalknpcVO
		{
			return _walknpcsDic[value];
		}
		/**  擂台成员数据
		**/
		public function get walknpcs():Array
	 	{
	 		return _walknpcs;
	 	}
		/**  等级排行榜
		**/
		private var _dengjiranks:Array;
		private var _dengjiranksDic:Dictionary;
		public function getDengjirankVOByuid(value:int):DengjirankVO
		{
			return _dengjiranksDic[value];
		}
		/**  等级排行榜
		**/
		public function get dengjiranks():Array
	 	{
	 		return _dengjiranks;
	 	}
		/**  战斗力排行榜数据
		**/
		private var _zhanliranks:Array;
		private var _zhanliranksDic:Dictionary;
		public function getZhanlirankVOByuid(value:int):ZhanlirankVO
		{
			return _zhanliranksDic[value];
		}
		/**  战斗力排行榜数据
		**/
		public function get zhanliranks():Array
	 	{
	 		return _zhanliranks;
	 	}
		/**  雄霸排行榜数据
		**/
		private var _xiongbaranks:Array;
		private var _xiongbaranksDic:Dictionary;
		public function getXiongbarankVOByuid(value:int):XiongbarankVO
		{
			return _xiongbaranksDic[value];
		}
		/**  雄霸排行榜数据
		**/
		public function get xiongbaranks():Array
	 	{
	 		return _xiongbaranks;
	 	}
		/**  土豪排行榜数据
		**/
		private var _tuhaoranks:Array;
		private var _tuhaoranksDic:Dictionary;
		public function getTuhaorankVOByuid(value:int):TuhaorankVO
		{
			return _tuhaoranksDic[value];
		}
		/**  土豪排行榜数据
		**/
		public function get tuhaoranks():Array
	 	{
	 		return _tuhaoranks;
	 	}
		/**  崇拜和鄙视数据
		**/
		private var _rankopt:RankoptVO;
		/**  崇拜和鄙视数据
		**/
		public function get rankopt():RankoptVO
	 	{
	 		return _rankopt;
	 	}
		/**  擂台成员数据
		**/
		private var _paihangbangpersion:PaihangbangpersionVO;
		/**  擂台成员数据
		**/
		public function get paihangbangpersion():PaihangbangpersionVO
	 	{
	 		return _paihangbangpersion;
	 	}
		/**  聊天
		**/
		private var _chats:Array;
		private var _chatsDic:Dictionary;
		public function getChatVOByid(value:Number):ChatVO
		{
			return _chatsDic[value];
		}
		/**  聊天
		**/
		public function get chats():Array
	 	{
	 		return _chats;
	 	}
		/**  聊天
		**/
		private var _banghuichats:Array;
		private var _banghuichatsDic:Dictionary;
		public function getBanghuichatVOByid(value:Number):BanghuichatVO
		{
			return _banghuichatsDic[value];
		}
		/**  聊天
		**/
		public function get banghuichats():Array
	 	{
	 		return _banghuichats;
	 	}
		/**  好友成员数据
		**/
		private var _friends:Array;
		private var _friendsDic:Dictionary;
		public function getFriendVOByuid(value:int):FriendVO
		{
			return _friendsDic[value];
		}
		/**  好友成员数据
		**/
		public function get friends():Array
	 	{
	 		return _friends;
	 	}
		/**  禁言
		**/
		private var _jinyan:JinyanVO;
		/**  禁言
		**/
		public function get jinyan():JinyanVO
	 	{
	 		return _jinyan;
	 	}
		/**  通知数据
		**/
		private var _tongzhis:Array;
		private var _tongzhisDic:Dictionary;
		public function getTongzhiVOByid(value:int):TongzhiVO
		{
			return _tongzhisDic[value];
		}
		/**  通知数据
		**/
		public function get tongzhis():Array
	 	{
	 		return _tongzhis;
	 	}
		/**  活动控制
		**/
		private var _huodongswitchs:Array;
		private var _huodongswitchsDic:Dictionary;
		public function getHuodongswitchVOByid(value:int):HuodongswitchVO
		{
			return _huodongswitchsDic[value];
		}
		/**  活动控制
		**/
		public function get huodongswitchs():Array
	 	{
	 		return _huodongswitchs;
	 	}
		/**  用户数据
		**/
		private var _huodongdetail:HuodongdetailVO;
		/**  用户数据
		**/
		public function get huodongdetail():HuodongdetailVO
	 	{
	 		return _huodongdetail;
	 	}
		/**  成长计划
		**/
		private var _chengzhang:ChengzhangVO;
		/**  成长计划
		**/
		public function get chengzhang():ChengzhangVO
	 	{
	 		return _chengzhang;
	 	}
		/**  活动数据
		**/
		private var _huodong:HuodongVO;
		/**  活动数据
		**/
		public function get huodong():HuodongVO
	 	{
	 		return _huodong;
	 	}
		/**  抢矿
		**/
		private var _xitongkuangs:Array;
		private var _xitongkuangsDic:Dictionary;
		public function getXitongkuangVOByxid(value:int):XitongkuangVO
		{
			return _xitongkuangsDic[value];
		}
		/**  抢矿
		**/
		public function get xitongkuangs():Array
	 	{
	 		return _xitongkuangs;
	 	}
		/**  用户数据
		**/
		private var _xitongkuangperson:XitongkuangpersonVO;
		/**  用户数据
		**/
		public function get xitongkuangperson():XitongkuangpersonVO
	 	{
	 		return _xitongkuangperson;
	 	}
		/**  金矿记录
		**/
		private var _jinkuanglogs:Array;
		private var _jinkuanglogsDic:Dictionary;
		public function getJinkuanglogVOByid(value:int):JinkuanglogVO
		{
			return _jinkuanglogsDic[value];
		}
		/**  金矿记录
		**/
		public function get jinkuanglogs():Array
	 	{
	 		return _jinkuanglogs;
	 	}
		/**  金矿数据
		**/
		private var _jinkuang:JinkuangVO;
		/**  金矿数据
		**/
		public function get jinkuang():JinkuangVO
	 	{
	 		return _jinkuang;
	 	}
		/**  战斗数据
		**/
		private var _battle:BattleVO;
		/**  战斗数据
		**/
		public function get battle():BattleVO
	 	{
	 		return _battle;
	 	}
		/**  cdkey 礼包
		**/
		private var _cdkey:CdkeyVO;
		/**  cdkey 礼包
		**/
		public function get cdkey():CdkeyVO
	 	{
	 		return _cdkey;
	 	}
		/**  限制购买数据
		**/
		private var _limitbuy:LimitbuyVO;
		/**  限制购买数据
		**/
		public function get limitbuy():LimitbuyVO
	 	{
	 		return _limitbuy;
	 	}
		/**  用户数据
		**/
		private var _gonghui:GonghuiVO;
		/**  用户数据
		**/
		public function get gonghui():GonghuiVO
	 	{
	 		return _gonghui;
	 	}
		/**  魔女塔排行榜
		**/
		private var _banghuiliebiaos:Array;
		private var _banghuiliebiaosDic:Dictionary;
		public function getBanghuiliebiaoVOBybid(value:int):BanghuiliebiaoVO
		{
			return _banghuiliebiaosDic[value];
		}
		/**  魔女塔排行榜
		**/
		public function get banghuiliebiaos():Array
	 	{
	 		return _banghuiliebiaos;
	 	}
		/**  帮会详情
		**/
		private var _banghuixiangqing:BanghuixiangqingVO;
		/**  帮会详情
		**/
		public function get banghuixiangqing():BanghuixiangqingVO
	 	{
	 		return _banghuixiangqing;
	 	}
		/**  用户数据
		**/
		private var _banghuiselfdata:BanghuiselfdataVO;
		/**  用户数据
		**/
		public function get banghuiselfdata():BanghuiselfdataVO
	 	{
	 		return _banghuiselfdata;
	 	}
		/**  魔女塔排行榜
		**/
		private var _baomingbanghuis:Array;
		private var _baomingbanghuisDic:Dictionary;
		public function getBaomingbanghuiVOBybid(value:int):BaomingbanghuiVO
		{
			return _baomingbanghuisDic[value];
		}
		/**  魔女塔排行榜
		**/
		public function get baomingbanghuis():Array
	 	{
	 		return _baomingbanghuis;
	 	}
		/**  魔女塔排行榜
		**/
		private var _banghuizhanjifens:Array;
		private var _banghuizhanjifensDic:Dictionary;
		public function getBanghuizhanjifenVOBybid(value:int):BanghuizhanjifenVO
		{
			return _banghuizhanjifensDic[value];
		}
		/**  魔女塔排行榜
		**/
		public function get banghuizhanjifens():Array
	 	{
	 		return _banghuizhanjifens;
	 	}
		/**  魔女塔排行榜
		**/
		private var _banghuizhandetails:Array;
		private var _banghuizhandetailsDic:Dictionary;
		public function getBanghuizhandetailVOBytid(value:int):BanghuizhandetailVO
		{
			return _banghuizhandetailsDic[value];
		}
		/**  魔女塔排行榜
		**/
		public function get banghuizhandetails():Array
	 	{
	 		return _banghuizhandetails;
	 	}
		/**  魔女塔排行榜
		**/
		private var _gerenzhanjis:Array;
		private var _gerenzhanjisDic:Dictionary;
		public function getGerenzhanjiVOByuid(value:int):GerenzhanjiVO
		{
			return _gerenzhanjisDic[value];
		}
		/**  魔女塔排行榜
		**/
		public function get gerenzhanjis():Array
	 	{
	 		return _gerenzhanjis;
	 	}
		/**  魔女塔排行榜
		**/
		private var _chongzhijilus:Array;
		private var _chongzhijilusDic:Dictionary;
		public function getChongzhijiluVOByid(value:int):ChongzhijiluVO
		{
			return _chongzhijilusDic[value];
		}
		/**  魔女塔排行榜
		**/
		public function get chongzhijilus():Array
	 	{
	 		return _chongzhijilus;
	 	}
		/**  魔女塔排行榜
		**/
		private var _lingqujilus:Array;
		private var _lingqujilusDic:Dictionary;
		public function getLingqujiluVOByid(value:int):LingqujiluVO
		{
			return _lingqujilusDic[value];
		}
		/**  魔女塔排行榜
		**/
		public function get lingqujilus():Array
	 	{
	 		return _lingqujilus;
	 	}
		/**  魔女塔排行榜
		**/
		private var _hongbaos:Array;
		private var _hongbaosDic:Dictionary;
		public function getHongbaoVOByid(value:int):HongbaoVO
		{
			return _hongbaosDic[value];
		}
		/**  魔女塔排行榜
		**/
		public function get hongbaos():Array
	 	{
	 		return _hongbaos;
	 	}
		/**  活动控制
		**/
		private var _shengqingpersions:Array;
		private var _shengqingpersionsDic:Dictionary;
		public function getShengqingpersionVOByuid(value:int):ShengqingpersionVO
		{
			return _shengqingpersionsDic[value];
		}
		/**  活动控制
		**/
		public function get shengqingpersions():Array
	 	{
	 		return _shengqingpersions;
	 	}
		/**  活动控制
		**/
		private var _banghuipersions:Array;
		private var _banghuipersionsDic:Dictionary;
		public function getBanghuipersionVOByuid(value:int):BanghuipersionVO
		{
			return _banghuipersionsDic[value];
		}
		/**  活动控制
		**/
		public function get banghuipersions():Array
	 	{
	 		return _banghuipersions;
	 	}
		/**  人物详情数据
		**/
		private var _persondetail:PersondetailVO;
		/**  人物详情数据
		**/
		public function get persondetail():PersondetailVO
	 	{
	 		return _persondetail;
	 	}
		public function GameVOManager()
		{
		}
		private var initflag:Boolean=false;
		private function init():void
		{
			if(initflag) return ;
			_user = new UserVO();
			_diginfo = new DiginfoVO();
			_zombiesDic = new Dictionary();
			_zombies = new Array();
			_equipsDic = new Dictionary();
			_equips = new Array();
			_hero = new HeroVO();
			_itemsDic = new Dictionary();
			_items = new Array();
			_battleinfo = new BattleinfoVO();
			_skillsDic = new Dictionary();
			_skills = new Array();
			_copysDic = new Dictionary();
			_copys = new Array();
			_shenmishangdian = new ShenmishangdianVO();
			_battleherosDic = new Dictionary();
			_battleheros = new Array();
			_saodangresult = new SaodangresultVO();
			_mailsDic = new Dictionary();
			_mails = new Array();
			_extrdata = new ExtrdataVO();
			_baoshisDic = new Dictionary();
			_baoshis = new Array();
			_leitaipersionsDic = new Dictionary();
			_leitaipersions = new Array();
			_leitai = new LeitaiVO();
			_equipgrid = new EquipgridVO();
			_battlepersonsDic = new Dictionary();
			_battlepersons = new Array();
			_battleresult = new BattleresultVO();
			_chaonengli = new ChaonengliVO();
			_tasksDic = new Dictionary();
			_tasks = new Array();
			_heroimage = new HeroimageVO();
			_battlebase = new BattlebaseVO();
			_battlegunsDic = new Dictionary();
			_battleguns = new Array();
			_funbenguanming = new FunbenguanmingVO();
			_choujiang = new ChoujiangVO();
			_dailytask = new DailytaskVO();
			_walknpcsDic = new Dictionary();
			_walknpcs = new Array();
			_dengjiranksDic = new Dictionary();
			_dengjiranks = new Array();
			_zhanliranksDic = new Dictionary();
			_zhanliranks = new Array();
			_xiongbaranksDic = new Dictionary();
			_xiongbaranks = new Array();
			_tuhaoranksDic = new Dictionary();
			_tuhaoranks = new Array();
			_rankopt = new RankoptVO();
			_paihangbangpersion = new PaihangbangpersionVO();
			_chatsDic = new Dictionary();
			_chats = new Array();
			_banghuichatsDic = new Dictionary();
			_banghuichats = new Array();
			_friendsDic = new Dictionary();
			_friends = new Array();
			_jinyan = new JinyanVO();
			_tongzhisDic = new Dictionary();
			_tongzhis = new Array();
			_huodongswitchsDic = new Dictionary();
			_huodongswitchs = new Array();
			_huodongdetail = new HuodongdetailVO();
			_chengzhang = new ChengzhangVO();
			_huodong = new HuodongVO();
			_xitongkuangsDic = new Dictionary();
			_xitongkuangs = new Array();
			_xitongkuangperson = new XitongkuangpersonVO();
			_jinkuanglogsDic = new Dictionary();
			_jinkuanglogs = new Array();
			_jinkuang = new JinkuangVO();
			_battle = new BattleVO();
			_cdkey = new CdkeyVO();
			_limitbuy = new LimitbuyVO();
			_gonghui = new GonghuiVO();
			_banghuiliebiaosDic = new Dictionary();
			_banghuiliebiaos = new Array();
			_banghuixiangqing = new BanghuixiangqingVO();
			_banghuiselfdata = new BanghuiselfdataVO();
			_baomingbanghuisDic = new Dictionary();
			_baomingbanghuis = new Array();
			_banghuizhanjifensDic = new Dictionary();
			_banghuizhanjifens = new Array();
			_banghuizhandetailsDic = new Dictionary();
			_banghuizhandetails = new Array();
			_gerenzhanjisDic = new Dictionary();
			_gerenzhanjis = new Array();
			_chongzhijilusDic = new Dictionary();
			_chongzhijilus = new Array();
			_lingqujilusDic = new Dictionary();
			_lingqujilus = new Array();
			_hongbaosDic = new Dictionary();
			_hongbaos = new Array();
			_shengqingpersionsDic = new Dictionary();
			_shengqingpersions = new Array();
			_banghuipersionsDic = new Dictionary();
			_banghuipersions = new Array();
			_persondetail = new PersondetailVO();

			initflag=true;
		}
		private static var _instance:GameVOManager;
		public static function getInstance():GameVOManager
		{
			if(_instance==null) _instance=new GameVOManager();
			return _instance;
		}
		
		public var arrayVoOP_SN:Signal=new Signal(Class,Array);
		
		public function setMessage(s2cProto:DigS2CProto):void
		{
			init();
			for each(var key:String in Attrs)
			{
				var att:String="_"+key;
				var protoKey:String=key;
				var isArray:Boolean=false;
				var clsName:String;
				var needCover:Boolean=false;
				var temp:Array=key.split(".");
				var mainKey:String=temp[0];
				
				clsName="com.fish.modules.core.gameVO."+mainKey.charAt(0).toUpperCase()+mainKey.substr(1,mainKey.length-1)+"VO";
				
				if(key.indexOf(".array")!=-1)
				{
					
					att="_"+mainKey.substr(0,mainKey.length)+"s";
					protoKey=mainKey+"s";
					isArray=true;
					protoKey=mainKey+"s";
				}
				needCover=(key.indexOf(".cover")!=-1);
				
				var needProccess:Boolean=BaseVo.judgeAttrUsable(s2cProto,protoKey);
				
				if(needProccess && needCover)
				{
					if(isArray){
						this[att]=[];
						this[att+"Dic"]=new Dictionary();
					}else{
						this[att]=new (ApplicationDomain.currentDomain.getDefinition(clsName) as Class)();
					}
				}
				
				if(this[att] && needProccess )
				{
					if(!isArray){
						(this[att] as BaseVo).setMessageData(s2cProto[protoKey]);
					}else{
						var opCls:Class=ApplicationDomain.currentDomain.getDefinition(clsName) as Class;
//						var op:String=ArrayOP_Normal;
//						if(opCls==targetClass)
//						{
//							op=arrayOP;
//						}
//						operationArray(this[att],s2cProto[protoKey],op,opCls);
						operationArray(att,s2cProto[protoKey],opCls);
						/*var arry:Array=this[att];
						arry.length=0;
						for each(var ms:Message in s2cProto[protoKey])
						{
							var vo:BaseVo=new (ApplicationDomain.currentDomain.getDefinition(clsName) as Class)();
							vo.setMessageData(ms);
							arry.push(vo);
						}*/
					}
				}
			}
		}

		/**  重新启动
		 * */
		public function reset():void
		{
			if(initflag){
				for each(var key:String in Attrs)
				{
					var att:String="_"+key;
					var protoKey:String=key;
					var isArray:Boolean=false;
					var clsName:String;
					var needCover:Boolean=false;
					var temp:Array=key.split(".");
					var mainKey:String=temp[0];
					
					clsName="com.fish.modules.core.gameVO."+mainKey.charAt(0).toUpperCase()+mainKey.substr(1,mainKey.length-1)+"VO";
					
					if(key.indexOf(".array")!=-1)
					{
						att="_"+mainKey.substr(0,mainKey.length)+"s";
						protoKey=mainKey+"s";
						isArray=true;
						protoKey=mainKey+"s";
					}
					needCover=(key.indexOf(".cover")!=-1);
					
					if(isArray){
						for each(var vo:BaseVo in this[att])
						{
							vo.destory();
						}
						this[att]=null;
						this[att+"Dic"]=null;
					}else{
						(this[att] as BaseVo).destory();
						this[att]=null;
					}
				}
				arrayVoOP_SN.removeAll();
				initflag=false;
			}
			
		}
		
		public function get currentMessage():String
		{
			return S2CHanlder.instance.currentMessage;
		}
		private function operationArray(attr:String,mesArray:Array,cls:Class):void
		{
			if(mesArray==null || mesArray.length==0){
				return ;
			}
			var array:Array=this[attr];
			var dic:Dictionary=this[attr+"Dic"];
			
			var keyAttr:String=cls["KeyAttr"];
			
			var dispatchArray:Array=[];
			
			for each(var ms:Message in mesArray)
			{
				if(!BaseVo.judgeAttrUsable(ms,keyAttr))
				{
					throw new Error("数组数据主键缺失： "+keyAttr+" / "+cls);
				}
				var dicKey:*=ms[keyAttr];
				
				if( (dicKey is UInt64) || (dicKey is Int64) ){
					dicKey=(dicKey as Object).toNumber();
				}
				
				var vo:BaseVo=dic[dicKey];
				if(vo==null)
				{
					vo=new cls();
					array.push(vo);
					dic[dicKey]=vo;
				}
				vo.setMessageData(ms);
				dispatchArray.push(vo);
			}
			arrayVoOP_SN.dispatch(cls,dispatchArray);
		}
		
		public  function resetZombieArray():void{
			_zombies=[]
			_zombiesDic=new Dictionary();
		}
		
		/*private function operationArray(voArray:Array,mesArray:Array,op:String,cls:Class):void
		{
			if(mesArray.length==0) return ;
			
			var ms:Message;
			var vo:BaseVo;
			var dispatchArray:Array=[];
			
			var keyAttr:String=cls["KeyAttr"];
			
			if(op==ArrayOP_Normal){
				voArray.length=0;
				for each(ms in mesArray)
				{
					vo=new cls();
					vo.setMessageData(ms);
					voArray.push(vo);
					arrayVoOP_SN.dispatch(op,cls,voArray);
				}
			}else if(op==ArrayOP_Add){
				for each(ms in mesArray)
				{
					vo=new cls();
					vo.setMessageData(ms);
					voArray.push(vo);
					dispatchArray.push(vo);
					arrayVoOP_SN.dispatch(op,cls,dispatchArray);
				}
			}else if(op==ArrayOP_Remove || op==ArrayOP_Modify){
				
				for(var index:int=0; index<voArray.length; index++){
					vo=voArray[index];
					if(mesArray.length==0){
						break;
					}
					var equal:Boolean=true;
					for(var i:int=0; i<mesArray.length; i++)
					{
						ms=mesArray[i];
						if(!BaseVo.judgeAttrUsable(ms,keyAttr))
						{
							throw new Error("数组数据主键缺失： "+keyAttr);
						}
						
						if(ms[keyAttr] == vo[keyAttr]){
							equal=false;
						}
						
						if(equal){
							mesArray.splice(i,1);
							break;
						}
					}
					
					if(equal){
						if(op==ArrayOP_Remove){
							dispatchArray=dispatchArray.concat(voArray.splice(index,1));
							index--;
						}else
						{
							vo.setMessageData(ms);
							dispatchArray=dispatchArray.concat(vo);
						}
						
						
					}
				}
				if(dispatchArray.length!=0)
				{
					arrayVoOP_SN.dispatch(op,cls,dispatchArray);
				}
			}
		}*/
		private const Attrs:Array=["user","diginfo","zombie.array","equip.array","hero","item.array","battleinfo","skill.array","copy.array","shenmishangdian","battlehero.array.cover","saodangresult","mail.array","extrdata","baoshi.array","leitaipersion.array.cover","leitai","equipgrid","battleperson.array.cover","battleresult","chaonengli","task.array","heroimage","battlebase","battlegun.array.cover","funbenguanming","choujiang","dailytask","walknpc.array.cover","dengjirank.array.cover","zhanlirank.array.cover","xiongbarank.array.cover","tuhaorank.array.cover","rankopt","paihangbangpersion","chat.array","banghuichat.array","friend.array","jinyan","tongzhi.array.cover","huodongswitch.array.cover","huodongdetail","chengzhang","huodong","xitongkuang.array.cover","xitongkuangperson","jinkuanglog.array.cover","jinkuang","battle","cdkey","limitbuy","gonghui","banghuiliebiao.array.cover","banghuixiangqing","banghuiselfdata","baomingbanghui.array.cover","banghuizhanjifen.array.cover","banghuizhandetail.array.cover","gerenzhanji.array.cover","chongzhijilu.array.cover","lingqujilu.array.cover","hongbao.array.cover","shengqingpersion.array.cover","banghuipersion.array.cover","persondetail"];
	}
}