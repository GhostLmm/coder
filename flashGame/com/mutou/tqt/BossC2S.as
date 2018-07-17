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
	public dynamic final class BossC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const XID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BossC2S.xid", "xid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const GUWUTYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BossC2S.guwuType", "guwuType", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guwuType$field:int;

		public function clearGuwuType():void {
			hasField$0 &= 0xfffffffd;
			guwuType$field = new int();
		}

		public function get hasGuwuType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set guwuType(value:int):void {
			hasField$0 |= 0x2;
			guwuType$field = value;
		}

		public function get guwuType():int {
			return guwuType$field;
		}

		/**
		 *  @private
		 */
		public static const XIDLIST:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.BossC2S.xidList", "xidList", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var xidList$field:String;

		public function clearXidList():void {
			xidList$field = null;
		}

		public function get hasXidList():Boolean {
			return xidList$field != null;
		}

		public function set xidList(value:String):void {
			xidList$field = value;
		}

		public function get xidList():String {
			return xidList$field;
		}

		/**
		 *  @private
		 */
		public static const ZONEID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BossC2S.zoneId", "zoneId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var zoneId$field:int;

		public function clearZoneId():void {
			hasField$0 &= 0xfffffffb;
			zoneId$field = new int();
		}

		public function get hasZoneId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set zoneId(value:int):void {
			hasField$0 |= 0x4;
			zoneId$field = value;
		}

		public function get zoneId():int {
			return zoneId$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, xid$field);
			}
			if (hasGuwuType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, guwuType$field);
			}
			if (hasXidList) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, xidList$field);
			}
			if (hasZoneId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, zoneId$field);
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
			var guwuType$count:uint = 0;
			var xidList$count:uint = 0;
			var zoneId$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (xid$count != 0) {
						throw new flash.errors.IOError('Bad data format: BossC2S.xid cannot be set twice.');
					}
					++xid$count;
					this.xid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (guwuType$count != 0) {
						throw new flash.errors.IOError('Bad data format: BossC2S.guwuType cannot be set twice.');
					}
					++guwuType$count;
					this.guwuType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (xidList$count != 0) {
						throw new flash.errors.IOError('Bad data format: BossC2S.xidList cannot be set twice.');
					}
					++xidList$count;
					this.xidList = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (zoneId$count != 0) {
						throw new flash.errors.IOError('Bad data format: BossC2S.zoneId cannot be set twice.');
					}
					++zoneId$count;
					this.zoneId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
