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
	public dynamic final class TaskS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.TaskS2C.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const MODIFY_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.TaskS2C.modify_type", "modifyType", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var modify_type$field:int;

		public function clearModifyType():void {
			hasField$0 &= 0xfffffffd;
			modify_type$field = new int();
		}

		public function get hasModifyType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set modifyType(value:int):void {
			hasField$0 |= 0x2;
			modify_type$field = value;
		}

		public function get modifyType():int {
			return modify_type$field;
		}

		/**
		 *  @private
		 */
		public static const HAS_COMPLETE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.TaskS2C.has_complete", "hasComplete", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var has_complete$field:int;

		public function clearHasComplete():void {
			hasField$0 &= 0xfffffffb;
			has_complete$field = new int();
		}

		public function get hasHasComplete():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set hasComplete(value:int):void {
			hasField$0 |= 0x4;
			has_complete$field = value;
		}

		public function get hasComplete():int {
			return has_complete$field;
		}

		/**
		 *  @private
		 */
		public static const INFO:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.TaskS2C.info", "info", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var info$field:String;

		public function clearInfo():void {
			info$field = null;
		}

		public function get hasInfo():Boolean {
			return info$field != null;
		}

		public function set info(value:String):void {
			info$field = value;
		}

		public function get info():String {
			return info$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, id$field);
			}
			if (hasModifyType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, modify_type$field);
			}
			if (hasHasComplete) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, has_complete$field);
			}
			if (hasInfo) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, info$field);
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
			var modify_type$count:uint = 0;
			var has_complete$count:uint = 0;
			var info$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskS2C.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (modify_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskS2C.modifyType cannot be set twice.');
					}
					++modify_type$count;
					this.modifyType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (has_complete$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskS2C.hasComplete cannot be set twice.');
					}
					++has_complete$count;
					this.hasComplete = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (info$count != 0) {
						throw new flash.errors.IOError('Bad data format: TaskS2C.info cannot be set twice.');
					}
					++info$count;
					this.info = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
