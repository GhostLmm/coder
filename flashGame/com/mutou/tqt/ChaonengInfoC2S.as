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
	public dynamic final class ChaonengInfoC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CHAONENGXID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.ChaonengInfoC2S.chaonengXid", "chaonengXid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chaonengXid$field:int;

		private var hasField$0:uint = 0;

		public function clearChaonengXid():void {
			hasField$0 &= 0xfffffffe;
			chaonengXid$field = new int();
		}

		public function get hasChaonengXid():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set chaonengXid(value:int):void {
			hasField$0 |= 0x1;
			chaonengXid$field = value;
		}

		public function get chaonengXid():int {
			return chaonengXid$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasChaonengXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, chaonengXid$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var chaonengXid$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (chaonengXid$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChaonengInfoC2S.chaonengXid cannot be set twice.');
					}
					++chaonengXid$count;
					this.chaonengXid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
