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
	public dynamic final class HuodongS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LINQU_NOON_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongS2C.linqu_noon_count", "linquNoonCount", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var linqu_noon_count$field:int;

		private var hasField$0:uint = 0;

		public function clearLinquNoonCount():void {
			hasField$0 &= 0xfffffffe;
			linqu_noon_count$field = new int();
		}

		public function get hasLinquNoonCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set linquNoonCount(value:int):void {
			hasField$0 |= 0x1;
			linqu_noon_count$field = value;
		}

		public function get linquNoonCount():int {
			return linqu_noon_count$field;
		}

		/**
		 *  @private
		 */
		public static const LINQU_AFTERNOON_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongS2C.linqu_afternoon_count", "linquAfternoonCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var linqu_afternoon_count$field:int;

		public function clearLinquAfternoonCount():void {
			hasField$0 &= 0xfffffffd;
			linqu_afternoon_count$field = new int();
		}

		public function get hasLinquAfternoonCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set linquAfternoonCount(value:int):void {
			hasField$0 |= 0x2;
			linqu_afternoon_count$field = value;
		}

		public function get linquAfternoonCount():int {
			return linqu_afternoon_count$field;
		}

		/**
		 *  @private
		 */
		public static const CANBAI_XID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongS2C.canbai_xid", "canbaiXid", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var canbai_xid$field:int;

		public function clearCanbaiXid():void {
			hasField$0 &= 0xfffffffb;
			canbai_xid$field = new int();
		}

		public function get hasCanbaiXid():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set canbaiXid(value:int):void {
			hasField$0 |= 0x4;
			canbai_xid$field = value;
		}

		public function get canbaiXid():int {
			return canbai_xid$field;
		}

		/**
		 *  @private
		 */
		public static const CANBAI_DAY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongS2C.canbai_day", "canbaiDay", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var canbai_day$field:int;

		public function clearCanbaiDay():void {
			hasField$0 &= 0xfffffff7;
			canbai_day$field = new int();
		}

		public function get hasCanbaiDay():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set canbaiDay(value:int):void {
			hasField$0 |= 0x8;
			canbai_day$field = value;
		}

		public function get canbaiDay():int {
			return canbai_day$field;
		}

		/**
		 *  @private
		 */
		public static const CANBAI_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.HuodongS2C.canbai_time", "canbaiTime", (5 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var canbai_time$field:UInt64;

		public function clearCanbaiTime():void {
			canbai_time$field = null;
		}

		public function get hasCanbaiTime():Boolean {
			return canbai_time$field != null;
		}

		public function set canbaiTime(value:UInt64):void {
			canbai_time$field = value;
		}

		public function get canbaiTime():UInt64 {
			return canbai_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLinquNoonCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, linqu_noon_count$field);
			}
			if (hasLinquAfternoonCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, linqu_afternoon_count$field);
			}
			if (hasCanbaiXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, canbai_xid$field);
			}
			if (hasCanbaiDay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, canbai_day$field);
			}
			if (hasCanbaiTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, canbai_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var linqu_noon_count$count:uint = 0;
			var linqu_afternoon_count$count:uint = 0;
			var canbai_xid$count:uint = 0;
			var canbai_day$count:uint = 0;
			var canbai_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (linqu_noon_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongS2C.linquNoonCount cannot be set twice.');
					}
					++linqu_noon_count$count;
					this.linquNoonCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (linqu_afternoon_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongS2C.linquAfternoonCount cannot be set twice.');
					}
					++linqu_afternoon_count$count;
					this.linquAfternoonCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (canbai_xid$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongS2C.canbaiXid cannot be set twice.');
					}
					++canbai_xid$count;
					this.canbaiXid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (canbai_day$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongS2C.canbaiDay cannot be set twice.');
					}
					++canbai_day$count;
					this.canbaiDay = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (canbai_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongS2C.canbaiTime cannot be set twice.');
					}
					++canbai_time$count;
					this.canbaiTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
