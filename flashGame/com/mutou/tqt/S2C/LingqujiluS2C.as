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
	public dynamic final class LingqujiluS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.LingqujiluS2C.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:int;

		private var hasField$0:uint = 0;

		public function clearId():void {
			hasField$0 &= 0xfffffffe;
			id$field = new int();
		}

		public function get hasId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set id(value:int):void {
			hasField$0 |= 0x1;
			id$field = value;
		}

		public function get id():int {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const LINGQU_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.LingqujiluS2C.lingqu_name", "lingquName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var lingqu_name$field:String;

		public function clearLingquName():void {
			lingqu_name$field = null;
		}

		public function get hasLingquName():Boolean {
			return lingqu_name$field != null;
		}

		public function set lingquName(value:String):void {
			lingqu_name$field = value;
		}

		public function get lingquName():String {
			return lingqu_name$field;
		}

		/**
		 *  @private
		 */
		public static const LINGQU_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.LingqujiluS2C.lingqu_count", "lingquCount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var lingqu_count$field:int;

		public function clearLingquCount():void {
			hasField$0 &= 0xfffffffd;
			lingqu_count$field = new int();
		}

		public function get hasLingquCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set lingquCount(value:int):void {
			hasField$0 |= 0x2;
			lingqu_count$field = value;
		}

		public function get lingquCount():int {
			return lingqu_count$field;
		}

		/**
		 *  @private
		 */
		public static const CHONGZHI_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.LingqujiluS2C.chongzhi_name", "chongzhiName", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var chongzhi_name$field:String;

		public function clearChongzhiName():void {
			chongzhi_name$field = null;
		}

		public function get hasChongzhiName():Boolean {
			return chongzhi_name$field != null;
		}

		public function set chongzhiName(value:String):void {
			chongzhi_name$field = value;
		}

		public function get chongzhiName():String {
			return chongzhi_name$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, id$field);
			}
			if (hasLingquName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, lingqu_name$field);
			}
			if (hasLingquCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, lingqu_count$field);
			}
			if (hasChongzhiName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, chongzhi_name$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var lingqu_name$count:uint = 0;
			var lingqu_count$count:uint = 0;
			var chongzhi_name$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: LingqujiluS2C.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (lingqu_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: LingqujiluS2C.lingquName cannot be set twice.');
					}
					++lingqu_name$count;
					this.lingquName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (lingqu_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: LingqujiluS2C.lingquCount cannot be set twice.');
					}
					++lingqu_count$count;
					this.lingquCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (chongzhi_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: LingqujiluS2C.chongzhiName cannot be set twice.');
					}
					++chongzhi_name$count;
					this.chongzhiName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
