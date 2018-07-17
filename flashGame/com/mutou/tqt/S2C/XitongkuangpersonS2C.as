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
	public dynamic final class XitongkuangpersonS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const MAIN_USER_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.XitongkuangpersonS2C.main_user_name", "mainUserName", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var main_user_name$field:String;

		public function clearMainUserName():void {
			main_user_name$field = null;
		}

		public function get hasMainUserName():Boolean {
			return main_user_name$field != null;
		}

		public function set mainUserName(value:String):void {
			main_user_name$field = value;
		}

		public function get mainUserName():String {
			return main_user_name$field;
		}

		/**
		 *  @private
		 */
		public static const MAIN_USER_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.XitongkuangpersonS2C.main_user_id", "mainUserId", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var main_user_id$field:int;

		private var hasField$0:uint = 0;

		public function clearMainUserId():void {
			hasField$0 &= 0xfffffffe;
			main_user_id$field = new int();
		}

		public function get hasMainUserId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set mainUserId(value:int):void {
			hasField$0 |= 0x1;
			main_user_id$field = value;
		}

		public function get mainUserId():int {
			return main_user_id$field;
		}

		/**
		 *  @private
		 */
		public static const OCCUPIED_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.XitongkuangpersonS2C.occupied_time", "occupiedTime", (3 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var occupied_time$field:UInt64;

		public function clearOccupiedTime():void {
			occupied_time$field = null;
		}

		public function get hasOccupiedTime():Boolean {
			return occupied_time$field != null;
		}

		public function set occupiedTime(value:UInt64):void {
			occupied_time$field = value;
		}

		public function get occupiedTime():UInt64 {
			return occupied_time$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY_TOTAL_PRODUCT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.XitongkuangpersonS2C.money_total_product", "moneyTotalProduct", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money_total_product$field:int;

		public function clearMoneyTotalProduct():void {
			hasField$0 &= 0xfffffffd;
			money_total_product$field = new int();
		}

		public function get hasMoneyTotalProduct():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set moneyTotalProduct(value:int):void {
			hasField$0 |= 0x2;
			money_total_product$field = value;
		}

		public function get moneyTotalProduct():int {
			return money_total_product$field;
		}

		/**
		 *  @private
		 */
		public static const UID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.XitongkuangpersonS2C.uid", "uid", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var uid$field:int;

		public function clearUid():void {
			hasField$0 &= 0xfffffffb;
			uid$field = new int();
		}

		public function get hasUid():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set uid(value:int):void {
			hasField$0 |= 0x4;
			uid$field = value;
		}

		public function get uid():int {
			return uid$field;
		}

		/**
		 *  @private
		 */
		public static const USER_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.XitongkuangpersonS2C.user_name", "userName", (6 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const USER_LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.XitongkuangpersonS2C.user_level", "userLevel", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_level$field:int;

		public function clearUserLevel():void {
			hasField$0 &= 0xfffffff7;
			user_level$field = new int();
		}

		public function get hasUserLevel():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set userLevel(value:int):void {
			hasField$0 |= 0x8;
			user_level$field = value;
		}

		public function get userLevel():int {
			return user_level$field;
		}

		/**
		 *  @private
		 */
		public static const KUANG_ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.XitongkuangpersonS2C.kuang_id", "kuangId", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var kuang_id$field:int;

		public function clearKuangId():void {
			hasField$0 &= 0xffffffef;
			kuang_id$field = new int();
		}

		public function get hasKuangId():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set kuangId(value:int):void {
			hasField$0 |= 0x10;
			kuang_id$field = value;
		}

		public function get kuangId():int {
			return kuang_id$field;
		}

		/**
		 *  @private
		 */
		public static const USER_GUNID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.XitongkuangpersonS2C.user_gunId", "userGunId", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_gunId$field:int;

		public function clearUserGunId():void {
			hasField$0 &= 0xffffffdf;
			user_gunId$field = new int();
		}

		public function get hasUserGunId():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set userGunId(value:int):void {
			hasField$0 |= 0x20;
			user_gunId$field = value;
		}

		public function get userGunId():int {
			return user_gunId$field;
		}

		/**
		 *  @private
		 */
		public static const USER_IMAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.XitongkuangpersonS2C.user_image", "userImage", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var user_image$field:int;

		public function clearUserImage():void {
			hasField$0 &= 0xffffffbf;
			user_image$field = new int();
		}

		public function get hasUserImage():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set userImage(value:int):void {
			hasField$0 |= 0x40;
			user_image$field = value;
		}

		public function get userImage():int {
			return user_image$field;
		}

		/**
		 *  @private
		 */
		public static const USER_MOVIE_FRAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.XitongkuangpersonS2C.user_movie_frame", "userMovieFrame", (11 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const USER_COLORS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.XitongkuangpersonS2C.user_colors", "userColors", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const FIGHTPOINT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.XitongkuangpersonS2C.fightPoint", "fightPoint", (13 << 3) | com.netease.protobuf.WireType.VARINT);

		private var fightPoint$field:int;

		public function clearFightPoint():void {
			hasField$0 &= 0xffffff7f;
			fightPoint$field = new int();
		}

		public function get hasFightPoint():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set fightPoint(value:int):void {
			hasField$0 |= 0x80;
			fightPoint$field = value;
		}

		public function get fightPoint():int {
			return fightPoint$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasMainUserName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, main_user_name$field);
			}
			if (hasMainUserId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, main_user_id$field);
			}
			if (hasOccupiedTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, occupied_time$field);
			}
			if (hasMoneyTotalProduct) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, money_total_product$field);
			}
			if (hasUid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, uid$field);
			}
			if (hasUserName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_name$field);
			}
			if (hasUserLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_level$field);
			}
			if (hasKuangId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, kuang_id$field);
			}
			if (hasUserGunId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_gunId$field);
			}
			if (hasUserImage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_image$field);
			}
			if (hasUserMovieFrame) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_movie_frame$field);
			}
			if (hasUserColors) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_colors$field);
			}
			if (hasFightPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 13);
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
			var main_user_name$count:uint = 0;
			var main_user_id$count:uint = 0;
			var occupied_time$count:uint = 0;
			var money_total_product$count:uint = 0;
			var uid$count:uint = 0;
			var user_name$count:uint = 0;
			var user_level$count:uint = 0;
			var kuang_id$count:uint = 0;
			var user_gunId$count:uint = 0;
			var user_image$count:uint = 0;
			var user_movie_frame$count:uint = 0;
			var user_colors$count:uint = 0;
			var fightPoint$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (main_user_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: XitongkuangpersonS2C.mainUserName cannot be set twice.');
					}
					++main_user_name$count;
					this.mainUserName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (main_user_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: XitongkuangpersonS2C.mainUserId cannot be set twice.');
					}
					++main_user_id$count;
					this.mainUserId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (occupied_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: XitongkuangpersonS2C.occupiedTime cannot be set twice.');
					}
					++occupied_time$count;
					this.occupiedTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 4:
					if (money_total_product$count != 0) {
						throw new flash.errors.IOError('Bad data format: XitongkuangpersonS2C.moneyTotalProduct cannot be set twice.');
					}
					++money_total_product$count;
					this.moneyTotalProduct = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (uid$count != 0) {
						throw new flash.errors.IOError('Bad data format: XitongkuangpersonS2C.uid cannot be set twice.');
					}
					++uid$count;
					this.uid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (user_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: XitongkuangpersonS2C.userName cannot be set twice.');
					}
					++user_name$count;
					this.userName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 7:
					if (user_level$count != 0) {
						throw new flash.errors.IOError('Bad data format: XitongkuangpersonS2C.userLevel cannot be set twice.');
					}
					++user_level$count;
					this.userLevel = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (kuang_id$count != 0) {
						throw new flash.errors.IOError('Bad data format: XitongkuangpersonS2C.kuangId cannot be set twice.');
					}
					++kuang_id$count;
					this.kuangId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (user_gunId$count != 0) {
						throw new flash.errors.IOError('Bad data format: XitongkuangpersonS2C.userGunId cannot be set twice.');
					}
					++user_gunId$count;
					this.userGunId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (user_image$count != 0) {
						throw new flash.errors.IOError('Bad data format: XitongkuangpersonS2C.userImage cannot be set twice.');
					}
					++user_image$count;
					this.userImage = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (user_movie_frame$count != 0) {
						throw new flash.errors.IOError('Bad data format: XitongkuangpersonS2C.userMovieFrame cannot be set twice.');
					}
					++user_movie_frame$count;
					this.userMovieFrame = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 12:
					if (user_colors$count != 0) {
						throw new flash.errors.IOError('Bad data format: XitongkuangpersonS2C.userColors cannot be set twice.');
					}
					++user_colors$count;
					this.userColors = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 13:
					if (fightPoint$count != 0) {
						throw new flash.errors.IOError('Bad data format: XitongkuangpersonS2C.fightPoint cannot be set twice.');
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
