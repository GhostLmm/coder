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
	public dynamic final class ChoujiangS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HAIXUAN_FRESH_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.ChoujiangS2C.haixuan_fresh_time", "haixuanFreshTime", (1 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var haixuan_fresh_time$field:UInt64;

		public function clearHaixuanFreshTime():void {
			haixuan_fresh_time$field = null;
		}

		public function get hasHaixuanFreshTime():Boolean {
			return haixuan_fresh_time$field != null;
		}

		public function set haixuanFreshTime(value:UInt64):void {
			haixuan_fresh_time$field = value;
		}

		public function get haixuanFreshTime():UInt64 {
			return haixuan_fresh_time$field;
		}

		/**
		 *  @private
		 */
		public static const JINGXUAN_FRESH_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.ChoujiangS2C.jingxuan_fresh_time", "jingxuanFreshTime", (2 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var jingxuan_fresh_time$field:UInt64;

		public function clearJingxuanFreshTime():void {
			jingxuan_fresh_time$field = null;
		}

		public function get hasJingxuanFreshTime():Boolean {
			return jingxuan_fresh_time$field != null;
		}

		public function set jingxuanFreshTime(value:UInt64):void {
			jingxuan_fresh_time$field = value;
		}

		public function get jingxuanFreshTime():UInt64 {
			return jingxuan_fresh_time$field;
		}

		/**
		 *  @private
		 */
		public static const HAIXUAN_CARDS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.ChoujiangS2C.haixuan_cards", "haixuanCards", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var haixuan_cards$field:String;

		public function clearHaixuanCards():void {
			haixuan_cards$field = null;
		}

		public function get hasHaixuanCards():Boolean {
			return haixuan_cards$field != null;
		}

		public function set haixuanCards(value:String):void {
			haixuan_cards$field = value;
		}

		public function get haixuanCards():String {
			return haixuan_cards$field;
		}

		/**
		 *  @private
		 */
		public static const HAIXUAN_CHOSENID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ChoujiangS2C.haixuan_chosenid", "haixuanChosenid", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var haixuan_chosenid$field:int;

		private var hasField$0:uint = 0;

		public function clearHaixuanChosenid():void {
			hasField$0 &= 0xfffffffe;
			haixuan_chosenid$field = new int();
		}

		public function get hasHaixuanChosenid():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set haixuanChosenid(value:int):void {
			hasField$0 |= 0x1;
			haixuan_chosenid$field = value;
		}

		public function get haixuanChosenid():int {
			return haixuan_chosenid$field;
		}

		/**
		 *  @private
		 */
		public static const HAIXUAN_LIANXUAN_COST:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ChoujiangS2C.haixuan_lianxuan_cost", "haixuanLianxuanCost", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var haixuan_lianxuan_cost$field:int;

		public function clearHaixuanLianxuanCost():void {
			hasField$0 &= 0xfffffffd;
			haixuan_lianxuan_cost$field = new int();
		}

		public function get hasHaixuanLianxuanCost():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set haixuanLianxuanCost(value:int):void {
			hasField$0 |= 0x2;
			haixuan_lianxuan_cost$field = value;
		}

		public function get haixuanLianxuanCost():int {
			return haixuan_lianxuan_cost$field;
		}

		/**
		 *  @private
		 */
		public static const HAIXUAN_SHILIAN:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.ChoujiangS2C.haixuan_shilian", "haixuanShilian", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var haixuan_shilian$field:String;

		public function clearHaixuanShilian():void {
			haixuan_shilian$field = null;
		}

		public function get hasHaixuanShilian():Boolean {
			return haixuan_shilian$field != null;
		}

		public function set haixuanShilian(value:String):void {
			haixuan_shilian$field = value;
		}

		public function get haixuanShilian():String {
			return haixuan_shilian$field;
		}

		/**
		 *  @private
		 */
		public static const JINGXUAN_SHILIAN:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.ChoujiangS2C.jingxuan_shilian", "jingxuanShilian", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var jingxuan_shilian$field:String;

		public function clearJingxuanShilian():void {
			jingxuan_shilian$field = null;
		}

		public function get hasJingxuanShilian():Boolean {
			return jingxuan_shilian$field != null;
		}

		public function set jingxuanShilian(value:String):void {
			jingxuan_shilian$field = value;
		}

		public function get jingxuanShilian():String {
			return jingxuan_shilian$field;
		}

		/**
		 *  @private
		 */
		public static const JINGXUAN_SHILIAN_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ChoujiangS2C.jingxuan_shilian_count", "jingxuanShilianCount", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var jingxuan_shilian_count$field:int;

		public function clearJingxuanShilianCount():void {
			hasField$0 &= 0xfffffffb;
			jingxuan_shilian_count$field = new int();
		}

		public function get hasJingxuanShilianCount():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set jingxuanShilianCount(value:int):void {
			hasField$0 |= 0x4;
			jingxuan_shilian_count$field = value;
		}

		public function get jingxuanShilianCount():int {
			return jingxuan_shilian_count$field;
		}

		/**
		 *  @private
		 */
		public static const JINGXUAN_SHILIAN_COST:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ChoujiangS2C.jingxuan_shilian_cost", "jingxuanShilianCost", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var jingxuan_shilian_cost$field:int;

		public function clearJingxuanShilianCost():void {
			hasField$0 &= 0xfffffff7;
			jingxuan_shilian_cost$field = new int();
		}

		public function get hasJingxuanShilianCost():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set jingxuanShilianCost(value:int):void {
			hasField$0 |= 0x8;
			jingxuan_shilian_cost$field = value;
		}

		public function get jingxuanShilianCost():int {
			return jingxuan_shilian_cost$field;
		}

		/**
		 *  @private
		 */
		public static const JINGXUAN_COST:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ChoujiangS2C.jingxuan_cost", "jingxuanCost", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var jingxuan_cost$field:int;

		public function clearJingxuanCost():void {
			hasField$0 &= 0xffffffef;
			jingxuan_cost$field = new int();
		}

		public function get hasJingxuanCost():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set jingxuanCost(value:int):void {
			hasField$0 |= 0x10;
			jingxuan_cost$field = value;
		}

		public function get jingxuanCost():int {
			return jingxuan_cost$field;
		}

		/**
		 *  @private
		 */
		public static const JINGXUAN_XID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ChoujiangS2C.jingxuan_xid", "jingxuanXid", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var jingxuan_xid$field:int;

		public function clearJingxuanXid():void {
			hasField$0 &= 0xffffffdf;
			jingxuan_xid$field = new int();
		}

		public function get hasJingxuanXid():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set jingxuanXid(value:int):void {
			hasField$0 |= 0x20;
			jingxuan_xid$field = value;
		}

		public function get jingxuanXid():int {
			return jingxuan_xid$field;
		}

		/**
		 *  @private
		 */
		public static const JINGXUAN_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ChoujiangS2C.jingxuan_count", "jingxuanCount", (12 << 3) | com.netease.protobuf.WireType.VARINT);

		private var jingxuan_count$field:int;

		public function clearJingxuanCount():void {
			hasField$0 &= 0xffffffbf;
			jingxuan_count$field = new int();
		}

		public function get hasJingxuanCount():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set jingxuanCount(value:int):void {
			hasField$0 |= 0x40;
			jingxuan_count$field = value;
		}

		public function get jingxuanCount():int {
			return jingxuan_count$field;
		}

		/**
		 *  @private
		 */
		public static const FENJIE_XIDS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.ChoujiangS2C.fenjie_xids", "fenjieXids", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var fenjie_xids$field:String;

		public function clearFenjieXids():void {
			fenjie_xids$field = null;
		}

		public function get hasFenjieXids():Boolean {
			return fenjie_xids$field != null;
		}

		public function set fenjieXids(value:String):void {
			fenjie_xids$field = value;
		}

		public function get fenjieXids():String {
			return fenjie_xids$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasHaixuanFreshTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, haixuan_fresh_time$field);
			}
			if (hasJingxuanFreshTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, jingxuan_fresh_time$field);
			}
			if (hasHaixuanCards) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, haixuan_cards$field);
			}
			if (hasHaixuanChosenid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, haixuan_chosenid$field);
			}
			if (hasHaixuanLianxuanCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, haixuan_lianxuan_cost$field);
			}
			if (hasHaixuanShilian) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, haixuan_shilian$field);
			}
			if (hasJingxuanShilian) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, jingxuan_shilian$field);
			}
			if (hasJingxuanShilianCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, jingxuan_shilian_count$field);
			}
			if (hasJingxuanShilianCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, jingxuan_shilian_cost$field);
			}
			if (hasJingxuanCost) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, jingxuan_cost$field);
			}
			if (hasJingxuanXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, jingxuan_xid$field);
			}
			if (hasJingxuanCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, jingxuan_count$field);
			}
			if (hasFenjieXids) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, fenjie_xids$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var haixuan_fresh_time$count:uint = 0;
			var jingxuan_fresh_time$count:uint = 0;
			var haixuan_cards$count:uint = 0;
			var haixuan_chosenid$count:uint = 0;
			var haixuan_lianxuan_cost$count:uint = 0;
			var haixuan_shilian$count:uint = 0;
			var jingxuan_shilian$count:uint = 0;
			var jingxuan_shilian_count$count:uint = 0;
			var jingxuan_shilian_cost$count:uint = 0;
			var jingxuan_cost$count:uint = 0;
			var jingxuan_xid$count:uint = 0;
			var jingxuan_count$count:uint = 0;
			var fenjie_xids$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (haixuan_fresh_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChoujiangS2C.haixuanFreshTime cannot be set twice.');
					}
					++haixuan_fresh_time$count;
					this.haixuanFreshTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 2:
					if (jingxuan_fresh_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChoujiangS2C.jingxuanFreshTime cannot be set twice.');
					}
					++jingxuan_fresh_time$count;
					this.jingxuanFreshTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 3:
					if (haixuan_cards$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChoujiangS2C.haixuanCards cannot be set twice.');
					}
					++haixuan_cards$count;
					this.haixuanCards = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (haixuan_chosenid$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChoujiangS2C.haixuanChosenid cannot be set twice.');
					}
					++haixuan_chosenid$count;
					this.haixuanChosenid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (haixuan_lianxuan_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChoujiangS2C.haixuanLianxuanCost cannot be set twice.');
					}
					++haixuan_lianxuan_cost$count;
					this.haixuanLianxuanCost = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (haixuan_shilian$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChoujiangS2C.haixuanShilian cannot be set twice.');
					}
					++haixuan_shilian$count;
					this.haixuanShilian = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 7:
					if (jingxuan_shilian$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChoujiangS2C.jingxuanShilian cannot be set twice.');
					}
					++jingxuan_shilian$count;
					this.jingxuanShilian = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 8:
					if (jingxuan_shilian_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChoujiangS2C.jingxuanShilianCount cannot be set twice.');
					}
					++jingxuan_shilian_count$count;
					this.jingxuanShilianCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (jingxuan_shilian_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChoujiangS2C.jingxuanShilianCost cannot be set twice.');
					}
					++jingxuan_shilian_cost$count;
					this.jingxuanShilianCost = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (jingxuan_cost$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChoujiangS2C.jingxuanCost cannot be set twice.');
					}
					++jingxuan_cost$count;
					this.jingxuanCost = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (jingxuan_xid$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChoujiangS2C.jingxuanXid cannot be set twice.');
					}
					++jingxuan_xid$count;
					this.jingxuanXid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 12:
					if (jingxuan_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChoujiangS2C.jingxuanCount cannot be set twice.');
					}
					++jingxuan_count$count;
					this.jingxuanCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 13:
					if (fenjie_xids$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChoujiangS2C.fenjieXids cannot be set twice.');
					}
					++fenjie_xids$count;
					this.fenjieXids = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
