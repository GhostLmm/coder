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
	public dynamic final class HeroS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HeroS2C.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const XID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HeroS2C.xid", "xid", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HeroS2C.level", "level", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffb;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x4;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const EXP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HeroS2C.exp", "exp", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var exp$field:int;

		public function clearExp():void {
			hasField$0 &= 0xfffffff7;
			exp$field = new int();
		}

		public function get hasExp():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set exp(value:int):void {
			hasField$0 |= 0x8;
			exp$field = value;
		}

		public function get exp():int {
			return exp$field;
		}

		/**
		 *  @private
		 */
		public static const HEROTYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HeroS2C.herotype", "herotype", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var herotype$field:int;

		public function clearHerotype():void {
			hasField$0 &= 0xffffffef;
			herotype$field = new int();
		}

		public function get hasHerotype():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set herotype(value:int):void {
			hasField$0 |= 0x10;
			herotype$field = value;
		}

		public function get herotype():int {
			return herotype$field;
		}

		/**
		 *  @private
		 */
		public static const GUN_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.HeroS2C.gun_id", "gunId", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gun_id$field:int;

		public function clearGunId():void {
			hasField$0 &= 0xffffffdf;
			gun_id$field = new int();
		}

		public function get hasGunId():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set gunId(value:int):void {
			hasField$0 |= 0x20;
			gun_id$field = value;
		}

		public function get gunId():int {
			return gun_id$field;
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
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level$field);
			}
			if (hasExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, exp$field);
			}
			if (hasHerotype) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, herotype$field);
			}
			if (hasGunId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, gun_id$field);
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
			var exp$count:uint = 0;
			var herotype$count:uint = 0;
			var gun_id$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroS2C.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (xid$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroS2C.xid cannot be set twice.');
					}
					++xid$count;
					this.xid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroS2C.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroS2C.exp cannot be set twice.');
					}
					++exp$count;
					this.exp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (herotype$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroS2C.herotype cannot be set twice.');
					}
					++herotype$count;
					this.herotype = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (gun_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroS2C.gunId cannot be set twice.');
					}
					++gun_id$count;
					this.gunId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
