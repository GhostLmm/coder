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
	public dynamic final class JinkuangS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const OPT_LENGQUE_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.JinkuangS2C.opt_lengque_time", "optLengqueTime", (1 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var opt_lengque_time$field:UInt64;

		public function clearOptLengqueTime():void {
			opt_lengque_time$field = null;
		}

		public function get hasOptLengqueTime():Boolean {
			return opt_lengque_time$field != null;
		}

		public function set optLengqueTime(value:UInt64):void {
			opt_lengque_time$field = value;
		}

		public function get optLengqueTime():UInt64 {
			return opt_lengque_time$field;
		}

		/**
		 *  @private
		 */
		public static const LAST_LEITAI_RANK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.JinkuangS2C.last_leitai_rank", "lastLeitaiRank", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var last_leitai_rank$field:int;

		private var hasField$0:uint = 0;

		public function clearLastLeitaiRank():void {
			hasField$0 &= 0xfffffffe;
			last_leitai_rank$field = new int();
		}

		public function get hasLastLeitaiRank():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set lastLeitaiRank(value:int):void {
			hasField$0 |= 0x1;
			last_leitai_rank$field = value;
		}

		public function get lastLeitaiRank():int {
			return last_leitai_rank$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasOptLengqueTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, opt_lengque_time$field);
			}
			if (hasLastLeitaiRank) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, last_leitai_rank$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var opt_lengque_time$count:uint = 0;
			var last_leitai_rank$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (opt_lengque_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinkuangS2C.optLengqueTime cannot be set twice.');
					}
					++opt_lengque_time$count;
					this.optLengqueTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 2:
					if (last_leitai_rank$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinkuangS2C.lastLeitaiRank cannot be set twice.');
					}
					++last_leitai_rank$count;
					this.lastLeitaiRank = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
