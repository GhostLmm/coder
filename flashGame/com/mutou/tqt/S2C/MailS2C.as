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
	public dynamic final class MailS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.MailS2C.type", "type", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var type$field:int;

		private var hasField$0:uint = 0;

		public function clearType():void {
			hasField$0 &= 0xfffffffe;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x1;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		public static const TITLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.MailS2C.title", "title", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var title$field:String;

		public function clearTitle():void {
			title$field = null;
		}

		public function get hasTitle():Boolean {
			return title$field != null;
		}

		public function set title(value:String):void {
			title$field = value;
		}

		public function get title():String {
			return title$field;
		}

		/**
		 *  @private
		 */
		public static const COTENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.MailS2C.cotent", "cotent", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var cotent$field:String;

		public function clearCotent():void {
			cotent$field = null;
		}

		public function get hasCotent():Boolean {
			return cotent$field != null;
		}

		public function set cotent(value:String):void {
			cotent$field = value;
		}

		public function get cotent():String {
			return cotent$field;
		}

		/**
		 *  @private
		 */
		public static const REWARDS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.MailS2C.rewards", "rewards", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var rewards$field:String;

		public function clearRewards():void {
			rewards$field = null;
		}

		public function get hasRewards():Boolean {
			return rewards$field != null;
		}

		public function set rewards(value:String):void {
			rewards$field = value;
		}

		public function get rewards():String {
			return rewards$field;
		}

		/**
		 *  @private
		 */
		public static const SENDER:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.MailS2C.sender", "sender", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var sender$field:String;

		public function clearSender():void {
			sender$field = null;
		}

		public function get hasSender():Boolean {
			return sender$field != null;
		}

		public function set sender(value:String):void {
			sender$field = value;
		}

		public function get sender():String {
			return sender$field;
		}

		/**
		 *  @private
		 */
		public static const SENDER_UID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.MailS2C.sender_uid", "senderUid", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var sender_uid$field:int;

		public function clearSenderUid():void {
			hasField$0 &= 0xfffffffd;
			sender_uid$field = new int();
		}

		public function get hasSenderUid():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set senderUid(value:int):void {
			hasField$0 |= 0x2;
			sender_uid$field = value;
		}

		public function get senderUid():int {
			return sender_uid$field;
		}

		/**
		 *  @private
		 */
		public static const SEND_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.MailS2C.send_time", "sendTime", (7 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var send_time$field:UInt64;

		public function clearSendTime():void {
			send_time$field = null;
		}

		public function get hasSendTime():Boolean {
			return send_time$field != null;
		}

		public function set sendTime(value:UInt64):void {
			send_time$field = value;
		}

		public function get sendTime():UInt64 {
			return send_time$field;
		}

		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.MailS2C.id", "id", (8 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

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
		public static const MODIFY_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.MailS2C.modify_type", "modifyType", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var modify_type$field:int;

		public function clearModifyType():void {
			hasField$0 &= 0xfffffffb;
			modify_type$field = new int();
		}

		public function get hasModifyType():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set modifyType(value:int):void {
			hasField$0 |= 0x4;
			modify_type$field = value;
		}

		public function get modifyType():int {
			return modify_type$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, type$field);
			}
			if (hasTitle) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, title$field);
			}
			if (hasCotent) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, cotent$field);
			}
			if (hasRewards) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, rewards$field);
			}
			if (hasSender) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, sender$field);
			}
			if (hasSenderUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, sender_uid$field);
			}
			if (hasSendTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, send_time$field);
			}
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, id$field);
			}
			if (hasModifyType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, modify_type$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var type$count:uint = 0;
			var title$count:uint = 0;
			var cotent$count:uint = 0;
			var rewards$count:uint = 0;
			var sender$count:uint = 0;
			var sender_uid$count:uint = 0;
			var send_time$count:uint = 0;
			var id$count:uint = 0;
			var modify_type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailS2C.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (title$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailS2C.title cannot be set twice.');
					}
					++title$count;
					this.title = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (cotent$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailS2C.cotent cannot be set twice.');
					}
					++cotent$count;
					this.cotent = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (rewards$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailS2C.rewards cannot be set twice.');
					}
					++rewards$count;
					this.rewards = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (sender$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailS2C.sender cannot be set twice.');
					}
					++sender$count;
					this.sender = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (sender_uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailS2C.senderUid cannot be set twice.');
					}
					++sender_uid$count;
					this.senderUid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (send_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailS2C.sendTime cannot be set twice.');
					}
					++send_time$count;
					this.sendTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 8:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailS2C.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 9:
					if (modify_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: MailS2C.modifyType cannot be set twice.');
					}
					++modify_type$count;
					this.modifyType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
