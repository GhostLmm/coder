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
	public dynamic final class BanghuiliebiaoS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BanghuiliebiaoS2C.bid", "bid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bid$field:int;

		private var hasField$0:uint = 0;

		public function clearBid():void {
			hasField$0 &= 0xfffffffe;
			bid$field = new int();
		}

		public function get hasBid():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set bid(value:int):void {
			hasField$0 |= 0x1;
			bid$field = value;
		}

		public function get bid():int {
			return bid$field;
		}

		/**
		 *  @private
		 */
		public static const PERSON_NUM:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BanghuiliebiaoS2C.person_num", "personNum", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var person_num$field:int;

		public function clearPersonNum():void {
			hasField$0 &= 0xfffffffd;
			person_num$field = new int();
		}

		public function get hasPersonNum():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set personNum(value:int):void {
			hasField$0 |= 0x2;
			person_num$field = value;
		}

		public function get personNum():int {
			return person_num$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUI_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.BanghuiliebiaoS2C.banghui_name", "banghuiName", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var banghui_name$field:String;

		public function clearBanghuiName():void {
			banghui_name$field = null;
		}

		public function get hasBanghuiName():Boolean {
			return banghui_name$field != null;
		}

		public function set banghuiName(value:String):void {
			banghui_name$field = value;
		}

		public function get banghuiName():String {
			return banghui_name$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUI_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BanghuiliebiaoS2C.banghui_level", "banghuiLevel", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var banghui_level$field:int;

		public function clearBanghuiLevel():void {
			hasField$0 &= 0xfffffffb;
			banghui_level$field = new int();
		}

		public function get hasBanghuiLevel():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set banghuiLevel(value:int):void {
			hasField$0 |= 0x4;
			banghui_level$field = value;
		}

		public function get banghuiLevel():int {
			return banghui_level$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUI_ICON:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BanghuiliebiaoS2C.banghui_icon", "banghuiIcon", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var banghui_icon$field:int;

		public function clearBanghuiIcon():void {
			hasField$0 &= 0xfffffff7;
			banghui_icon$field = new int();
		}

		public function get hasBanghuiIcon():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set banghuiIcon(value:int):void {
			hasField$0 |= 0x8;
			banghui_icon$field = value;
		}

		public function get banghuiIcon():int {
			return banghui_icon$field;
		}

		/**
		 *  @private
		 */
		public static const HUIZHANG_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.BanghuiliebiaoS2C.huizhang_name", "huizhangName", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var huizhang_name$field:String;

		public function clearHuizhangName():void {
			huizhang_name$field = null;
		}

		public function get hasHuizhangName():Boolean {
			return huizhang_name$field != null;
		}

		public function set huizhangName(value:String):void {
			huizhang_name$field = value;
		}

		public function get huizhangName():String {
			return huizhang_name$field;
		}

		/**
		 *  @private
		 */
		public static const HUIZHANG_UID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BanghuiliebiaoS2C.huizhang_uid", "huizhangUid", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var huizhang_uid$field:int;

		public function clearHuizhangUid():void {
			hasField$0 &= 0xffffffef;
			huizhang_uid$field = new int();
		}

		public function get hasHuizhangUid():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set huizhangUid(value:int):void {
			hasField$0 |= 0x10;
			huizhang_uid$field = value;
		}

		public function get huizhangUid():int {
			return huizhang_uid$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasBid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, bid$field);
			}
			if (hasPersonNum) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, person_num$field);
			}
			if (hasBanghuiName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, banghui_name$field);
			}
			if (hasBanghuiLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, banghui_level$field);
			}
			if (hasBanghuiIcon) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, banghui_icon$field);
			}
			if (hasHuizhangName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, huizhang_name$field);
			}
			if (hasHuizhangUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, huizhang_uid$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var bid$count:uint = 0;
			var person_num$count:uint = 0;
			var banghui_name$count:uint = 0;
			var banghui_level$count:uint = 0;
			var banghui_icon$count:uint = 0;
			var huizhang_name$count:uint = 0;
			var huizhang_uid$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (bid$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiliebiaoS2C.bid cannot be set twice.');
					}
					++bid$count;
					this.bid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (person_num$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiliebiaoS2C.personNum cannot be set twice.');
					}
					++person_num$count;
					this.personNum = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (banghui_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiliebiaoS2C.banghuiName cannot be set twice.');
					}
					++banghui_name$count;
					this.banghuiName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (banghui_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiliebiaoS2C.banghuiLevel cannot be set twice.');
					}
					++banghui_level$count;
					this.banghuiLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (banghui_icon$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiliebiaoS2C.banghuiIcon cannot be set twice.');
					}
					++banghui_icon$count;
					this.banghuiIcon = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (huizhang_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiliebiaoS2C.huizhangName cannot be set twice.');
					}
					++huizhang_name$count;
					this.huizhangName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 7:
					if (huizhang_uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiliebiaoS2C.huizhangUid cannot be set twice.');
					}
					++huizhang_uid$count;
					this.huizhangUid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
