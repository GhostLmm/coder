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
	public dynamic final class LimitbuyS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SHENGWANG_BUY_ITEMS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.LimitbuyS2C.shengwang_buy_items", "shengwangBuyItems", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var shengwang_buy_items$field:String;

		public function clearShengwangBuyItems():void {
			shengwang_buy_items$field = null;
		}

		public function get hasShengwangBuyItems():Boolean {
			return shengwang_buy_items$field != null;
		}

		public function set shengwangBuyItems(value:String):void {
			shengwang_buy_items$field = value;
		}

		public function get shengwangBuyItems():String {
			return shengwang_buy_items$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasShengwangBuyItems) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, shengwang_buy_items$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var shengwang_buy_items$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (shengwang_buy_items$count != 0) {
						throw new flash.errors.IOError('Bad data format: LimitbuyS2C.shengwangBuyItems cannot be set twice.');
					}
					++shengwang_buy_items$count;
					this.shengwangBuyItems = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
