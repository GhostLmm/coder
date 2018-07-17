package com.mutou.tqt.S2C {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class ExtrdataS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const COPY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.copy", "copy", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var copy$field:int;

		private var hasField$0:uint = 0;

		public function clearCopy():void {
			hasField$0 &= 0xfffffffe;
			copy$field = new int();
		}

		public function get hasCopy():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set copy(value:int):void {
			hasField$0 |= 0x1;
			copy$field = value;
		}

		public function get copy():int {
			return copy$field;
		}

		/**
		 *  @private
		 */
		public static const RND_FRIEND:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.ExtrdataS2C.rnd_friend", "rndFriend", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var rnd_friend$field:String;

		public function clearRndFriend():void {
			rnd_friend$field = null;
		}

		public function get hasRndFriend():Boolean {
			return rnd_friend$field != null;
		}

		public function set rndFriend(value:String):void {
			rnd_friend$field = value;
		}

		public function get rndFriend():String {
			return rnd_friend$field;
		}

		/**
		 *  @private
		 */
		public static const SAODANG_FRESH_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.ExtrdataS2C.saodang_fresh_time", "saodangFreshTime", (3 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var saodang_fresh_time$field:UInt64;

		public function clearSaodangFreshTime():void {
			saodang_fresh_time$field = null;
		}

		public function get hasSaodangFreshTime():Boolean {
			return saodang_fresh_time$field != null;
		}

		public function set saodangFreshTime(value:UInt64):void {
			saodang_fresh_time$field = value;
		}

		public function get saodangFreshTime():UInt64 {
			return saodang_fresh_time$field;
		}

		/**
		 *  @private
		 */
		public static const HAS_NEW_CHAT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.has_new_chat", "hasNewChat", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var has_new_chat$field:int;

		public function clearHasNewChat():void {
			hasField$0 &= 0xfffffffd;
			has_new_chat$field = new int();
		}

		public function get hasHasNewChat():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set hasNewChat(value:int):void {
			hasField$0 |= 0x2;
			has_new_chat$field = value;
		}

		public function get hasNewChat():int {
			return has_new_chat$field;
		}

		/**
		 *  @private
		 */
		public static const HAS_REWARD_SUIPIAN:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.has_reward_suipian", "hasRewardSuipian", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var has_reward_suipian$field:int;

		public function clearHasRewardSuipian():void {
			hasField$0 &= 0xfffffffb;
			has_reward_suipian$field = new int();
		}

		public function get hasHasRewardSuipian():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set hasRewardSuipian(value:int):void {
			hasField$0 |= 0x4;
			has_reward_suipian$field = value;
		}

		public function get hasRewardSuipian():int {
			return has_reward_suipian$field;
		}

		/**
		 *  @private
		 */
		public static const JINGKUANG_FIGHT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.jingkuang_fight", "jingkuangFight", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var jingkuang_fight$field:int;

		public function clearJingkuangFight():void {
			hasField$0 &= 0xfffffff7;
			jingkuang_fight$field = new int();
		}

		public function get hasJingkuangFight():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set jingkuangFight(value:int):void {
			hasField$0 |= 0x8;
			jingkuang_fight$field = value;
		}

		public function get jingkuangFight():int {
			return jingkuang_fight$field;
		}

		/**
		 *  @private
		 */
		public static const XITONGKUANG_MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.xitongkuang_money", "xitongkuangMoney", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var xitongkuang_money$field:int;

		public function clearXitongkuangMoney():void {
			hasField$0 &= 0xffffffef;
			xitongkuang_money$field = new int();
		}

		public function get hasXitongkuangMoney():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set xitongkuangMoney(value:int):void {
			hasField$0 |= 0x10;
			xitongkuang_money$field = value;
		}

		public function get xitongkuangMoney():int {
			return xitongkuang_money$field;
		}

		/**
		 *  @private
		 */
		public static const JINGKUANG_LOG_NULL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.jingkuang_log_null", "jingkuangLogNull", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var jingkuang_log_null$field:int;

		public function clearJingkuangLogNull():void {
			hasField$0 &= 0xffffffdf;
			jingkuang_log_null$field = new int();
		}

		public function get hasJingkuangLogNull():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set jingkuangLogNull(value:int):void {
			hasField$0 |= 0x20;
			jingkuang_log_null$field = value;
		}

		public function get jingkuangLogNull():int {
			return jingkuang_log_null$field;
		}

		/**
		 *  @private
		 */
		public static const HUODONG_NULL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.huodong_null", "huodongNull", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var huodong_null$field:int;

		public function clearHuodongNull():void {
			hasField$0 &= 0xffffffbf;
			huodong_null$field = new int();
		}

		public function get hasHuodongNull():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set huodongNull(value:int):void {
			hasField$0 |= 0x40;
			huodong_null$field = value;
		}

		public function get huodongNull():int {
			return huodong_null$field;
		}

		/**
		 *  @private
		 */
		public static const MAIL_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.mail_count", "mailCount", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mail_count$field:int;

		public function clearMailCount():void {
			hasField$0 &= 0xffffff7f;
			mail_count$field = new int();
		}

		public function get hasMailCount():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set mailCount(value:int):void {
			hasField$0 |= 0x80;
			mail_count$field = value;
		}

		public function get mailCount():int {
			return mail_count$field;
		}

		/**
		 *  @private
		 */
		public static const GUIDE_UPGRADE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.guide_upgrade", "guideUpgrade", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guide_upgrade$field:int;

		public function clearGuideUpgrade():void {
			hasField$0 &= 0xfffffeff;
			guide_upgrade$field = new int();
		}

		public function get hasGuideUpgrade():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set guideUpgrade(value:int):void {
			hasField$0 |= 0x100;
			guide_upgrade$field = value;
		}

		public function get guideUpgrade():int {
			return guide_upgrade$field;
		}

		/**
		 *  @private
		 */
		public static const XITONGKUANG_NULL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.xitongkuang_null", "xitongkuangNull", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var xitongkuang_null$field:int;

		public function clearXitongkuangNull():void {
			hasField$0 &= 0xfffffdff;
			xitongkuang_null$field = new int();
		}

		public function get hasXitongkuangNull():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set xitongkuangNull(value:int):void {
			hasField$0 |= 0x200;
			xitongkuang_null$field = value;
		}

		public function get xitongkuangNull():int {
			return xitongkuang_null$field;
		}

		/**
		 *  @private
		 */
		public static const BAOMINGBANGHUI_NULL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.baomingbanghui_null", "baomingbanghuiNull", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var baomingbanghui_null$field:int;

		public function clearBaomingbanghuiNull():void {
			hasField$0 &= 0xfffffbff;
			baomingbanghui_null$field = new int();
		}

		public function get hasBaomingbanghuiNull():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set baomingbanghuiNull(value:int):void {
			hasField$0 |= 0x400;
			baomingbanghui_null$field = value;
		}

		public function get baomingbanghuiNull():int {
			return baomingbanghui_null$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUIZHANJIFEN_NULL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.banghuizhanjifen_null", "banghuizhanjifenNull", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var banghuizhanjifen_null$field:int;

		public function clearBanghuizhanjifenNull():void {
			hasField$0 &= 0xfffff7ff;
			banghuizhanjifen_null$field = new int();
		}

		public function get hasBanghuizhanjifenNull():Boolean {
			return (hasField$0 & 0x800) != 0;
		}

		public function set banghuizhanjifenNull(value:int):void {
			hasField$0 |= 0x800;
			banghuizhanjifen_null$field = value;
		}

		public function get banghuizhanjifenNull():int {
			return banghuizhanjifen_null$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUIZHANDETAIL_NULL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.banghuizhandetail_null", "banghuizhandetailNull", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var banghuizhandetail_null$field:int;

		public function clearBanghuizhandetailNull():void {
			hasField$0 &= 0xffffefff;
			banghuizhandetail_null$field = new int();
		}

		public function get hasBanghuizhandetailNull():Boolean {
			return (hasField$0 & 0x1000) != 0;
		}

		public function set banghuizhandetailNull(value:int):void {
			hasField$0 |= 0x1000;
			banghuizhandetail_null$field = value;
		}

		public function get banghuizhandetailNull():int {
			return banghuizhandetail_null$field;
		}

		/**
		 *  @private
		 */
		public static const GERENZHANJI_NULL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.gerenzhanji_null", "gerenzhanjiNull", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gerenzhanji_null$field:int;

		public function clearGerenzhanjiNull():void {
			hasField$0 &= 0xffffdfff;
			gerenzhanji_null$field = new int();
		}

		public function get hasGerenzhanjiNull():Boolean {
			return (hasField$0 & 0x2000) != 0;
		}

		public function set gerenzhanjiNull(value:int):void {
			hasField$0 |= 0x2000;
			gerenzhanji_null$field = value;
		}

		public function get gerenzhanjiNull():int {
			return gerenzhanji_null$field;
		}

		/**
		 *  @private
		 */
		public static const RND_BAOXIANG_REWARD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.ExtrdataS2C.rnd_baoxiang_reward", "rndBaoxiangReward", (17 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var rnd_baoxiang_reward$field:String;

		public function clearRndBaoxiangReward():void {
			rnd_baoxiang_reward$field = null;
		}

		public function get hasRndBaoxiangReward():Boolean {
			return rnd_baoxiang_reward$field != null;
		}

		public function set rndBaoxiangReward(value:String):void {
			rnd_baoxiang_reward$field = value;
		}

		public function get rndBaoxiangReward():String {
			return rnd_baoxiang_reward$field;
		}

		/**
		 *  @private
		 */
		public static const CHONGZHIJILU_NULL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.chongzhijilu_null", "chongzhijiluNull", (18 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chongzhijilu_null$field:int;

		public function clearChongzhijiluNull():void {
			hasField$0 &= 0xffffbfff;
			chongzhijilu_null$field = new int();
		}

		public function get hasChongzhijiluNull():Boolean {
			return (hasField$0 & 0x4000) != 0;
		}

		public function set chongzhijiluNull(value:int):void {
			hasField$0 |= 0x4000;
			chongzhijilu_null$field = value;
		}

		public function get chongzhijiluNull():int {
			return chongzhijilu_null$field;
		}

		/**
		 *  @private
		 */
		public static const LINGQUJILU_NULL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.lingqujilu_null", "lingqujiluNull", (19 << 3) | com.netease.protobuf.WireType.VARINT);

		private var lingqujilu_null$field:int;

		public function clearLingqujiluNull():void {
			hasField$0 &= 0xffff7fff;
			lingqujilu_null$field = new int();
		}

		public function get hasLingqujiluNull():Boolean {
			return (hasField$0 & 0x8000) != 0;
		}

		public function set lingqujiluNull(value:int):void {
			hasField$0 |= 0x8000;
			lingqujilu_null$field = value;
		}

		public function get lingqujiluNull():int {
			return lingqujilu_null$field;
		}

		/**
		 *  @private
		 */
		public static const HONGBAO_NULL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.hongbao_null", "hongbaoNull", (20 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hongbao_null$field:int;

		public function clearHongbaoNull():void {
			hasField$0 &= 0xfffeffff;
			hongbao_null$field = new int();
		}

		public function get hasHongbaoNull():Boolean {
			return (hasField$0 & 0x10000) != 0;
		}

		public function set hongbaoNull(value:int):void {
			hasField$0 |= 0x10000;
			hongbao_null$field = value;
		}

		public function get hongbaoNull():int {
			return hongbao_null$field;
		}

		/**
		 *  @private
		 */
		public static const SHENGQINGPERSION_NULL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.shengqingpersion_null", "shengqingpersionNull", (21 << 3) | com.netease.protobuf.WireType.VARINT);

		private var shengqingpersion_null$field:int;

		public function clearShengqingpersionNull():void {
			hasField$0 &= 0xfffdffff;
			shengqingpersion_null$field = new int();
		}

		public function get hasShengqingpersionNull():Boolean {
			return (hasField$0 & 0x20000) != 0;
		}

		public function set shengqingpersionNull(value:int):void {
			hasField$0 |= 0x20000;
			shengqingpersion_null$field = value;
		}

		public function get shengqingpersionNull():int {
			return shengqingpersion_null$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUI_PERSOION_NULL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.banghui_persoion_null", "banghuiPersoionNull", (22 << 3) | com.netease.protobuf.WireType.VARINT);

		private var banghui_persoion_null$field:int;

		public function clearBanghuiPersoionNull():void {
			hasField$0 &= 0xfffbffff;
			banghui_persoion_null$field = new int();
		}

		public function get hasBanghuiPersoionNull():Boolean {
			return (hasField$0 & 0x40000) != 0;
		}

		public function set banghuiPersoionNull(value:int):void {
			hasField$0 |= 0x40000;
			banghui_persoion_null$field = value;
		}

		public function get banghuiPersoionNull():int {
			return banghui_persoion_null$field;
		}

		/**
		 *  @private
		 */
		public static const ENHANCE10_DEATIAL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.ExtrdataS2C.enhance10_deatial", "enhance10Deatial", (23 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var enhance10_deatial$field:String;

		public function clearEnhance10Deatial():void {
			enhance10_deatial$field = null;
		}

		public function get hasEnhance10Deatial():Boolean {
			return enhance10_deatial$field != null;
		}

		public function set enhance10Deatial(value:String):void {
			enhance10_deatial$field = value;
		}

		public function get enhance10Deatial():String {
			return enhance10_deatial$field;
		}

		/**
		 *  @private
		 */
		public static const RONGLIAN_EQUIPIDS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.ExtrdataS2C.ronglian_equipids", "ronglianEquipids", (24 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var ronglian_equipids$field:String;

		public function clearRonglianEquipids():void {
			ronglian_equipids$field = null;
		}

		public function get hasRonglianEquipids():Boolean {
			return ronglian_equipids$field != null;
		}

		public function set ronglianEquipids(value:String):void {
			ronglian_equipids$field = value;
		}

		public function get ronglianEquipids():String {
			return ronglian_equipids$field;
		}

		/**
		 *  @private
		 */
		public static const FUBEN_PAIMING_NOW:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.ExtrdataS2C.fuben_paiming_now", "fubenPaimingNow", (25 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var fuben_paiming_now$field:String;

		public function clearFubenPaimingNow():void {
			fuben_paiming_now$field = null;
		}

		public function get hasFubenPaimingNow():Boolean {
			return fuben_paiming_now$field != null;
		}

		public function set fubenPaimingNow(value:String):void {
			fuben_paiming_now$field = value;
		}

		public function get fubenPaimingNow():String {
			return fuben_paiming_now$field;
		}

		/**
		 *  @private
		 */
		public static const FUBEN_PAIMING_OLD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.ExtrdataS2C.fuben_paiming_old", "fubenPaimingOld", (26 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var fuben_paiming_old$field:String;

		public function clearFubenPaimingOld():void {
			fuben_paiming_old$field = null;
		}

		public function get hasFubenPaimingOld():Boolean {
			return fuben_paiming_old$field != null;
		}

		public function set fubenPaimingOld(value:String):void {
			fuben_paiming_old$field = value;
		}

		public function get fubenPaimingOld():String {
			return fuben_paiming_old$field;
		}

		/**
		 *  @private
		 */
		public static const NPC_TALKS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.ExtrdataS2C.npc_talks", "npcTalks", (27 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var npc_talks$field:String;

		public function clearNpcTalks():void {
			npc_talks$field = null;
		}

		public function get hasNpcTalks():Boolean {
			return npc_talks$field != null;
		}

		public function set npcTalks(value:String):void {
			npc_talks$field = value;
		}

		public function get npcTalks():String {
			return npc_talks$field;
		}

		/**
		 *  @private
		 */
		public static const CHONGZHI_SUCCESS_XID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ExtrdataS2C.chongzhi_success_xid", "chongzhiSuccessXid", (28 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chongzhi_success_xid$field:int;

		public function clearChongzhiSuccessXid():void {
			hasField$0 &= 0xfff7ffff;
			chongzhi_success_xid$field = new int();
		}

		public function get hasChongzhiSuccessXid():Boolean {
			return (hasField$0 & 0x80000) != 0;
		}

		public function set chongzhiSuccessXid(value:int):void {
			hasField$0 |= 0x80000;
			chongzhi_success_xid$field = value;
		}

		public function get chongzhiSuccessXid():int {
			return chongzhi_success_xid$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCopy) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, copy$field);
			}
			if (hasRndFriend) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, rnd_friend$field);
			}
			if (hasSaodangFreshTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, saodang_fresh_time$field);
			}
			if (hasHasNewChat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, has_new_chat$field);
			}
			if (hasHasRewardSuipian) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, has_reward_suipian$field);
			}
			if (hasJingkuangFight) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, jingkuang_fight$field);
			}
			if (hasXitongkuangMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, xitongkuang_money$field);
			}
			if (hasJingkuangLogNull) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, jingkuang_log_null$field);
			}
			if (hasHuodongNull) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, huodong_null$field);
			}
			if (hasMailCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, mail_count$field);
			}
			if (hasGuideUpgrade) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, guide_upgrade$field);
			}
			if (hasXitongkuangNull) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, xitongkuang_null$field);
			}
			if (hasBaomingbanghuiNull) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, baomingbanghui_null$field);
			}
			if (hasBanghuizhanjifenNull) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, banghuizhanjifen_null$field);
			}
			if (hasBanghuizhandetailNull) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, banghuizhandetail_null$field);
			}
			if (hasGerenzhanjiNull) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, gerenzhanji_null$field);
			}
			if (hasRndBaoxiangReward) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, rnd_baoxiang_reward$field);
			}
			if (hasChongzhijiluNull) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 18);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, chongzhijilu_null$field);
			}
			if (hasLingqujiluNull) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 19);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, lingqujilu_null$field);
			}
			if (hasHongbaoNull) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, hongbao_null$field);
			}
			if (hasShengqingpersionNull) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, shengqingpersion_null$field);
			}
			if (hasBanghuiPersoionNull) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, banghui_persoion_null$field);
			}
			if (hasEnhance10Deatial) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 23);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, enhance10_deatial$field);
			}
			if (hasRonglianEquipids) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 24);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, ronglian_equipids$field);
			}
			if (hasFubenPaimingNow) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 25);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, fuben_paiming_now$field);
			}
			if (hasFubenPaimingOld) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 26);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, fuben_paiming_old$field);
			}
			if (hasNpcTalks) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 27);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, npc_talks$field);
			}
			if (hasChongzhiSuccessXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 28);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, chongzhi_success_xid$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var copy$count:uint = 0;
			var rnd_friend$count:uint = 0;
			var saodang_fresh_time$count:uint = 0;
			var has_new_chat$count:uint = 0;
			var has_reward_suipian$count:uint = 0;
			var jingkuang_fight$count:uint = 0;
			var xitongkuang_money$count:uint = 0;
			var jingkuang_log_null$count:uint = 0;
			var huodong_null$count:uint = 0;
			var mail_count$count:uint = 0;
			var guide_upgrade$count:uint = 0;
			var xitongkuang_null$count:uint = 0;
			var baomingbanghui_null$count:uint = 0;
			var banghuizhanjifen_null$count:uint = 0;
			var banghuizhandetail_null$count:uint = 0;
			var gerenzhanji_null$count:uint = 0;
			var rnd_baoxiang_reward$count:uint = 0;
			var chongzhijilu_null$count:uint = 0;
			var lingqujilu_null$count:uint = 0;
			var hongbao_null$count:uint = 0;
			var shengqingpersion_null$count:uint = 0;
			var banghui_persoion_null$count:uint = 0;
			var enhance10_deatial$count:uint = 0;
			var ronglian_equipids$count:uint = 0;
			var fuben_paiming_now$count:uint = 0;
			var fuben_paiming_old$count:uint = 0;
			var npc_talks$count:uint = 0;
			var chongzhi_success_xid$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (copy$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.copy cannot be set twice.');
					}
					++copy$count;
					this.copy = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (rnd_friend$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.rndFriend cannot be set twice.');
					}
					++rnd_friend$count;
					this.rndFriend = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (saodang_fresh_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.saodangFreshTime cannot be set twice.');
					}
					++saodang_fresh_time$count;
					this.saodangFreshTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 4:
					if (has_new_chat$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.hasNewChat cannot be set twice.');
					}
					++has_new_chat$count;
					this.hasNewChat = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (has_reward_suipian$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.hasRewardSuipian cannot be set twice.');
					}
					++has_reward_suipian$count;
					this.hasRewardSuipian = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (jingkuang_fight$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.jingkuangFight cannot be set twice.');
					}
					++jingkuang_fight$count;
					this.jingkuangFight = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (xitongkuang_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.xitongkuangMoney cannot be set twice.');
					}
					++xitongkuang_money$count;
					this.xitongkuangMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (jingkuang_log_null$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.jingkuangLogNull cannot be set twice.');
					}
					++jingkuang_log_null$count;
					this.jingkuangLogNull = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (huodong_null$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.huodongNull cannot be set twice.');
					}
					++huodong_null$count;
					this.huodongNull = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (mail_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.mailCount cannot be set twice.');
					}
					++mail_count$count;
					this.mailCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (guide_upgrade$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.guideUpgrade cannot be set twice.');
					}
					++guide_upgrade$count;
					this.guideUpgrade = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 12:
					if (xitongkuang_null$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.xitongkuangNull cannot be set twice.');
					}
					++xitongkuang_null$count;
					this.xitongkuangNull = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 13:
					if (baomingbanghui_null$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.baomingbanghuiNull cannot be set twice.');
					}
					++baomingbanghui_null$count;
					this.baomingbanghuiNull = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 14:
					if (banghuizhanjifen_null$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.banghuizhanjifenNull cannot be set twice.');
					}
					++banghuizhanjifen_null$count;
					this.banghuizhanjifenNull = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 15:
					if (banghuizhandetail_null$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.banghuizhandetailNull cannot be set twice.');
					}
					++banghuizhandetail_null$count;
					this.banghuizhandetailNull = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 16:
					if (gerenzhanji_null$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.gerenzhanjiNull cannot be set twice.');
					}
					++gerenzhanji_null$count;
					this.gerenzhanjiNull = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 17:
					if (rnd_baoxiang_reward$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.rndBaoxiangReward cannot be set twice.');
					}
					++rnd_baoxiang_reward$count;
					this.rndBaoxiangReward = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 18:
					if (chongzhijilu_null$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.chongzhijiluNull cannot be set twice.');
					}
					++chongzhijilu_null$count;
					this.chongzhijiluNull = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 19:
					if (lingqujilu_null$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.lingqujiluNull cannot be set twice.');
					}
					++lingqujilu_null$count;
					this.lingqujiluNull = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 20:
					if (hongbao_null$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.hongbaoNull cannot be set twice.');
					}
					++hongbao_null$count;
					this.hongbaoNull = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 21:
					if (shengqingpersion_null$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.shengqingpersionNull cannot be set twice.');
					}
					++shengqingpersion_null$count;
					this.shengqingpersionNull = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 22:
					if (banghui_persoion_null$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.banghuiPersoionNull cannot be set twice.');
					}
					++banghui_persoion_null$count;
					this.banghuiPersoionNull = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 23:
					if (enhance10_deatial$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.enhance10Deatial cannot be set twice.');
					}
					++enhance10_deatial$count;
					this.enhance10Deatial = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 24:
					if (ronglian_equipids$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.ronglianEquipids cannot be set twice.');
					}
					++ronglian_equipids$count;
					this.ronglianEquipids = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 25:
					if (fuben_paiming_now$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.fubenPaimingNow cannot be set twice.');
					}
					++fuben_paiming_now$count;
					this.fubenPaimingNow = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 26:
					if (fuben_paiming_old$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.fubenPaimingOld cannot be set twice.');
					}
					++fuben_paiming_old$count;
					this.fubenPaimingOld = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 27:
					if (npc_talks$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.npcTalks cannot be set twice.');
					}
					++npc_talks$count;
					this.npcTalks = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 28:
					if (chongzhi_success_xid$count != 0) {
						throw new flash.errors.IOError('Bad data format: ExtrdataS2C.chongzhiSuccessXid cannot be set twice.');
					}
					++chongzhi_success_xid$count;
					this.chongzhiSuccessXid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
