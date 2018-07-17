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
	public dynamic final class ChaonengliS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CURRENTTYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ChaonengliS2C.currentType", "currentType", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var currentType$field:int;

		private var hasField$0:uint = 0;

		public function clearCurrentType():void {
			hasField$0 &= 0xfffffffe;
			currentType$field = new int();
		}

		public function get hasCurrentType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set currentType(value:int):void {
			hasField$0 |= 0x1;
			currentType$field = value;
		}

		public function get currentType():int {
			return currentType$field;
		}

		/**
		 *  @private
		 */
		public static const XIDLIST:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.ChaonengliS2C.xidList", "xidList", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var xidList$field:String;

		public function clearXidList():void {
			xidList$field = null;
		}

		public function get hasXidList():Boolean {
			return xidList$field != null;
		}

		public function set xidList(value:String):void {
			xidList$field = value;
		}

		public function get xidList():String {
			return xidList$field;
		}

		/**
		 *  @private
		 */
		public static const UP_ENABLE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ChaonengliS2C.up_enable", "upEnable", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var up_enable$field:int;

		public function clearUpEnable():void {
			hasField$0 &= 0xfffffffd;
			up_enable$field = new int();
		}

		public function get hasUpEnable():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set upEnable(value:int):void {
			hasField$0 |= 0x2;
			up_enable$field = value;
		}

		public function get upEnable():int {
			return up_enable$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasCurrentType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, currentType$field);
			}
			if (hasXidList) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, xidList$field);
			}
			if (hasUpEnable) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, up_enable$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var currentType$count:uint = 0;
			var xidList$count:uint = 0;
			var up_enable$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (currentType$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChaonengliS2C.currentType cannot be set twice.');
					}
					++currentType$count;
					this.currentType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (xidList$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChaonengliS2C.xidList cannot be set twice.');
					}
					++xidList$count;
					this.xidList = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (up_enable$count != 0) {
						throw new flash.errors.IOError('Bad data format: ChaonengliS2C.upEnable cannot be set twice.');
					}
					++up_enable$count;
					this.upEnable = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
