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
	public dynamic final class TongzhiS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.TongzhiS2C.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const XID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.TongzhiS2C.xid", "xid", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var xid$field:int;

		public function clearXid():void {
			hasField$0 &= 0xfffffffd;
			xid$field = new int();
		}

		public function get hasXid():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set xid(value:int):void {
			hasField$0 |= 0x2;
			xid$field = value;
		}

		public function get xid():int {
			return xid$field;
		}

		/**
		 *  @private
		 */
		public static const ARGS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.TongzhiS2C.args", "args", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var args$field:String;

		public function clearArgs():void {
			args$field = null;
		}

		public function get hasArgs():Boolean {
			return args$field != null;
		}

		public function set args(value:String):void {
			args$field = value;
		}

		public function get args():String {
			return args$field;
		}

		/**
		 *  @private
		 */
		public static const SPECIAL_DESC:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.TongzhiS2C.special_desc", "specialDesc", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var special_desc$field:String;

		public function clearSpecialDesc():void {
			special_desc$field = null;
		}

		public function get hasSpecialDesc():Boolean {
			return special_desc$field != null;
		}

		public function set specialDesc(value:String):void {
			special_desc$field = value;
		}

		public function get specialDesc():String {
			return special_desc$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, id$field);
			}
			if (hasXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, xid$field);
			}
			if (hasArgs) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, args$field);
			}
			if (hasSpecialDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, special_desc$field);
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
			var xid$count:uint = 0;
			var args$count:uint = 0;
			var special_desc$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: TongzhiS2C.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (xid$count != 0) {
						throw new flash.errors.IOError('Bad data format: TongzhiS2C.xid cannot be set twice.');
					}
					++xid$count;
					this.xid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (args$count != 0) {
						throw new flash.errors.IOError('Bad data format: TongzhiS2C.args cannot be set twice.');
					}
					++args$count;
					this.args = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (special_desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: TongzhiS2C.specialDesc cannot be set twice.');
					}
					++special_desc$count;
					this.specialDesc = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
