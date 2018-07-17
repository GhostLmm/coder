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
	public dynamic final class BattleC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HEID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BattleC2S.heId", "heId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var heId$field:int;

		private var hasField$0:uint = 0;

		public function clearHeId():void {
			hasField$0 &= 0xfffffffe;
			heId$field = new int();
		}

		public function get hasHeId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set heId(value:int):void {
			hasField$0 |= 0x1;
			heId$field = value;
		}

		public function get heId():int {
			return heId$field;
		}

		/**
		 *  @private
		 */
		public static const MELOSEHP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BattleC2S.meLoseHp", "meLoseHp", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var meLoseHp$field:int;

		public function clearMeLoseHp():void {
			hasField$0 &= 0xfffffffd;
			meLoseHp$field = new int();
		}

		public function get hasMeLoseHp():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set meLoseHp(value:int):void {
			hasField$0 |= 0x2;
			meLoseHp$field = value;
		}

		public function get meLoseHp():int {
			return meLoseHp$field;
		}

		/**
		 *  @private
		 */
		public static const MEFIREDWAY:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("com.mutou.tqt.BattleC2S.meFiredWay", "meFiredWay", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var meFiredWay$field:Int64;

		public function clearMeFiredWay():void {
			meFiredWay$field = null;
		}

		public function get hasMeFiredWay():Boolean {
			return meFiredWay$field != null;
		}

		public function set meFiredWay(value:Int64):void {
			meFiredWay$field = value;
		}

		public function get meFiredWay():Int64 {
			return meFiredWay$field;
		}

		/**
		 *  @private
		 */
		public static const HEDEAD:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BattleC2S.heDead", "heDead", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var heDead$field:int;

		public function clearHeDead():void {
			hasField$0 &= 0xfffffffb;
			heDead$field = new int();
		}

		public function get hasHeDead():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set heDead(value:int):void {
			hasField$0 |= 0x4;
			heDead$field = value;
		}

		public function get heDead():int {
			return heDead$field;
		}

		/**
		 *  @private
		 */
		public static const HELOSEHP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BattleC2S.heLoseHp", "heLoseHp", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var heLoseHp$field:int;

		public function clearHeLoseHp():void {
			hasField$0 &= 0xfffffff7;
			heLoseHp$field = new int();
		}

		public function get hasHeLoseHp():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set heLoseHp(value:int):void {
			hasField$0 |= 0x8;
			heLoseHp$field = value;
		}

		public function get heLoseHp():int {
			return heLoseHp$field;
		}

		/**
		 *  @private
		 */
		public static const HEFIREDWAY:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("com.mutou.tqt.BattleC2S.heFiredWay", "heFiredWay", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var heFiredWay$field:Int64;

		public function clearHeFiredWay():void {
			heFiredWay$field = null;
		}

		public function get hasHeFiredWay():Boolean {
			return heFiredWay$field != null;
		}

		public function set heFiredWay(value:Int64):void {
			heFiredWay$field = value;
		}

		public function get heFiredWay():Int64 {
			return heFiredWay$field;
		}

		/**
		 *  @private
		 */
		public static const MEGUN:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("com.mutou.tqt.BattleC2S.meGun", "meGun", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var meGun$field:Int64;

		public function clearMeGun():void {
			meGun$field = null;
		}

		public function get hasMeGun():Boolean {
			return meGun$field != null;
		}

		public function set meGun(value:Int64):void {
			meGun$field = value;
		}

		public function get meGun():Int64 {
			return meGun$field;
		}

		/**
		 *  @private
		 */
		public static const HEGUN:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("com.mutou.tqt.BattleC2S.heGun", "heGun", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var heGun$field:Int64;

		public function clearHeGun():void {
			heGun$field = null;
		}

		public function get hasHeGun():Boolean {
			return heGun$field != null;
		}

		public function set heGun(value:Int64):void {
			heGun$field = value;
		}

		public function get heGun():Int64 {
			return heGun$field;
		}

		/**
		 *  @private
		 */
		public static const TIMEOUT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BattleC2S.timeOut", "timeOut", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var timeOut$field:int;

		public function clearTimeOut():void {
			hasField$0 &= 0xffffffef;
			timeOut$field = new int();
		}

		public function get hasTimeOut():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set timeOut(value:int):void {
			hasField$0 |= 0x10;
			timeOut$field = value;
		}

		public function get timeOut():int {
			return timeOut$field;
		}

		/**
		 *  @private
		 */
		public static const INFOID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("com.mutou.tqt.BattleC2S.infoId", "infoId", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var infoId$field:Int64;

		public function clearInfoId():void {
			infoId$field = null;
		}

		public function get hasInfoId():Boolean {
			return infoId$field != null;
		}

		public function set infoId(value:Int64):void {
			infoId$field = value;
		}

		public function get infoId():Int64 {
			return infoId$field;
		}

		/**
		 *  @private
		 */
		public static const RETREAT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BattleC2S.retreat", "retreat", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var retreat$field:int;

		public function clearRetreat():void {
			hasField$0 &= 0xffffffdf;
			retreat$field = new int();
		}

		public function get hasRetreat():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set retreat(value:int):void {
			hasField$0 |= 0x20;
			retreat$field = value;
		}

		public function get retreat():int {
			return retreat$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasHeId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, heId$field);
			}
			if (hasMeLoseHp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, meLoseHp$field);
			}
			if (hasMeFiredWay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, meFiredWay$field);
			}
			if (hasHeDead) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, heDead$field);
			}
			if (hasHeLoseHp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, heLoseHp$field);
			}
			if (hasHeFiredWay) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, heFiredWay$field);
			}
			if (hasMeGun) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, meGun$field);
			}
			if (hasHeGun) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, heGun$field);
			}
			if (hasTimeOut) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, timeOut$field);
			}
			if (hasInfoId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, infoId$field);
			}
			if (hasRetreat) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
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
			var heId$count:uint = 0;
			var meLoseHp$count:uint = 0;
			var meFiredWay$count:uint = 0;
			var heDead$count:uint = 0;
			var heLoseHp$count:uint = 0;
			var heFiredWay$count:uint = 0;
			var meGun$count:uint = 0;
			var heGun$count:uint = 0;
			var timeOut$count:uint = 0;
			var infoId$count:uint = 0;
			var retreat$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (heId$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleC2S.heId cannot be set twice.');
					}
					++heId$count;
					this.heId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (meLoseHp$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleC2S.meLoseHp cannot be set twice.');
					}
					++meLoseHp$count;
					this.meLoseHp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (meFiredWay$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleC2S.meFiredWay cannot be set twice.');
					}
					++meFiredWay$count;
					this.meFiredWay = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 4:
					if (heDead$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleC2S.heDead cannot be set twice.');
					}
					++heDead$count;
					this.heDead = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (heLoseHp$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleC2S.heLoseHp cannot be set twice.');
					}
					++heLoseHp$count;
					this.heLoseHp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (heFiredWay$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleC2S.heFiredWay cannot be set twice.');
					}
					++heFiredWay$count;
					this.heFiredWay = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 7:
					if (meGun$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleC2S.meGun cannot be set twice.');
					}
					++meGun$count;
					this.meGun = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 8:
					if (heGun$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleC2S.heGun cannot be set twice.');
					}
					++heGun$count;
					this.heGun = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 9:
					if (timeOut$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleC2S.timeOut cannot be set twice.');
					}
					++timeOut$count;
					this.timeOut = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (infoId$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleC2S.infoId cannot be set twice.');
					}
					++infoId$count;
					this.infoId = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 11:
					if (retreat$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleC2S.retreat cannot be set twice.');
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
