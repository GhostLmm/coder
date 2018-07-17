package com.mutou.tqt.S2C {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.mutou.tqt.S2C.ChatS2C;
	import com.mutou.tqt.S2C.DiginfoS2C;
	import com.mutou.tqt.S2C.BanghuizhanjifenS2C;
	import com.mutou.tqt.S2C.CopyS2C;
	import com.mutou.tqt.S2C.JinyanS2C;
	import com.mutou.tqt.S2C.FriendS2C;
	import com.mutou.tqt.S2C.ChengzhangS2C;
	import com.mutou.tqt.S2C.ChongzhijiluS2C;
	import com.mutou.tqt.S2C.ZombieS2C;
	import com.mutou.tqt.S2C.BanghuichatS2C;
	import com.mutou.tqt.S2C.XiongbarankS2C;
	import com.mutou.tqt.S2C.TuhaorankS2C;
	import com.mutou.tqt.S2C.UserS2C;
	import com.mutou.tqt.S2C.CdkeyS2C;
	import com.mutou.tqt.S2C.BattlepersonS2C;
	import com.mutou.tqt.S2C.TaskS2C;
	import com.mutou.tqt.S2C.BattlebaseS2C;
	import com.mutou.tqt.S2C.ChaonengliS2C;
	import com.mutou.tqt.S2C.BattleresultS2C;
	import com.mutou.tqt.S2C.HuodongS2C;
	import com.mutou.tqt.S2C.PersondetailS2C;
	import com.mutou.tqt.S2C.BattleheroS2C;
	import com.mutou.tqt.S2C.ShengqingpersionS2C;
	import com.mutou.tqt.S2C.DengjirankS2C;
	import com.mutou.tqt.S2C.BattleS2C;
	import com.mutou.tqt.S2C.EquipgridS2C;
	import com.mutou.tqt.S2C.HeroS2C;
	import com.mutou.tqt.S2C.HuodongswitchS2C;
	import com.mutou.tqt.S2C.BaomingbanghuiS2C;
	import com.mutou.tqt.S2C.ZhanlirankS2C;
	import com.mutou.tqt.S2C.ItemS2C;
	import com.mutou.tqt.S2C.ChoujiangS2C;
	import com.mutou.tqt.S2C.BanghuixiangqingS2C;
	import com.mutou.tqt.S2C.SkillS2C;
	import com.mutou.tqt.S2C.DailytaskS2C;
	import com.mutou.tqt.S2C.PaihangbangpersionS2C;
	import com.mutou.tqt.S2C.LeitaiS2C;
	import com.mutou.tqt.S2C.HuodongdetailS2C;
	import com.mutou.tqt.S2C.HongbaoS2C;
	import com.mutou.tqt.S2C.XitongkuangS2C;
	import com.mutou.tqt.S2C.GonghuiS2C;
	import com.mutou.tqt.S2C.GerenzhanjiS2C;
	import com.mutou.tqt.S2C.BanghuiselfdataS2C;
	import com.mutou.tqt.S2C.BattlegunS2C;
	import com.mutou.tqt.S2C.LimitbuyS2C;
	import com.mutou.tqt.S2C.LeitaipersionS2C;
	import com.mutou.tqt.S2C.RankoptS2C;
	import com.mutou.tqt.S2C.EquipS2C;
	import com.mutou.tqt.S2C.BanghuiliebiaoS2C;
	import com.mutou.tqt.S2C.JinkuangS2C;
	import com.mutou.tqt.S2C.ExtrdataS2C;
	import com.mutou.tqt.S2C.TongzhiS2C;
	import com.mutou.tqt.S2C.BaoshiS2C;
	import com.mutou.tqt.S2C.BanghuipersionS2C;
	import com.mutou.tqt.S2C.FunbenguanmingS2C;
	import com.mutou.tqt.S2C.XitongkuangpersonS2C;
	import com.mutou.tqt.S2C.HeroimageS2C;
	import com.mutou.tqt.S2C.BattleinfoS2C;
	import com.mutou.tqt.S2C.ShenmishangdianS2C;
	import com.mutou.tqt.S2C.SaodangresultS2C;
	import com.mutou.tqt.S2C.WalknpcS2C;
	import com.mutou.tqt.S2C.LingqujiluS2C;
	import com.mutou.tqt.S2C.JinkuanglogS2C;
	import com.mutou.tqt.S2C.MailS2C;
	import com.mutou.tqt.S2C.BanghuizhandetailS2C;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class DigS2CProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RCE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.DigS2CProto.rce", "rce", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var rce:String;

		/**
		 *  @private
		 */
		public static const RET_CODE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.DigS2CProto.ret_code", "retCode", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		public var retCode:int;

		/**
		 *  @private
		 */
		public static const EXTR:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.DigS2CProto.extr", "extr", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		public var extr:String;

		/**
		 *  @private
		 */
		public static const TIME_STAMP:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.DigS2CProto.time_stamp", "timeStamp", (4 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		public var timeStamp:UInt64;

		/**
		 *  @private
		 */
		public static const TIME_START:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.DigS2CProto.time_start", "timeStart", (5 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		public var timeStart:UInt64;

		/**
		 *  @private
		 */
		public static const PROTOID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.DigS2CProto.protoId", "protoId", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var protoId$field:int;

		private var hasField$0:uint = 0;

		public function clearProtoId():void {
			hasField$0 &= 0xfffffffe;
			protoId$field = new int();
		}

		public function get hasProtoId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set protoId(value:int):void {
			hasField$0 |= 0x1;
			protoId$field = value;
		}

		public function get protoId():int {
			return protoId$field;
		}

		/**
		 *  @private
		 */
		public static const USER:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.user", "user", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.UserS2C; });

		private var user$field:com.mutou.tqt.S2C.UserS2C;

		public function clearUser():void {
			user$field = null;
		}

		public function get hasUser():Boolean {
			return user$field != null;
		}

		public function set user(value:com.mutou.tqt.S2C.UserS2C):void {
			user$field = value;
		}

		public function get user():com.mutou.tqt.S2C.UserS2C {
			return user$field;
		}

		/**
		 *  @private
		 */
		public static const DIGINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.diginfo", "diginfo", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.DiginfoS2C; });

		private var diginfo$field:com.mutou.tqt.S2C.DiginfoS2C;

		public function clearDiginfo():void {
			diginfo$field = null;
		}

		public function get hasDiginfo():Boolean {
			return diginfo$field != null;
		}

		public function set diginfo(value:com.mutou.tqt.S2C.DiginfoS2C):void {
			diginfo$field = value;
		}

		public function get diginfo():com.mutou.tqt.S2C.DiginfoS2C {
			return diginfo$field;
		}

		/**
		 *  @private
		 */
		public static const ZOMBIES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.zombies", "zombies", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.ZombieS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.ZombieS2C")]
		public var zombies:Array;

		/**
		 *  @private
		 */
		public static const EQUIPS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.equips", "equips", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.EquipS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.EquipS2C")]
		public var equips:Array;

		/**
		 *  @private
		 */
		public static const HERO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.hero", "hero", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.HeroS2C; });

		private var hero$field:com.mutou.tqt.S2C.HeroS2C;

		public function clearHero():void {
			hero$field = null;
		}

		public function get hasHero():Boolean {
			return hero$field != null;
		}

		public function set hero(value:com.mutou.tqt.S2C.HeroS2C):void {
			hero$field = value;
		}

		public function get hero():com.mutou.tqt.S2C.HeroS2C {
			return hero$field;
		}

		/**
		 *  @private
		 */
		public static const ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.items", "items", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.ItemS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.ItemS2C")]
		public var items:Array;

		/**
		 *  @private
		 */
		public static const BATTLEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.battleinfo", "battleinfo", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.BattleinfoS2C; });

		private var battleinfo$field:com.mutou.tqt.S2C.BattleinfoS2C;

		public function clearBattleinfo():void {
			battleinfo$field = null;
		}

		public function get hasBattleinfo():Boolean {
			return battleinfo$field != null;
		}

		public function set battleinfo(value:com.mutou.tqt.S2C.BattleinfoS2C):void {
			battleinfo$field = value;
		}

		public function get battleinfo():com.mutou.tqt.S2C.BattleinfoS2C {
			return battleinfo$field;
		}

		/**
		 *  @private
		 */
		public static const SKILLS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.skills", "skills", (14 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.SkillS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.SkillS2C")]
		public var skills:Array;

		/**
		 *  @private
		 */
		public static const COPYS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.copys", "copys", (15 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.CopyS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.CopyS2C")]
		public var copys:Array;

		/**
		 *  @private
		 */
		public static const SHENMISHANGDIAN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.shenmishangdian", "shenmishangdian", (16 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.ShenmishangdianS2C; });

		private var shenmishangdian$field:com.mutou.tqt.S2C.ShenmishangdianS2C;

		public function clearShenmishangdian():void {
			shenmishangdian$field = null;
		}

		public function get hasShenmishangdian():Boolean {
			return shenmishangdian$field != null;
		}

		public function set shenmishangdian(value:com.mutou.tqt.S2C.ShenmishangdianS2C):void {
			shenmishangdian$field = value;
		}

		public function get shenmishangdian():com.mutou.tqt.S2C.ShenmishangdianS2C {
			return shenmishangdian$field;
		}

		/**
		 *  @private
		 */
		public static const BATTLEHEROS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.battleheros", "battleheros", (17 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.BattleheroS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.BattleheroS2C")]
		public var battleheros:Array;

		/**
		 *  @private
		 */
		public static const SAODANGRESULT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.saodangresult", "saodangresult", (18 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.SaodangresultS2C; });

		private var saodangresult$field:com.mutou.tqt.S2C.SaodangresultS2C;

		public function clearSaodangresult():void {
			saodangresult$field = null;
		}

		public function get hasSaodangresult():Boolean {
			return saodangresult$field != null;
		}

		public function set saodangresult(value:com.mutou.tqt.S2C.SaodangresultS2C):void {
			saodangresult$field = value;
		}

		public function get saodangresult():com.mutou.tqt.S2C.SaodangresultS2C {
			return saodangresult$field;
		}

		/**
		 *  @private
		 */
		public static const MAILS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.mails", "mails", (19 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.MailS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.MailS2C")]
		public var mails:Array;

		/**
		 *  @private
		 */
		public static const EXTRDATA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.extrdata", "extrdata", (20 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.ExtrdataS2C; });

		private var extrdata$field:com.mutou.tqt.S2C.ExtrdataS2C;

		public function clearExtrdata():void {
			extrdata$field = null;
		}

		public function get hasExtrdata():Boolean {
			return extrdata$field != null;
		}

		public function set extrdata(value:com.mutou.tqt.S2C.ExtrdataS2C):void {
			extrdata$field = value;
		}

		public function get extrdata():com.mutou.tqt.S2C.ExtrdataS2C {
			return extrdata$field;
		}

		/**
		 *  @private
		 */
		public static const BAOSHIS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.baoshis", "baoshis", (21 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.BaoshiS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.BaoshiS2C")]
		public var baoshis:Array;

		/**
		 *  @private
		 */
		public static const LEITAIPERSIONS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.leitaipersions", "leitaipersions", (22 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.LeitaipersionS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.LeitaipersionS2C")]
		public var leitaipersions:Array;

		/**
		 *  @private
		 */
		public static const LEITAI:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.leitai", "leitai", (23 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.LeitaiS2C; });

		private var leitai$field:com.mutou.tqt.S2C.LeitaiS2C;

		public function clearLeitai():void {
			leitai$field = null;
		}

		public function get hasLeitai():Boolean {
			return leitai$field != null;
		}

		public function set leitai(value:com.mutou.tqt.S2C.LeitaiS2C):void {
			leitai$field = value;
		}

		public function get leitai():com.mutou.tqt.S2C.LeitaiS2C {
			return leitai$field;
		}

		/**
		 *  @private
		 */
		public static const EQUIPGRID:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.equipgrid", "equipgrid", (24 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.EquipgridS2C; });

		private var equipgrid$field:com.mutou.tqt.S2C.EquipgridS2C;

		public function clearEquipgrid():void {
			equipgrid$field = null;
		}

		public function get hasEquipgrid():Boolean {
			return equipgrid$field != null;
		}

		public function set equipgrid(value:com.mutou.tqt.S2C.EquipgridS2C):void {
			equipgrid$field = value;
		}

		public function get equipgrid():com.mutou.tqt.S2C.EquipgridS2C {
			return equipgrid$field;
		}

		/**
		 *  @private
		 */
		public static const BATTLEPERSONS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.battlepersons", "battlepersons", (25 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.BattlepersonS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.BattlepersonS2C")]
		public var battlepersons:Array;

		/**
		 *  @private
		 */
		public static const BATTLERESULT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.battleresult", "battleresult", (26 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.BattleresultS2C; });

		private var battleresult$field:com.mutou.tqt.S2C.BattleresultS2C;

		public function clearBattleresult():void {
			battleresult$field = null;
		}

		public function get hasBattleresult():Boolean {
			return battleresult$field != null;
		}

		public function set battleresult(value:com.mutou.tqt.S2C.BattleresultS2C):void {
			battleresult$field = value;
		}

		public function get battleresult():com.mutou.tqt.S2C.BattleresultS2C {
			return battleresult$field;
		}

		/**
		 *  @private
		 */
		public static const CHAONENGLI:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.chaonengli", "chaonengli", (27 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.ChaonengliS2C; });

		private var chaonengli$field:com.mutou.tqt.S2C.ChaonengliS2C;

		public function clearChaonengli():void {
			chaonengli$field = null;
		}

		public function get hasChaonengli():Boolean {
			return chaonengli$field != null;
		}

		public function set chaonengli(value:com.mutou.tqt.S2C.ChaonengliS2C):void {
			chaonengli$field = value;
		}

		public function get chaonengli():com.mutou.tqt.S2C.ChaonengliS2C {
			return chaonengli$field;
		}

		/**
		 *  @private
		 */
		public static const TASKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.tasks", "tasks", (28 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.TaskS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.TaskS2C")]
		public var tasks:Array;

		/**
		 *  @private
		 */
		public static const HEROIMAGE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.heroimage", "heroimage", (29 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.HeroimageS2C; });

		private var heroimage$field:com.mutou.tqt.S2C.HeroimageS2C;

		public function clearHeroimage():void {
			heroimage$field = null;
		}

		public function get hasHeroimage():Boolean {
			return heroimage$field != null;
		}

		public function set heroimage(value:com.mutou.tqt.S2C.HeroimageS2C):void {
			heroimage$field = value;
		}

		public function get heroimage():com.mutou.tqt.S2C.HeroimageS2C {
			return heroimage$field;
		}

		/**
		 *  @private
		 */
		public static const BATTLEBASE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.battlebase", "battlebase", (30 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.BattlebaseS2C; });

		private var battlebase$field:com.mutou.tqt.S2C.BattlebaseS2C;

		public function clearBattlebase():void {
			battlebase$field = null;
		}

		public function get hasBattlebase():Boolean {
			return battlebase$field != null;
		}

		public function set battlebase(value:com.mutou.tqt.S2C.BattlebaseS2C):void {
			battlebase$field = value;
		}

		public function get battlebase():com.mutou.tqt.S2C.BattlebaseS2C {
			return battlebase$field;
		}

		/**
		 *  @private
		 */
		public static const BATTLEGUNS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.battleguns", "battleguns", (31 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.BattlegunS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.BattlegunS2C")]
		public var battleguns:Array;

		/**
		 *  @private
		 */
		public static const FUNBENGUANMING:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.funbenguanming", "funbenguanming", (32 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.FunbenguanmingS2C; });

		private var funbenguanming$field:com.mutou.tqt.S2C.FunbenguanmingS2C;

		public function clearFunbenguanming():void {
			funbenguanming$field = null;
		}

		public function get hasFunbenguanming():Boolean {
			return funbenguanming$field != null;
		}

		public function set funbenguanming(value:com.mutou.tqt.S2C.FunbenguanmingS2C):void {
			funbenguanming$field = value;
		}

		public function get funbenguanming():com.mutou.tqt.S2C.FunbenguanmingS2C {
			return funbenguanming$field;
		}

		/**
		 *  @private
		 */
		public static const CHOUJIANG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.choujiang", "choujiang", (33 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.ChoujiangS2C; });

		private var choujiang$field:com.mutou.tqt.S2C.ChoujiangS2C;

		public function clearChoujiang():void {
			choujiang$field = null;
		}

		public function get hasChoujiang():Boolean {
			return choujiang$field != null;
		}

		public function set choujiang(value:com.mutou.tqt.S2C.ChoujiangS2C):void {
			choujiang$field = value;
		}

		public function get choujiang():com.mutou.tqt.S2C.ChoujiangS2C {
			return choujiang$field;
		}

		/**
		 *  @private
		 */
		public static const DAILYTASK:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.dailytask", "dailytask", (34 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.DailytaskS2C; });

		private var dailytask$field:com.mutou.tqt.S2C.DailytaskS2C;

		public function clearDailytask():void {
			dailytask$field = null;
		}

		public function get hasDailytask():Boolean {
			return dailytask$field != null;
		}

		public function set dailytask(value:com.mutou.tqt.S2C.DailytaskS2C):void {
			dailytask$field = value;
		}

		public function get dailytask():com.mutou.tqt.S2C.DailytaskS2C {
			return dailytask$field;
		}

		/**
		 *  @private
		 */
		public static const WALKNPCS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.walknpcs", "walknpcs", (35 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.WalknpcS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.WalknpcS2C")]
		public var walknpcs:Array;

		/**
		 *  @private
		 */
		public static const DENGJIRANKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.dengjiranks", "dengjiranks", (36 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.DengjirankS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.DengjirankS2C")]
		public var dengjiranks:Array;

		/**
		 *  @private
		 */
		public static const ZHANLIRANKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.zhanliranks", "zhanliranks", (37 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.ZhanlirankS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.ZhanlirankS2C")]
		public var zhanliranks:Array;

		/**
		 *  @private
		 */
		public static const XIONGBARANKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.xiongbaranks", "xiongbaranks", (38 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.XiongbarankS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.XiongbarankS2C")]
		public var xiongbaranks:Array;

		/**
		 *  @private
		 */
		public static const TUHAORANKS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.tuhaoranks", "tuhaoranks", (39 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.TuhaorankS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.TuhaorankS2C")]
		public var tuhaoranks:Array;

		/**
		 *  @private
		 */
		public static const RANKOPT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.rankopt", "rankopt", (40 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.RankoptS2C; });

		private var rankopt$field:com.mutou.tqt.S2C.RankoptS2C;

		public function clearRankopt():void {
			rankopt$field = null;
		}

		public function get hasRankopt():Boolean {
			return rankopt$field != null;
		}

		public function set rankopt(value:com.mutou.tqt.S2C.RankoptS2C):void {
			rankopt$field = value;
		}

		public function get rankopt():com.mutou.tqt.S2C.RankoptS2C {
			return rankopt$field;
		}

		/**
		 *  @private
		 */
		public static const PAIHANGBANGPERSION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.paihangbangpersion", "paihangbangpersion", (41 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.PaihangbangpersionS2C; });

		private var paihangbangpersion$field:com.mutou.tqt.S2C.PaihangbangpersionS2C;

		public function clearPaihangbangpersion():void {
			paihangbangpersion$field = null;
		}

		public function get hasPaihangbangpersion():Boolean {
			return paihangbangpersion$field != null;
		}

		public function set paihangbangpersion(value:com.mutou.tqt.S2C.PaihangbangpersionS2C):void {
			paihangbangpersion$field = value;
		}

		public function get paihangbangpersion():com.mutou.tqt.S2C.PaihangbangpersionS2C {
			return paihangbangpersion$field;
		}

		/**
		 *  @private
		 */
		public static const CHATS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.chats", "chats", (42 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.ChatS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.ChatS2C")]
		public var chats:Array;

		/**
		 *  @private
		 */
		public static const BANGHUICHATS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.banghuichats", "banghuichats", (43 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.BanghuichatS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.BanghuichatS2C")]
		public var banghuichats:Array;

		/**
		 *  @private
		 */
		public static const FRIENDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.friends", "friends", (44 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.FriendS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.FriendS2C")]
		public var friends:Array;

		/**
		 *  @private
		 */
		public static const JINYAN:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.jinyan", "jinyan", (45 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.JinyanS2C; });

		private var jinyan$field:com.mutou.tqt.S2C.JinyanS2C;

		public function clearJinyan():void {
			jinyan$field = null;
		}

		public function get hasJinyan():Boolean {
			return jinyan$field != null;
		}

		public function set jinyan(value:com.mutou.tqt.S2C.JinyanS2C):void {
			jinyan$field = value;
		}

		public function get jinyan():com.mutou.tqt.S2C.JinyanS2C {
			return jinyan$field;
		}

		/**
		 *  @private
		 */
		public static const TONGZHIS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.tongzhis", "tongzhis", (46 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.TongzhiS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.TongzhiS2C")]
		public var tongzhis:Array;

		/**
		 *  @private
		 */
		public static const HUODONGSWITCHS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.huodongswitchs", "huodongswitchs", (47 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.HuodongswitchS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.HuodongswitchS2C")]
		public var huodongswitchs:Array;

		/**
		 *  @private
		 */
		public static const HUODONGDETAIL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.huodongdetail", "huodongdetail", (48 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.HuodongdetailS2C; });

		private var huodongdetail$field:com.mutou.tqt.S2C.HuodongdetailS2C;

		public function clearHuodongdetail():void {
			huodongdetail$field = null;
		}

		public function get hasHuodongdetail():Boolean {
			return huodongdetail$field != null;
		}

		public function set huodongdetail(value:com.mutou.tqt.S2C.HuodongdetailS2C):void {
			huodongdetail$field = value;
		}

		public function get huodongdetail():com.mutou.tqt.S2C.HuodongdetailS2C {
			return huodongdetail$field;
		}

		/**
		 *  @private
		 */
		public static const CHENGZHANG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.chengzhang", "chengzhang", (49 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.ChengzhangS2C; });

		private var chengzhang$field:com.mutou.tqt.S2C.ChengzhangS2C;

		public function clearChengzhang():void {
			chengzhang$field = null;
		}

		public function get hasChengzhang():Boolean {
			return chengzhang$field != null;
		}

		public function set chengzhang(value:com.mutou.tqt.S2C.ChengzhangS2C):void {
			chengzhang$field = value;
		}

		public function get chengzhang():com.mutou.tqt.S2C.ChengzhangS2C {
			return chengzhang$field;
		}

		/**
		 *  @private
		 */
		public static const HUODONG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.huodong", "huodong", (50 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.HuodongS2C; });

		private var huodong$field:com.mutou.tqt.S2C.HuodongS2C;

		public function clearHuodong():void {
			huodong$field = null;
		}

		public function get hasHuodong():Boolean {
			return huodong$field != null;
		}

		public function set huodong(value:com.mutou.tqt.S2C.HuodongS2C):void {
			huodong$field = value;
		}

		public function get huodong():com.mutou.tqt.S2C.HuodongS2C {
			return huodong$field;
		}

		/**
		 *  @private
		 */
		public static const XITONGKUANGS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.xitongkuangs", "xitongkuangs", (51 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.XitongkuangS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.XitongkuangS2C")]
		public var xitongkuangs:Array;

		/**
		 *  @private
		 */
		public static const XITONGKUANGPERSON:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.xitongkuangperson", "xitongkuangperson", (52 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.XitongkuangpersonS2C; });

		private var xitongkuangperson$field:com.mutou.tqt.S2C.XitongkuangpersonS2C;

		public function clearXitongkuangperson():void {
			xitongkuangperson$field = null;
		}

		public function get hasXitongkuangperson():Boolean {
			return xitongkuangperson$field != null;
		}

		public function set xitongkuangperson(value:com.mutou.tqt.S2C.XitongkuangpersonS2C):void {
			xitongkuangperson$field = value;
		}

		public function get xitongkuangperson():com.mutou.tqt.S2C.XitongkuangpersonS2C {
			return xitongkuangperson$field;
		}

		/**
		 *  @private
		 */
		public static const JINKUANGLOGS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.jinkuanglogs", "jinkuanglogs", (53 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.JinkuanglogS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.JinkuanglogS2C")]
		public var jinkuanglogs:Array;

		/**
		 *  @private
		 */
		public static const JINKUANG:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.jinkuang", "jinkuang", (54 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.JinkuangS2C; });

		private var jinkuang$field:com.mutou.tqt.S2C.JinkuangS2C;

		public function clearJinkuang():void {
			jinkuang$field = null;
		}

		public function get hasJinkuang():Boolean {
			return jinkuang$field != null;
		}

		public function set jinkuang(value:com.mutou.tqt.S2C.JinkuangS2C):void {
			jinkuang$field = value;
		}

		public function get jinkuang():com.mutou.tqt.S2C.JinkuangS2C {
			return jinkuang$field;
		}

		/**
		 *  @private
		 */
		public static const BATTLE:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.battle", "battle", (55 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.BattleS2C; });

		private var battle$field:com.mutou.tqt.S2C.BattleS2C;

		public function clearBattle():void {
			battle$field = null;
		}

		public function get hasBattle():Boolean {
			return battle$field != null;
		}

		public function set battle(value:com.mutou.tqt.S2C.BattleS2C):void {
			battle$field = value;
		}

		public function get battle():com.mutou.tqt.S2C.BattleS2C {
			return battle$field;
		}

		/**
		 *  @private
		 */
		public static const CDKEY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.cdkey", "cdkey", (56 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.CdkeyS2C; });

		private var cdkey$field:com.mutou.tqt.S2C.CdkeyS2C;

		public function clearCdkey():void {
			cdkey$field = null;
		}

		public function get hasCdkey():Boolean {
			return cdkey$field != null;
		}

		public function set cdkey(value:com.mutou.tqt.S2C.CdkeyS2C):void {
			cdkey$field = value;
		}

		public function get cdkey():com.mutou.tqt.S2C.CdkeyS2C {
			return cdkey$field;
		}

		/**
		 *  @private
		 */
		public static const LIMITBUY:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.limitbuy", "limitbuy", (57 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.LimitbuyS2C; });

		private var limitbuy$field:com.mutou.tqt.S2C.LimitbuyS2C;

		public function clearLimitbuy():void {
			limitbuy$field = null;
		}

		public function get hasLimitbuy():Boolean {
			return limitbuy$field != null;
		}

		public function set limitbuy(value:com.mutou.tqt.S2C.LimitbuyS2C):void {
			limitbuy$field = value;
		}

		public function get limitbuy():com.mutou.tqt.S2C.LimitbuyS2C {
			return limitbuy$field;
		}

		/**
		 *  @private
		 */
		public static const GONGHUI:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.gonghui", "gonghui", (58 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.GonghuiS2C; });

		private var gonghui$field:com.mutou.tqt.S2C.GonghuiS2C;

		public function clearGonghui():void {
			gonghui$field = null;
		}

		public function get hasGonghui():Boolean {
			return gonghui$field != null;
		}

		public function set gonghui(value:com.mutou.tqt.S2C.GonghuiS2C):void {
			gonghui$field = value;
		}

		public function get gonghui():com.mutou.tqt.S2C.GonghuiS2C {
			return gonghui$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUILIEBIAOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.banghuiliebiaos", "banghuiliebiaos", (59 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.BanghuiliebiaoS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.BanghuiliebiaoS2C")]
		public var banghuiliebiaos:Array;

		/**
		 *  @private
		 */
		public static const BANGHUIXIANGQING:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.banghuixiangqing", "banghuixiangqing", (60 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.BanghuixiangqingS2C; });

		private var banghuixiangqing$field:com.mutou.tqt.S2C.BanghuixiangqingS2C;

		public function clearBanghuixiangqing():void {
			banghuixiangqing$field = null;
		}

		public function get hasBanghuixiangqing():Boolean {
			return banghuixiangqing$field != null;
		}

		public function set banghuixiangqing(value:com.mutou.tqt.S2C.BanghuixiangqingS2C):void {
			banghuixiangqing$field = value;
		}

		public function get banghuixiangqing():com.mutou.tqt.S2C.BanghuixiangqingS2C {
			return banghuixiangqing$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUISELFDATA:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.banghuiselfdata", "banghuiselfdata", (61 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.BanghuiselfdataS2C; });

		private var banghuiselfdata$field:com.mutou.tqt.S2C.BanghuiselfdataS2C;

		public function clearBanghuiselfdata():void {
			banghuiselfdata$field = null;
		}

		public function get hasBanghuiselfdata():Boolean {
			return banghuiselfdata$field != null;
		}

		public function set banghuiselfdata(value:com.mutou.tqt.S2C.BanghuiselfdataS2C):void {
			banghuiselfdata$field = value;
		}

		public function get banghuiselfdata():com.mutou.tqt.S2C.BanghuiselfdataS2C {
			return banghuiselfdata$field;
		}

		/**
		 *  @private
		 */
		public static const BAOMINGBANGHUIS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.baomingbanghuis", "baomingbanghuis", (62 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.BaomingbanghuiS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.BaomingbanghuiS2C")]
		public var baomingbanghuis:Array;

		/**
		 *  @private
		 */
		public static const BANGHUIZHANJIFENS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.banghuizhanjifens", "banghuizhanjifens", (63 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.BanghuizhanjifenS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.BanghuizhanjifenS2C")]
		public var banghuizhanjifens:Array;

		/**
		 *  @private
		 */
		public static const BANGHUIZHANDETAILS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.banghuizhandetails", "banghuizhandetails", (64 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.BanghuizhandetailS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.BanghuizhandetailS2C")]
		public var banghuizhandetails:Array;

		/**
		 *  @private
		 */
		public static const GERENZHANJIS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.gerenzhanjis", "gerenzhanjis", (65 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.GerenzhanjiS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.GerenzhanjiS2C")]
		public var gerenzhanjis:Array;

		/**
		 *  @private
		 */
		public static const CHONGZHIJILUS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.chongzhijilus", "chongzhijilus", (66 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.ChongzhijiluS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.ChongzhijiluS2C")]
		public var chongzhijilus:Array;

		/**
		 *  @private
		 */
		public static const LINGQUJILUS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.lingqujilus", "lingqujilus", (67 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.LingqujiluS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.LingqujiluS2C")]
		public var lingqujilus:Array;

		/**
		 *  @private
		 */
		public static const HONGBAOS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.hongbaos", "hongbaos", (68 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.HongbaoS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.HongbaoS2C")]
		public var hongbaos:Array;

		/**
		 *  @private
		 */
		public static const SHENGQINGPERSIONS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.shengqingpersions", "shengqingpersions", (69 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.ShengqingpersionS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.ShengqingpersionS2C")]
		public var shengqingpersions:Array;

		/**
		 *  @private
		 */
		public static const BANGHUIPERSIONS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.banghuipersions", "banghuipersions", (70 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.BanghuipersionS2C; });

		[ArrayElementType("com.mutou.tqt.S2C.BanghuipersionS2C")]
		public var banghuipersions:Array;

		/**
		 *  @private
		 */
		public static const PERSONDETAIL:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("com.mutou.tqt.S2C.DigS2CProto.persondetail", "persondetail", (71 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.mutou.tqt.S2C.PersondetailS2C; });

		private var persondetail$field:com.mutou.tqt.S2C.PersondetailS2C;

		public function clearPersondetail():void {
			persondetail$field = null;
		}

		public function get hasPersondetail():Boolean {
			return persondetail$field != null;
		}

		public function set persondetail(value:com.mutou.tqt.S2C.PersondetailS2C):void {
			persondetail$field = value;
		}

		public function get persondetail():com.mutou.tqt.S2C.PersondetailS2C {
			return persondetail$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {

			return;
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.rce);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.retCode);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
			com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, this.extr);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 4);
			com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, this.timeStamp);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 5);
			com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, this.timeStart);
			if (hasProtoId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, protoId$field);
			}
			if (hasUser) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, user$field);
			}
			if (hasDiginfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, diginfo$field);
			}
			for (var zombies$index:uint = 0; zombies$index < this.zombies.length; ++zombies$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.zombies[zombies$index]);
			}
			for (var equips$index:uint = 0; equips$index < this.equips.length; ++equips$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.equips[equips$index]);
			}
			if (hasHero) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, hero$field);
			}
			for (var items$index:uint = 0; items$index < this.items.length; ++items$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.items[items$index]);
			}
			if (hasBattleinfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, battleinfo$field);
			}
			for (var skills$index:uint = 0; skills$index < this.skills.length; ++skills$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.skills[skills$index]);
			}
			for (var copys$index:uint = 0; copys$index < this.copys.length; ++copys$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.copys[copys$index]);
			}
			if (hasShenmishangdian) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, shenmishangdian$field);
			}
			for (var battleheros$index:uint = 0; battleheros$index < this.battleheros.length; ++battleheros$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.battleheros[battleheros$index]);
			}
			if (hasSaodangresult) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 18);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, saodangresult$field);
			}
			for (var mails$index:uint = 0; mails$index < this.mails.length; ++mails$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 19);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.mails[mails$index]);
			}
			if (hasExtrdata) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, extrdata$field);
			}
			for (var baoshis$index:uint = 0; baoshis$index < this.baoshis.length; ++baoshis$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.baoshis[baoshis$index]);
			}
			for (var leitaipersions$index:uint = 0; leitaipersions$index < this.leitaipersions.length; ++leitaipersions$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.leitaipersions[leitaipersions$index]);
			}
			if (hasLeitai) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 23);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, leitai$field);
			}
			if (hasEquipgrid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 24);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, equipgrid$field);
			}
			for (var battlepersons$index:uint = 0; battlepersons$index < this.battlepersons.length; ++battlepersons$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 25);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.battlepersons[battlepersons$index]);
			}
			if (hasBattleresult) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 26);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, battleresult$field);
			}
			if (hasChaonengli) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 27);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, chaonengli$field);
			}
			for (var tasks$index:uint = 0; tasks$index < this.tasks.length; ++tasks$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 28);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.tasks[tasks$index]);
			}
			if (hasHeroimage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 29);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, heroimage$field);
			}
			if (hasBattlebase) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 30);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, battlebase$field);
			}
			for (var battleguns$index:uint = 0; battleguns$index < this.battleguns.length; ++battleguns$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 31);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.battleguns[battleguns$index]);
			}
			if (hasFunbenguanming) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 32);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, funbenguanming$field);
			}
			if (hasChoujiang) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 33);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, choujiang$field);
			}
			if (hasDailytask) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 34);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, dailytask$field);
			}
			for (var walknpcs$index:uint = 0; walknpcs$index < this.walknpcs.length; ++walknpcs$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 35);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.walknpcs[walknpcs$index]);
			}
			for (var dengjiranks$index:uint = 0; dengjiranks$index < this.dengjiranks.length; ++dengjiranks$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 36);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.dengjiranks[dengjiranks$index]);
			}
			for (var zhanliranks$index:uint = 0; zhanliranks$index < this.zhanliranks.length; ++zhanliranks$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 37);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.zhanliranks[zhanliranks$index]);
			}
			for (var xiongbaranks$index:uint = 0; xiongbaranks$index < this.xiongbaranks.length; ++xiongbaranks$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 38);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.xiongbaranks[xiongbaranks$index]);
			}
			for (var tuhaoranks$index:uint = 0; tuhaoranks$index < this.tuhaoranks.length; ++tuhaoranks$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 39);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.tuhaoranks[tuhaoranks$index]);
			}
			if (hasRankopt) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 40);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, rankopt$field);
			}
			if (hasPaihangbangpersion) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 41);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, paihangbangpersion$field);
			}
			for (var chats$index:uint = 0; chats$index < this.chats.length; ++chats$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 42);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.chats[chats$index]);
			}
			for (var banghuichats$index:uint = 0; banghuichats$index < this.banghuichats.length; ++banghuichats$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 43);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.banghuichats[banghuichats$index]);
			}
			for (var friends$index:uint = 0; friends$index < this.friends.length; ++friends$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 44);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.friends[friends$index]);
			}
			if (hasJinyan) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 45);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, jinyan$field);
			}
			for (var tongzhis$index:uint = 0; tongzhis$index < this.tongzhis.length; ++tongzhis$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 46);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.tongzhis[tongzhis$index]);
			}
			for (var huodongswitchs$index:uint = 0; huodongswitchs$index < this.huodongswitchs.length; ++huodongswitchs$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 47);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.huodongswitchs[huodongswitchs$index]);
			}
			if (hasHuodongdetail) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 48);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, huodongdetail$field);
			}
			if (hasChengzhang) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 49);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, chengzhang$field);
			}
			if (hasHuodong) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 50);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, huodong$field);
			}
			for (var xitongkuangs$index:uint = 0; xitongkuangs$index < this.xitongkuangs.length; ++xitongkuangs$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 51);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.xitongkuangs[xitongkuangs$index]);
			}
			if (hasXitongkuangperson) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 52);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, xitongkuangperson$field);
			}
			for (var jinkuanglogs$index:uint = 0; jinkuanglogs$index < this.jinkuanglogs.length; ++jinkuanglogs$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 53);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.jinkuanglogs[jinkuanglogs$index]);
			}
			if (hasJinkuang) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 54);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, jinkuang$field);
			}
			if (hasBattle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 55);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, battle$field);
			}
			if (hasCdkey) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 56);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, cdkey$field);
			}
			if (hasLimitbuy) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 57);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, limitbuy$field);
			}
			if (hasGonghui) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 58);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, gonghui$field);
			}
			for (var banghuiliebiaos$index:uint = 0; banghuiliebiaos$index < this.banghuiliebiaos.length; ++banghuiliebiaos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 59);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.banghuiliebiaos[banghuiliebiaos$index]);
			}
			if (hasBanghuixiangqing) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 60);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, banghuixiangqing$field);
			}
			if (hasBanghuiselfdata) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 61);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, banghuiselfdata$field);
			}
			for (var baomingbanghuis$index:uint = 0; baomingbanghuis$index < this.baomingbanghuis.length; ++baomingbanghuis$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 62);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.baomingbanghuis[baomingbanghuis$index]);
			}
			for (var banghuizhanjifens$index:uint = 0; banghuizhanjifens$index < this.banghuizhanjifens.length; ++banghuizhanjifens$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 63);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.banghuizhanjifens[banghuizhanjifens$index]);
			}
			for (var banghuizhandetails$index:uint = 0; banghuizhandetails$index < this.banghuizhandetails.length; ++banghuizhandetails$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 64);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.banghuizhandetails[banghuizhandetails$index]);
			}
			for (var gerenzhanjis$index:uint = 0; gerenzhanjis$index < this.gerenzhanjis.length; ++gerenzhanjis$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 65);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.gerenzhanjis[gerenzhanjis$index]);
			}
			for (var chongzhijilus$index:uint = 0; chongzhijilus$index < this.chongzhijilus.length; ++chongzhijilus$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 66);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.chongzhijilus[chongzhijilus$index]);
			}
			for (var lingqujilus$index:uint = 0; lingqujilus$index < this.lingqujilus.length; ++lingqujilus$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 67);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.lingqujilus[lingqujilus$index]);
			}
			for (var hongbaos$index:uint = 0; hongbaos$index < this.hongbaos.length; ++hongbaos$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 68);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.hongbaos[hongbaos$index]);
			}
			for (var shengqingpersions$index:uint = 0; shengqingpersions$index < this.shengqingpersions.length; ++shengqingpersions$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 69);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.shengqingpersions[shengqingpersions$index]);
			}
			for (var banghuipersions$index:uint = 0; banghuipersions$index < this.banghuipersions.length; ++banghuipersions$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 70);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.banghuipersions[banghuipersions$index]);
			}
			if (hasPersondetail) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 71);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, persondetail$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var rce$count:uint = 0;
			var ret_code$count:uint = 0;
			var extr$count:uint = 0;
			var time_stamp$count:uint = 0;
			var time_start$count:uint = 0;
			var protoId$count:uint = 0;
			var user$count:uint = 0;
			var diginfo$count:uint = 0;
			var hero$count:uint = 0;
			var battleinfo$count:uint = 0;
			var shenmishangdian$count:uint = 0;
			var saodangresult$count:uint = 0;
			var extrdata$count:uint = 0;
			var leitai$count:uint = 0;
			var equipgrid$count:uint = 0;
			var battleresult$count:uint = 0;
			var chaonengli$count:uint = 0;
			var heroimage$count:uint = 0;
			var battlebase$count:uint = 0;
			var funbenguanming$count:uint = 0;
			var choujiang$count:uint = 0;
			var dailytask$count:uint = 0;
			var rankopt$count:uint = 0;
			var paihangbangpersion$count:uint = 0;
			var jinyan$count:uint = 0;
			var huodongdetail$count:uint = 0;
			var chengzhang$count:uint = 0;
			var huodong$count:uint = 0;
			var xitongkuangperson$count:uint = 0;
			var jinkuang$count:uint = 0;
			var battle$count:uint = 0;
			var cdkey$count:uint = 0;
			var limitbuy$count:uint = 0;
			var gonghui$count:uint = 0;
			var banghuixiangqing$count:uint = 0;
			var banghuiselfdata$count:uint = 0;
			var persondetail$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (rce$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.rce cannot be set twice.');
					}
					++rce$count;
					this.rce = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (ret_code$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.retCode cannot be set twice.');
					}
					++ret_code$count;
					this.retCode = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (extr$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.extr cannot be set twice.');
					}
					++extr$count;
					this.extr = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (time_stamp$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.timeStamp cannot be set twice.');
					}
					++time_stamp$count;
					this.timeStamp = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 5:
					if (time_start$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.timeStart cannot be set twice.');
					}
					++time_start$count;
					this.timeStart = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 6:
					if (protoId$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.protoId cannot be set twice.');
					}
					++protoId$count;
					this.protoId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (user$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.user cannot be set twice.');
					}
					++user$count;
					this.user = new com.mutou.tqt.S2C.UserS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.user);
					break;
				case 8:
					if (diginfo$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.diginfo cannot be set twice.');
					}
					++diginfo$count;
					this.diginfo = new com.mutou.tqt.S2C.DiginfoS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.diginfo);
					break;
				case 9:
					if(this.zombies==null)
					{
						this.zombies=[];
					}
					this.zombies.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.ZombieS2C()));
					break;
				case 10:
					if(this.equips==null)
					{
						this.equips=[];
					}
					this.equips.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.EquipS2C()));
					break;
				case 11:
					if (hero$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.hero cannot be set twice.');
					}
					++hero$count;
					this.hero = new com.mutou.tqt.S2C.HeroS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.hero);
					break;
				case 12:
					if(this.items==null)
					{
						this.items=[];
					}
					this.items.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.ItemS2C()));
					break;
				case 13:
					if (battleinfo$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.battleinfo cannot be set twice.');
					}
					++battleinfo$count;
					this.battleinfo = new com.mutou.tqt.S2C.BattleinfoS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.battleinfo);
					break;
				case 14:
					if(this.skills==null)
					{
						this.skills=[];
					}
					this.skills.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.SkillS2C()));
					break;
				case 15:
					if(this.copys==null)
					{
						this.copys=[];
					}
					this.copys.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.CopyS2C()));
					break;
				case 16:
					if (shenmishangdian$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.shenmishangdian cannot be set twice.');
					}
					++shenmishangdian$count;
					this.shenmishangdian = new com.mutou.tqt.S2C.ShenmishangdianS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.shenmishangdian);
					break;
				case 17:
					if(this.battleheros==null)
					{
						this.battleheros=[];
					}
					this.battleheros.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.BattleheroS2C()));
					break;
				case 18:
					if (saodangresult$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.saodangresult cannot be set twice.');
					}
					++saodangresult$count;
					this.saodangresult = new com.mutou.tqt.S2C.SaodangresultS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.saodangresult);
					break;
				case 19:
					if(this.mails==null)
					{
						this.mails=[];
					}
					this.mails.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.MailS2C()));
					break;
				case 20:
					if (extrdata$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.extrdata cannot be set twice.');
					}
					++extrdata$count;
					this.extrdata = new com.mutou.tqt.S2C.ExtrdataS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.extrdata);
					break;
				case 21:
					if(this.baoshis==null)
					{
						this.baoshis=[];
					}
					this.baoshis.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.BaoshiS2C()));
					break;
				case 22:
					if(this.leitaipersions==null)
					{
						this.leitaipersions=[];
					}
					this.leitaipersions.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.LeitaipersionS2C()));
					break;
				case 23:
					if (leitai$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.leitai cannot be set twice.');
					}
					++leitai$count;
					this.leitai = new com.mutou.tqt.S2C.LeitaiS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.leitai);
					break;
				case 24:
					if (equipgrid$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.equipgrid cannot be set twice.');
					}
					++equipgrid$count;
					this.equipgrid = new com.mutou.tqt.S2C.EquipgridS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.equipgrid);
					break;
				case 25:
					if(this.battlepersons==null)
					{
						this.battlepersons=[];
					}
					this.battlepersons.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.BattlepersonS2C()));
					break;
				case 26:
					if (battleresult$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.battleresult cannot be set twice.');
					}
					++battleresult$count;
					this.battleresult = new com.mutou.tqt.S2C.BattleresultS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.battleresult);
					break;
				case 27:
					if (chaonengli$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.chaonengli cannot be set twice.');
					}
					++chaonengli$count;
					this.chaonengli = new com.mutou.tqt.S2C.ChaonengliS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.chaonengli);
					break;
				case 28:
					if(this.tasks==null)
					{
						this.tasks=[];
					}
					this.tasks.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.TaskS2C()));
					break;
				case 29:
					if (heroimage$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.heroimage cannot be set twice.');
					}
					++heroimage$count;
					this.heroimage = new com.mutou.tqt.S2C.HeroimageS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.heroimage);
					break;
				case 30:
					if (battlebase$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.battlebase cannot be set twice.');
					}
					++battlebase$count;
					this.battlebase = new com.mutou.tqt.S2C.BattlebaseS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.battlebase);
					break;
				case 31:
					if(this.battleguns==null)
					{
						this.battleguns=[];
					}
					this.battleguns.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.BattlegunS2C()));
					break;
				case 32:
					if (funbenguanming$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.funbenguanming cannot be set twice.');
					}
					++funbenguanming$count;
					this.funbenguanming = new com.mutou.tqt.S2C.FunbenguanmingS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.funbenguanming);
					break;
				case 33:
					if (choujiang$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.choujiang cannot be set twice.');
					}
					++choujiang$count;
					this.choujiang = new com.mutou.tqt.S2C.ChoujiangS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.choujiang);
					break;
				case 34:
					if (dailytask$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.dailytask cannot be set twice.');
					}
					++dailytask$count;
					this.dailytask = new com.mutou.tqt.S2C.DailytaskS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.dailytask);
					break;
				case 35:
					if(this.walknpcs==null)
					{
						this.walknpcs=[];
					}
					this.walknpcs.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.WalknpcS2C()));
					break;
				case 36:
					if(this.dengjiranks==null)
					{
						this.dengjiranks=[];
					}
					this.dengjiranks.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.DengjirankS2C()));
					break;
				case 37:
					if(this.zhanliranks==null)
					{
						this.zhanliranks=[];
					}
					this.zhanliranks.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.ZhanlirankS2C()));
					break;
				case 38:
					if(this.xiongbaranks==null)
					{
						this.xiongbaranks=[];
					}
					this.xiongbaranks.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.XiongbarankS2C()));
					break;
				case 39:
					if(this.tuhaoranks==null)
					{
						this.tuhaoranks=[];
					}
					this.tuhaoranks.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.TuhaorankS2C()));
					break;
				case 40:
					if (rankopt$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.rankopt cannot be set twice.');
					}
					++rankopt$count;
					this.rankopt = new com.mutou.tqt.S2C.RankoptS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.rankopt);
					break;
				case 41:
					if (paihangbangpersion$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.paihangbangpersion cannot be set twice.');
					}
					++paihangbangpersion$count;
					this.paihangbangpersion = new com.mutou.tqt.S2C.PaihangbangpersionS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.paihangbangpersion);
					break;
				case 42:
					if(this.chats==null)
					{
						this.chats=[];
					}
					this.chats.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.ChatS2C()));
					break;
				case 43:
					if(this.banghuichats==null)
					{
						this.banghuichats=[];
					}
					this.banghuichats.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.BanghuichatS2C()));
					break;
				case 44:
					if(this.friends==null)
					{
						this.friends=[];
					}
					this.friends.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.FriendS2C()));
					break;
				case 45:
					if (jinyan$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.jinyan cannot be set twice.');
					}
					++jinyan$count;
					this.jinyan = new com.mutou.tqt.S2C.JinyanS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.jinyan);
					break;
				case 46:
					if(this.tongzhis==null)
					{
						this.tongzhis=[];
					}
					this.tongzhis.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.TongzhiS2C()));
					break;
				case 47:
					if(this.huodongswitchs==null)
					{
						this.huodongswitchs=[];
					}
					this.huodongswitchs.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.HuodongswitchS2C()));
					break;
				case 48:
					if (huodongdetail$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.huodongdetail cannot be set twice.');
					}
					++huodongdetail$count;
					this.huodongdetail = new com.mutou.tqt.S2C.HuodongdetailS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.huodongdetail);
					break;
				case 49:
					if (chengzhang$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.chengzhang cannot be set twice.');
					}
					++chengzhang$count;
					this.chengzhang = new com.mutou.tqt.S2C.ChengzhangS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.chengzhang);
					break;
				case 50:
					if (huodong$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.huodong cannot be set twice.');
					}
					++huodong$count;
					this.huodong = new com.mutou.tqt.S2C.HuodongS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.huodong);
					break;
				case 51:
					if(this.xitongkuangs==null)
					{
						this.xitongkuangs=[];
					}
					this.xitongkuangs.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.XitongkuangS2C()));
					break;
				case 52:
					if (xitongkuangperson$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.xitongkuangperson cannot be set twice.');
					}
					++xitongkuangperson$count;
					this.xitongkuangperson = new com.mutou.tqt.S2C.XitongkuangpersonS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.xitongkuangperson);
					break;
				case 53:
					if(this.jinkuanglogs==null)
					{
						this.jinkuanglogs=[];
					}
					this.jinkuanglogs.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.JinkuanglogS2C()));
					break;
				case 54:
					if (jinkuang$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.jinkuang cannot be set twice.');
					}
					++jinkuang$count;
					this.jinkuang = new com.mutou.tqt.S2C.JinkuangS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.jinkuang);
					break;
				case 55:
					if (battle$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.battle cannot be set twice.');
					}
					++battle$count;
					this.battle = new com.mutou.tqt.S2C.BattleS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.battle);
					break;
				case 56:
					if (cdkey$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.cdkey cannot be set twice.');
					}
					++cdkey$count;
					this.cdkey = new com.mutou.tqt.S2C.CdkeyS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.cdkey);
					break;
				case 57:
					if (limitbuy$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.limitbuy cannot be set twice.');
					}
					++limitbuy$count;
					this.limitbuy = new com.mutou.tqt.S2C.LimitbuyS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.limitbuy);
					break;
				case 58:
					if (gonghui$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.gonghui cannot be set twice.');
					}
					++gonghui$count;
					this.gonghui = new com.mutou.tqt.S2C.GonghuiS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.gonghui);
					break;
				case 59:
					if(this.banghuiliebiaos==null)
					{
						this.banghuiliebiaos=[];
					}
					this.banghuiliebiaos.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.BanghuiliebiaoS2C()));
					break;
				case 60:
					if (banghuixiangqing$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.banghuixiangqing cannot be set twice.');
					}
					++banghuixiangqing$count;
					this.banghuixiangqing = new com.mutou.tqt.S2C.BanghuixiangqingS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.banghuixiangqing);
					break;
				case 61:
					if (banghuiselfdata$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.banghuiselfdata cannot be set twice.');
					}
					++banghuiselfdata$count;
					this.banghuiselfdata = new com.mutou.tqt.S2C.BanghuiselfdataS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.banghuiselfdata);
					break;
				case 62:
					if(this.baomingbanghuis==null)
					{
						this.baomingbanghuis=[];
					}
					this.baomingbanghuis.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.BaomingbanghuiS2C()));
					break;
				case 63:
					if(this.banghuizhanjifens==null)
					{
						this.banghuizhanjifens=[];
					}
					this.banghuizhanjifens.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.BanghuizhanjifenS2C()));
					break;
				case 64:
					if(this.banghuizhandetails==null)
					{
						this.banghuizhandetails=[];
					}
					this.banghuizhandetails.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.BanghuizhandetailS2C()));
					break;
				case 65:
					if(this.gerenzhanjis==null)
					{
						this.gerenzhanjis=[];
					}
					this.gerenzhanjis.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.GerenzhanjiS2C()));
					break;
				case 66:
					if(this.chongzhijilus==null)
					{
						this.chongzhijilus=[];
					}
					this.chongzhijilus.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.ChongzhijiluS2C()));
					break;
				case 67:
					if(this.lingqujilus==null)
					{
						this.lingqujilus=[];
					}
					this.lingqujilus.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.LingqujiluS2C()));
					break;
				case 68:
					if(this.hongbaos==null)
					{
						this.hongbaos=[];
					}
					this.hongbaos.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.HongbaoS2C()));
					break;
				case 69:
					if(this.shengqingpersions==null)
					{
						this.shengqingpersions=[];
					}
					this.shengqingpersions.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.ShengqingpersionS2C()));
					break;
				case 70:
					if(this.banghuipersions==null)
					{
						this.banghuipersions=[];
					}
					this.banghuipersions.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.mutou.tqt.S2C.BanghuipersionS2C()));
					break;
				case 71:
					if (persondetail$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigS2CProto.persondetail cannot be set twice.');
					}
					++persondetail$count;
					this.persondetail = new com.mutou.tqt.S2C.PersondetailS2C();
					com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, this.persondetail);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
