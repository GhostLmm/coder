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
	public dynamic final class BanghuizhandetailS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BanghuizhandetailS2C.tid", "tid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var tid$field:int;

		private var hasField$0:uint = 0;

		public function clearTid():void {
			hasField$0 &= 0xfffffffe;
			tid$field = new int();
		}

		public function get hasTid():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set tid(value:int):void {
			hasField$0 |= 0x1;
			tid$field = value;
		}

		public function get tid():int {
			return tid$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUI_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.BanghuizhandetailS2C.banghui_name", "banghuiName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var banghui_name$field:String;

		public function clearBanghuiName():void {
			banghui_name$field = null;
		}

		public function get hasBanghuiName():Boolean {
			return banghui_name$field != null;
		}

		public function set banghuiName(value:String):void {
			banghui_name$field = value;
		}

		public function get banghuiName():String {
			return banghui_name$field;
		}

		/**
		 *  @private
		 */
		public static const ORDER:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BanghuizhandetailS2C.order", "order", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var order$field:int;

		public function clearOrder():void {
			hasField$0 &= 0xfffffffd;
			order$field = new int();
		}

		public function get hasOrder():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set order(value:int):void {
			hasField$0 |= 0x2;
			order$field = value;
		}

		public function get order():int {
			return order$field;
		}

		/**
		 *  @private
		 */
		public static const RESULT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BanghuizhandetailS2C.result", "result", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var result$field:int;

		public function clearResult():void {
			hasField$0 &= 0xfffffffb;
			result$field = new int();
		}

		public function get hasResult():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set result(value:int):void {
			hasField$0 |= 0x4;
			result$field = value;
		}

		public function get result():int {
			return result$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, tid$field);
			}
			if (hasBanghuiName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, banghui_name$field);
			}
			if (hasOrder) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, order$field);
			}
			if (hasResult) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, result$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var tid$count:uint = 0;
			var banghui_name$count:uint = 0;
			var order$count:uint = 0;
			var result$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (tid$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuizhandetailS2C.tid cannot be set twice.');
					}
					++tid$count;
					this.tid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (banghui_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuizhandetailS2C.banghuiName cannot be set twice.');
					}
					++banghui_name$count;
					this.banghuiName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (order$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuizhandetailS2C.order cannot be set twice.');
					}
					++order$count;
					this.order = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (result$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuizhandetailS2C.result cannot be set twice.');
					}
					++result$count;
					this.result = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
