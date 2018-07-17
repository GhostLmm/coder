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
	public dynamic final class ShengqingpersionS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ShengqingpersionS2C.uid", "uid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var uid$field:int;

		private var hasField$0:uint = 0;

		public function clearUid():void {
			hasField$0 &= 0xfffffffe;
			uid$field = new int();
		}

		public function get hasUid():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set uid(value:int):void {
			hasField$0 |= 0x1;
			uid$field = value;
		}

		public function get uid():int {
			return uid$field;
		}

		/**
		 *  @private
		 */
		public static const USER_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.ShengqingpersionS2C.user_name", "userName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var user_name$field:String;

		public function clearUserName():void {
			user_name$field = null;
		}

		public function get hasUserName():Boolean {
			return user_name$field != null;
		}

		public function set userName(value:String):void {
			user_name$field = value;
		}

		public function get userName():String {
			return user_name$field;
		}

		/**
		 *  @private
		 */
		public static const VIP_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ShengqingpersionS2C.vip_level", "vipLevel", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vip_level$field:int;

		public function clearVipLevel():void {
			hasField$0 &= 0xfffffffd;
			vip_level$field = new int();
		}

		public function get hasVipLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set vipLevel(value:int):void {
			hasField$0 |= 0x2;
			vip_level$field = value;
		}

		public function get vipLevel():int {
			return vip_level$field;
		}

		/**
		 *  @private
		 */
		public static const LEITAI_RANK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ShengqingpersionS2C.leitai_rank", "leitaiRank", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var leitai_rank$field:int;

		public function clearLeitaiRank():void {
			hasField$0 &= 0xfffffffb;
			leitai_rank$field = new int();
		}

		public function get hasLeitaiRank():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set leitaiRank(value:int):void {
			hasField$0 |= 0x4;
			leitai_rank$field = value;
		}

		public function get leitaiRank():int {
			return leitai_rank$field;
		}

		/**
		 *  @private
		 */
		public static const USER_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ShengqingpersionS2C.user_level", "userLevel", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_level$field:int;

		public function clearUserLevel():void {
			hasField$0 &= 0xfffffff7;
			user_level$field = new int();
		}

		public function get hasUserLevel():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set userLevel(value:int):void {
			hasField$0 |= 0x8;
			user_level$field = value;
		}

		public function get userLevel():int {
			return user_level$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, uid$field);
			}
			if (hasUserName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_name$field);
			}
			if (hasVipLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, vip_level$field);
			}
			if (hasLeitaiRank) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, leitai_rank$field);
			}
			if (hasUserLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_level$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var uid$count:uint = 0;
			var user_name$count:uint = 0;
			var vip_level$count:uint = 0;
			var leitai_rank$count:uint = 0;
			var user_level$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShengqingpersionS2C.uid cannot be set twice.');
					}
					++uid$count;
					this.uid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (user_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShengqingpersionS2C.userName cannot be set twice.');
					}
					++user_name$count;
					this.userName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (vip_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShengqingpersionS2C.vipLevel cannot be set twice.');
					}
					++vip_level$count;
					this.vipLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (leitai_rank$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShengqingpersionS2C.leitaiRank cannot be set twice.');
					}
					++leitai_rank$count;
					this.leitaiRank = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (user_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShengqingpersionS2C.userLevel cannot be set twice.');
					}
					++user_level$count;
					this.userLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
