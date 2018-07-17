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
	public dynamic final class HeroimageS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const USER_MOVIE_FRAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.HeroimageS2C.user_movie_frame", "userMovieFrame", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var user_movie_frame$field:String;

		public function clearUserMovieFrame():void {
			user_movie_frame$field = null;
		}

		public function get hasUserMovieFrame():Boolean {
			return user_movie_frame$field != null;
		}

		public function set userMovieFrame(value:String):void {
			user_movie_frame$field = value;
		}

		public function get userMovieFrame():String {
			return user_movie_frame$field;
		}

		/**
		 *  @private
		 */
		public static const USER_COLORS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.HeroimageS2C.user_colors", "userColors", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var user_colors$field:String;

		public function clearUserColors():void {
			user_colors$field = null;
		}

		public function get hasUserColors():Boolean {
			return user_colors$field != null;
		}

		public function set userColors(value:String):void {
			user_colors$field = value;
		}

		public function get userColors():String {
			return user_colors$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUserMovieFrame) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_movie_frame$field);
			}
			if (hasUserColors) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_colors$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var user_movie_frame$count:uint = 0;
			var user_colors$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (user_movie_frame$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroimageS2C.userMovieFrame cannot be set twice.');
					}
					++user_movie_frame$count;
					this.userMovieFrame = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (user_colors$count != 0) {
						throw new flash.errors.IOError('Bad data format: HeroimageS2C.userColors cannot be set twice.');
					}
					++user_colors$count;
					this.userColors = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
