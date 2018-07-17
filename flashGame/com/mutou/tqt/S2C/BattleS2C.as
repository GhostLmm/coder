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
	public dynamic final class BattleS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GONGJI_USERID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattleS2C.gongji_userid", "gongjiUserid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gongji_userid$field:int;

		private var hasField$0:uint = 0;

		public function clearGongjiUserid():void {
			hasField$0 &= 0xfffffffe;
			gongji_userid$field = new int();
		}

		public function get hasGongjiUserid():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set gongjiUserid(value:int):void {
			hasField$0 |= 0x1;
			gongji_userid$field = value;
		}

		public function get gongjiUserid():int {
			return gongji_userid$field;
		}

		/**
		 *  @private
		 */
		public static const FANGYU_USERID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattleS2C.fangyu_userid", "fangyuUserid", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fangyu_userid$field:int;

		public function clearFangyuUserid():void {
			hasField$0 &= 0xfffffffd;
			fangyu_userid$field = new int();
		}

		public function get hasFangyuUserid():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set fangyuUserid(value:int):void {
			hasField$0 |= 0x2;
			fangyu_userid$field = value;
		}

		public function get fangyuUserid():int {
			return fangyu_userid$field;
		}

		/**
		 *  @private
		 */
		public static const WIN_USERID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattleS2C.win_userid", "winUserid", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var win_userid$field:int;

		public function clearWinUserid():void {
			hasField$0 &= 0xfffffffb;
			win_userid$field = new int();
		}

		public function get hasWinUserid():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set winUserid(value:int):void {
			hasField$0 |= 0x4;
			win_userid$field = value;
		}

		public function get winUserid():int {
			return win_userid$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGongjiUserid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, gongji_userid$field);
			}
			if (hasFangyuUserid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, fangyu_userid$field);
			}
			if (hasWinUserid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, win_userid$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var gongji_userid$count:uint = 0;
			var fangyu_userid$count:uint = 0;
			var win_userid$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (gongji_userid$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleS2C.gongjiUserid cannot be set twice.');
					}
					++gongji_userid$count;
					this.gongjiUserid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (fangyu_userid$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleS2C.fangyuUserid cannot be set twice.');
					}
					++fangyu_userid$count;
					this.fangyuUserid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (win_userid$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleS2C.winUserid cannot be set twice.');
					}
					++win_userid$count;
					this.winUserid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
