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
	public dynamic final class GonghuiS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GONGGAO:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.GonghuiS2C.gonggao", "gonggao", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var gonggao$field:String;

		public function clearGonggao():void {
			gonggao$field = null;
		}

		public function get hasGonggao():Boolean {
			return gonggao$field != null;
		}

		public function set gonggao(value:String):void {
			gonggao$field = value;
		}

		public function get gonggao():String {
			return gonggao$field;
		}

		/**
		 *  @private
		 */
		public static const CREATE_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.GonghuiS2C.create_time", "createTime", (2 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var create_time$field:UInt64;

		public function clearCreateTime():void {
			create_time$field = null;
		}

		public function get hasCreateTime():Boolean {
			return create_time$field != null;
		}

		public function set createTime(value:UInt64):void {
			create_time$field = value;
		}

		public function get createTime():UInt64 {
			return create_time$field;
		}

		/**
		 *  @private
		 */
		public static const XUANYAN:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.GonghuiS2C.xuanyan", "xuanyan", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var xuanyan$field:String;

		public function clearXuanyan():void {
			xuanyan$field = null;
		}

		public function get hasXuanyan():Boolean {
			return xuanyan$field != null;
		}

		public function set xuanyan(value:String):void {
			xuanyan$field = value;
		}

		public function get xuanyan():String {
			return xuanyan$field;
		}

		/**
		 *  @private
		 */
		public static const PERSON_NUM:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.GonghuiS2C.person_num", "personNum", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var person_num$field:int;

		private var hasField$0:uint = 0;

		public function clearPersonNum():void {
			hasField$0 &= 0xfffffffe;
			person_num$field = new int();
		}

		public function get hasPersonNum():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set personNum(value:int):void {
			hasField$0 |= 0x1;
			person_num$field = value;
		}

		public function get personNum():int {
			return person_num$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUI_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.GonghuiS2C.banghui_name", "banghuiName", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var banghui_name$field:String;

		public function clearBanghuiName():void {
			banghui_name$field = null;
		}

		public function get hasBanghuiName():Boolean {
			return banghui_name$field != null;
		}

		public function set banghuiName(value:String):void {
			banghui_name$field = value;
		}

		public function get banghuiName():String {
			return banghui_name$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUI_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.GonghuiS2C.banghui_level", "banghuiLevel", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var banghui_level$field:int;

		public function clearBanghuiLevel():void {
			hasField$0 &= 0xfffffffd;
			banghui_level$field = new int();
		}

		public function get hasBanghuiLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set banghuiLevel(value:int):void {
			hasField$0 |= 0x2;
			banghui_level$field = value;
		}

		public function get banghuiLevel():int {
			return banghui_level$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUI_ICON:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.GonghuiS2C.banghui_icon", "banghuiIcon", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var banghui_icon$field:int;

		public function clearBanghuiIcon():void {
			hasField$0 &= 0xfffffffb;
			banghui_icon$field = new int();
		}

		public function get hasBanghuiIcon():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set banghuiIcon(value:int):void {
			hasField$0 |= 0x4;
			banghui_icon$field = value;
		}

		public function get banghuiIcon():int {
			return banghui_icon$field;
		}

		/**
		 *  @private
		 */
		public static const HUIZHANG_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.GonghuiS2C.huizhang_name", "huizhangName", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var huizhang_name$field:String;

		public function clearHuizhangName():void {
			huizhang_name$field = null;
		}

		public function get hasHuizhangName():Boolean {
			return huizhang_name$field != null;
		}

		public function set huizhangName(value:String):void {
			huizhang_name$field = value;
		}

		public function get huizhangName():String {
			return huizhang_name$field;
		}

		/**
		 *  @private
		 */
		public static const HUIZHANG_UID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.GonghuiS2C.huizhang_uid", "huizhangUid", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var huizhang_uid$field:int;

		public function clearHuizhangUid():void {
			hasField$0 &= 0xfffffff7;
			huizhang_uid$field = new int();
		}

		public function get hasHuizhangUid():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set huizhangUid(value:int):void {
			hasField$0 |= 0x8;
			huizhang_uid$field = value;
		}

		public function get huizhangUid():int {
			return huizhang_uid$field;
		}

		/**
		 *  @private
		 */
		public static const JIANGSHEDU:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.GonghuiS2C.jiangshedu", "jiangshedu", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var jiangshedu$field:int;

		public function clearJiangshedu():void {
			hasField$0 &= 0xffffffef;
			jiangshedu$field = new int();
		}

		public function get hasJiangshedu():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set jiangshedu(value:int):void {
			hasField$0 |= 0x10;
			jiangshedu$field = value;
		}

		public function get jiangshedu():int {
			return jiangshedu$field;
		}

		/**
		 *  @private
		 */
		public static const GUANGGONGMIAO_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.GonghuiS2C.guanggongmiao_level", "guanggongmiaoLevel", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guanggongmiao_level$field:int;

		public function clearGuanggongmiaoLevel():void {
			hasField$0 &= 0xffffffdf;
			guanggongmiao_level$field = new int();
		}

		public function get hasGuanggongmiaoLevel():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set guanggongmiaoLevel(value:int):void {
			hasField$0 |= 0x20;
			guanggongmiao_level$field = value;
		}

		public function get guanggongmiaoLevel():int {
			return guanggongmiao_level$field;
		}

		/**
		 *  @private
		 */
		public static const DATING_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.GonghuiS2C.dating_level", "datingLevel", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dating_level$field:int;

		public function clearDatingLevel():void {
			hasField$0 &= 0xffffffbf;
			dating_level$field = new int();
		}

		public function get hasDatingLevel():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set datingLevel(value:int):void {
			hasField$0 |= 0x40;
			dating_level$field = value;
		}

		public function get datingLevel():int {
			return dating_level$field;
		}

		/**
		 *  @private
		 */
		public static const SHANGCHENG_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.GonghuiS2C.shangcheng_level", "shangchengLevel", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var shangcheng_level$field:int;

		public function clearShangchengLevel():void {
			hasField$0 &= 0xffffff7f;
			shangcheng_level$field = new int();
		}

		public function get hasShangchengLevel():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set shangchengLevel(value:int):void {
			hasField$0 |= 0x80;
			shangcheng_level$field = value;
		}

		public function get shangchengLevel():int {
			return shangcheng_level$field;
		}

		/**
		 *  @private
		 */
		public static const BID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.GonghuiS2C.bid", "bid", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bid$field:int;

		public function clearBid():void {
			hasField$0 &= 0xfffffeff;
			bid$field = new int();
		}

		public function get hasBid():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set bid(value:int):void {
			hasField$0 |= 0x100;
			bid$field = value;
		}

		public function get bid():int {
			return bid$field;
		}

		/**
		 *  @private
		 */
		public static const ZHENPING_REFRESH_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.GonghuiS2C.zhenping_refresh_time", "zhenpingRefreshTime", (15 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var zhenping_refresh_time$field:UInt64;

		public function clearZhenpingRefreshTime():void {
			zhenping_refresh_time$field = null;
		}

		public function get hasZhenpingRefreshTime():Boolean {
			return zhenping_refresh_time$field != null;
		}

		public function set zhenpingRefreshTime(value:UInt64):void {
			zhenping_refresh_time$field = value;
		}

		public function get zhenpingRefreshTime():UInt64 {
			return zhenping_refresh_time$field;
		}

		/**
		 *  @private
		 */
		public static const ZHENPING_LIST:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.GonghuiS2C.zhenping_list", "zhenpingList", (16 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var zhenping_list$field:String;

		public function clearZhenpingList():void {
			zhenping_list$field = null;
		}

		public function get hasZhenpingList():Boolean {
			return zhenping_list$field != null;
		}

		public function set zhenpingList(value:String):void {
			zhenping_list$field = value;
		}

		public function get zhenpingList():String {
			return zhenping_list$field;
		}

		/**
		 *  @private
		 */
		public static const JUANXIAN_RECORD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.GonghuiS2C.juanxian_record", "juanxianRecord", (17 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var juanxian_record$field:String;

		public function clearJuanxianRecord():void {
			juanxian_record$field = null;
		}

		public function get hasJuanxianRecord():Boolean {
			return juanxian_record$field != null;
		}

		public function set juanxianRecord(value:String):void {
			juanxian_record$field = value;
		}

		public function get juanxianRecord():String {
			return juanxian_record$field;
		}

		/**
		 *  @private
		 */
		public static const CANBAI_COUT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.GonghuiS2C.canbai_cout", "canbaiCout", (18 << 3) | com.netease.protobuf.WireType.VARINT);

		private var canbai_cout$field:int;

		public function clearCanbaiCout():void {
			hasField$0 &= 0xfffffdff;
			canbai_cout$field = new int();
		}

		public function get hasCanbaiCout():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set canbaiCout(value:int):void {
			hasField$0 |= 0x200;
			canbai_cout$field = value;
		}

		public function get canbaiCout():int {
			return canbai_cout$field;
		}

		/**
		 *  @private
		 */
		public static const COIN_BUFF:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("com.mutou.tqt.S2C.GonghuiS2C.coin_buff", "coinBuff", (19 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var coin_buff$field:Number;

		public function clearCoinBuff():void {
			hasField$0 &= 0xfffffbff;
			coin_buff$field = new Number();
		}

		public function get hasCoinBuff():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set coinBuff(value:Number):void {
			hasField$0 |= 0x400;
			coin_buff$field = value;
		}

		public function get coinBuff():Number {
			return coin_buff$field;
		}

		/**
		 *  @private
		 */
		public static const COIN_BUFF_END_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.GonghuiS2C.coin_buff_end_time", "coinBuffEndTime", (20 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var coin_buff_end_time$field:UInt64;

		public function clearCoinBuffEndTime():void {
			coin_buff_end_time$field = null;
		}

		public function get hasCoinBuffEndTime():Boolean {
			return coin_buff_end_time$field != null;
		}

		public function set coinBuffEndTime(value:UInt64):void {
			coin_buff_end_time$field = value;
		}

		public function get coinBuffEndTime():UInt64 {
			return coin_buff_end_time$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUIZHAN_BAOMING_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.GonghuiS2C.banghuizhan_baoming_time", "banghuizhanBaomingTime", (21 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var banghuizhan_baoming_time$field:UInt64;

		public function clearBanghuizhanBaomingTime():void {
			banghuizhan_baoming_time$field = null;
		}

		public function get hasBanghuizhanBaomingTime():Boolean {
			return banghuizhan_baoming_time$field != null;
		}

		public function set banghuizhanBaomingTime(value:UInt64):void {
			banghuizhan_baoming_time$field = value;
		}

		public function get banghuizhanBaomingTime():UInt64 {
			return banghuizhan_baoming_time$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUIZHAN_BATTLE_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.GonghuiS2C.banghuizhan_battle_time", "banghuizhanBattleTime", (22 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var banghuizhan_battle_time$field:UInt64;

		public function clearBanghuizhanBattleTime():void {
			banghuizhan_battle_time$field = null;
		}

		public function get hasBanghuizhanBattleTime():Boolean {
			return banghuizhan_battle_time$field != null;
		}

		public function set banghuizhanBattleTime(value:UInt64):void {
			banghuizhan_battle_time$field = value;
		}

		public function get banghuizhanBattleTime():UInt64 {
			return banghuizhan_battle_time$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUIZHAN_REWARD_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.GonghuiS2C.banghuizhan_reward_time", "banghuizhanRewardTime", (23 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var banghuizhan_reward_time$field:UInt64;

		public function clearBanghuizhanRewardTime():void {
			banghuizhan_reward_time$field = null;
		}

		public function get hasBanghuizhanRewardTime():Boolean {
			return banghuizhan_reward_time$field != null;
		}

		public function set banghuizhanRewardTime(value:UInt64):void {
			banghuizhan_reward_time$field = value;
		}

		public function get banghuizhanRewardTime():UInt64 {
			return banghuizhan_reward_time$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUIZHAN_DURATION_TIME:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.GonghuiS2C.banghuizhan_duration_time", "banghuizhanDurationTime", (24 << 3) | com.netease.protobuf.WireType.VARINT);

		private var banghuizhan_duration_time$field:int;

		public function clearBanghuizhanDurationTime():void {
			hasField$0 &= 0xfffff7ff;
			banghuizhan_duration_time$field = new int();
		}

		public function get hasBanghuizhanDurationTime():Boolean {
			return (hasField$0 & 0x800) != 0;
		}

		public function set banghuizhanDurationTime(value:int):void {
			hasField$0 |= 0x800;
			banghuizhan_duration_time$field = value;
		}

		public function get banghuizhanDurationTime():int {
			return banghuizhan_duration_time$field;
		}

		/**
		 *  @private
		 */
		public static const HAS_BAOMING_BANGHUIZHAN:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.GonghuiS2C.has_baoming_banghuizhan", "hasBaomingBanghuizhan", (25 << 3) | com.netease.protobuf.WireType.VARINT);

		private var has_baoming_banghuizhan$field:int;

		public function clearHasBaomingBanghuizhan():void {
			hasField$0 &= 0xffffefff;
			has_baoming_banghuizhan$field = new int();
		}

		public function get hasHasBaomingBanghuizhan():Boolean {
			return (hasField$0 & 0x1000) != 0;
		}

		public function set hasBaomingBanghuizhan(value:int):void {
			hasField$0 |= 0x1000;
			has_baoming_banghuizhan$field = value;
		}

		public function get hasBaomingBanghuizhan():int {
			return has_baoming_banghuizhan$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGonggao) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, gonggao$field);
			}
			if (hasCreateTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, create_time$field);
			}
			if (hasXuanyan) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, xuanyan$field);
			}
			if (hasPersonNum) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, person_num$field);
			}
			if (hasBanghuiName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, banghui_name$field);
			}
			if (hasBanghuiLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, banghui_level$field);
			}
			if (hasBanghuiIcon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, banghui_icon$field);
			}
			if (hasHuizhangName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, huizhang_name$field);
			}
			if (hasHuizhangUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, huizhang_uid$field);
			}
			if (hasJiangshedu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, jiangshedu$field);
			}
			if (hasGuanggongmiaoLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, guanggongmiao_level$field);
			}
			if (hasDatingLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, dating_level$field);
			}
			if (hasShangchengLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, shangcheng_level$field);
			}
			if (hasBid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, bid$field);
			}
			if (hasZhenpingRefreshTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, zhenping_refresh_time$field);
			}
			if (hasZhenpingList) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, zhenping_list$field);
			}
			if (hasJuanxianRecord) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, juanxian_record$field);
			}
			if (hasCanbaiCout) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 18);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, canbai_cout$field);
			}
			if (hasCoinBuff) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 19);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, coin_buff$field);
			}
			if (hasCoinBuffEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, coin_buff_end_time$field);
			}
			if (hasBanghuizhanBaomingTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, banghuizhan_baoming_time$field);
			}
			if (hasBanghuizhanBattleTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, banghuizhan_battle_time$field);
			}
			if (hasBanghuizhanRewardTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 23);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, banghuizhan_reward_time$field);
			}
			if (hasBanghuizhanDurationTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 24);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, banghuizhan_duration_time$field);
			}
			if (hasHasBaomingBanghuizhan) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 25);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, has_baoming_banghuizhan$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var gonggao$count:uint = 0;
			var create_time$count:uint = 0;
			var xuanyan$count:uint = 0;
			var person_num$count:uint = 0;
			var banghui_name$count:uint = 0;
			var banghui_level$count:uint = 0;
			var banghui_icon$count:uint = 0;
			var huizhang_name$count:uint = 0;
			var huizhang_uid$count:uint = 0;
			var jiangshedu$count:uint = 0;
			var guanggongmiao_level$count:uint = 0;
			var dating_level$count:uint = 0;
			var shangcheng_level$count:uint = 0;
			var bid$count:uint = 0;
			var zhenping_refresh_time$count:uint = 0;
			var zhenping_list$count:uint = 0;
			var juanxian_record$count:uint = 0;
			var canbai_cout$count:uint = 0;
			var coin_buff$count:uint = 0;
			var coin_buff_end_time$count:uint = 0;
			var banghuizhan_baoming_time$count:uint = 0;
			var banghuizhan_battle_time$count:uint = 0;
			var banghuizhan_reward_time$count:uint = 0;
			var banghuizhan_duration_time$count:uint = 0;
			var has_baoming_banghuizhan$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (gonggao$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.gonggao cannot be set twice.');
					}
					++gonggao$count;
					this.gonggao = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (create_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.createTime cannot be set twice.');
					}
					++create_time$count;
					this.createTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 3:
					if (xuanyan$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.xuanyan cannot be set twice.');
					}
					++xuanyan$count;
					this.xuanyan = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (person_num$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.personNum cannot be set twice.');
					}
					++person_num$count;
					this.personNum = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (banghui_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.banghuiName cannot be set twice.');
					}
					++banghui_name$count;
					this.banghuiName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (banghui_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.banghuiLevel cannot be set twice.');
					}
					++banghui_level$count;
					this.banghuiLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (banghui_icon$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.banghuiIcon cannot be set twice.');
					}
					++banghui_icon$count;
					this.banghuiIcon = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (huizhang_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.huizhangName cannot be set twice.');
					}
					++huizhang_name$count;
					this.huizhangName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 9:
					if (huizhang_uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.huizhangUid cannot be set twice.');
					}
					++huizhang_uid$count;
					this.huizhangUid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (jiangshedu$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.jiangshedu cannot be set twice.');
					}
					++jiangshedu$count;
					this.jiangshedu = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (guanggongmiao_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.guanggongmiaoLevel cannot be set twice.');
					}
					++guanggongmiao_level$count;
					this.guanggongmiaoLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 12:
					if (dating_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.datingLevel cannot be set twice.');
					}
					++dating_level$count;
					this.datingLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 13:
					if (shangcheng_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.shangchengLevel cannot be set twice.');
					}
					++shangcheng_level$count;
					this.shangchengLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 14:
					if (bid$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.bid cannot be set twice.');
					}
					++bid$count;
					this.bid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 15:
					if (zhenping_refresh_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.zhenpingRefreshTime cannot be set twice.');
					}
					++zhenping_refresh_time$count;
					this.zhenpingRefreshTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 16:
					if (zhenping_list$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.zhenpingList cannot be set twice.');
					}
					++zhenping_list$count;
					this.zhenpingList = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 17:
					if (juanxian_record$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.juanxianRecord cannot be set twice.');
					}
					++juanxian_record$count;
					this.juanxianRecord = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 18:
					if (canbai_cout$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.canbaiCout cannot be set twice.');
					}
					++canbai_cout$count;
					this.canbaiCout = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 19:
					if (coin_buff$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.coinBuff cannot be set twice.');
					}
					++coin_buff$count;
					this.coinBuff = com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input);
					break;
				case 20:
					if (coin_buff_end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.coinBuffEndTime cannot be set twice.');
					}
					++coin_buff_end_time$count;
					this.coinBuffEndTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 21:
					if (banghuizhan_baoming_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.banghuizhanBaomingTime cannot be set twice.');
					}
					++banghuizhan_baoming_time$count;
					this.banghuizhanBaomingTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 22:
					if (banghuizhan_battle_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.banghuizhanBattleTime cannot be set twice.');
					}
					++banghuizhan_battle_time$count;
					this.banghuizhanBattleTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 23:
					if (banghuizhan_reward_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.banghuizhanRewardTime cannot be set twice.');
					}
					++banghuizhan_reward_time$count;
					this.banghuizhanRewardTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 24:
					if (banghuizhan_duration_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.banghuizhanDurationTime cannot be set twice.');
					}
					++banghuizhan_duration_time$count;
					this.banghuizhanDurationTime = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 25:
					if (has_baoming_banghuizhan$count != 0) {
						throw new flash.errors.IOError('Bad data format: GonghuiS2C.hasBaomingBanghuizhan cannot be set twice.');
					}
					++has_baoming_banghuizhan$count;
					this.hasBaomingBanghuizhan = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
