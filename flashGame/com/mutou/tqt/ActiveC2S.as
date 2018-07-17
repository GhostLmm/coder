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
	public dynamic final class ActiveC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const POS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.ActiveC2S.pos", "pos", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var pos$field:String;

		public function clearPos():void {
			pos$field = null;
		}

		public function get hasPos():Boolean {
			return pos$field != null;
		}

		public function set pos(value:String):void {
			pos$field = value;
		}

		public function get pos():String {
			return pos$field;
		}

		/**
		 *  @private
		 */
		public static const SAYS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.ActiveC2S.says", "says", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var says$field:String;

		public function clearSays():void {
			says$field = null;
		}

		public function get hasSays():Boolean {
			return says$field != null;
		}

		public function set says(value:String):void {
			says$field = value;
		}

		public function get says():String {
			return says$field;
		}

		/**
		 *  @private
		 */
		public static const STATUS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.ActiveC2S.status", "status", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var status$field:int;

		private var hasField$0:uint = 0;

		public function clearStatus():void {
			hasField$0 &= 0xfffffffe;
			status$field = new int();
		}

		public function get hasStatus():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set status(value:int):void {
			hasField$0 |= 0x1;
			status$field = value;
		}

		public function get status():int {
			return status$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, pos$field);
			}
			if (hasSays) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, says$field);
			}
			if (hasStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, status$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var pos$count:uint = 0;
			var says$count:uint = 0;
			var status$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActiveC2S.pos cannot be set twice.');
					}
					++pos$count;
					this.pos = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (says$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActiveC2S.says cannot be set twice.');
					}
					++says$count;
					this.says = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (status$count != 0) {
						throw new flash.errors.IOError('Bad data format: ActiveC2S.status cannot be set twice.');
					}
					++status$count;
					this.status = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
