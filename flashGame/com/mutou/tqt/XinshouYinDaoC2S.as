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
	public dynamic final class XinshouYinDaoC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const STEP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.XinshouYinDaoC2S.step", "step", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var step$field:int;

		private var hasField$0:uint = 0;

		public function clearStep():void {
			hasField$0 &= 0xfffffffe;
			step$field = new int();
		}

		public function get hasStep():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set step(value:int):void {
			hasField$0 |= 0x1;
			step$field = value;
		}

		public function get step():int {
			return step$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasStep) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, step$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var step$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (step$count != 0) {
						throw new flash.errors.IOError('Bad data format: XinshouYinDaoC2S.step cannot be set twice.');
					}
					++step$count;
					this.step = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
