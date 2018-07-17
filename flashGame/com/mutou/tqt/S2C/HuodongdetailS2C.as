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
	public dynamic final class HuodongdetailS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL_START:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongdetailS2C.level_start", "levelStart", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level_start$field:int;

		private var hasField$0:uint = 0;

		public function clearLevelStart():void {
			hasField$0 &= 0xfffffffe;
			level_start$field = new int();
		}

		public function get hasLevelStart():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set levelStart(value:int):void {
			hasField$0 |= 0x1;
			level_start$field = value;
		}

		public function get levelStart():int {
			return level_start$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL_CUR:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongdetailS2C.level_cur", "levelCur", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level_cur$field:int;

		public function clearLevelCur():void {
			hasField$0 &= 0xfffffffd;
			level_cur$field = new int();
		}

		public function get hasLevelCur():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set levelCur(value:int):void {
			hasField$0 |= 0x2;
			level_cur$field = value;
		}

		public function get levelCur():int {
			return level_cur$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL_REWARD_LIST:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.HuodongdetailS2C.level_reward_list", "levelRewardList", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var level_reward_list$field:String;

		public function clearLevelRewardList():void {
			level_reward_list$field = null;
		}

		public function get hasLevelRewardList():Boolean {
			return level_reward_list$field != null;
		}

		public function set levelRewardList(value:String):void {
			level_reward_list$field = value;
		}

		public function get levelRewardList():String {
			return level_reward_list$field;
		}

		/**
		 *  @private
		 */
		public static const CHONGZHI_START:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongdetailS2C.chongzhi_start", "chongzhiStart", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chongzhi_start$field:int;

		public function clearChongzhiStart():void {
			hasField$0 &= 0xfffffffb;
			chongzhi_start$field = new int();
		}

		public function get hasChongzhiStart():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set chongzhiStart(value:int):void {
			hasField$0 |= 0x4;
			chongzhi_start$field = value;
		}

		public function get chongzhiStart():int {
			return chongzhi_start$field;
		}

		/**
		 *  @private
		 */
		public static const CHONGZHI_REWARD_LIST:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.HuodongdetailS2C.chongzhi_reward_list", "chongzhiRewardList", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var chongzhi_reward_list$field:String;

		public function clearChongzhiRewardList():void {
			chongzhi_reward_list$field = null;
		}

		public function get hasChongzhiRewardList():Boolean {
			return chongzhi_reward_list$field != null;
		}

		public function set chongzhiRewardList(value:String):void {
			chongzhi_reward_list$field = value;
		}

		public function get chongzhiRewardList():String {
			return chongzhi_reward_list$field;
		}

		/**
		 *  @private
		 */
		public static const CHONGZHI_CUR:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongdetailS2C.chongzhi_cur", "chongzhiCur", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chongzhi_cur$field:int;

		public function clearChongzhiCur():void {
			hasField$0 &= 0xfffffff7;
			chongzhi_cur$field = new int();
		}

		public function get hasChongzhiCur():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set chongzhiCur(value:int):void {
			hasField$0 |= 0x8;
			chongzhi_cur$field = value;
		}

		public function get chongzhiCur():int {
			return chongzhi_cur$field;
		}

		/**
		 *  @private
		 */
		public static const LABA_TIMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongdetailS2C.laba_times", "labaTimes", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var laba_times$field:int;

		public function clearLabaTimes():void {
			hasField$0 &= 0xffffffef;
			laba_times$field = new int();
		}

		public function get hasLabaTimes():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set labaTimes(value:int):void {
			hasField$0 |= 0x10;
			laba_times$field = value;
		}

		public function get labaTimes():int {
			return laba_times$field;
		}

		/**
		 *  @private
		 */
		public static const LABA_REWARDS_CASH:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongdetailS2C.laba_rewards_cash", "labaRewardsCash", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var laba_rewards_cash$field:int;

		public function clearLabaRewardsCash():void {
			hasField$0 &= 0xffffffdf;
			laba_rewards_cash$field = new int();
		}

		public function get hasLabaRewardsCash():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set labaRewardsCash(value:int):void {
			hasField$0 |= 0x20;
			laba_rewards_cash$field = value;
		}

		public function get labaRewardsCash():int {
			return laba_rewards_cash$field;
		}

		/**
		 *  @private
		 */
		public static const ZHUANPAN_REWARDID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongdetailS2C.zhuanpan_rewardid", "zhuanpanRewardid", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var zhuanpan_rewardid$field:int;

		public function clearZhuanpanRewardid():void {
			hasField$0 &= 0xffffffbf;
			zhuanpan_rewardid$field = new int();
		}

		public function get hasZhuanpanRewardid():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set zhuanpanRewardid(value:int):void {
			hasField$0 |= 0x40;
			zhuanpan_rewardid$field = value;
		}

		public function get zhuanpanRewardid():int {
			return zhuanpan_rewardid$field;
		}

		/**
		 *  @private
		 */
		public static const ZHUANPAN_COST:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongdetailS2C.zhuanpan_cost", "zhuanpanCost", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var zhuanpan_cost$field:int;

		public function clearZhuanpanCost():void {
			hasField$0 &= 0xffffff7f;
			zhuanpan_cost$field = new int();
		}

		public function get hasZhuanpanCost():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set zhuanpanCost(value:int):void {
			hasField$0 |= 0x80;
			zhuanpan_cost$field = value;
		}

		public function get zhuanpanCost():int {
			return zhuanpan_cost$field;
		}

		/**
		 *  @private
		 */
		public static const CHOUKA_DATA:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.HuodongdetailS2C.chouka_data", "choukaData", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var chouka_data$field:String;

		public function clearChoukaData():void {
			chouka_data$field = null;
		}

		public function get hasChoukaData():Boolean {
			return chouka_data$field != null;
		}

		public function set choukaData(value:String):void {
			chouka_data$field = value;
		}

		public function get choukaData():String {
			return chouka_data$field;
		}

		/**
		 *  @private
		 */
		public static const CHOUKA_COST:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongdetailS2C.chouka_cost", "choukaCost", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chouka_cost$field:int;

		public function clearChoukaCost():void {
			hasField$0 &= 0xfffffeff;
			chouka_cost$field = new int();
		}

		public function get hasChoukaCost():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set choukaCost(value:int):void {
			hasField$0 |= 0x100;
			chouka_cost$field = value;
		}

		public function get choukaCost():int {
			return chouka_cost$field;
		}

		/**
		 *  @private
		 */
		public static const CHOUKA_ALL_COST:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongdetailS2C.chouka_all_cost", "choukaAllCost", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chouka_all_cost$field:int;

		public function clearChoukaAllCost():void {
			hasField$0 &= 0xfffffdff;
			chouka_all_cost$field = new int();
		}

		public function get hasChoukaAllCost():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set choukaAllCost(value:int):void {
			hasField$0 |= 0x200;
			chouka_all_cost$field = value;
		}

		public function get choukaAllCost():int {
			return chouka_all_cost$field;
		}

		/**
		 *  @private
		 */
		public static const COLLECT_SUPPLY_NUM:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongdetailS2C.collect_supply_num", "collectSupplyNum", (14 << 3) | com.netease.protobuf.WireType.VARINT);

		private var collect_supply_num$field:int;

		public function clearCollectSupplyNum():void {
			hasField$0 &= 0xfffffbff;
			collect_supply_num$field = new int();
		}

		public function get hasCollectSupplyNum():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set collectSupplyNum(value:int):void {
			hasField$0 |= 0x400;
			collect_supply_num$field = value;
		}

		public function get collectSupplyNum():int {
			return collect_supply_num$field;
		}

		/**
		 *  @private
		 */
		public static const GUAGUALE_JIANGCI:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.HuodongdetailS2C.guaguale_jiangci", "guagualeJiangci", (15 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var guaguale_jiangci$field:String;

		public function clearGuagualeJiangci():void {
			guaguale_jiangci$field = null;
		}

		public function get hasGuagualeJiangci():Boolean {
			return guaguale_jiangci$field != null;
		}

		public function set guagualeJiangci(value:String):void {
			guaguale_jiangci$field = value;
		}

		public function get guagualeJiangci():String {
			return guaguale_jiangci$field;
		}

		/**
		 *  @private
		 */
		public static const GUAGUALE_REWARD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.HuodongdetailS2C.guaguale_reward", "guagualeReward", (16 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var guaguale_reward$field:String;

		public function clearGuagualeReward():void {
			guaguale_reward$field = null;
		}

		public function get hasGuagualeReward():Boolean {
			return guaguale_reward$field != null;
		}

		public function set guagualeReward(value:String):void {
			guaguale_reward$field = value;
		}

		public function get guagualeReward():String {
			return guaguale_reward$field;
		}

		/**
		 *  @private
		 */
		public static const GUAGUALE_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongdetailS2C.guaguale_count", "guagualeCount", (17 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guaguale_count$field:int;

		public function clearGuagualeCount():void {
			hasField$0 &= 0xfffff7ff;
			guaguale_count$field = new int();
		}

		public function get hasGuagualeCount():Boolean {
			return (hasField$0 & 0x800) != 0;
		}

		public function set guagualeCount(value:int):void {
			hasField$0 |= 0x800;
			guaguale_count$field = value;
		}

		public function get guagualeCount():int {
			return guaguale_count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLevelStart) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level_start$field);
			}
			if (hasLevelCur) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level_cur$field);
			}
			if (hasLevelRewardList) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, level_reward_list$field);
			}
			if (hasChongzhiStart) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, chongzhi_start$field);
			}
			if (hasChongzhiRewardList) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, chongzhi_reward_list$field);
			}
			if (hasChongzhiCur) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, chongzhi_cur$field);
			}
			if (hasLabaTimes) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, laba_times$field);
			}
			if (hasLabaRewardsCash) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, laba_rewards_cash$field);
			}
			if (hasZhuanpanRewardid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, zhuanpan_rewardid$field);
			}
			if (hasZhuanpanCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, zhuanpan_cost$field);
			}
			if (hasChoukaData) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, chouka_data$field);
			}
			if (hasChoukaCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, chouka_cost$field);
			}
			if (hasChoukaAllCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, chouka_all_cost$field);
			}
			if (hasCollectSupplyNum) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, collect_supply_num$field);
			}
			if (hasGuagualeJiangci) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, guaguale_jiangci$field);
			}
			if (hasGuagualeReward) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, guaguale_reward$field);
			}
			if (hasGuagualeCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, guaguale_count$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var level_start$count:uint = 0;
			var level_cur$count:uint = 0;
			var level_reward_list$count:uint = 0;
			var chongzhi_start$count:uint = 0;
			var chongzhi_reward_list$count:uint = 0;
			var chongzhi_cur$count:uint = 0;
			var laba_times$count:uint = 0;
			var laba_rewards_cash$count:uint = 0;
			var zhuanpan_rewardid$count:uint = 0;
			var zhuanpan_cost$count:uint = 0;
			var chouka_data$count:uint = 0;
			var chouka_cost$count:uint = 0;
			var chouka_all_cost$count:uint = 0;
			var collect_supply_num$count:uint = 0;
			var guaguale_jiangci$count:uint = 0;
			var guaguale_reward$count:uint = 0;
			var guaguale_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (level_start$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongdetailS2C.levelStart cannot be set twice.');
					}
					++level_start$count;
					this.levelStart = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (level_cur$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongdetailS2C.levelCur cannot be set twice.');
					}
					++level_cur$count;
					this.levelCur = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (level_reward_list$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongdetailS2C.levelRewardList cannot be set twice.');
					}
					++level_reward_list$count;
					this.levelRewardList = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (chongzhi_start$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongdetailS2C.chongzhiStart cannot be set twice.');
					}
					++chongzhi_start$count;
					this.chongzhiStart = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (chongzhi_reward_list$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongdetailS2C.chongzhiRewardList cannot be set twice.');
					}
					++chongzhi_reward_list$count;
					this.chongzhiRewardList = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (chongzhi_cur$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongdetailS2C.chongzhiCur cannot be set twice.');
					}
					++chongzhi_cur$count;
					this.chongzhiCur = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (laba_times$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongdetailS2C.labaTimes cannot be set twice.');
					}
					++laba_times$count;
					this.labaTimes = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (laba_rewards_cash$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongdetailS2C.labaRewardsCash cannot be set twice.');
					}
					++laba_rewards_cash$count;
					this.labaRewardsCash = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (zhuanpan_rewardid$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongdetailS2C.zhuanpanRewardid cannot be set twice.');
					}
					++zhuanpan_rewardid$count;
					this.zhuanpanRewardid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (zhuanpan_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongdetailS2C.zhuanpanCost cannot be set twice.');
					}
					++zhuanpan_cost$count;
					this.zhuanpanCost = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (chouka_data$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongdetailS2C.choukaData cannot be set twice.');
					}
					++chouka_data$count;
					this.choukaData = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 12:
					if (chouka_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongdetailS2C.choukaCost cannot be set twice.');
					}
					++chouka_cost$count;
					this.choukaCost = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 13:
					if (chouka_all_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongdetailS2C.choukaAllCost cannot be set twice.');
					}
					++chouka_all_cost$count;
					this.choukaAllCost = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 14:
					if (collect_supply_num$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongdetailS2C.collectSupplyNum cannot be set twice.');
					}
					++collect_supply_num$count;
					this.collectSupplyNum = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 15:
					if (guaguale_jiangci$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongdetailS2C.guagualeJiangci cannot be set twice.');
					}
					++guaguale_jiangci$count;
					this.guagualeJiangci = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 16:
					if (guaguale_reward$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongdetailS2C.guagualeReward cannot be set twice.');
					}
					++guaguale_reward$count;
					this.guagualeReward = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 17:
					if (guaguale_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongdetailS2C.guagualeCount cannot be set twice.');
					}
					++guaguale_count$count;
					this.guagualeCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
