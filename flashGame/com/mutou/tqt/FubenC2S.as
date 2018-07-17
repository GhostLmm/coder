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
	public dynamic final class FubenC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const XID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.FubenC2S.xid", "xid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var xid$field:int;

		private var hasField$0:uint = 0;

		public function clearXid():void {
			hasField$0 &= 0xfffffffe;
			xid$field = new int();
		}

		public function get hasXid():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set xid(value:int):void {
			hasField$0 |= 0x1;
			xid$field = value;
		}

		public function get xid():int {
			return xid$field;
		}

		/**
		 *  @private
		 */
		public static const MAPID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.FubenC2S.mapId", "mapId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mapId$field:int;

		public function clearMapId():void {
			hasField$0 &= 0xfffffffd;
			mapId$field = new int();
		}

		public function get hasMapId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set mapId(value:int):void {
			hasField$0 |= 0x2;
			mapId$field = value;
		}

		public function get mapId():int {
			return mapId$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, xid$field);
			}
			if (hasMapId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, mapId$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var xid$count:uint = 0;
			var mapId$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (xid$count != 0) {
						throw new flash.errors.IOError('Bad data format: FubenC2S.xid cannot be set twice.');
					}
					++xid$count;
					this.xid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (mapId$count != 0) {
						throw new flash.errors.IOError('Bad data format: FubenC2S.mapId cannot be set twice.');
					}
					++mapId$count;
					this.mapId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
