package com.mutou.tqt {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.mutou.tqt.BanghuiInfoC2S;
	import com.mutou.tqt.MailInfoC2S;
	import com.mutou.tqt.BanghuiTirenC2S;
	import com.mutou.tqt.BanghuiChatC2S;
	import com.mutou.tqt.ItemC2S;
	import com.mutou.tqt.BanghuiJianshe;
	import com.mutou.tqt.ActiveC2S;
	import com.mutou.tqt.XinshouYinDaoC2S;
	import com.mutou.tqt.BuyInfoC2S;
	import com.mutou.tqt.RongyuC2S;
	import com.mutou.tqt.MyTestC2S;
	import com.mutou.tqt.DigInfoC2S;
	import com.mutou.tqt.BanghuiShenqingC2S;
	import com.mutou.tqt.HonorListC2S;
	import com.mutou.tqt.BagC2S;
	import com.mutou.tqt.SkillInfoC2S;
	import com.mutou.tqt.LeitaiC2S;
	import com.mutou.tqt.BattleC2S;
	import com.mutou.tqt.FubenC2S;
	import com.mutou.tqt.JinKuangInfoC2S;
	import com.mutou.tqt.LingquJihua;
	import com.mutou.tqt.HeroInfoC2S;
	import com.mutou.tqt.FriendC2S;
	import com.mutou.tqt.ChaonengInfoC2S;
	import com.mutou.tqt.ServerNoticeC2S;
	import com.mutou.tqt.BanghuiBuy;
	import com.mutou.tqt.ChatC2S;
	import com.mutou.tqt.OtherInfoC2S;
	import com.mutou.tqt.EquipInfoC2S;
	import com.mutou.tqt.YunYingC2S;
	import com.mutou.tqt.TaskInfoC2S;
	import com.mutou.tqt.BossC2S;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class DigC2SProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PROTOID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.DigC2SProto.protoId", "protoId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		public var protoId:int;

		/**
		 *  @private
		 */
		public static const REQ:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.DigC2SProto.req", "req", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var req:String;

		/**
		 *  @private
		 */
		public static const AUTHKEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.DigC2SProto.authkey", "authkey", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var authkey:String;

		/**
		 *  @private
		 */
		public static const USERID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.DigC2SProto.userId", "userId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		public var userId:int;

		/**
		 *  @private
		 */
		public static const DELAY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.DigC2SProto.delay", "delay", (28 << 3) | com.netease.protobuf.WireType.VARINT);

		private var delay$field:int;

		private var hasField$0:uint = 0;

		public function clearDelay():void {
			hasField$0 &= 0xfffffffe;
			delay$field = new int();
		}

		public function get hasDelay():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set delay(value:int):void {
			hasField$0 |= 0x1;
			delay$field = value;
		}

		public function get delay():int {
			return delay$field;
		}

		/**
		 *  @private
		 */
		public static const ACCOUNTID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.DigC2SProto.accountId", "accountId", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var accountId$field:String;

		public function clearAccountId():void {
			accountId$field = null;
		}

		public function get hasAccountId():Boolean {
			return accountId$field != null;
		}

		public function set accountId(value:String):void {
			accountId$field = value;
		}

		public function get accountId():String {
			return accountId$field;
		}

		/**
		 *  @private
		 */
		public static const YINDAO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.yinDao", "yinDao", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.XinshouYinDaoC2S; });

		private var yinDao$field:com.mutou.tqt.XinshouYinDaoC2S;

		public function clearYinDao():void {
			yinDao$field = null;
		}

		public function get hasYinDao():Boolean {
			return yinDao$field != null;
		}

		public function set yinDao(value:com.mutou.tqt.XinshouYinDaoC2S):void {
			yinDao$field = value;
		}

		public function get yinDao():com.mutou.tqt.XinshouYinDaoC2S {
			return yinDao$field;
		}

		/**
		 *  @private
		 */
		public static const DIGINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.digInfo", "digInfo", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.DigInfoC2S; });

		private var digInfo$field:com.mutou.tqt.DigInfoC2S;

		public function clearDigInfo():void {
			digInfo$field = null;
		}

		public function get hasDigInfo():Boolean {
			return digInfo$field != null;
		}

		public function set digInfo(value:com.mutou.tqt.DigInfoC2S):void {
			digInfo$field = value;
		}

		public function get digInfo():com.mutou.tqt.DigInfoC2S {
			return digInfo$field;
		}

		/**
		 *  @private
		 */
		public static const BATTLE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.battle", "battle", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.BattleC2S; });

		private var battle$field:com.mutou.tqt.BattleC2S;

		public function clearBattle():void {
			battle$field = null;
		}

		public function get hasBattle():Boolean {
			return battle$field != null;
		}

		public function set battle(value:com.mutou.tqt.BattleC2S):void {
			battle$field = value;
		}

		public function get battle():com.mutou.tqt.BattleC2S {
			return battle$field;
		}

		/**
		 *  @private
		 */
		public static const HEROINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.heroInfo", "heroInfo", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.HeroInfoC2S; });

		private var heroInfo$field:com.mutou.tqt.HeroInfoC2S;

		public function clearHeroInfo():void {
			heroInfo$field = null;
		}

		public function get hasHeroInfo():Boolean {
			return heroInfo$field != null;
		}

		public function set heroInfo(value:com.mutou.tqt.HeroInfoC2S):void {
			heroInfo$field = value;
		}

		public function get heroInfo():com.mutou.tqt.HeroInfoC2S {
			return heroInfo$field;
		}

		/**
		 *  @private
		 */
		public static const EQUIPINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.equipInfo", "equipInfo", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.EquipInfoC2S; });

		private var equipInfo$field:com.mutou.tqt.EquipInfoC2S;

		public function clearEquipInfo():void {
			equipInfo$field = null;
		}

		public function get hasEquipInfo():Boolean {
			return equipInfo$field != null;
		}

		public function set equipInfo(value:com.mutou.tqt.EquipInfoC2S):void {
			equipInfo$field = value;
		}

		public function get equipInfo():com.mutou.tqt.EquipInfoC2S {
			return equipInfo$field;
		}

		/**
		 *  @private
		 */
		public static const SKILLINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.skillInfo", "skillInfo", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.SkillInfoC2S; });

		private var skillInfo$field:com.mutou.tqt.SkillInfoC2S;

		public function clearSkillInfo():void {
			skillInfo$field = null;
		}

		public function get hasSkillInfo():Boolean {
			return skillInfo$field != null;
		}

		public function set skillInfo(value:com.mutou.tqt.SkillInfoC2S):void {
			skillInfo$field = value;
		}

		public function get skillInfo():com.mutou.tqt.SkillInfoC2S {
			return skillInfo$field;
		}

		/**
		 *  @private
		 */
		public static const BUY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.buy", "buy", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.BuyInfoC2S; });

		private var buy$field:com.mutou.tqt.BuyInfoC2S;

		public function clearBuy():void {
			buy$field = null;
		}

		public function get hasBuy():Boolean {
			return buy$field != null;
		}

		public function set buy(value:com.mutou.tqt.BuyInfoC2S):void {
			buy$field = value;
		}

		public function get buy():com.mutou.tqt.BuyInfoC2S {
			return buy$field;
		}

		/**
		 *  @private
		 */
		public static const ACTIVE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.active", "active", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.ActiveC2S; });

		private var active$field:com.mutou.tqt.ActiveC2S;

		public function clearActive():void {
			active$field = null;
		}

		public function get hasActive():Boolean {
			return active$field != null;
		}

		public function set active(value:com.mutou.tqt.ActiveC2S):void {
			active$field = value;
		}

		public function get active():com.mutou.tqt.ActiveC2S {
			return active$field;
		}

		/**
		 *  @private
		 */
		public static const ITEM:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.item", "item", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.ItemC2S; });

		private var item$field:com.mutou.tqt.ItemC2S;

		public function clearItem():void {
			item$field = null;
		}

		public function get hasItem():Boolean {
			return item$field != null;
		}

		public function set item(value:com.mutou.tqt.ItemC2S):void {
			item$field = value;
		}

		public function get item():com.mutou.tqt.ItemC2S {
			return item$field;
		}

		/**
		 *  @private
		 */
		public static const BOSS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.boss", "boss", (15 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.BossC2S; });

		private var boss$field:com.mutou.tqt.BossC2S;

		public function clearBoss():void {
			boss$field = null;
		}

		public function get hasBoss():Boolean {
			return boss$field != null;
		}

		public function set boss(value:com.mutou.tqt.BossC2S):void {
			boss$field = value;
		}

		public function get boss():com.mutou.tqt.BossC2S {
			return boss$field;
		}

		/**
		 *  @private
		 */
		public static const MAIL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.mail", "mail", (16 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.MailInfoC2S; });

		private var mail$field:com.mutou.tqt.MailInfoC2S;

		public function clearMail():void {
			mail$field = null;
		}

		public function get hasMail():Boolean {
			return mail$field != null;
		}

		public function set mail(value:com.mutou.tqt.MailInfoC2S):void {
			mail$field = value;
		}

		public function get mail():com.mutou.tqt.MailInfoC2S {
			return mail$field;
		}

		/**
		 *  @private
		 */
		public static const CHAT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.chat", "chat", (17 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.ChatC2S; });

		private var chat$field:com.mutou.tqt.ChatC2S;

		public function clearChat():void {
			chat$field = null;
		}

		public function get hasChat():Boolean {
			return chat$field != null;
		}

		public function set chat(value:com.mutou.tqt.ChatC2S):void {
			chat$field = value;
		}

		public function get chat():com.mutou.tqt.ChatC2S {
			return chat$field;
		}

		/**
		 *  @private
		 */
		public static const TASK:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.task", "task", (18 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.TaskInfoC2S; });

		private var task$field:com.mutou.tqt.TaskInfoC2S;

		public function clearTask():void {
			task$field = null;
		}

		public function get hasTask():Boolean {
			return task$field != null;
		}

		public function set task(value:com.mutou.tqt.TaskInfoC2S):void {
			task$field = value;
		}

		public function get task():com.mutou.tqt.TaskInfoC2S {
			return task$field;
		}

		/**
		 *  @private
		 */
		public static const FUBEN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.fuben", "fuben", (19 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.FubenC2S; });

		private var fuben$field:com.mutou.tqt.FubenC2S;

		public function clearFuben():void {
			fuben$field = null;
		}

		public function get hasFuben():Boolean {
			return fuben$field != null;
		}

		public function set fuben(value:com.mutou.tqt.FubenC2S):void {
			fuben$field = value;
		}

		public function get fuben():com.mutou.tqt.FubenC2S {
			return fuben$field;
		}

		/**
		 *  @private
		 */
		public static const LEITAI:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.leitai", "leitai", (20 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.LeitaiC2S; });

		private var leitai$field:com.mutou.tqt.LeitaiC2S;

		public function clearLeitai():void {
			leitai$field = null;
		}

		public function get hasLeitai():Boolean {
			return leitai$field != null;
		}

		public function set leitai(value:com.mutou.tqt.LeitaiC2S):void {
			leitai$field = value;
		}

		public function get leitai():com.mutou.tqt.LeitaiC2S {
			return leitai$field;
		}

		/**
		 *  @private
		 */
		public static const YUNYING:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.yunying", "yunying", (22 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.YunYingC2S; });

		private var yunying$field:com.mutou.tqt.YunYingC2S;

		public function clearYunying():void {
			yunying$field = null;
		}

		public function get hasYunying():Boolean {
			return yunying$field != null;
		}

		public function set yunying(value:com.mutou.tqt.YunYingC2S):void {
			yunying$field = value;
		}

		public function get yunying():com.mutou.tqt.YunYingC2S {
			return yunying$field;
		}

		/**
		 *  @private
		 */
		public static const FRIEND:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.friend", "friend", (23 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.FriendC2S; });

		private var friend$field:com.mutou.tqt.FriendC2S;

		public function clearFriend():void {
			friend$field = null;
		}

		public function get hasFriend():Boolean {
			return friend$field != null;
		}

		public function set friend(value:com.mutou.tqt.FriendC2S):void {
			friend$field = value;
		}

		public function get friend():com.mutou.tqt.FriendC2S {
			return friend$field;
		}

		/**
		 *  @private
		 */
		public static const HORNORLIST:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.hornorList", "hornorList", (24 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.HonorListC2S; });

		private var hornorList$field:com.mutou.tqt.HonorListC2S;

		public function clearHornorList():void {
			hornorList$field = null;
		}

		public function get hasHornorList():Boolean {
			return hornorList$field != null;
		}

		public function set hornorList(value:com.mutou.tqt.HonorListC2S):void {
			hornorList$field = value;
		}

		public function get hornorList():com.mutou.tqt.HonorListC2S {
			return hornorList$field;
		}

		/**
		 *  @private
		 */
		public static const JINKUANG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.jinkuang", "jinkuang", (25 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.JinKuangInfoC2S; });

		private var jinkuang$field:com.mutou.tqt.JinKuangInfoC2S;

		public function clearJinkuang():void {
			jinkuang$field = null;
		}

		public function get hasJinkuang():Boolean {
			return jinkuang$field != null;
		}

		public function set jinkuang(value:com.mutou.tqt.JinKuangInfoC2S):void {
			jinkuang$field = value;
		}

		public function get jinkuang():com.mutou.tqt.JinKuangInfoC2S {
			return jinkuang$field;
		}

		/**
		 *  @private
		 */
		public static const BAG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.bag", "bag", (26 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.BagC2S; });

		private var bag$field:com.mutou.tqt.BagC2S;

		public function clearBag():void {
			bag$field = null;
		}

		public function get hasBag():Boolean {
			return bag$field != null;
		}

		public function set bag(value:com.mutou.tqt.BagC2S):void {
			bag$field = value;
		}

		public function get bag():com.mutou.tqt.BagC2S {
			return bag$field;
		}

		/**
		 *  @private
		 */
		public static const CHAONENGINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.chaonengInfo", "chaonengInfo", (27 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.ChaonengInfoC2S; });

		private var chaonengInfo$field:com.mutou.tqt.ChaonengInfoC2S;

		public function clearChaonengInfo():void {
			chaonengInfo$field = null;
		}

		public function get hasChaonengInfo():Boolean {
			return chaonengInfo$field != null;
		}

		public function set chaonengInfo(value:com.mutou.tqt.ChaonengInfoC2S):void {
			chaonengInfo$field = value;
		}

		public function get chaonengInfo():com.mutou.tqt.ChaonengInfoC2S {
			return chaonengInfo$field;
		}

		/**
		 *  @private
		 */
		public static const BATTLEBATCH:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.battleBatch", "battleBatch", (29 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.BattleC2S; });

		[ArrayElementType("com.mutou.tqt.BattleC2S")]
		public var battleBatch:Array = [];

		/**
		 *  @private
		 */
		public static const SERVERNOTICE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.serverNotice", "serverNotice", (30 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.ServerNoticeC2S; });

		private var serverNotice$field:com.mutou.tqt.ServerNoticeC2S;

		public function clearServerNotice():void {
			serverNotice$field = null;
		}

		public function get hasServerNotice():Boolean {
			return serverNotice$field != null;
		}

		public function set serverNotice(value:com.mutou.tqt.ServerNoticeC2S):void {
			serverNotice$field = value;
		}

		public function get serverNotice():com.mutou.tqt.ServerNoticeC2S {
			return serverNotice$field;
		}

		/**
		 *  @private
		 */
		public static const HUODONGVERSION:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.DigC2SProto.huodongVersion", "huodongVersion", (31 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var huodongVersion$field:String;

		public function clearHuodongVersion():void {
			huodongVersion$field = null;
		}

		public function get hasHuodongVersion():Boolean {
			return huodongVersion$field != null;
		}

		public function set huodongVersion(value:String):void {
			huodongVersion$field = value;
		}

		public function get huodongVersion():String {
			return huodongVersion$field;
		}

		/**
		 *  @private
		 */
		public static const LINGQU:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.lingqu", "lingqu", (32 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.LingquJihua; });

		private var lingqu$field:com.mutou.tqt.LingquJihua;

		public function clearLingqu():void {
			lingqu$field = null;
		}

		public function get hasLingqu():Boolean {
			return lingqu$field != null;
		}

		public function set lingqu(value:com.mutou.tqt.LingquJihua):void {
			lingqu$field = value;
		}

		public function get lingqu():com.mutou.tqt.LingquJihua {
			return lingqu$field;
		}

		/**
		 *  @private
		 */
		public static const RONGYU:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.rongyu", "rongyu", (33 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.RongyuC2S; });

		private var rongyu$field:com.mutou.tqt.RongyuC2S;

		public function clearRongyu():void {
			rongyu$field = null;
		}

		public function get hasRongyu():Boolean {
			return rongyu$field != null;
		}

		public function set rongyu(value:com.mutou.tqt.RongyuC2S):void {
			rongyu$field = value;
		}

		public function get rongyu():com.mutou.tqt.RongyuC2S {
			return rongyu$field;
		}

		/**
		 *  @private
		 */
		public static const OHTER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.ohter", "ohter", (34 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.OtherInfoC2S; });

		private var ohter$field:com.mutou.tqt.OtherInfoC2S;

		public function clearOhter():void {
			ohter$field = null;
		}

		public function get hasOhter():Boolean {
			return ohter$field != null;
		}

		public function set ohter(value:com.mutou.tqt.OtherInfoC2S):void {
			ohter$field = value;
		}

		public function get ohter():com.mutou.tqt.OtherInfoC2S {
			return ohter$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUIINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.banghuiInfo", "banghuiInfo", (35 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.BanghuiInfoC2S; });

		private var banghuiInfo$field:com.mutou.tqt.BanghuiInfoC2S;

		public function clearBanghuiInfo():void {
			banghuiInfo$field = null;
		}

		public function get hasBanghuiInfo():Boolean {
			return banghuiInfo$field != null;
		}

		public function set banghuiInfo(value:com.mutou.tqt.BanghuiInfoC2S):void {
			banghuiInfo$field = value;
		}

		public function get banghuiInfo():com.mutou.tqt.BanghuiInfoC2S {
			return banghuiInfo$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUISHENQING:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.banghuiShenqing", "banghuiShenqing", (36 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.BanghuiShenqingC2S; });

		private var banghuiShenqing$field:com.mutou.tqt.BanghuiShenqingC2S;

		public function clearBanghuiShenqing():void {
			banghuiShenqing$field = null;
		}

		public function get hasBanghuiShenqing():Boolean {
			return banghuiShenqing$field != null;
		}

		public function set banghuiShenqing(value:com.mutou.tqt.BanghuiShenqingC2S):void {
			banghuiShenqing$field = value;
		}

		public function get banghuiShenqing():com.mutou.tqt.BanghuiShenqingC2S {
			return banghuiShenqing$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUITIREN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.banghuiTiren", "banghuiTiren", (37 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.BanghuiTirenC2S; });

		private var banghuiTiren$field:com.mutou.tqt.BanghuiTirenC2S;

		public function clearBanghuiTiren():void {
			banghuiTiren$field = null;
		}

		public function get hasBanghuiTiren():Boolean {
			return banghuiTiren$field != null;
		}

		public function set banghuiTiren(value:com.mutou.tqt.BanghuiTirenC2S):void {
			banghuiTiren$field = value;
		}

		public function get banghuiTiren():com.mutou.tqt.BanghuiTirenC2S {
			return banghuiTiren$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUIBUY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.banghuiBuy", "banghuiBuy", (38 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.BanghuiBuy; });

		private var banghuiBuy$field:com.mutou.tqt.BanghuiBuy;

		public function clearBanghuiBuy():void {
			banghuiBuy$field = null;
		}

		public function get hasBanghuiBuy():Boolean {
			return banghuiBuy$field != null;
		}

		public function set banghuiBuy(value:com.mutou.tqt.BanghuiBuy):void {
			banghuiBuy$field = value;
		}

		public function get banghuiBuy():com.mutou.tqt.BanghuiBuy {
			return banghuiBuy$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUIJIANSHE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.banghuiJianshe", "banghuiJianshe", (39 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.BanghuiJianshe; });

		private var banghuiJianshe$field:com.mutou.tqt.BanghuiJianshe;

		public function clearBanghuiJianshe():void {
			banghuiJianshe$field = null;
		}

		public function get hasBanghuiJianshe():Boolean {
			return banghuiJianshe$field != null;
		}

		public function set banghuiJianshe(value:com.mutou.tqt.BanghuiJianshe):void {
			banghuiJianshe$field = value;
		}

		public function get banghuiJianshe():com.mutou.tqt.BanghuiJianshe {
			return banghuiJianshe$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUICHAT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.banghuiChat", "banghuiChat", (40 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.BanghuiChatC2S; });

		private var banghuiChat$field:com.mutou.tqt.BanghuiChatC2S;

		public function clearBanghuiChat():void {
			banghuiChat$field = null;
		}

		public function get hasBanghuiChat():Boolean {
			return banghuiChat$field != null;
		}

		public function set banghuiChat(value:com.mutou.tqt.BanghuiChatC2S):void {
			banghuiChat$field = value;
		}

		public function get banghuiChat():com.mutou.tqt.BanghuiChatC2S {
			return banghuiChat$field;
		}

		/**
		 *  @private
		 */
		public static const MYTEST:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.DigC2SProto.mytest", "mytest", (100 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.MyTestC2S; });

		private var mytest$field:com.mutou.tqt.MyTestC2S;

		public function clearMytest():void {
			mytest$field = null;
		}

		public function get hasMytest():Boolean {
			return mytest$field != null;
		}

		public function set mytest(value:com.mutou.tqt.MyTestC2S):void {
			mytest$field = value;
		}

		public function get mytest():com.mutou.tqt.MyTestC2S {
			return mytest$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.protoId);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.req);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.authkey);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.userId);
			if (hasDelay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 28);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, delay$field);
			}
			if (hasAccountId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, accountId$field);
			}
			if (hasYinDao) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, yinDao$field);
			}
			if (hasDigInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, digInfo$field);
			}
			if (hasBattle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, battle$field);
			}
			if (hasHeroInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, heroInfo$field);
			}
			if (hasEquipInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, equipInfo$field);
			}
			if (hasSkillInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, skillInfo$field);
			}
			if (hasBuy) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, buy$field);
			}
			if (hasActive) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, active$field);
			}
			if (hasItem) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, item$field);
			}
			if (hasBoss) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, boss$field);
			}
			if (hasMail) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mail$field);
			}
			if (hasChat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, chat$field);
			}
			if (hasTask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 18);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, task$field);
			}
			if (hasFuben) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 19);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, fuben$field);
			}
			if (hasLeitai) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, leitai$field);
			}
			if (hasYunying) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, yunying$field);
			}
			if (hasFriend) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 23);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, friend$field);
			}
			if (hasHornorList) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 24);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, hornorList$field);
			}
			if (hasJinkuang) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 25);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, jinkuang$field);
			}
			if (hasBag) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 26);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, bag$field);
			}
			if (hasChaonengInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 27);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, chaonengInfo$field);
			}
			for (var battleBatch$index:uint = 0; battleBatch$index < this.battleBatch.length; ++battleBatch$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 29);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.battleBatch[battleBatch$index]);
			}
			if (hasServerNotice) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 30);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, serverNotice$field);
			}
			if (hasHuodongVersion) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 31);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, huodongVersion$field);
			}
			if (hasLingqu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 32);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, lingqu$field);
			}
			if (hasRongyu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 33);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, rongyu$field);
			}
			if (hasOhter) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 34);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, ohter$field);
			}
			if (hasBanghuiInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 35);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, banghuiInfo$field);
			}
			if (hasBanghuiShenqing) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 36);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, banghuiShenqing$field);
			}
			if (hasBanghuiTiren) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 37);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, banghuiTiren$field);
			}
			if (hasBanghuiBuy) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 38);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, banghuiBuy$field);
			}
			if (hasBanghuiJianshe) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 39);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, banghuiJianshe$field);
			}
			if (hasBanghuiChat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 40);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, banghuiChat$field);
			}
			if (hasMytest) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 100);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, mytest$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var protoId$count:uint = 0;
			var req$count:uint = 0;
			var authkey$count:uint = 0;
			var userId$count:uint = 0;
			var delay$count:uint = 0;
			var accountId$count:uint = 0;
			var yinDao$count:uint = 0;
			var digInfo$count:uint = 0;
			var battle$count:uint = 0;
			var heroInfo$count:uint = 0;
			var equipInfo$count:uint = 0;
			var skillInfo$count:uint = 0;
			var buy$count:uint = 0;
			var active$count:uint = 0;
			var item$count:uint = 0;
			var boss$count:uint = 0;
			var mail$count:uint = 0;
			var chat$count:uint = 0;
			var task$count:uint = 0;
			var fuben$count:uint = 0;
			var leitai$count:uint = 0;
			var yunying$count:uint = 0;
			var friend$count:uint = 0;
			var hornorList$count:uint = 0;
			var jinkuang$count:uint = 0;
			var bag$count:uint = 0;
			var chaonengInfo$count:uint = 0;
			var serverNotice$count:uint = 0;
			var huodongVersion$count:uint = 0;
			var lingqu$count:uint = 0;
			var rongyu$count:uint = 0;
			var ohter$count:uint = 0;
			var banghuiInfo$count:uint = 0;
			var banghuiShenqing$count:uint = 0;
			var banghuiTiren$count:uint = 0;
			var banghuiBuy$count:uint = 0;
			var banghuiJianshe$count:uint = 0;
			var banghuiChat$count:uint = 0;
			var mytest$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (protoId$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.protoId cannot be set twice.');
					}
					++protoId$count;
					this.protoId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (req$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.req cannot be set twice.');
					}
					++req$count;
					this.req = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (authkey$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.authkey cannot be set twice.');
					}
					++authkey$count;
					this.authkey = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (userId$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.userId cannot be set twice.');
					}
					++userId$count;
					this.userId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 28:
					if (delay$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.delay cannot be set twice.');
					}
					++delay$count;
					this.delay = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (accountId$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.accountId cannot be set twice.');
					}
					++accountId$count;
					this.accountId = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (yinDao$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.yinDao cannot be set twice.');
					}
					++yinDao$count;
					this.yinDao = new com.mutou.tqt.XinshouYinDaoC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.yinDao);
					break;
				case 7:
					if (digInfo$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.digInfo cannot be set twice.');
					}
					++digInfo$count;
					this.digInfo = new com.mutou.tqt.DigInfoC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.digInfo);
					break;
				case 8:
					if (battle$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.battle cannot be set twice.');
					}
					++battle$count;
					this.battle = new com.mutou.tqt.BattleC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.battle);
					break;
				case 9:
					if (heroInfo$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.heroInfo cannot be set twice.');
					}
					++heroInfo$count;
					this.heroInfo = new com.mutou.tqt.HeroInfoC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.heroInfo);
					break;
				case 10:
					if (equipInfo$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.equipInfo cannot be set twice.');
					}
					++equipInfo$count;
					this.equipInfo = new com.mutou.tqt.EquipInfoC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.equipInfo);
					break;
				case 11:
					if (skillInfo$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.skillInfo cannot be set twice.');
					}
					++skillInfo$count;
					this.skillInfo = new com.mutou.tqt.SkillInfoC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.skillInfo);
					break;
				case 12:
					if (buy$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.buy cannot be set twice.');
					}
					++buy$count;
					this.buy = new com.mutou.tqt.BuyInfoC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.buy);
					break;
				case 13:
					if (active$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.active cannot be set twice.');
					}
					++active$count;
					this.active = new com.mutou.tqt.ActiveC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.active);
					break;
				case 14:
					if (item$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.item cannot be set twice.');
					}
					++item$count;
					this.item = new com.mutou.tqt.ItemC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.item);
					break;
				case 15:
					if (boss$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.boss cannot be set twice.');
					}
					++boss$count;
					this.boss = new com.mutou.tqt.BossC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.boss);
					break;
				case 16:
					if (mail$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.mail cannot be set twice.');
					}
					++mail$count;
					this.mail = new com.mutou.tqt.MailInfoC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mail);
					break;
				case 17:
					if (chat$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.chat cannot be set twice.');
					}
					++chat$count;
					this.chat = new com.mutou.tqt.ChatC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.chat);
					break;
				case 18:
					if (task$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.task cannot be set twice.');
					}
					++task$count;
					this.task = new com.mutou.tqt.TaskInfoC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.task);
					break;
				case 19:
					if (fuben$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.fuben cannot be set twice.');
					}
					++fuben$count;
					this.fuben = new com.mutou.tqt.FubenC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.fuben);
					break;
				case 20:
					if (leitai$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.leitai cannot be set twice.');
					}
					++leitai$count;
					this.leitai = new com.mutou.tqt.LeitaiC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.leitai);
					break;
				case 22:
					if (yunying$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.yunying cannot be set twice.');
					}
					++yunying$count;
					this.yunying = new com.mutou.tqt.YunYingC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.yunying);
					break;
				case 23:
					if (friend$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.friend cannot be set twice.');
					}
					++friend$count;
					this.friend = new com.mutou.tqt.FriendC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.friend);
					break;
				case 24:
					if (hornorList$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.hornorList cannot be set twice.');
					}
					++hornorList$count;
					this.hornorList = new com.mutou.tqt.HonorListC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.hornorList);
					break;
				case 25:
					if (jinkuang$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.jinkuang cannot be set twice.');
					}
					++jinkuang$count;
					this.jinkuang = new com.mutou.tqt.JinKuangInfoC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.jinkuang);
					break;
				case 26:
					if (bag$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.bag cannot be set twice.');
					}
					++bag$count;
					this.bag = new com.mutou.tqt.BagC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.bag);
					break;
				case 27:
					if (chaonengInfo$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.chaonengInfo cannot be set twice.');
					}
					++chaonengInfo$count;
					this.chaonengInfo = new com.mutou.tqt.ChaonengInfoC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.chaonengInfo);
					break;
				case 29:
					this.battleBatch.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.BattleC2S()));
					break;
				case 30:
					if (serverNotice$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.serverNotice cannot be set twice.');
					}
					++serverNotice$count;
					this.serverNotice = new com.mutou.tqt.ServerNoticeC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.serverNotice);
					break;
				case 31:
					if (huodongVersion$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.huodongVersion cannot be set twice.');
					}
					++huodongVersion$count;
					this.huodongVersion = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 32:
					if (lingqu$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.lingqu cannot be set twice.');
					}
					++lingqu$count;
					this.lingqu = new com.mutou.tqt.LingquJihua();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.lingqu);
					break;
				case 33:
					if (rongyu$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.rongyu cannot be set twice.');
					}
					++rongyu$count;
					this.rongyu = new com.mutou.tqt.RongyuC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.rongyu);
					break;
				case 34:
					if (ohter$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.ohter cannot be set twice.');
					}
					++ohter$count;
					this.ohter = new com.mutou.tqt.OtherInfoC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.ohter);
					break;
				case 35:
					if (banghuiInfo$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.banghuiInfo cannot be set twice.');
					}
					++banghuiInfo$count;
					this.banghuiInfo = new com.mutou.tqt.BanghuiInfoC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.banghuiInfo);
					break;
				case 36:
					if (banghuiShenqing$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.banghuiShenqing cannot be set twice.');
					}
					++banghuiShenqing$count;
					this.banghuiShenqing = new com.mutou.tqt.BanghuiShenqingC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.banghuiShenqing);
					break;
				case 37:
					if (banghuiTiren$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.banghuiTiren cannot be set twice.');
					}
					++banghuiTiren$count;
					this.banghuiTiren = new com.mutou.tqt.BanghuiTirenC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.banghuiTiren);
					break;
				case 38:
					if (banghuiBuy$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.banghuiBuy cannot be set twice.');
					}
					++banghuiBuy$count;
					this.banghuiBuy = new com.mutou.tqt.BanghuiBuy();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.banghuiBuy);
					break;
				case 39:
					if (banghuiJianshe$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.banghuiJianshe cannot be set twice.');
					}
					++banghuiJianshe$count;
					this.banghuiJianshe = new com.mutou.tqt.BanghuiJianshe();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.banghuiJianshe);
					break;
				case 40:
					if (banghuiChat$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.banghuiChat cannot be set twice.');
					}
					++banghuiChat$count;
					this.banghuiChat = new com.mutou.tqt.BanghuiChatC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.banghuiChat);
					break;
				case 100:
					if (mytest$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigC2SProto.mytest cannot be set twice.');
					}
					++mytest$count;
					this.mytest = new com.mutou.tqt.MyTestC2S();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.mytest);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
