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
	public dynamic final class EquipgridS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const GRID_QIANG:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.EquipgridS2C.grid_qiang", "gridQiang", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var grid_qiang$field:String;

		public function clearGridQiang():void {
			grid_qiang$field = null;
		}

		public function get hasGridQiang():Boolean {
			return grid_qiang$field != null;
		}

		public function set gridQiang(value:String):void {
			grid_qiang$field = value;
		}

		public function get gridQiang():String {
			return grid_qiang$field;
		}

		/**
		 *  @private
		 */
		public static const GRID_XING:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.EquipgridS2C.grid_xing", "gridXing", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var grid_xing$field:String;

		public function clearGridXing():void {
			grid_xing$field = null;
		}

		public function get hasGridXing():Boolean {
			return grid_xing$field != null;
		}

		public function set gridXing(value:String):void {
			grid_xing$field = value;
		}

		public function get gridXing():String {
			return grid_xing$field;
		}

		/**
		 *  @private
		 */
		public static const GRID_BAOSHI:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.EquipgridS2C.grid_baoshi", "gridBaoshi", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var grid_baoshi$field:String;

		public function clearGridBaoshi():void {
			grid_baoshi$field = null;
		}

		public function get hasGridBaoshi():Boolean {
			return grid_baoshi$field != null;
		}

		public function set gridBaoshi(value:String):void {
			grid_baoshi$field = value;
		}

		public function get gridBaoshi():String {
			return grid_baoshi$field;
		}

		/**
		 *  @private
		 */
		public static const GRID_RONGLIAN:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.EquipgridS2C.grid_ronglian", "gridRonglian", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var grid_ronglian$field:String;

		public function clearGridRonglian():void {
			grid_ronglian$field = null;
		}

		public function get hasGridRonglian():Boolean {
			return grid_ronglian$field != null;
		}

		public function set gridRonglian(value:String):void {
			grid_ronglian$field = value;
		}

		public function get gridRonglian():String {
			return grid_ronglian$field;
		}

		/**
		 *  @private
		 */
		public static const MODIFY_TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.EquipgridS2C.modify_type", "modifyType", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var modify_type$field:int;

		private var hasField$0:uint = 0;

		public function clearModifyType():void {
			hasField$0 &= 0xfffffffe;
			modify_type$field = new int();
		}

		public function get hasModifyType():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set modifyType(value:int):void {
			hasField$0 |= 0x1;
			modify_type$field = value;
		}

		public function get modifyType():int {
			return modify_type$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasGridQiang) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, grid_qiang$field);
			}
			if (hasGridXing) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, grid_xing$field);
			}
			if (hasGridBaoshi) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, grid_baoshi$field);
			}
			if (hasGridRonglian) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, grid_ronglian$field);
			}
			if (hasModifyType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
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
			var grid_qiang$count:uint = 0;
			var grid_xing$count:uint = 0;
			var grid_baoshi$count:uint = 0;
			var grid_ronglian$count:uint = 0;
			var modify_type$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (grid_qiang$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipgridS2C.gridQiang cannot be set twice.');
					}
					++grid_qiang$count;
					this.gridQiang = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (grid_xing$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipgridS2C.gridXing cannot be set twice.');
					}
					++grid_xing$count;
					this.gridXing = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (grid_baoshi$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipgridS2C.gridBaoshi cannot be set twice.');
					}
					++grid_baoshi$count;
					this.gridBaoshi = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (grid_ronglian$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipgridS2C.gridRonglian cannot be set twice.');
					}
					++grid_ronglian$count;
					this.gridRonglian = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (modify_type$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipgridS2C.modifyType cannot be set twice.');
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
