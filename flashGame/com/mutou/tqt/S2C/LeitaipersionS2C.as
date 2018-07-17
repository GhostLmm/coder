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
	public dynamic final class LeitaipersionS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.LeitaipersionS2C.uid", "uid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const USER_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.LeitaipersionS2C.user_name", "userName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const USER_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.LeitaipersionS2C.user_level", "userLevel", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_level$field:int;

		public function clearUserLevel():void {
			hasField$0 &= 0xfffffffd;
			user_level$field = new int();
		}

		public function get hasUserLevel():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set userLevel(value:int):void {
			hasField$0 |= 0x2;
			user_level$field = value;
		}

		public function get userLevel():int {
			return user_level$field;
		}

		/**
		 *  @private
		 */
		public static const USER_RANK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.LeitaipersionS2C.user_rank", "userRank", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_rank$field:int;

		public function clearUserRank():void {
			hasField$0 &= 0xfffffffb;
			user_rank$field = new int();
		}

		public function get hasUserRank():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set userRank(value:int):void {
			hasField$0 |= 0x4;
			user_rank$field = value;
		}

		public function get userRank():int {
			return user_rank$field;
		}

		/**
		 *  @private
		 */
		public static const USER_GUNID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.LeitaipersionS2C.user_gunId", "userGunId", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_gunId$field:int;

		public function clearUserGunId():void {
			hasField$0 &= 0xfffffff7;
			user_gunId$field = new int();
		}

		public function get hasUserGunId():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set userGunId(value:int):void {
			hasField$0 |= 0x8;
			user_gunId$field = value;
		}

		public function get userGunId():int {
			return user_gunId$field;
		}

		/**
		 *  @private
		 */
		public static const USER_IMAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.LeitaipersionS2C.user_image", "userImage", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_image$field:int;

		public function clearUserImage():void {
			hasField$0 &= 0xffffffef;
			user_image$field = new int();
		}

		public function get hasUserImage():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set userImage(value:int):void {
			hasField$0 |= 0x10;
			user_image$field = value;
		}

		public function get userImage():int {
			return user_image$field;
		}

		/**
		 *  @private
		 */
		public static const USER_MOVIE_FRAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.LeitaipersionS2C.user_movie_frame", "userMovieFrame", (7 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const USER_COLORS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.LeitaipersionS2C.user_colors", "userColors", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const FIGHTPOINT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.LeitaipersionS2C.fightPoint", "fightPoint", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fightPoint$field:int;

		public function clearFightPoint():void {
			hasField$0 &= 0xffffffdf;
			fightPoint$field = new int();
		}

		public function get hasFightPoint():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set fightPoint(value:int):void {
			hasField$0 |= 0x20;
			fightPoint$field = value;
		}

		public function get fightPoint():int {
			return fightPoint$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, uid$field);
			}
			if (hasUserName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_name$field);
			}
			if (hasUserLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_level$field);
			}
			if (hasUserRank) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_rank$field);
			}
			if (hasUserGunId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_gunId$field);
			}
			if (hasUserImage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_image$field);
			}
			if (hasUserMovieFrame) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_movie_frame$field);
			}
			if (hasUserColors) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_colors$field);
			}
			if (hasFightPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, fightPoint$field);
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
			var user_name$count:uint = 0;
			var user_level$count:uint = 0;
			var user_rank$count:uint = 0;
			var user_gunId$count:uint = 0;
			var user_image$count:uint = 0;
			var user_movie_frame$count:uint = 0;
			var user_colors$count:uint = 0;
			var fightPoint$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaipersionS2C.uid cannot be set twice.');
					}
					++uid$count;
					this.uid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (user_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaipersionS2C.userName cannot be set twice.');
					}
					++user_name$count;
					this.userName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (user_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaipersionS2C.userLevel cannot be set twice.');
					}
					++user_level$count;
					this.userLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (user_rank$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaipersionS2C.userRank cannot be set twice.');
					}
					++user_rank$count;
					this.userRank = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (user_gunId$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaipersionS2C.userGunId cannot be set twice.');
					}
					++user_gunId$count;
					this.userGunId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (user_image$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaipersionS2C.userImage cannot be set twice.');
					}
					++user_image$count;
					this.userImage = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (user_movie_frame$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaipersionS2C.userMovieFrame cannot be set twice.');
					}
					++user_movie_frame$count;
					this.userMovieFrame = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 8:
					if (user_colors$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaipersionS2C.userColors cannot be set twice.');
					}
					++user_colors$count;
					this.userColors = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 9:
					if (fightPoint$count != 0) {
						throw new flash.errors.IOError('Bad data format: LeitaipersionS2C.fightPoint cannot be set twice.');
					}
					++fightPoint$count;
					this.fightPoint = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
