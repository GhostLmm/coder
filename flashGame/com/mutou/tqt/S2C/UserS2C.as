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
	public dynamic final class UserS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const USER_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.user_level", "userLevel", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_level$field:int;

		private var hasField$0:uint = 0;

		public function clearUserLevel():void {
			hasField$0 &= 0xfffffffe;
			user_level$field = new int();
		}

		public function get hasUserLevel():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set userLevel(value:int):void {
			hasField$0 |= 0x1;
			user_level$field = value;
		}

		public function get userLevel():int {
			return user_level$field;
		}

		/**
		 *  @private
		 */
		public static const USER_EXP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.user_exp", "userExp", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_exp$field:int;

		public function clearUserExp():void {
			hasField$0 &= 0xfffffffd;
			user_exp$field = new int();
		}

		public function get hasUserExp():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set userExp(value:int):void {
			hasField$0 |= 0x2;
			user_exp$field = value;
		}

		public function get userExp():int {
			return user_exp$field;
		}

		/**
		 *  @private
		 */
		public static const USER_MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.user_money", "userMoney", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_money$field:int;

		public function clearUserMoney():void {
			hasField$0 &= 0xfffffffb;
			user_money$field = new int();
		}

		public function get hasUserMoney():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set userMoney(value:int):void {
			hasField$0 |= 0x4;
			user_money$field = value;
		}

		public function get userMoney():int {
			return user_money$field;
		}

		/**
		 *  @private
		 */
		public static const USER_CASH:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.user_cash", "userCash", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_cash$field:int;

		public function clearUserCash():void {
			hasField$0 &= 0xfffffff7;
			user_cash$field = new int();
		}

		public function get hasUserCash():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set userCash(value:int):void {
			hasField$0 |= 0x8;
			user_cash$field = value;
		}

		public function get userCash():int {
			return user_cash$field;
		}

		/**
		 *  @private
		 */
		public static const USER_ICON:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.UserS2C.user_icon", "userIcon", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var user_icon$field:String;

		public function clearUserIcon():void {
			user_icon$field = null;
		}

		public function get hasUserIcon():Boolean {
			return user_icon$field != null;
		}

		public function set userIcon(value:String):void {
			user_icon$field = value;
		}

		public function get userIcon():String {
			return user_icon$field;
		}

		/**
		 *  @private
		 */
		public static const CUR_GUANKA:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.cur_guanka", "curGuanka", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cur_guanka$field:int;

		public function clearCurGuanka():void {
			hasField$0 &= 0xffffffef;
			cur_guanka$field = new int();
		}

		public function get hasCurGuanka():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set curGuanka(value:int):void {
			hasField$0 |= 0x10;
			cur_guanka$field = value;
		}

		public function get curGuanka():int {
			return cur_guanka$field;
		}

		/**
		 *  @private
		 */
		public static const CURRENT_TILI:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.current_tili", "currentTili", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var current_tili$field:int;

		public function clearCurrentTili():void {
			hasField$0 &= 0xffffffdf;
			current_tili$field = new int();
		}

		public function get hasCurrentTili():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set currentTili(value:int):void {
			hasField$0 |= 0x20;
			current_tili$field = value;
		}

		public function get currentTili():int {
			return current_tili$field;
		}

		/**
		 *  @private
		 */
		public static const TILI_REFRESH_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.UserS2C.tili_refresh_time", "tiliRefreshTime", (8 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var tili_refresh_time$field:UInt64;

		public function clearTiliRefreshTime():void {
			tili_refresh_time$field = null;
		}

		public function get hasTiliRefreshTime():Boolean {
			return tili_refresh_time$field != null;
		}

		public function set tiliRefreshTime(value:UInt64):void {
			tili_refresh_time$field = value;
		}

		public function get tiliRefreshTime():UInt64 {
			return tili_refresh_time$field;
		}

		/**
		 *  @private
		 */
		public static const TILI_LIMIT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.tili_limit", "tiliLimit", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tili_limit$field:int;

		public function clearTiliLimit():void {
			hasField$0 &= 0xffffffbf;
			tili_limit$field = new int();
		}

		public function get hasTiliLimit():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set tiliLimit(value:int):void {
			hasField$0 |= 0x40;
			tili_limit$field = value;
		}

		public function get tiliLimit():int {
			return tili_limit$field;
		}

		/**
		 *  @private
		 */
		public static const TILI_BUY_NUM:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.tili_buy_num", "tiliBuyNum", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tili_buy_num$field:int;

		public function clearTiliBuyNum():void {
			hasField$0 &= 0xffffff7f;
			tili_buy_num$field = new int();
		}

		public function get hasTiliBuyNum():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set tiliBuyNum(value:int):void {
			hasField$0 |= 0x80;
			tili_buy_num$field = value;
		}

		public function get tiliBuyNum():int {
			return tili_buy_num$field;
		}

		/**
		 *  @private
		 */
		public static const CLEAR_TIAOZHAN_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.clear_tiaozhan_count", "clearTiaozhanCount", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var clear_tiaozhan_count$field:int;

		public function clearClearTiaozhanCount():void {
			hasField$0 &= 0xfffffeff;
			clear_tiaozhan_count$field = new int();
		}

		public function get hasClearTiaozhanCount():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set clearTiaozhanCount(value:int):void {
			hasField$0 |= 0x100;
			clear_tiaozhan_count$field = value;
		}

		public function get clearTiaozhanCount():int {
			return clear_tiaozhan_count$field;
		}

		/**
		 *  @private
		 */
		public static const VIP_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.vip_level", "vipLevel", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vip_level$field:int;

		public function clearVipLevel():void {
			hasField$0 &= 0xfffffdff;
			vip_level$field = new int();
		}

		public function get hasVipLevel():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set vipLevel(value:int):void {
			hasField$0 |= 0x200;
			vip_level$field = value;
		}

		public function get vipLevel():int {
			return vip_level$field;
		}

		/**
		 *  @private
		 */
		public static const VIP_EXP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.vip_exp", "vipExp", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vip_exp$field:int;

		public function clearVipExp():void {
			hasField$0 &= 0xfffffbff;
			vip_exp$field = new int();
		}

		public function get hasVipExp():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set vipExp(value:int):void {
			hasField$0 |= 0x400;
			vip_exp$field = value;
		}

		public function get vipExp():int {
			return vip_exp$field;
		}

		/**
		 *  @private
		 */
		public static const COULD_USE_BUGNUM:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.could_use_bugnum", "couldUseBugnum", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var could_use_bugnum$field:int;

		public function clearCouldUseBugnum():void {
			hasField$0 &= 0xfffff7ff;
			could_use_bugnum$field = new int();
		}

		public function get hasCouldUseBugnum():Boolean {
			return (hasField$0 & 0x800) != 0;
		}

		public function set couldUseBugnum(value:int):void {
			hasField$0 |= 0x800;
			could_use_bugnum$field = value;
		}

		public function get couldUseBugnum():int {
			return could_use_bugnum$field;
		}

		/**
		 *  @private
		 */
		public static const USER_RONGLIAN:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.user_ronglian", "userRonglian", (15 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_ronglian$field:int;

		public function clearUserRonglian():void {
			hasField$0 &= 0xffffefff;
			user_ronglian$field = new int();
		}

		public function get hasUserRonglian():Boolean {
			return (hasField$0 & 0x1000) != 0;
		}

		public function set userRonglian(value:int):void {
			hasField$0 |= 0x1000;
			user_ronglian$field = value;
		}

		public function get userRonglian():int {
			return user_ronglian$field;
		}

		/**
		 *  @private
		 */
		public static const USER_STAR_HISTORY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.user_star_history", "userStarHistory", (16 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_star_history$field:int;

		public function clearUserStarHistory():void {
			hasField$0 &= 0xffffdfff;
			user_star_history$field = new int();
		}

		public function get hasUserStarHistory():Boolean {
			return (hasField$0 & 0x2000) != 0;
		}

		public function set userStarHistory(value:int):void {
			hasField$0 |= 0x2000;
			user_star_history$field = value;
		}

		public function get userStarHistory():int {
			return user_star_history$field;
		}

		/**
		 *  @private
		 */
		public static const USER_STAR_CURRENT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.user_star_current", "userStarCurrent", (17 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_star_current$field:int;

		public function clearUserStarCurrent():void {
			hasField$0 &= 0xffffbfff;
			user_star_current$field = new int();
		}

		public function get hasUserStarCurrent():Boolean {
			return (hasField$0 & 0x4000) != 0;
		}

		public function set userStarCurrent(value:int):void {
			hasField$0 |= 0x4000;
			user_star_current$field = value;
		}

		public function get userStarCurrent():int {
			return user_star_current$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY_BUY_NUM:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.money_buy_num", "moneyBuyNum", (18 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money_buy_num$field:int;

		public function clearMoneyBuyNum():void {
			hasField$0 &= 0xffff7fff;
			money_buy_num$field = new int();
		}

		public function get hasMoneyBuyNum():Boolean {
			return (hasField$0 & 0x8000) != 0;
		}

		public function set moneyBuyNum(value:int):void {
			hasField$0 |= 0x8000;
			money_buy_num$field = value;
		}

		public function get moneyBuyNum():int {
			return money_buy_num$field;
		}

		/**
		 *  @private
		 */
		public static const GUIDE_STEP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.guide_step", "guideStep", (19 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guide_step$field:int;

		public function clearGuideStep():void {
			hasField$0 &= 0xfffeffff;
			guide_step$field = new int();
		}

		public function get hasGuideStep():Boolean {
			return (hasField$0 & 0x10000) != 0;
		}

		public function set guideStep(value:int):void {
			hasField$0 |= 0x10000;
			guide_step$field = value;
		}

		public function get guideStep():int {
			return guide_step$field;
		}

		/**
		 *  @private
		 */
		public static const CHONGZHI_INFO:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.UserS2C.chongzhi_info", "chongzhiInfo", (20 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var chongzhi_info$field:String;

		public function clearChongzhiInfo():void {
			chongzhi_info$field = null;
		}

		public function get hasChongzhiInfo():Boolean {
			return chongzhi_info$field != null;
		}

		public function set chongzhiInfo(value:String):void {
			chongzhi_info$field = value;
		}

		public function get chongzhiInfo():String {
			return chongzhi_info$field;
		}

		/**
		 *  @private
		 */
		public static const USER_RONGYU:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.user_rongyu", "userRongyu", (21 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_rongyu$field:int;

		public function clearUserRongyu():void {
			hasField$0 &= 0xfffdffff;
			user_rongyu$field = new int();
		}

		public function get hasUserRongyu():Boolean {
			return (hasField$0 & 0x20000) != 0;
		}

		public function set userRongyu(value:int):void {
			hasField$0 |= 0x20000;
			user_rongyu$field = value;
		}

		public function get userRongyu():int {
			return user_rongyu$field;
		}

		/**
		 *  @private
		 */
		public static const PAY_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.UserS2C.pay_count", "payCount", (22 << 3) | com.netease.protobuf.WireType.VARINT);

		private var pay_count$field:int;

		public function clearPayCount():void {
			hasField$0 &= 0xfffbffff;
			pay_count$field = new int();
		}

		public function get hasPayCount():Boolean {
			return (hasField$0 & 0x40000) != 0;
		}

		public function set payCount(value:int):void {
			hasField$0 |= 0x40000;
			pay_count$field = value;
		}

		public function get payCount():int {
			return pay_count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUserLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_level$field);
			}
			if (hasUserExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_exp$field);
			}
			if (hasUserMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_money$field);
			}
			if (hasUserCash) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_cash$field);
			}
			if (hasUserIcon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_icon$field);
			}
			if (hasCurGuanka) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cur_guanka$field);
			}
			if (hasCurrentTili) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, current_tili$field);
			}
			if (hasTiliRefreshTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, tili_refresh_time$field);
			}
			if (hasTiliLimit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, tili_limit$field);
			}
			if (hasTiliBuyNum) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, tili_buy_num$field);
			}
			if (hasClearTiaozhanCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, clear_tiaozhan_count$field);
			}
			if (hasVipLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, vip_level$field);
			}
			if (hasVipExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, vip_exp$field);
			}
			if (hasCouldUseBugnum) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, could_use_bugnum$field);
			}
			if (hasUserRonglian) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_ronglian$field);
			}
			if (hasUserStarHistory) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_star_history$field);
			}
			if (hasUserStarCurrent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_star_current$field);
			}
			if (hasMoneyBuyNum) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 18);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, money_buy_num$field);
			}
			if (hasGuideStep) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 19);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, guide_step$field);
			}
			if (hasChongzhiInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, chongzhi_info$field);
			}
			if (hasUserRongyu) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_rongyu$field);
			}
			if (hasPayCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, pay_count$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var user_level$count:uint = 0;
			var user_exp$count:uint = 0;
			var user_money$count:uint = 0;
			var user_cash$count:uint = 0;
			var user_icon$count:uint = 0;
			var cur_guanka$count:uint = 0;
			var current_tili$count:uint = 0;
			var tili_refresh_time$count:uint = 0;
			var tili_limit$count:uint = 0;
			var tili_buy_num$count:uint = 0;
			var clear_tiaozhan_count$count:uint = 0;
			var vip_level$count:uint = 0;
			var vip_exp$count:uint = 0;
			var could_use_bugnum$count:uint = 0;
			var user_ronglian$count:uint = 0;
			var user_star_history$count:uint = 0;
			var user_star_current$count:uint = 0;
			var money_buy_num$count:uint = 0;
			var guide_step$count:uint = 0;
			var chongzhi_info$count:uint = 0;
			var user_rongyu$count:uint = 0;
			var pay_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (user_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.userLevel cannot be set twice.');
					}
					++user_level$count;
					this.userLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (user_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.userExp cannot be set twice.');
					}
					++user_exp$count;
					this.userExp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (user_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.userMoney cannot be set twice.');
					}
					++user_money$count;
					this.userMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (user_cash$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.userCash cannot be set twice.');
					}
					++user_cash$count;
					this.userCash = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (user_icon$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.userIcon cannot be set twice.');
					}
					++user_icon$count;
					this.userIcon = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (cur_guanka$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.curGuanka cannot be set twice.');
					}
					++cur_guanka$count;
					this.curGuanka = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (current_tili$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.currentTili cannot be set twice.');
					}
					++current_tili$count;
					this.currentTili = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (tili_refresh_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.tiliRefreshTime cannot be set twice.');
					}
					++tili_refresh_time$count;
					this.tiliRefreshTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 9:
					if (tili_limit$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.tiliLimit cannot be set twice.');
					}
					++tili_limit$count;
					this.tiliLimit = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (tili_buy_num$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.tiliBuyNum cannot be set twice.');
					}
					++tili_buy_num$count;
					this.tiliBuyNum = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (clear_tiaozhan_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.clearTiaozhanCount cannot be set twice.');
					}
					++clear_tiaozhan_count$count;
					this.clearTiaozhanCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 12:
					if (vip_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.vipLevel cannot be set twice.');
					}
					++vip_level$count;
					this.vipLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 13:
					if (vip_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.vipExp cannot be set twice.');
					}
					++vip_exp$count;
					this.vipExp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 14:
					if (could_use_bugnum$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.couldUseBugnum cannot be set twice.');
					}
					++could_use_bugnum$count;
					this.couldUseBugnum = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 15:
					if (user_ronglian$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.userRonglian cannot be set twice.');
					}
					++user_ronglian$count;
					this.userRonglian = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 16:
					if (user_star_history$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.userStarHistory cannot be set twice.');
					}
					++user_star_history$count;
					this.userStarHistory = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 17:
					if (user_star_current$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.userStarCurrent cannot be set twice.');
					}
					++user_star_current$count;
					this.userStarCurrent = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 18:
					if (money_buy_num$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.moneyBuyNum cannot be set twice.');
					}
					++money_buy_num$count;
					this.moneyBuyNum = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 19:
					if (guide_step$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.guideStep cannot be set twice.');
					}
					++guide_step$count;
					this.guideStep = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 20:
					if (chongzhi_info$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.chongzhiInfo cannot be set twice.');
					}
					++chongzhi_info$count;
					this.chongzhiInfo = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 21:
					if (user_rongyu$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.userRongyu cannot be set twice.');
					}
					++user_rongyu$count;
					this.userRongyu = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 22:
					if (pay_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: UserS2C.payCount cannot be set twice.');
					}
					++pay_count$count;
					this.payCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
