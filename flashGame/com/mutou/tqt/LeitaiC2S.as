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
	public dynamic final class LeitaiC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const USERID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.LeitaiC2S.userId", "userId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const RANK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.LeitaiC2S.rank", "rank", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rank$field:int;

		public function clearRank():void {
			hasField$0 &= 0xfffffffd;
			rank$field = new int();
		}

		public function get hasRank():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set rank(value:int):void {
			hasField$0 |= 0x2;
			rank$field = value;
		}

		public function get rank():int {
			return rank$field;
		}

		/**
		 *  @private
		 */
		public static const USECASH:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.LeitaiC2S.useCash", "useCash", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var useCash$field:int;

		public function clearUseCash():void {
			hasField$0 &= 0xfffffffb;
			useCash$field = new int();
		}

		public function get hasUseCash():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set useCash(value:int):void {
			hasField$0 |= 0x4;
			useCash$field = value;
		}

		public function get useCash():int {
			return useCash$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUserId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, userId$field);
			}
			if (hasRank) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, rank$field);
			}
			if (hasUseCash) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, useCash$field);
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
			var rank$count:uint = 0;
			var useCash$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (userId$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaiC2S.userId cannot be set twice.');
					}
					++userId$count;
					this.userId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (rank$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaiC2S.rank cannot be set twice.');
					}
					++rank$count;
					this.rank = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (useCash$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaiC2S.useCash cannot be set twice.');
					}
					++useCash$count;
					this.useCash = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
