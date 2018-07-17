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
	public dynamic final class ServerNoticeC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ZONEID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.ServerNoticeC2S.zoneId", "zoneId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var zoneId$field:int;

		private var hasField$0:uint = 0;

		public function clearZoneId():void {
			hasField$0 &= 0xfffffffe;
			zoneId$field = new int();
		}

		public function get hasZoneId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set zoneId(value:int):void {
			hasField$0 |= 0x1;
			zoneId$field = value;
		}

		public function get zoneId():int {
			return zoneId$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasZoneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, zoneId$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var zoneId$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (zoneId$count != 0) {
						throw new flash.errors.IOError('Bad data format: ServerNoticeC2S.zoneId cannot be set twice.');
					}
					++zoneId$count;
					this.zoneId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
