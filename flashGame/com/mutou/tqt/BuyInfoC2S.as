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
	public dynamic final class BuyInfoC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TUNAGOUID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BuyInfoC2S.tunagouId", "tunagouId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tunagouId$field:int;

		private var hasField$0:uint = 0;

		public function clearTunagouId():void {
			hasField$0 &= 0xfffffffe;
			tunagouId$field = new int();
		}

		public function get hasTunagouId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set tunagouId(value:int):void {
			hasField$0 |= 0x1;
			tunagouId$field = value;
		}

		public function get tunagouId():int {
			return tunagouId$field;
		}

		/**
		 *  @private
		 */
		public static const HEIDIANID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BuyInfoC2S.heidianId", "heidianId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var heidianId$field:int;

		public function clearHeidianId():void {
			hasField$0 &= 0xfffffffd;
			heidianId$field = new int();
		}

		public function get hasHeidianId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set heidianId(value:int):void {
			hasField$0 |= 0x2;
			heidianId$field = value;
		}

		public function get heidianId():int {
			return heidianId$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTunagouId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, tunagouId$field);
			}
			if (hasHeidianId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, heidianId$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var tunagouId$count:uint = 0;
			var heidianId$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (tunagouId$count != 0) {
						throw new flash.errors.IOError('Bad data format: BuyInfoC2S.tunagouId cannot be set twice.');
					}
					++tunagouId$count;
					this.tunagouId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (heidianId$count != 0) {
						throw new flash.errors.IOError('Bad data format: BuyInfoC2S.heidianId cannot be set twice.');
					}
					++heidianId$count;
					this.heidianId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
