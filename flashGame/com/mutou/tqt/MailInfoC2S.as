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
	public dynamic final class MailInfoC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const RECEIVEUSERID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.MailInfoC2S.receiveUserId", "receiveUserId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var receiveUserId$field:int;

		private var hasField$0:uint = 0;

		public function clearReceiveUserId():void {
			hasField$0 &= 0xfffffffe;
			receiveUserId$field = new int();
		}

		public function get hasReceiveUserId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set receiveUserId(value:int):void {
			hasField$0 |= 0x1;
			receiveUserId$field = value;
		}

		public function get receiveUserId():int {
			return receiveUserId$field;
		}

		/**
		 *  @private
		 */
		public static const RECEIVEUSERNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.MailInfoC2S.receiveUserName", "receiveUserName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var receiveUserName$field:String;

		public function clearReceiveUserName():void {
			receiveUserName$field = null;
		}

		public function get hasReceiveUserName():Boolean {
			return receiveUserName$field != null;
		}

		public function set receiveUserName(value:String):void {
			receiveUserName$field = value;
		}

		public function get receiveUserName():String {
			return receiveUserName$field;
		}

		/**
		 *  @private
		 */
		public static const MAILXID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.MailInfoC2S.mailXid", "mailXid", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mailXid$field:int;

		public function clearMailXid():void {
			hasField$0 &= 0xfffffffd;
			mailXid$field = new int();
		}

		public function get hasMailXid():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set mailXid(value:int):void {
			hasField$0 |= 0x2;
			mailXid$field = value;
		}

		public function get mailXid():int {
			return mailXid$field;
		}

		/**
		 *  @private
		 */
		public static const VARS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.MailInfoC2S.vars", "vars", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var vars$field:String;

		public function clearVars():void {
			vars$field = null;
		}

		public function get hasVars():Boolean {
			return vars$field != null;
		}

		public function set vars(value:String):void {
			vars$field = value;
		}

		public function get vars():String {
			return vars$field;
		}

		/**
		 *  @private
		 */
		public static const MAILID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.MailInfoC2S.mailId", "mailId", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mailId$field:int;

		public function clearMailId():void {
			hasField$0 &= 0xfffffffb;
			mailId$field = new int();
		}

		public function get hasMailId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set mailId(value:int):void {
			hasField$0 |= 0x4;
			mailId$field = value;
		}

		public function get mailId():int {
			return mailId$field;
		}

		/**
		 *  @private
		 */
		public static const HANLESTATUS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.MailInfoC2S.hanleStatus", "hanleStatus", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hanleStatus$field:int;

		public function clearHanleStatus():void {
			hasField$0 &= 0xfffffff7;
			hanleStatus$field = new int();
		}

		public function get hasHanleStatus():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set hanleStatus(value:int):void {
			hasField$0 |= 0x8;
			hanleStatus$field = value;
		}

		public function get hanleStatus():int {
			return hanleStatus$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasReceiveUserId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, receiveUserId$field);
			}
			if (hasReceiveUserName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, receiveUserName$field);
			}
			if (hasMailXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, mailXid$field);
			}
			if (hasVars) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, vars$field);
			}
			if (hasMailId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, mailId$field);
			}
			if (hasHanleStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, hanleStatus$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var receiveUserId$count:uint = 0;
			var receiveUserName$count:uint = 0;
			var mailXid$count:uint = 0;
			var vars$count:uint = 0;
			var mailId$count:uint = 0;
			var hanleStatus$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (receiveUserId$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailInfoC2S.receiveUserId cannot be set twice.');
					}
					++receiveUserId$count;
					this.receiveUserId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (receiveUserName$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailInfoC2S.receiveUserName cannot be set twice.');
					}
					++receiveUserName$count;
					this.receiveUserName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (mailXid$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailInfoC2S.mailXid cannot be set twice.');
					}
					++mailXid$count;
					this.mailXid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (vars$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailInfoC2S.vars cannot be set twice.');
					}
					++vars$count;
					this.vars = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (mailId$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailInfoC2S.mailId cannot be set twice.');
					}
					++mailId$count;
					this.mailId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (hanleStatus$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailInfoC2S.hanleStatus cannot be set twice.');
					}
					++hanleStatus$count;
					this.hanleStatus = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
