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
	public dynamic final class ItemC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const XID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.ItemC2S.xid", "xid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var xid$field:int;

		private var hasField$0:uint = 0;

		public function clearXid():void {
			hasField$0 &= 0xfffffffe;
			xid$field = new int();
		}

		public function get hasXid():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set xid(value:int):void {
			hasField$0 |= 0x1;
			xid$field = value;
		}

		public function get xid():int {
			return xid$field;
		}

		/**
		 *  @private
		 */
		public static const NUM:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.ItemC2S.num", "num", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var num$field:int;

		public function clearNum():void {
			hasField$0 &= 0xfffffffd;
			num$field = new int();
		}

		public function get hasNum():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set num(value:int):void {
			hasField$0 |= 0x2;
			num$field = value;
		}

		public function get num():int {
			return num$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, xid$field);
			}
			if (hasNum) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, num$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var xid$count:uint = 0;
			var num$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (xid$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemC2S.xid cannot be set twice.');
					}
					++xid$count;
					this.xid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (num$count != 0) {
						throw new flash.errors.IOError('Bad data format: ItemC2S.num cannot be set twice.');
					}
					++num$count;
					this.num = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
