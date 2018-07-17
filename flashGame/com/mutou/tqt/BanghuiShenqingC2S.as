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
	public dynamic final class BanghuiShenqingC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ACCEPT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BanghuiShenqingC2S.accept", "accept", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var accept$field:int;

		private var hasField$0:uint = 0;

		public function clearAccept():void {
			hasField$0 &= 0xfffffffe;
			accept$field = new int();
		}

		public function get hasAccept():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set accept(value:int):void {
			hasField$0 |= 0x1;
			accept$field = value;
		}

		public function get accept():int {
			return accept$field;
		}

		/**
		 *  @private
		 */
		public static const USERID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BanghuiShenqingC2S.userId", "userId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var userId$field:int;

		public function clearUserId():void {
			hasField$0 &= 0xfffffffd;
			userId$field = new int();
		}

		public function get hasUserId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set userId(value:int):void {
			hasField$0 |= 0x2;
			userId$field = value;
		}

		public function get userId():int {
			return userId$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUIID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BanghuiShenqingC2S.banghuiId", "banghuiId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var banghuiId$field:int;

		public function clearBanghuiId():void {
			hasField$0 &= 0xfffffffb;
			banghuiId$field = new int();
		}

		public function get hasBanghuiId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set banghuiId(value:int):void {
			hasField$0 |= 0x4;
			banghuiId$field = value;
		}

		public function get banghuiId():int {
			return banghuiId$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAccept) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, accept$field);
			}
			if (hasUserId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, userId$field);
			}
			if (hasBanghuiId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
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
			var accept$count:uint = 0;
			var userId$count:uint = 0;
			var banghuiId$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (accept$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiShenqingC2S.accept cannot be set twice.');
					}
					++accept$count;
					this.accept = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (userId$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiShenqingC2S.userId cannot be set twice.');
					}
					++userId$count;
					this.userId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (banghuiId$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiShenqingC2S.banghuiId cannot be set twice.');
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
