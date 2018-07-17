package com.ghostlmm.gamedataconfig {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import com.ghostlmm.gamedataconfig.CharAnimDataProto;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class MovieDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const CHARANIMDATAS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("com.ghostlmm.gamedataconfig.MovieDataProto.charAnimDatas", "charAnimDatas", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return com.ghostlmm.gamedataconfig.CharAnimDataProto; });

		[ArrayElementType("com.ghostlmm.gamedataconfig.CharAnimDataProto")]
		public var charAnimDatas:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var charAnimDatas$index:uint = 0; charAnimDatas$index < this.charAnimDatas.length; ++charAnimDatas$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.charAnimDatas[charAnimDatas$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					this.charAnimDatas.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new com.ghostlmm.gamedataconfig.CharAnimDataProto()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
