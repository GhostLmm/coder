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
	public dynamic final class DiginfoS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DROP_ITEMS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.DiginfoS2C.drop_items", "dropItems", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var drop_items$field:String;

		public function clearDropItems():void {
			drop_items$field = null;
		}

		public function get hasDropItems():Boolean {
			return drop_items$field != null;
		}

		public function set dropItems(value:String):void {
			drop_items$field = value;
		}

		public function get dropItems():String {
			return drop_items$field;
		}

		/**
		 *  @private
		 */
		public static const HAS_DIGINIT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.DiginfoS2C.has_diginit", "hasDiginit", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var has_diginit$field:int;

		private var hasField$0:uint = 0;

		public function clearHasDiginit():void {
			hasField$0 &= 0xfffffffe;
			has_diginit$field = new int();
		}

		public function get hasHasDiginit():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set hasDiginit(value:int):void {
			hasField$0 |= 0x1;
			has_diginit$field = value;
		}

		public function get hasDiginit():int {
			return has_diginit$field;
		}

		/**
		 *  @private
		 */
		public static const JIASHU_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.DiginfoS2C.jiashu_count", "jiashuCount", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var jiashu_count$field:int;

		public function clearJiashuCount():void {
			hasField$0 &= 0xfffffffd;
			jiashu_count$field = new int();
		}

		public function get hasJiashuCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set jiashuCount(value:int):void {
			hasField$0 |= 0x2;
			jiashu_count$field = value;
		}

		public function get jiashuCount():int {
			return jiashu_count$field;
		}

		/**
		 *  @private
		 */
		public static const GUAJI_DIG_MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.DiginfoS2C.guaji_dig_money", "guajiDigMoney", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guaji_dig_money$field:int;

		public function clearGuajiDigMoney():void {
			hasField$0 &= 0xfffffffb;
			guaji_dig_money$field = new int();
		}

		public function get hasGuajiDigMoney():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set guajiDigMoney(value:int):void {
			hasField$0 |= 0x4;
			guaji_dig_money$field = value;
		}

		public function get guajiDigMoney():int {
			return guaji_dig_money$field;
		}

		/**
		 *  @private
		 */
		public static const GUAJI_DIG_EXP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.DiginfoS2C.guaji_dig_exp", "guajiDigExp", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guaji_dig_exp$field:int;

		public function clearGuajiDigExp():void {
			hasField$0 &= 0xfffffff7;
			guaji_dig_exp$field = new int();
		}

		public function get hasGuajiDigExp():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set guajiDigExp(value:int):void {
			hasField$0 |= 0x8;
			guaji_dig_exp$field = value;
		}

		public function get guajiDigExp():int {
			return guaji_dig_exp$field;
		}

		/**
		 *  @private
		 */
		public static const GUAJI_DIG_TIME:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.DiginfoS2C.guaji_dig_time", "guajiDigTime", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var guaji_dig_time$field:int;

		public function clearGuajiDigTime():void {
			hasField$0 &= 0xffffffef;
			guaji_dig_time$field = new int();
		}

		public function get hasGuajiDigTime():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set guajiDigTime(value:int):void {
			hasField$0 |= 0x10;
			guaji_dig_time$field = value;
		}

		public function get guajiDigTime():int {
			return guaji_dig_time$field;
		}

		/**
		 *  @private
		 */
		public static const GUAJI_DIG_EQUIPS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.DiginfoS2C.guaji_dig_equips", "guajiDigEquips", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var guaji_dig_equips$field:String;

		public function clearGuajiDigEquips():void {
			guaji_dig_equips$field = null;
		}

		public function get hasGuajiDigEquips():Boolean {
			return guaji_dig_equips$field != null;
		}

		public function set guajiDigEquips(value:String):void {
			guaji_dig_equips$field = value;
		}

		public function get guajiDigEquips():String {
			return guaji_dig_equips$field;
		}

		/**
		 *  @private
		 */
		public static const GUAJI_DIG_SELL_EQUIPS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.DiginfoS2C.guaji_dig_sell_equips", "guajiDigSellEquips", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var guaji_dig_sell_equips$field:String;

		public function clearGuajiDigSellEquips():void {
			guaji_dig_sell_equips$field = null;
		}

		public function get hasGuajiDigSellEquips():Boolean {
			return guaji_dig_sell_equips$field != null;
		}

		public function set guajiDigSellEquips(value:String):void {
			guaji_dig_sell_equips$field = value;
		}

		public function get guajiDigSellEquips():String {
			return guaji_dig_sell_equips$field;
		}

		/**
		 *  @private
		 */
		public static const CHUSHOU_SETINFO:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.DiginfoS2C.chushou_setinfo", "chushouSetinfo", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chushou_setinfo$field:int;

		public function clearChushouSetinfo():void {
			hasField$0 &= 0xffffffdf;
			chushou_setinfo$field = new int();
		}

		public function get hasChushouSetinfo():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set chushouSetinfo(value:int):void {
			hasField$0 |= 0x20;
			chushou_setinfo$field = value;
		}

		public function get chushouSetinfo():int {
			return chushou_setinfo$field;
		}

		/**
		 *  @private
		 */
		public static const DIG_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.DiginfoS2C.dig_level", "digLevel", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var dig_level$field:int;

		public function clearDigLevel():void {
			hasField$0 &= 0xffffffbf;
			dig_level$field = new int();
		}

		public function get hasDigLevel():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set digLevel(value:int):void {
			hasField$0 |= 0x40;
			dig_level$field = value;
		}

		public function get digLevel():int {
			return dig_level$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasDropItems) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, drop_items$field);
			}
			if (hasHasDiginit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, has_diginit$field);
			}
			if (hasJiashuCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, jiashu_count$field);
			}
			if (hasGuajiDigMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, guaji_dig_money$field);
			}
			if (hasGuajiDigExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, guaji_dig_exp$field);
			}
			if (hasGuajiDigTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, guaji_dig_time$field);
			}
			if (hasGuajiDigEquips) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, guaji_dig_equips$field);
			}
			if (hasGuajiDigSellEquips) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, guaji_dig_sell_equips$field);
			}
			if (hasChushouSetinfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, chushou_setinfo$field);
			}
			if (hasDigLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, dig_level$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var drop_items$count:uint = 0;
			var has_diginit$count:uint = 0;
			var jiashu_count$count:uint = 0;
			var guaji_dig_money$count:uint = 0;
			var guaji_dig_exp$count:uint = 0;
			var guaji_dig_time$count:uint = 0;
			var guaji_dig_equips$count:uint = 0;
			var guaji_dig_sell_equips$count:uint = 0;
			var chushou_setinfo$count:uint = 0;
			var dig_level$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (drop_items$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiginfoS2C.dropItems cannot be set twice.');
					}
					++drop_items$count;
					this.dropItems = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (has_diginit$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiginfoS2C.hasDiginit cannot be set twice.');
					}
					++has_diginit$count;
					this.hasDiginit = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (jiashu_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiginfoS2C.jiashuCount cannot be set twice.');
					}
					++jiashu_count$count;
					this.jiashuCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (guaji_dig_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiginfoS2C.guajiDigMoney cannot be set twice.');
					}
					++guaji_dig_money$count;
					this.guajiDigMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (guaji_dig_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiginfoS2C.guajiDigExp cannot be set twice.');
					}
					++guaji_dig_exp$count;
					this.guajiDigExp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (guaji_dig_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiginfoS2C.guajiDigTime cannot be set twice.');
					}
					++guaji_dig_time$count;
					this.guajiDigTime = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (guaji_dig_equips$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiginfoS2C.guajiDigEquips cannot be set twice.');
					}
					++guaji_dig_equips$count;
					this.guajiDigEquips = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 8:
					if (guaji_dig_sell_equips$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiginfoS2C.guajiDigSellEquips cannot be set twice.');
					}
					++guaji_dig_sell_equips$count;
					this.guajiDigSellEquips = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 9:
					if (chushou_setinfo$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiginfoS2C.chushouSetinfo cannot be set twice.');
					}
					++chushou_setinfo$count;
					this.chushouSetinfo = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (dig_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: DiginfoS2C.digLevel cannot be set twice.');
					}
					++dig_level$count;
					this.digLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
