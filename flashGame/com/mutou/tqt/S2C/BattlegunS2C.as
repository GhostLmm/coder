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
	public dynamic final class BattlegunS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.BattlegunS2C.id", "id", (1 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var id$field:UInt64;

		public function clearId():void {
			id$field = null;
		}

		public function get hasId():Boolean {
			return id$field != null;
		}

		public function set id(value:UInt64):void {
			id$field = value;
		}

		public function get id():UInt64 {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const XID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattlegunS2C.xid", "xid", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const HP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattlegunS2C.hp", "hp", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hp$field:int;

		public function clearHp():void {
			hasField$0 &= 0xfffffffd;
			hp$field = new int();
		}

		public function get hasHp():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set hp(value:int):void {
			hasField$0 |= 0x2;
			hp$field = value;
		}

		public function get hp():int {
			return hp$field;
		}

		/**
		 *  @private
		 */
		public static const ATK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattlegunS2C.atk", "atk", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var atk$field:int;

		public function clearAtk():void {
			hasField$0 &= 0xfffffffb;
			atk$field = new int();
		}

		public function get hasAtk():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set atk(value:int):void {
			hasField$0 |= 0x4;
			atk$field = value;
		}

		public function get atk():int {
			return atk$field;
		}

		/**
		 *  @private
		 */
		public static const DEF:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattlegunS2C.def", "def", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var def$field:int;

		public function clearDef():void {
			hasField$0 &= 0xfffffff7;
			def$field = new int();
		}

		public function get hasDef():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set def(value:int):void {
			hasField$0 |= 0x8;
			def$field = value;
		}

		public function get def():int {
			return def$field;
		}

		/**
		 *  @private
		 */
		public static const SPEED:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattlegunS2C.speed", "speed", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var speed$field:int;

		public function clearSpeed():void {
			hasField$0 &= 0xffffffef;
			speed$field = new int();
		}

		public function get hasSpeed():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set speed(value:int):void {
			hasField$0 |= 0x10;
			speed$field = value;
		}

		public function get speed():int {
			return speed$field;
		}

		/**
		 *  @private
		 */
		public static const CRI:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattlegunS2C.cri", "cri", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cri$field:int;

		public function clearCri():void {
			hasField$0 &= 0xffffffdf;
			cri$field = new int();
		}

		public function get hasCri():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set cri(value:int):void {
			hasField$0 |= 0x20;
			cri$field = value;
		}

		public function get cri():int {
			return cri$field;
		}

		/**
		 *  @private
		 */
		public static const RENXING:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattlegunS2C.renxing", "renxing", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var renxing$field:int;

		public function clearRenxing():void {
			hasField$0 &= 0xffffffbf;
			renxing$field = new int();
		}

		public function get hasRenxing():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set renxing(value:int):void {
			hasField$0 |= 0x40;
			renxing$field = value;
		}

		public function get renxing():int {
			return renxing$field;
		}

		/**
		 *  @private
		 */
		public static const HIT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattlegunS2C.hit", "hit", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hit$field:int;

		public function clearHit():void {
			hasField$0 &= 0xffffff7f;
			hit$field = new int();
		}

		public function get hasHit():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set hit(value:int):void {
			hasField$0 |= 0x80;
			hit$field = value;
		}

		public function get hit():int {
			return hit$field;
		}

		/**
		 *  @private
		 */
		public static const EVA:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattlegunS2C.eva", "eva", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var eva$field:int;

		public function clearEva():void {
			hasField$0 &= 0xfffffeff;
			eva$field = new int();
		}

		public function get hasEva():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set eva(value:int):void {
			hasField$0 |= 0x100;
			eva$field = value;
		}

		public function get eva():int {
			return eva$field;
		}

		/**
		 *  @private
		 */
		public static const HEROID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattlegunS2C.heroid", "heroid", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var heroid$field:int;

		public function clearHeroid():void {
			hasField$0 &= 0xfffffdff;
			heroid$field = new int();
		}

		public function get hasHeroid():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set heroid(value:int):void {
			hasField$0 |= 0x200;
			heroid$field = value;
		}

		public function get heroid():int {
			return heroid$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, id$field);
			}
			if (hasXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, xid$field);
			}
			if (hasHp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, hp$field);
			}
			if (hasAtk) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, atk$field);
			}
			if (hasDef) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, def$field);
			}
			if (hasSpeed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, speed$field);
			}
			if (hasCri) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cri$field);
			}
			if (hasRenxing) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, renxing$field);
			}
			if (hasHit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, hit$field);
			}
			if (hasEva) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, eva$field);
			}
			if (hasHeroid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, heroid$field);
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
			var hp$count:uint = 0;
			var atk$count:uint = 0;
			var def$count:uint = 0;
			var speed$count:uint = 0;
			var cri$count:uint = 0;
			var renxing$count:uint = 0;
			var hit$count:uint = 0;
			var eva$count:uint = 0;
			var heroid$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattlegunS2C.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 2:
					if (xid$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattlegunS2C.xid cannot be set twice.');
					}
					++xid$count;
					this.xid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (hp$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattlegunS2C.hp cannot be set twice.');
					}
					++hp$count;
					this.hp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (atk$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattlegunS2C.atk cannot be set twice.');
					}
					++atk$count;
					this.atk = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (def$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattlegunS2C.def cannot be set twice.');
					}
					++def$count;
					this.def = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (speed$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattlegunS2C.speed cannot be set twice.');
					}
					++speed$count;
					this.speed = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (cri$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattlegunS2C.cri cannot be set twice.');
					}
					++cri$count;
					this.cri = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (renxing$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattlegunS2C.renxing cannot be set twice.');
					}
					++renxing$count;
					this.renxing = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (hit$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattlegunS2C.hit cannot be set twice.');
					}
					++hit$count;
					this.hit = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (eva$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattlegunS2C.eva cannot be set twice.');
					}
					++eva$count;
					this.eva = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (heroid$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattlegunS2C.heroid cannot be set twice.');
					}
					++heroid$count;
					this.heroid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
