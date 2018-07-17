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
	public dynamic final class BanghuiTirenC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const USERID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BanghuiTirenC2S.userId", "userId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var userId$field:int;

		private var hasField$0:uint = 0;

		public function clearUserId():void {
			hasField$0 &= 0xfffffffe;
			userId$field = new int();
		}

		public function get hasUserId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set userId(value:int):void {
			hasField$0 |= 0x1;
			userId$field = value;
		}

		public function get userId():int {
			return userId$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUIID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BanghuiTirenC2S.banghuiId", "banghuiId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var banghuiId$field:int;

		public function clearBanghuiId():void {
			hasField$0 &= 0xfffffffd;
			banghuiId$field = new int();
		}

		public function get hasBanghuiId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set banghuiId(value:int):void {
			hasField$0 |= 0x2;
			banghuiId$field = value;
		}

		public function get banghuiId():int {
			return banghuiId$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUserId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, userId$field);
			}
			if (hasBanghuiId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, banghuiId$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var userId$count:uint = 0;
			var banghuiId$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (userId$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiTirenC2S.userId cannot be set twice.');
					}
					++userId$count;
					this.userId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (banghuiId$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiTirenC2S.banghuiId cannot be set twice.');
					}
					++banghuiId$count;
					this.banghuiId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
