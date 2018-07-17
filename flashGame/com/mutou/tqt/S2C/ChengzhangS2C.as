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
	public dynamic final class ChengzhangS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HAS_GOUMAI:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ChengzhangS2C.has_goumai", "hasGoumai", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var has_goumai$field:int;

		private var hasField$0:uint = 0;

		public function clearHasGoumai():void {
			hasField$0 &= 0xfffffffe;
			has_goumai$field = new int();
		}

		public function get hasHasGoumai():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set hasGoumai(value:int):void {
			hasField$0 |= 0x1;
			has_goumai$field = value;
		}

		public function get hasGoumai():int {
			return has_goumai$field;
		}

		/**
		 *  @private
		 */
		public static const LINGQU_MSG:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.ChengzhangS2C.lingqu_msg", "lingquMsg", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var lingqu_msg$field:String;

		public function clearLingquMsg():void {
			lingqu_msg$field = null;
		}

		public function get hasLingquMsg():Boolean {
			return lingqu_msg$field != null;
		}

		public function set lingquMsg(value:String):void {
			lingqu_msg$field = value;
		}

		public function get lingquMsg():String {
			return lingqu_msg$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasHasGoumai) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, has_goumai$field);
			}
			if (hasLingquMsg) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, lingqu_msg$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var has_goumai$count:uint = 0;
			var lingqu_msg$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (has_goumai$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChengzhangS2C.hasGoumai cannot be set twice.');
					}
					++has_goumai$count;
					this.hasGoumai = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (lingqu_msg$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChengzhangS2C.lingquMsg cannot be set twice.');
					}
					++lingqu_msg$count;
					this.lingquMsg = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
