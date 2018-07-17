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
	public dynamic final class JinkuanglogS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.JinkuanglogS2C.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var id$field:int;

		private var hasField$0:uint = 0;

		public function clearId():void {
			hasField$0 &= 0xfffffffe;
			id$field = new int();
		}

		public function get hasId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set id(value:int):void {
			hasField$0 |= 0x1;
			id$field = value;
		}

		public function get id():int {
			return id$field;
		}

		/**
		 *  @private
		 */
		public static const TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.JinkuanglogS2C.time", "time", (2 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var time$field:UInt64;

		public function clearTime():void {
			time$field = null;
		}

		public function get hasTime():Boolean {
			return time$field != null;
		}

		public function set time(value:UInt64):void {
			time$field = value;
		}

		public function get time():UInt64 {
			return time$field;
		}

		/**
		 *  @private
		 */
		public static const USER_NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.JinkuanglogS2C.user_name", "userName", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const TYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.JinkuanglogS2C.type", "type", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var type$field:int;

		public function clearType():void {
			hasField$0 &= 0xfffffffd;
			type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x2;
			type$field = value;
		}

		public function get type():int {
			return type$field;
		}

		/**
		 *  @private
		 */
		public static const MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.JinkuanglogS2C.money", "money", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var money$field:int;

		public function clearMoney():void {
			hasField$0 &= 0xfffffffb;
			money$field = new int();
		}

		public function get hasMoney():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set money(value:int):void {
			hasField$0 |= 0x4;
			money$field = value;
		}

		public function get money():int {
			return money$field;
		}

		/**
		 *  @private
		 */
		public static const LOST_MONEY:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.JinkuanglogS2C.lost_money", "lostMoney", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var lost_money$field:int;

		public function clearLostMoney():void {
			hasField$0 &= 0xfffffff7;
			lost_money$field = new int();
		}

		public function get hasLostMoney():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set lostMoney(value:int):void {
			hasField$0 |= 0x8;
			lost_money$field = value;
		}

		public function get lostMoney():int {
			return lost_money$field;
		}

		/**
		 *  @private
		 */
		public static const USER_IMAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.JinkuanglogS2C.user_image", "userImage", (7 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const USER_MOVIE_FRAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.JinkuanglogS2C.user_movie_frame", "userMovieFrame", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const USER_COLORS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.JinkuanglogS2C.user_colors", "userColors", (9 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const FIGHTPOINT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.JinkuanglogS2C.fightPoint", "fightPoint", (10 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const USER_GUNID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.JinkuanglogS2C.user_gunId", "userGunId", (11 << 3) | com.netease.protobuf.WireType.VARINT);

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
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, id$field);
			}
			if (hasTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, time$field);
			}
			if (hasUserName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_name$field);
			}
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, type$field);
			}
			if (hasMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, money$field);
			}
			if (hasLostMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, lost_money$field);
			}
			if (hasUserImage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_image$field);
			}
			if (hasUserMovieFrame) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_movie_frame$field);
			}
			if (hasUserColors) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_colors$field);
			}
			if (hasFightPoint) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, fightPoint$field);
			}
			if (hasUserGunId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, user_gunId$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var id$count:uint = 0;
			var time$count:uint = 0;
			var user_name$count:uint = 0;
			var type$count:uint = 0;
			var money$count:uint = 0;
			var lost_money$count:uint = 0;
			var user_image$count:uint = 0;
			var user_movie_frame$count:uint = 0;
			var user_colors$count:uint = 0;
			var fightPoint$count:uint = 0;
			var user_gunId$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinkuanglogS2C.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (time$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinkuanglogS2C.time cannot be set twice.');
					}
					++time$count;
					this.time = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 3:
					if (user_name$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinkuanglogS2C.userName cannot be set twice.');
					}
					++user_name$count;
					this.userName = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (type$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinkuanglogS2C.type cannot be set twice.');
					}
					++type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (money$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinkuanglogS2C.money cannot be set twice.');
					}
					++money$count;
					this.money = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (lost_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinkuanglogS2C.lostMoney cannot be set twice.');
					}
					++lost_money$count;
					this.lostMoney = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (user_image$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinkuanglogS2C.userImage cannot be set twice.');
					}
					++user_image$count;
					this.userImage = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (user_movie_frame$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinkuanglogS2C.userMovieFrame cannot be set twice.');
					}
					++user_movie_frame$count;
					this.userMovieFrame = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 9:
					if (user_colors$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinkuanglogS2C.userColors cannot be set twice.');
					}
					++user_colors$count;
					this.userColors = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 10:
					if (fightPoint$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinkuanglogS2C.fightPoint cannot be set twice.');
					}
					++fightPoint$count;
					this.fightPoint = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (user_gunId$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinkuanglogS2C.userGunId cannot be set twice.');
					}
					++user_gunId$count;
					this.userGunId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
