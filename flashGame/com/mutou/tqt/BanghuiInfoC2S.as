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
	public dynamic final class BanghuiInfoC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ICONID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BanghuiInfoC2S.iconId", "iconId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var iconId$field:int;

		private var hasField$0:uint = 0;

		public function clearIconId():void {
			hasField$0 &= 0xfffffffe;
			iconId$field = new int();
		}

		public function get hasIconId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set iconId(value:int):void {
			hasField$0 |= 0x1;
			iconId$field = value;
		}

		public function get iconId():int {
			return iconId$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUINAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.BanghuiInfoC2S.banghuiName", "banghuiName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var banghuiName$field:String;

		public function clearBanghuiName():void {
			banghuiName$field = null;
		}

		public function get hasBanghuiName():Boolean {
			return banghuiName$field != null;
		}

		public function set banghuiName(value:String):void {
			banghuiName$field = value;
		}

		public function get banghuiName():String {
			return banghuiName$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUIID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BanghuiInfoC2S.banghuiId", "banghuiId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var banghuiId$field:int;

		public function clearBanghuiId():void {
			hasField$0 &= 0xfffffffd;
			banghuiId$field = new int();
		}

		public function get hasBanghuiId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set banghuiId(value:int):void {
			hasField$0 |= 0x2;
			banghuiId$field = value;
		}

		public function get banghuiId():int {
			return banghuiId$field;
		}

		/**
		 *  @private
		 */
		public static const PASSWORD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.BanghuiInfoC2S.password", "password", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var password$field:String;

		public function clearPassword():void {
			password$field = null;
		}

		public function get hasPassword():Boolean {
			return password$field != null;
		}

		public function set password(value:String):void {
			password$field = value;
		}

		public function get password():String {
			return password$field;
		}

		/**
		 *  @private
		 */
		public static const NEWPASSWORD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.BanghuiInfoC2S.newpassword", "newpassword", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var newpassword$field:String;

		public function clearNewpassword():void {
			newpassword$field = null;
		}

		public function get hasNewpassword():Boolean {
			return newpassword$field != null;
		}

		public function set newpassword(value:String):void {
			newpassword$field = value;
		}

		public function get newpassword():String {
			return newpassword$field;
		}

		/**
		 *  @private
		 */
		public static const GONGGAO:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.BanghuiInfoC2S.gonggao", "gonggao", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var gonggao$field:String;

		public function clearGonggao():void {
			gonggao$field = null;
		}

		public function get hasGonggao():Boolean {
			return gonggao$field != null;
		}

		public function set gonggao(value:String):void {
			gonggao$field = value;
		}

		public function get gonggao():String {
			return gonggao$field;
		}

		/**
		 *  @private
		 */
		public static const XUANYAN:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.BanghuiInfoC2S.xuanyan", "xuanyan", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var xuanyan$field:String;

		public function clearXuanyan():void {
			xuanyan$field = null;
		}

		public function get hasXuanyan():Boolean {
			return xuanyan$field != null;
		}

		public function set xuanyan(value:String):void {
			xuanyan$field = value;
		}

		public function get xuanyan():String {
			return xuanyan$field;
		}

		/**
		 *  @private
		 */
		public static const REDPACKETID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.BanghuiInfoC2S.redPacketId", "redPacketId", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var redPacketId$field:int;

		public function clearRedPacketId():void {
			hasField$0 &= 0xfffffffb;
			redPacketId$field = new int();
		}

		public function get hasRedPacketId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set redPacketId(value:int):void {
			hasField$0 |= 0x4;
			redPacketId$field = value;
		}

		public function get redPacketId():int {
			return redPacketId$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasIconId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, iconId$field);
			}
			if (hasBanghuiName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, banghuiName$field);
			}
			if (hasBanghuiId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, banghuiId$field);
			}
			if (hasPassword) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, password$field);
			}
			if (hasNewpassword) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, newpassword$field);
			}
			if (hasGonggao) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, gonggao$field);
			}
			if (hasXuanyan) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, xuanyan$field);
			}
			if (hasRedPacketId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, redPacketId$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var iconId$count:uint = 0;
			var banghuiName$count:uint = 0;
			var banghuiId$count:uint = 0;
			var password$count:uint = 0;
			var newpassword$count:uint = 0;
			var gonggao$count:uint = 0;
			var xuanyan$count:uint = 0;
			var redPacketId$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (iconId$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiInfoC2S.iconId cannot be set twice.');
					}
					++iconId$count;
					this.iconId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (banghuiName$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiInfoC2S.banghuiName cannot be set twice.');
					}
					++banghuiName$count;
					this.banghuiName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (banghuiId$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiInfoC2S.banghuiId cannot be set twice.');
					}
					++banghuiId$count;
					this.banghuiId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (password$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiInfoC2S.password cannot be set twice.');
					}
					++password$count;
					this.password = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (newpassword$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiInfoC2S.newpassword cannot be set twice.');
					}
					++newpassword$count;
					this.newpassword = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (gonggao$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiInfoC2S.gonggao cannot be set twice.');
					}
					++gonggao$count;
					this.gonggao = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 7:
					if (xuanyan$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiInfoC2S.xuanyan cannot be set twice.');
					}
					++xuanyan$count;
					this.xuanyan = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 8:
					if (redPacketId$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiInfoC2S.redPacketId cannot be set twice.');
					}
					++redPacketId$count;
					this.redPacketId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
