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
	public dynamic final class TuhaorankS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.TuhaorankS2C.uid", "uid", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const USER_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.TuhaorankS2C.user_name", "userName", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const USER_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.TuhaorankS2C.user_level", "userLevel", (3 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const RANK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.TuhaorankS2C.rank", "rank", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var rank$field:int;

		public function clearRank():void {
			hasField$0 &= 0xfffffffb;
			rank$field = new int();
		}

		public function get hasRank():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set rank(value:int):void {
			hasField$0 |= 0x4;
			rank$field = value;
		}

		public function get rank():int {
			return rank$field;
		}

		/**
		 *  @private
		 */
		public static const CHONGBAI_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.TuhaorankS2C.chongbai_count", "chongbaiCount", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var chongbai_count$field:int;

		public function clearChongbaiCount():void {
			hasField$0 &= 0xfffffff7;
			chongbai_count$field = new int();
		}

		public function get hasChongbaiCount():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set chongbaiCount(value:int):void {
			hasField$0 |= 0x8;
			chongbai_count$field = value;
		}

		public function get chongbaiCount():int {
			return chongbai_count$field;
		}

		/**
		 *  @private
		 */
		public static const BISHI_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.TuhaorankS2C.bishi_count", "bishiCount", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bishi_count$field:int;

		public function clearBishiCount():void {
			hasField$0 &= 0xffffffef;
			bishi_count$field = new int();
		}

		public function get hasBishiCount():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set bishiCount(value:int):void {
			hasField$0 |= 0x10;
			bishi_count$field = value;
		}

		public function get bishiCount():int {
			return bishi_count$field;
		}

		/**
		 *  @private
		 */
		public static const VIP_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.TuhaorankS2C.vip_level", "vipLevel", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var vip_level$field:int;

		public function clearVipLevel():void {
			hasField$0 &= 0xffffffdf;
			vip_level$field = new int();
		}

		public function get hasVipLevel():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set vipLevel(value:int):void {
			hasField$0 |= 0x20;
			vip_level$field = value;
		}

		public function get vipLevel():int {
			return vip_level$field;
		}

		/**
		 *  @private
		 */
		public static const USER_GUNID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.TuhaorankS2C.user_gunId", "userGunId", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_gunId$field:int;

		public function clearUserGunId():void {
			hasField$0 &= 0xffffffbf;
			user_gunId$field = new int();
		}

		public function get hasUserGunId():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set userGunId(value:int):void {
			hasField$0 |= 0x40;
			user_gunId$field = value;
		}

		public function get userGunId():int {
			return user_gunId$field;
		}

		/**
		 *  @private
		 */
		public static const USER_IMAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.TuhaorankS2C.user_image", "userImage", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_image$field:int;

		public function clearUserImage():void {
			hasField$0 &= 0xffffff7f;
			user_image$field = new int();
		}

		public function get hasUserImage():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set userImage(value:int):void {
			hasField$0 |= 0x80;
			user_image$field = value;
		}

		public function get userImage():int {
			return user_image$field;
		}

		/**
		 *  @private
		 */
		public static const USER_MOVIE_FRAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.TuhaorankS2C.user_movie_frame", "userMovieFrame", (10 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const USER_COLORS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.TuhaorankS2C.user_colors", "userColors", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
			if (hasRank) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, rank$field);
			}
			if (hasChongbaiCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, chongbai_count$field);
			}
			if (hasBishiCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, bishi_count$field);
			}
			if (hasVipLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, vip_level$field);
			}
			if (hasUserGunId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_gunId$field);
			}
			if (hasUserImage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_image$field);
			}
			if (hasUserMovieFrame) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_movie_frame$field);
			}
			if (hasUserColors) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
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
			var uid$count:uint = 0;
			var user_name$count:uint = 0;
			var user_level$count:uint = 0;
			var rank$count:uint = 0;
			var chongbai_count$count:uint = 0;
			var bishi_count$count:uint = 0;
			var vip_level$count:uint = 0;
			var user_gunId$count:uint = 0;
			var user_image$count:uint = 0;
			var user_movie_frame$count:uint = 0;
			var user_colors$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: TuhaorankS2C.uid cannot be set twice.');
					}
					++uid$count;
					this.uid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (user_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: TuhaorankS2C.userName cannot be set twice.');
					}
					++user_name$count;
					this.userName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (user_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: TuhaorankS2C.userLevel cannot be set twice.');
					}
					++user_level$count;
					this.userLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (rank$count != 0) {
						throw new flash.errors.IOError('Bad data format: TuhaorankS2C.rank cannot be set twice.');
					}
					++rank$count;
					this.rank = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (chongbai_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: TuhaorankS2C.chongbaiCount cannot be set twice.');
					}
					++chongbai_count$count;
					this.chongbaiCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (bishi_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: TuhaorankS2C.bishiCount cannot be set twice.');
					}
					++bishi_count$count;
					this.bishiCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (vip_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: TuhaorankS2C.vipLevel cannot be set twice.');
					}
					++vip_level$count;
					this.vipLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (user_gunId$count != 0) {
						throw new flash.errors.IOError('Bad data format: TuhaorankS2C.userGunId cannot be set twice.');
					}
					++user_gunId$count;
					this.userGunId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (user_image$count != 0) {
						throw new flash.errors.IOError('Bad data format: TuhaorankS2C.userImage cannot be set twice.');
					}
					++user_image$count;
					this.userImage = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (user_movie_frame$count != 0) {
						throw new flash.errors.IOError('Bad data format: TuhaorankS2C.userMovieFrame cannot be set twice.');
					}
					++user_movie_frame$count;
					this.userMovieFrame = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 11:
					if (user_colors$count != 0) {
						throw new flash.errors.IOError('Bad data format: TuhaorankS2C.userColors cannot be set twice.');
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
