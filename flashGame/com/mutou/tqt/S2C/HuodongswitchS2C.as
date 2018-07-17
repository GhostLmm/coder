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
	public dynamic final class HuodongswitchS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const START_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.HuodongswitchS2C.start_time", "startTime", (1 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var start_time$field:UInt64;

		public function clearStartTime():void {
			start_time$field = null;
		}

		public function get hasStartTime():Boolean {
			return start_time$field != null;
		}

		public function set startTime(value:UInt64):void {
			start_time$field = value;
		}

		public function get startTime():UInt64 {
			return start_time$field;
		}

		/**
		 *  @private
		 */
		public static const END_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.HuodongswitchS2C.end_time", "endTime", (2 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var end_time$field:UInt64;

		public function clearEndTime():void {
			end_time$field = null;
		}

		public function get hasEndTime():Boolean {
			return end_time$field != null;
		}

		public function set endTime(value:UInt64):void {
			end_time$field = value;
		}

		public function get endTime():UInt64 {
			return end_time$field;
		}

		/**
		 *  @private
		 */
		public static const HUODONG_FLAG:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongswitchS2C.huodong_flag", "huodongFlag", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var huodong_flag$field:int;

		private var hasField$0:uint = 0;

		public function clearHuodongFlag():void {
			hasField$0 &= 0xfffffffe;
			huodong_flag$field = new int();
		}

		public function get hasHuodongFlag():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set huodongFlag(value:int):void {
			hasField$0 |= 0x1;
			huodong_flag$field = value;
		}

		public function get huodongFlag():int {
			return huodong_flag$field;
		}

		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HuodongswitchS2C.id", "id", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:int;

		public function clearId():void {
			hasField$0 &= 0xfffffffd;
			id$field = new int();
		}

		public function get hasId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set id(value:int):void {
			hasField$0 |= 0x2;
			id$field = value;
		}

		public function get id():int {
			return id$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasStartTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, start_time$field);
			}
			if (hasEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, end_time$field);
			}
			if (hasHuodongFlag) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, huodong_flag$field);
			}
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, id$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var start_time$count:uint = 0;
			var end_time$count:uint = 0;
			var huodong_flag$count:uint = 0;
			var id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (start_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongswitchS2C.startTime cannot be set twice.');
					}
					++start_time$count;
					this.startTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 2:
					if (end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongswitchS2C.endTime cannot be set twice.');
					}
					++end_time$count;
					this.endTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 3:
					if (huodong_flag$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongswitchS2C.huodongFlag cannot be set twice.');
					}
					++huodong_flag$count;
					this.huodongFlag = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: HuodongswitchS2C.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
