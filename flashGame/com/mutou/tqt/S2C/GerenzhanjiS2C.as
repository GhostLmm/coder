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
	public dynamic final class GerenzhanjiS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.GerenzhanjiS2C.uid", "uid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const UNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.GerenzhanjiS2C.uname", "uname", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var uname$field:String;

		public function clearUname():void {
			uname$field = null;
		}

		public function get hasUname():Boolean {
			return uname$field != null;
		}

		public function set uname(value:String):void {
			uname$field = value;
		}

		public function get uname():String {
			return uname$field;
		}

		/**
		 *  @private
		 */
		public static const KILL_NUM:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.GerenzhanjiS2C.kill_num", "killNum", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var kill_num$field:int;

		public function clearKillNum():void {
			hasField$0 &= 0xfffffffd;
			kill_num$field = new int();
		}

		public function get hasKillNum():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set killNum(value:int):void {
			hasField$0 |= 0x2;
			kill_num$field = value;
		}

		public function get killNum():int {
			return kill_num$field;
		}

		/**
		 *  @private
		 */
		public static const TOTAL_DEMAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.GerenzhanjiS2C.total_demage", "totalDemage", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var total_demage$field:int;

		public function clearTotalDemage():void {
			hasField$0 &= 0xfffffffb;
			total_demage$field = new int();
		}

		public function get hasTotalDemage():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set totalDemage(value:int):void {
			hasField$0 |= 0x4;
			total_demage$field = value;
		}

		public function get totalDemage():int {
			return total_demage$field;
		}

		/**
		 *  @private
		 */
		public static const LINGJIANG_STATUS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.GerenzhanjiS2C.lingjiang_status", "lingjiangStatus", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var lingjiang_status$field:int;

		public function clearLingjiangStatus():void {
			hasField$0 &= 0xfffffff7;
			lingjiang_status$field = new int();
		}

		public function get hasLingjiangStatus():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set lingjiangStatus(value:int):void {
			hasField$0 |= 0x8;
			lingjiang_status$field = value;
		}

		public function get lingjiangStatus():int {
			return lingjiang_status$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, uid$field);
			}
			if (hasUname) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, uname$field);
			}
			if (hasKillNum) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, kill_num$field);
			}
			if (hasTotalDemage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, total_demage$field);
			}
			if (hasLingjiangStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, lingjiang_status$field);
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
			var uname$count:uint = 0;
			var kill_num$count:uint = 0;
			var total_demage$count:uint = 0;
			var lingjiang_status$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: GerenzhanjiS2C.uid cannot be set twice.');
					}
					++uid$count;
					this.uid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (uname$count != 0) {
						throw new flash.errors.IOError('Bad data format: GerenzhanjiS2C.uname cannot be set twice.');
					}
					++uname$count;
					this.uname = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (kill_num$count != 0) {
						throw new flash.errors.IOError('Bad data format: GerenzhanjiS2C.killNum cannot be set twice.');
					}
					++kill_num$count;
					this.killNum = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (total_demage$count != 0) {
						throw new flash.errors.IOError('Bad data format: GerenzhanjiS2C.totalDemage cannot be set twice.');
					}
					++total_demage$count;
					this.totalDemage = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (lingjiang_status$count != 0) {
						throw new flash.errors.IOError('Bad data format: GerenzhanjiS2C.lingjiangStatus cannot be set twice.');
					}
					++lingjiang_status$count;
					this.lingjiangStatus = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
