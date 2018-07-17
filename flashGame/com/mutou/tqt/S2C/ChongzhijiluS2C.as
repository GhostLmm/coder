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
	public dynamic final class ChongzhijiluS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ChongzhijiluS2C.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const USER_CHONGZHI:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.ChongzhijiluS2C.user_chongzhi", "userChongzhi", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var user_chongzhi$field:String;

		public function clearUserChongzhi():void {
			user_chongzhi$field = null;
		}

		public function get hasUserChongzhi():Boolean {
			return user_chongzhi$field != null;
		}

		public function set userChongzhi(value:String):void {
			user_chongzhi$field = value;
		}

		public function get userChongzhi():String {
			return user_chongzhi$field;
		}

		/**
		 *  @private
		 */
		public static const CHONGHZI_CASH:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ChongzhijiluS2C.chonghzi_cash", "chonghziCash", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chonghzi_cash$field:int;

		public function clearChonghziCash():void {
			hasField$0 &= 0xfffffffd;
			chonghzi_cash$field = new int();
		}

		public function get hasChonghziCash():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set chonghziCash(value:int):void {
			hasField$0 |= 0x2;
			chonghzi_cash$field = value;
		}

		public function get chonghziCash():int {
			return chonghzi_cash$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, id$field);
			}
			if (hasUserChongzhi) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_chongzhi$field);
			}
			if (hasChonghziCash) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, chonghzi_cash$field);
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
			var user_chongzhi$count:uint = 0;
			var chonghzi_cash$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChongzhijiluS2C.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (user_chongzhi$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChongzhijiluS2C.userChongzhi cannot be set twice.');
					}
					++user_chongzhi$count;
					this.userChongzhi = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (chonghzi_cash$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChongzhijiluS2C.chonghziCash cannot be set twice.');
					}
					++chonghzi_cash$count;
					this.chonghziCash = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
