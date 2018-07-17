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
	public dynamic final class FunbenguanmingS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const FUBEN_NAME_MAP:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.FunbenguanmingS2C.fuben_name_map", "fubenNameMap", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var fuben_name_map$field:String;

		public function clearFubenNameMap():void {
			fuben_name_map$field = null;
		}

		public function get hasFubenNameMap():Boolean {
			return fuben_name_map$field != null;
		}

		public function set fubenNameMap(value:String):void {
			fuben_name_map$field = value;
		}

		public function get fubenNameMap():String {
			return fuben_name_map$field;
		}

		/**
		 *  @private
		 */
		public static const GUANMING_DETAIL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.FunbenguanmingS2C.guanming_detail", "guanmingDetail", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var guanming_detail$field:String;

		public function clearGuanmingDetail():void {
			guanming_detail$field = null;
		}

		public function get hasGuanmingDetail():Boolean {
			return guanming_detail$field != null;
		}

		public function set guanmingDetail(value:String):void {
			guanming_detail$field = value;
		}

		public function get guanmingDetail():String {
			return guanming_detail$field;
		}

		/**
		 *  @private
		 */
		public static const LINGQU_STATUS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.FunbenguanmingS2C.lingqu_status", "lingquStatus", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var lingqu_status$field:String;

		public function clearLingquStatus():void {
			lingqu_status$field = null;
		}

		public function get hasLingquStatus():Boolean {
			return lingqu_status$field != null;
		}

		public function set lingquStatus(value:String):void {
			lingqu_status$field = value;
		}

		public function get lingquStatus():String {
			return lingqu_status$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasFubenNameMap) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, fuben_name_map$field);
			}
			if (hasGuanmingDetail) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, guanming_detail$field);
			}
			if (hasLingquStatus) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, lingqu_status$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var fuben_name_map$count:uint = 0;
			var guanming_detail$count:uint = 0;
			var lingqu_status$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (fuben_name_map$count != 0) {
						throw new flash.errors.IOError('Bad data format: FunbenguanmingS2C.fubenNameMap cannot be set twice.');
					}
					++fuben_name_map$count;
					this.fubenNameMap = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (guanming_detail$count != 0) {
						throw new flash.errors.IOError('Bad data format: FunbenguanmingS2C.guanmingDetail cannot be set twice.');
					}
					++guanming_detail$count;
					this.guanmingDetail = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (lingqu_status$count != 0) {
						throw new flash.errors.IOError('Bad data format: FunbenguanmingS2C.lingquStatus cannot be set twice.');
					}
					++lingqu_status$count;
					this.lingquStatus = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
