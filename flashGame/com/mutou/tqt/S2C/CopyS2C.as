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
	public dynamic final class CopyS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const XID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.CopyS2C.xid", "xid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.CopyS2C.count", "count", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var count$field:int;

		public function clearCount():void {
			hasField$0 &= 0xfffffffd;
			count$field = new int();
		}

		public function get hasCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set count(value:int):void {
			hasField$0 |= 0x2;
			count$field = value;
		}

		public function get count():int {
			return count$field;
		}

		/**
		 *  @private
		 */
		public static const STATUS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.CopyS2C.status", "status", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var status$field:int;

		public function clearStatus():void {
			hasField$0 &= 0xfffffffb;
			status$field = new int();
		}

		public function get hasStatus():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set status(value:int):void {
			hasField$0 |= 0x4;
			status$field = value;
		}

		public function get status():int {
			return status$field;
		}

		/**
		 *  @private
		 */
		public static const MODIFY_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.CopyS2C.modify_type", "modifyType", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var modify_type$field:int;

		public function clearModifyType():void {
			hasField$0 &= 0xfffffff7;
			modify_type$field = new int();
		}

		public function get hasModifyType():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set modifyType(value:int):void {
			hasField$0 |= 0x8;
			modify_type$field = value;
		}

		public function get modifyType():int {
			return modify_type$field;
		}

		/**
		 *  @private
		 */
		public static const DROP_ITEM:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.CopyS2C.drop_item", "dropItem", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var drop_item$field:String;

		public function clearDropItem():void {
			drop_item$field = null;
		}

		public function get hasDropItem():Boolean {
			return drop_item$field != null;
		}

		public function set dropItem(value:String):void {
			drop_item$field = value;
		}

		public function get dropItem():String {
			return drop_item$field;
		}

		/**
		 *  @private
		 */
		public static const DROP_COLLECT_ITEMS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.CopyS2C.drop_collect_items", "dropCollectItems", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var drop_collect_items$field:String;

		public function clearDropCollectItems():void {
			drop_collect_items$field = null;
		}

		public function get hasDropCollectItems():Boolean {
			return drop_collect_items$field != null;
		}

		public function set dropCollectItems(value:String):void {
			drop_collect_items$field = value;
		}

		public function get dropCollectItems():String {
			return drop_collect_items$field;
		}

		/**
		 *  @private
		 */
		public static const STARS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.CopyS2C.stars", "stars", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var stars$field:String;

		public function clearStars():void {
			stars$field = null;
		}

		public function get hasStars():Boolean {
			return stars$field != null;
		}

		public function set stars(value:String):void {
			stars$field = value;
		}

		public function get stars():String {
			return stars$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, xid$field);
			}
			if (hasCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, count$field);
			}
			if (hasStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, status$field);
			}
			if (hasModifyType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, modify_type$field);
			}
			if (hasDropItem) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, drop_item$field);
			}
			if (hasDropCollectItems) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, drop_collect_items$field);
			}
			if (hasStars) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, stars$field);
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
			var count$count:uint = 0;
			var status$count:uint = 0;
			var modify_type$count:uint = 0;
			var drop_item$count:uint = 0;
			var drop_collect_items$count:uint = 0;
			var stars$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (xid$count != 0) {
						throw new flash.errors.IOError('Bad data format: CopyS2C.xid cannot be set twice.');
					}
					++xid$count;
					this.xid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (count$count != 0) {
						throw new flash.errors.IOError('Bad data format: CopyS2C.count cannot be set twice.');
					}
					++count$count;
					this.count = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (status$count != 0) {
						throw new flash.errors.IOError('Bad data format: CopyS2C.status cannot be set twice.');
					}
					++status$count;
					this.status = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (modify_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: CopyS2C.modifyType cannot be set twice.');
					}
					++modify_type$count;
					this.modifyType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (drop_item$count != 0) {
						throw new flash.errors.IOError('Bad data format: CopyS2C.dropItem cannot be set twice.');
					}
					++drop_item$count;
					this.dropItem = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (drop_collect_items$count != 0) {
						throw new flash.errors.IOError('Bad data format: CopyS2C.dropCollectItems cannot be set twice.');
					}
					++drop_collect_items$count;
					this.dropCollectItems = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 7:
					if (stars$count != 0) {
						throw new flash.errors.IOError('Bad data format: CopyS2C.stars cannot be set twice.');
					}
					++stars$count;
					this.stars = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
