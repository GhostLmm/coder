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
	public dynamic final class JinKuangInfoC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.JinKuangInfoC2S.type", "type", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var type$field:int;

		private var hasField$0:uint = 0;

		public function clearType():void {
			hasField$0 &= 0xfffffffe;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x1;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		public static const KUANGXID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.JinKuangInfoC2S.kuangXid", "kuangXid", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var kuangXid$field:int;

		public function clearKuangXid():void {
			hasField$0 &= 0xfffffffd;
			kuangXid$field = new int();
		}

		public function get hasKuangXid():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set kuangXid(value:int):void {
			hasField$0 |= 0x2;
			kuangXid$field = value;
		}

		public function get kuangXid():int {
			return kuangXid$field;
		}

		/**
		 *  @private
		 */
		public static const INFOID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.JinKuangInfoC2S.infoId", "infoId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var infoId$field:int;

		public function clearInfoId():void {
			hasField$0 &= 0xfffffffb;
			infoId$field = new int();
		}

		public function get hasInfoId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set infoId(value:int):void {
			hasField$0 |= 0x4;
			infoId$field = value;
		}

		public function get infoId():int {
			return infoId$field;
		}

		/**
		 *  @private
		 */
		public static const RETREAT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.JinKuangInfoC2S.retreat", "retreat", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var retreat$field:int;

		public function clearRetreat():void {
			hasField$0 &= 0xfffffff7;
			retreat$field = new int();
		}

		public function get hasRetreat():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set retreat(value:int):void {
			hasField$0 |= 0x8;
			retreat$field = value;
		}

		public function get retreat():int {
			return retreat$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, type$field);
			}
			if (hasKuangXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, kuangXid$field);
			}
			if (hasInfoId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, infoId$field);
			}
			if (hasRetreat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, retreat$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var type$count:uint = 0;
			var kuangXid$count:uint = 0;
			var infoId$count:uint = 0;
			var retreat$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinKuangInfoC2S.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (kuangXid$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinKuangInfoC2S.kuangXid cannot be set twice.');
					}
					++kuangXid$count;
					this.kuangXid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (infoId$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinKuangInfoC2S.infoId cannot be set twice.');
					}
					++infoId$count;
					this.infoId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (retreat$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinKuangInfoC2S.retreat cannot be set twice.');
					}
					++retreat$count;
					this.retreat = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
