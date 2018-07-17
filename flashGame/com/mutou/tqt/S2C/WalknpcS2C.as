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
	public dynamic final class WalknpcS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.WalknpcS2C.uid", "uid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var uid$field:int;

		private var hasField$0:uint = 0;

		public function clearUid():void {
			hasField$0 &= 0xfffffffe;
			uid$field = new int();
		}

		public function get hasUid():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set uid(value:int):void {
			hasField$0 |= 0x1;
			uid$field = value;
		}

		public function get uid():int {
			return uid$field;
		}

		/**
		 *  @private
		 */
		public static const USER_GUNID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.WalknpcS2C.user_gunId", "userGunId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_gunId$field:int;

		public function clearUserGunId():void {
			hasField$0 &= 0xfffffffd;
			user_gunId$field = new int();
		}

		public function get hasUserGunId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set userGunId(value:int):void {
			hasField$0 |= 0x2;
			user_gunId$field = value;
		}

		public function get userGunId():int {
			return user_gunId$field;
		}

		/**
		 *  @private
		 */
		public static const USER_IMAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.WalknpcS2C.user_image", "userImage", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_image$field:int;

		public function clearUserImage():void {
			hasField$0 &= 0xfffffffb;
			user_image$field = new int();
		}

		public function get hasUserImage():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set userImage(value:int):void {
			hasField$0 |= 0x4;
			user_image$field = value;
		}

		public function get userImage():int {
			return user_image$field;
		}

		/**
		 *  @private
		 */
		public static const USER_MOVIE_FRAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.WalknpcS2C.user_movie_frame", "userMovieFrame", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const USER_COLORS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.WalknpcS2C.user_colors", "userColors", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const USER_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.WalknpcS2C.user_name", "userName", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var user_name$field:String;

		public function clearUserName():void {
			user_name$field = null;
		}

		public function get hasUserName():Boolean {
			return user_name$field != null;
		}

		public function set userName(value:String):void {
			user_name$field = value;
		}

		public function get userName():String {
			return user_name$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, uid$field);
			}
			if (hasUserGunId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_gunId$field);
			}
			if (hasUserImage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_image$field);
			}
			if (hasUserMovieFrame) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_movie_frame$field);
			}
			if (hasUserColors) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_colors$field);
			}
			if (hasUserName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_name$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var uid$count:uint = 0;
			var user_gunId$count:uint = 0;
			var user_image$count:uint = 0;
			var user_movie_frame$count:uint = 0;
			var user_colors$count:uint = 0;
			var user_name$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: WalknpcS2C.uid cannot be set twice.');
					}
					++uid$count;
					this.uid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (user_gunId$count != 0) {
						throw new flash.errors.IOError('Bad data format: WalknpcS2C.userGunId cannot be set twice.');
					}
					++user_gunId$count;
					this.userGunId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (user_image$count != 0) {
						throw new flash.errors.IOError('Bad data format: WalknpcS2C.userImage cannot be set twice.');
					}
					++user_image$count;
					this.userImage = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (user_movie_frame$count != 0) {
						throw new flash.errors.IOError('Bad data format: WalknpcS2C.userMovieFrame cannot be set twice.');
					}
					++user_movie_frame$count;
					this.userMovieFrame = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (user_colors$count != 0) {
						throw new flash.errors.IOError('Bad data format: WalknpcS2C.userColors cannot be set twice.');
					}
					++user_colors$count;
					this.userColors = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (user_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: WalknpcS2C.userName cannot be set twice.');
					}
					++user_name$count;
					this.userName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
