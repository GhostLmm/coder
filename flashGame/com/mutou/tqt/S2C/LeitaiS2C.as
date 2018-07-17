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
	public dynamic final class LeitaiS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LENQUE_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.LeitaiS2C.lenque_time", "lenqueTime", (1 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var lenque_time$field:UInt64;

		public function clearLenqueTime():void {
			lenque_time$field = null;
		}

		public function get hasLenqueTime():Boolean {
			return lenque_time$field != null;
		}

		public function set lenqueTime(value:UInt64):void {
			lenque_time$field = value;
		}

		public function get lenqueTime():UInt64 {
			return lenque_time$field;
		}

		/**
		 *  @private
		 */
		public static const FAFANG_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.LeitaiS2C.fafang_time", "fafangTime", (2 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var fafang_time$field:UInt64;

		public function clearFafangTime():void {
			fafang_time$field = null;
		}

		public function get hasFafangTime():Boolean {
			return fafang_time$field != null;
		}

		public function set fafangTime(value:UInt64):void {
			fafang_time$field = value;
		}

		public function get fafangTime():UInt64 {
			return fafang_time$field;
		}

		/**
		 *  @private
		 */
		public static const MY_RANK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.LeitaiS2C.my_rank", "myRank", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var my_rank$field:int;

		private var hasField$0:uint = 0;

		public function clearMyRank():void {
			hasField$0 &= 0xfffffffe;
			my_rank$field = new int();
		}

		public function get hasMyRank():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set myRank(value:int):void {
			hasField$0 |= 0x1;
			my_rank$field = value;
		}

		public function get myRank():int {
			return my_rank$field;
		}

		/**
		 *  @private
		 */
		public static const TIAOZHAN_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.LeitaiS2C.tiaozhan_count", "tiaozhanCount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tiaozhan_count$field:int;

		public function clearTiaozhanCount():void {
			hasField$0 &= 0xfffffffd;
			tiaozhan_count$field = new int();
		}

		public function get hasTiaozhanCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set tiaozhanCount(value:int):void {
			hasField$0 |= 0x2;
			tiaozhan_count$field = value;
		}

		public function get tiaozhanCount():int {
			return tiaozhan_count$field;
		}

		/**
		 *  @private
		 */
		public static const LAST_RANK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.LeitaiS2C.last_rank", "lastRank", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var last_rank$field:int;

		public function clearLastRank():void {
			hasField$0 &= 0xfffffffb;
			last_rank$field = new int();
		}

		public function get hasLastRank():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set lastRank(value:int):void {
			hasField$0 |= 0x4;
			last_rank$field = value;
		}

		public function get lastRank():int {
			return last_rank$field;
		}

		/**
		 *  @private
		 */
		public static const BAOXIANG_STATUS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.LeitaiS2C.baoxiang_status", "baoxiangStatus", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var baoxiang_status$field:int;

		public function clearBaoxiangStatus():void {
			hasField$0 &= 0xfffffff7;
			baoxiang_status$field = new int();
		}

		public function get hasBaoxiangStatus():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set baoxiangStatus(value:int):void {
			hasField$0 |= 0x8;
			baoxiang_status$field = value;
		}

		public function get baoxiangStatus():int {
			return baoxiang_status$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLenqueTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, lenque_time$field);
			}
			if (hasFafangTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, fafang_time$field);
			}
			if (hasMyRank) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, my_rank$field);
			}
			if (hasTiaozhanCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, tiaozhan_count$field);
			}
			if (hasLastRank) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, last_rank$field);
			}
			if (hasBaoxiangStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, baoxiang_status$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var lenque_time$count:uint = 0;
			var fafang_time$count:uint = 0;
			var my_rank$count:uint = 0;
			var tiaozhan_count$count:uint = 0;
			var last_rank$count:uint = 0;
			var baoxiang_status$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (lenque_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaiS2C.lenqueTime cannot be set twice.');
					}
					++lenque_time$count;
					this.lenqueTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 2:
					if (fafang_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaiS2C.fafangTime cannot be set twice.');
					}
					++fafang_time$count;
					this.fafangTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 3:
					if (my_rank$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaiS2C.myRank cannot be set twice.');
					}
					++my_rank$count;
					this.myRank = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (tiaozhan_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaiS2C.tiaozhanCount cannot be set twice.');
					}
					++tiaozhan_count$count;
					this.tiaozhanCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (last_rank$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaiS2C.lastRank cannot be set twice.');
					}
					++last_rank$count;
					this.lastRank = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (baoxiang_status$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaiS2C.baoxiangStatus cannot be set twice.');
					}
					++baoxiang_status$count;
					this.baoxiangStatus = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
