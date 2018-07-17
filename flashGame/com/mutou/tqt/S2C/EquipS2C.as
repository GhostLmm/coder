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
	public dynamic final class EquipS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("com.mutou.tqt.S2C.EquipS2C.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:Int64;

		public function clearId():void {
			id$field = null;
		}

		public function get hasId():Boolean {
			return id$field != null;
		}

		public function set id(value:Int64):void {
			id$field = value;
		}

		public function get id():Int64 {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const XID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.EquipS2C.xid", "xid", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.EquipS2C.level", "level", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffd;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x2;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const HERO_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.EquipS2C.hero_id", "heroId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hero_id$field:int;

		public function clearHeroId():void {
			hasField$0 &= 0xfffffffb;
			hero_id$field = new int();
		}

		public function get hasHeroId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set heroId(value:int):void {
			hasField$0 |= 0x4;
			hero_id$field = value;
		}

		public function get heroId():int {
			return hero_id$field;
		}

		/**
		 *  @private
		 */
		public static const MODIFY_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.EquipS2C.modify_type", "modifyType", (5 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const CREATE_TIME:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("com.mutou.tqt.S2C.EquipS2C.create_time", "createTime", (6 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var create_time$field:Number;

		public function clearCreateTime():void {
			hasField$0 &= 0xffffffef;
			create_time$field = new Number();
		}

		public function get hasCreateTime():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set createTime(value:Number):void {
			hasField$0 |= 0x10;
			create_time$field = value;
		}

		public function get createTime():Number {
			return create_time$field;
		}

		/**
		 *  @private
		 */
		public static const SHENZHUANG_XID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.EquipS2C.shenzhuang_xid", "shenzhuangXid", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var shenzhuang_xid$field:int;

		public function clearShenzhuangXid():void {
			hasField$0 &= 0xffffffdf;
			shenzhuang_xid$field = new int();
		}

		public function get hasShenzhuangXid():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set shenzhuangXid(value:int):void {
			hasField$0 |= 0x20;
			shenzhuang_xid$field = value;
		}

		public function get shenzhuangXid():int {
			return shenzhuang_xid$field;
		}

		/**
		 *  @private
		 */
		public static const SHENZHUANG_EXP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.EquipS2C.shenzhuang_exp", "shenzhuangExp", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var shenzhuang_exp$field:int;

		public function clearShenzhuangExp():void {
			hasField$0 &= 0xffffffbf;
			shenzhuang_exp$field = new int();
		}

		public function get hasShenzhuangExp():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set shenzhuangExp(value:int):void {
			hasField$0 |= 0x40;
			shenzhuang_exp$field = value;
		}

		public function get shenzhuangExp():int {
			return shenzhuang_exp$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, id$field);
			}
			if (hasXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, xid$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level$field);
			}
			if (hasHeroId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, hero_id$field);
			}
			if (hasModifyType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, modify_type$field);
			}
			if (hasCreateTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, create_time$field);
			}
			if (hasShenzhuangXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, shenzhuang_xid$field);
			}
			if (hasShenzhuangExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, shenzhuang_exp$field);
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
			var level$count:uint = 0;
			var hero_id$count:uint = 0;
			var modify_type$count:uint = 0;
			var create_time$count:uint = 0;
			var shenzhuang_xid$count:uint = 0;
			var shenzhuang_exp$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipS2C.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (xid$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipS2C.xid cannot be set twice.');
					}
					++xid$count;
					this.xid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipS2C.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (hero_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipS2C.heroId cannot be set twice.');
					}
					++hero_id$count;
					this.heroId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (modify_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipS2C.modifyType cannot be set twice.');
					}
					++modify_type$count;
					this.modifyType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (create_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipS2C.createTime cannot be set twice.');
					}
					++create_time$count;
					this.createTime = com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input);
					break;
				case 7:
					if (shenzhuang_xid$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipS2C.shenzhuangXid cannot be set twice.');
					}
					++shenzhuang_xid$count;
					this.shenzhuangXid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (shenzhuang_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipS2C.shenzhuangExp cannot be set twice.');
					}
					++shenzhuang_exp$count;
					this.shenzhuangExp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
