package com.mutou.tqt {
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
	public dynamic final class TaskInfoC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const REWARDXID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.TaskInfoC2S.rewardXid", "rewardXid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rewardXid$field:int;

		private var hasField$0:uint = 0;

		public function clearRewardXid():void {
			hasField$0 &= 0xfffffffe;
			rewardXid$field = new int();
		}

		public function get hasRewardXid():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set rewardXid(value:int):void {
			hasField$0 |= 0x1;
			rewardXid$field = value;
		}

		public function get rewardXid():int {
			return rewardXid$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRewardXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, rewardXid$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var rewardXid$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (rewardXid$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskInfoC2S.rewardXid cannot be set twice.');
					}
					++rewardXid$count;
					this.rewardXid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
