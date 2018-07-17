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
	public dynamic final class BattleheroS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattleheroS2C.id", "id", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const XID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattleheroS2C.xid", "xid", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var xid$field:int;

		public function clearXid():void {
			hasField$0 &= 0xfffffffd;
			xid$field = new int();
		}

		public function get hasXid():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set xid(value:int):void {
			hasField$0 |= 0x2;
			xid$field = value;
		}

		public function get xid():int {
			return xid$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattleheroS2C.level", "level", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var level$field:int;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffb;
			level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x4;
			level$field = value;
		}

		public function get level():int {
			return level$field;
		}

		/**
		 *  @private
		 */
		public static const HP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattleheroS2C.hp", "hp", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hp$field:int;

		public function clearHp():void {
			hasField$0 &= 0xfffffff7;
			hp$field = new int();
		}

		public function get hasHp():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set hp(value:int):void {
			hasField$0 |= 0x8;
			hp$field = value;
		}

		public function get hp():int {
			return hp$field;
		}

		/**
		 *  @private
		 */
		public static const ATK:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattleheroS2C.atk", "atk", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var atk$field:int;

		public function clearAtk():void {
			hasField$0 &= 0xffffffef;
			atk$field = new int();
		}

		public function get hasAtk():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set atk(value:int):void {
			hasField$0 |= 0x10;
			atk$field = value;
		}

		public function get atk():int {
			return atk$field;
		}

		/**
		 *  @private
		 */
		public static const DEF:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattleheroS2C.def", "def", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var def$field:int;

		public function clearDef():void {
			hasField$0 &= 0xffffffdf;
			def$field = new int();
		}

		public function get hasDef():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set def(value:int):void {
			hasField$0 |= 0x20;
			def$field = value;
		}

		public function get def():int {
			return def$field;
		}

		/**
		 *  @private
		 */
		public static const SPEED:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattleheroS2C.speed", "speed", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var speed$field:int;

		public function clearSpeed():void {
			hasField$0 &= 0xffffffbf;
			speed$field = new int();
		}

		public function get hasSpeed():Boolean {
			return (hasField$0 & 0x40) != 0;
		}

		public function set speed(value:int):void {
			hasField$0 |= 0x40;
			speed$field = value;
		}

		public function get speed():int {
			return speed$field;
		}

		/**
		 *  @private
		 */
		public static const CRI:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattleheroS2C.cri", "cri", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cri$field:int;

		public function clearCri():void {
			hasField$0 &= 0xffffff7f;
			cri$field = new int();
		}

		public function get hasCri():Boolean {
			return (hasField$0 & 0x80) != 0;
		}

		public function set cri(value:int):void {
			hasField$0 |= 0x80;
			cri$field = value;
		}

		public function get cri():int {
			return cri$field;
		}

		/**
		 *  @private
		 */
		public static const RENXING:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattleheroS2C.renxing", "renxing", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var renxing$field:int;

		public function clearRenxing():void {
			hasField$0 &= 0xfffffeff;
			renxing$field = new int();
		}

		public function get hasRenxing():Boolean {
			return (hasField$0 & 0x100) != 0;
		}

		public function set renxing(value:int):void {
			hasField$0 |= 0x100;
			renxing$field = value;
		}

		public function get renxing():int {
			return renxing$field;
		}

		/**
		 *  @private
		 */
		public static const HIT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattleheroS2C.hit", "hit", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var hit$field:int;

		public function clearHit():void {
			hasField$0 &= 0xfffffdff;
			hit$field = new int();
		}

		public function get hasHit():Boolean {
			return (hasField$0 & 0x200) != 0;
		}

		public function set hit(value:int):void {
			hasField$0 |= 0x200;
			hit$field = value;
		}

		public function get hit():int {
			return hit$field;
		}

		/**
		 *  @private
		 */
		public static const EVA:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattleheroS2C.eva", "eva", (11 << 3) | com.netease.protobuf.WireType.VARINT);

		private var eva$field:int;

		public function clearEva():void {
			hasField$0 &= 0xfffffbff;
			eva$field = new int();
		}

		public function get hasEva():Boolean {
			return (hasField$0 & 0x400) != 0;
		}

		public function set eva(value:int):void {
			hasField$0 |= 0x400;
			eva$field = value;
		}

		public function get eva():int {
			return eva$field;
		}

		/**
		 *  @private
		 */
		public static const USER_MOVIE_FRAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.BattleheroS2C.user_movie_frame", "userMovieFrame", (12 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const USER_COLORS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.BattleheroS2C.user_colors", "userColors", (13 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const NB_SPEED:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("com.mutou.tqt.S2C.BattleheroS2C.nb_speed", "nbSpeed", (14 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var nb_speed$field:Number;

		public function clearNbSpeed():void {
			hasField$0 &= 0xfffff7ff;
			nb_speed$field = new Number();
		}

		public function get hasNbSpeed():Boolean {
			return (hasField$0 & 0x800) != 0;
		}

		public function set nbSpeed(value:Number):void {
			hasField$0 |= 0x800;
			nb_speed$field = value;
		}

		public function get nbSpeed():Number {
			return nb_speed$field;
		}

		/**
		 *  @private
		 */
		public static const NB_CRI:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("com.mutou.tqt.S2C.BattleheroS2C.nb_cri", "nbCri", (15 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var nb_cri$field:Number;

		public function clearNbCri():void {
			hasField$0 &= 0xffffefff;
			nb_cri$field = new Number();
		}

		public function get hasNbCri():Boolean {
			return (hasField$0 & 0x1000) != 0;
		}

		public function set nbCri(value:Number):void {
			hasField$0 |= 0x1000;
			nb_cri$field = value;
		}

		public function get nbCri():Number {
			return nb_cri$field;
		}

		/**
		 *  @private
		 */
		public static const NB_RENXING:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("com.mutou.tqt.S2C.BattleheroS2C.nb_renxing", "nbRenxing", (16 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var nb_renxing$field:Number;

		public function clearNbRenxing():void {
			hasField$0 &= 0xffffdfff;
			nb_renxing$field = new Number();
		}

		public function get hasNbRenxing():Boolean {
			return (hasField$0 & 0x2000) != 0;
		}

		public function set nbRenxing(value:Number):void {
			hasField$0 |= 0x2000;
			nb_renxing$field = value;
		}

		public function get nbRenxing():Number {
			return nb_renxing$field;
		}

		/**
		 *  @private
		 */
		public static const NB_HIT:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("com.mutou.tqt.S2C.BattleheroS2C.nb_hit", "nbHit", (17 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var nb_hit$field:Number;

		public function clearNbHit():void {
			hasField$0 &= 0xffffbfff;
			nb_hit$field = new Number();
		}

		public function get hasNbHit():Boolean {
			return (hasField$0 & 0x4000) != 0;
		}

		public function set nbHit(value:Number):void {
			hasField$0 |= 0x4000;
			nb_hit$field = value;
		}

		public function get nbHit():Number {
			return nb_hit$field;
		}

		/**
		 *  @private
		 */
		public static const NB_EVA:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("com.mutou.tqt.S2C.BattleheroS2C.nb_eva", "nbEva", (18 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var nb_eva$field:Number;

		public function clearNbEva():void {
			hasField$0 &= 0xffff7fff;
			nb_eva$field = new Number();
		}

		public function get hasNbEva():Boolean {
			return (hasField$0 & 0x8000) != 0;
		}

		public function set nbEva(value:Number):void {
			hasField$0 |= 0x8000;
			nb_eva$field = value;
		}

		public function get nbEva():Number {
			return nb_eva$field;
		}

		/**
		 *  @private
		 */
		public static const NB_DAMAGE:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("com.mutou.tqt.S2C.BattleheroS2C.nb_damage", "nbDamage", (19 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var nb_damage$field:Number;

		public function clearNbDamage():void {
			hasField$0 &= 0xfffeffff;
			nb_damage$field = new Number();
		}

		public function get hasNbDamage():Boolean {
			return (hasField$0 & 0x10000) != 0;
		}

		public function set nbDamage(value:Number):void {
			hasField$0 |= 0x10000;
			nb_damage$field = value;
		}

		public function get nbDamage():Number {
			return nb_damage$field;
		}

		/**
		 *  @private
		 */
		public static const NB_XIXUE:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("com.mutou.tqt.S2C.BattleheroS2C.nb_xixue", "nbXixue", (20 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var nb_xixue$field:Number;

		public function clearNbXixue():void {
			hasField$0 &= 0xfffdffff;
			nb_xixue$field = new Number();
		}

		public function get hasNbXixue():Boolean {
			return (hasField$0 & 0x20000) != 0;
		}

		public function set nbXixue(value:Number):void {
			hasField$0 |= 0x20000;
			nb_xixue$field = value;
		}

		public function get nbXixue():Number {
			return nb_xixue$field;
		}

		/**
		 *  @private
		 */
		public static const NB_FANSHANG:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("com.mutou.tqt.S2C.BattleheroS2C.nb_fanshang", "nbFanshang", (21 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var nb_fanshang$field:Number;

		public function clearNbFanshang():void {
			hasField$0 &= 0xfffbffff;
			nb_fanshang$field = new Number();
		}

		public function get hasNbFanshang():Boolean {
			return (hasField$0 & 0x40000) != 0;
		}

		public function set nbFanshang(value:Number):void {
			hasField$0 |= 0x40000;
			nb_fanshang$field = value;
		}

		public function get nbFanshang():Number {
			return nb_fanshang$field;
		}

		/**
		 *  @private
		 */
		public static const NB_MONEY:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("com.mutou.tqt.S2C.BattleheroS2C.nb_money", "nbMoney", (22 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var nb_money$field:Number;

		public function clearNbMoney():void {
			hasField$0 &= 0xfff7ffff;
			nb_money$field = new Number();
		}

		public function get hasNbMoney():Boolean {
			return (hasField$0 & 0x80000) != 0;
		}

		public function set nbMoney(value:Number):void {
			hasField$0 |= 0x80000;
			nb_money$field = value;
		}

		public function get nbMoney():Number {
			return nb_money$field;
		}

		/**
		 *  @private
		 */
		public static const NB_EXP:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("com.mutou.tqt.S2C.BattleheroS2C.nb_exp", "nbExp", (23 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var nb_exp$field:Number;

		public function clearNbExp():void {
			hasField$0 &= 0xffefffff;
			nb_exp$field = new Number();
		}

		public function get hasNbExp():Boolean {
			return (hasField$0 & 0x100000) != 0;
		}

		public function set nbExp(value:Number):void {
			hasField$0 |= 0x100000;
			nb_exp$field = value;
		}

		public function get nbExp():Number {
			return nb_exp$field;
		}

		/**
		 *  @private
		 */
		public static const MAIN_GUN:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattleheroS2C.main_gun", "mainGun", (24 << 3) | com.netease.protobuf.WireType.VARINT);

		private var main_gun$field:int;

		public function clearMainGun():void {
			hasField$0 &= 0xffdfffff;
			main_gun$field = new int();
		}

		public function get hasMainGun():Boolean {
			return (hasField$0 & 0x200000) != 0;
		}

		public function set mainGun(value:int):void {
			hasField$0 |= 0x200000;
			main_gun$field = value;
		}

		public function get mainGun():int {
			return main_gun$field;
		}

		/**
		 *  @private
		 */
		public static const NB_CRIDAMAGE:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("com.mutou.tqt.S2C.BattleheroS2C.nb_cridamage", "nbCridamage", (25 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var nb_cridamage$field:Number;

		public function clearNbCridamage():void {
			hasField$0 &= 0xffbfffff;
			nb_cridamage$field = new Number();
		}

		public function get hasNbCridamage():Boolean {
			return (hasField$0 & 0x400000) != 0;
		}

		public function set nbCridamage(value:Number):void {
			hasField$0 |= 0x400000;
			nb_cridamage$field = value;
		}

		public function get nbCridamage():Number {
			return nb_cridamage$field;
		}

		/**
		 *  @private
		 */
		public static const CURHP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattleheroS2C.curhp", "curhp", (26 << 3) | com.netease.protobuf.WireType.VARINT);

		private var curhp$field:int;

		public function clearCurhp():void {
			hasField$0 &= 0xff7fffff;
			curhp$field = new int();
		}

		public function get hasCurhp():Boolean {
			return (hasField$0 & 0x800000) != 0;
		}

		public function set curhp(value:int):void {
			hasField$0 |= 0x800000;
			curhp$field = value;
		}

		public function get curhp():int {
			return curhp$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, id$field);
			}
			if (hasXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, xid$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, level$field);
			}
			if (hasHp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, hp$field);
			}
			if (hasAtk) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, atk$field);
			}
			if (hasDef) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, def$field);
			}
			if (hasSpeed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, speed$field);
			}
			if (hasCri) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cri$field);
			}
			if (hasRenxing) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, renxing$field);
			}
			if (hasHit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, hit$field);
			}
			if (hasEva) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, eva$field);
			}
			if (hasUserMovieFrame) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_movie_frame$field);
			}
			if (hasUserColors) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, user_colors$field);
			}
			if (hasNbSpeed) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, nb_speed$field);
			}
			if (hasNbCri) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, nb_cri$field);
			}
			if (hasNbRenxing) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, nb_renxing$field);
			}
			if (hasNbHit) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, nb_hit$field);
			}
			if (hasNbEva) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 18);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, nb_eva$field);
			}
			if (hasNbDamage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 19);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, nb_damage$field);
			}
			if (hasNbXixue) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, nb_xixue$field);
			}
			if (hasNbFanshang) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, nb_fanshang$field);
			}
			if (hasNbMoney) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, nb_money$field);
			}
			if (hasNbExp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 23);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, nb_exp$field);
			}
			if (hasMainGun) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 24);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, main_gun$field);
			}
			if (hasNbCridamage) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 25);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, nb_cridamage$field);
			}
			if (hasCurhp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 26);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, curhp$field);
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
			var xid$count:uint = 0;
			var level$count:uint = 0;
			var hp$count:uint = 0;
			var atk$count:uint = 0;
			var def$count:uint = 0;
			var speed$count:uint = 0;
			var cri$count:uint = 0;
			var renxing$count:uint = 0;
			var hit$count:uint = 0;
			var eva$count:uint = 0;
			var user_movie_frame$count:uint = 0;
			var user_colors$count:uint = 0;
			var nb_speed$count:uint = 0;
			var nb_cri$count:uint = 0;
			var nb_renxing$count:uint = 0;
			var nb_hit$count:uint = 0;
			var nb_eva$count:uint = 0;
			var nb_damage$count:uint = 0;
			var nb_xixue$count:uint = 0;
			var nb_fanshang$count:uint = 0;
			var nb_money$count:uint = 0;
			var nb_exp$count:uint = 0;
			var main_gun$count:uint = 0;
			var nb_cridamage$count:uint = 0;
			var curhp$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.id cannot be set twice.');
					}
					++id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (xid$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.xid cannot be set twice.');
					}
					++xid$count;
					this.xid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (level$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.level cannot be set twice.');
					}
					++level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (hp$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.hp cannot be set twice.');
					}
					++hp$count;
					this.hp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (atk$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.atk cannot be set twice.');
					}
					++atk$count;
					this.atk = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 6:
					if (def$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.def cannot be set twice.');
					}
					++def$count;
					this.def = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (speed$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.speed cannot be set twice.');
					}
					++speed$count;
					this.speed = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (cri$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.cri cannot be set twice.');
					}
					++cri$count;
					this.cri = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 9:
					if (renxing$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.renxing cannot be set twice.');
					}
					++renxing$count;
					this.renxing = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (hit$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.hit cannot be set twice.');
					}
					++hit$count;
					this.hit = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 11:
					if (eva$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.eva cannot be set twice.');
					}
					++eva$count;
					this.eva = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 12:
					if (user_movie_frame$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.userMovieFrame cannot be set twice.');
					}
					++user_movie_frame$count;
					this.userMovieFrame = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 13:
					if (user_colors$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.userColors cannot be set twice.');
					}
					++user_colors$count;
					this.userColors = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 14:
					if (nb_speed$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.nbSpeed cannot be set twice.');
					}
					++nb_speed$count;
					this.nbSpeed = com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input);
					break;
				case 15:
					if (nb_cri$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.nbCri cannot be set twice.');
					}
					++nb_cri$count;
					this.nbCri = com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input);
					break;
				case 16:
					if (nb_renxing$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.nbRenxing cannot be set twice.');
					}
					++nb_renxing$count;
					this.nbRenxing = com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input);
					break;
				case 17:
					if (nb_hit$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.nbHit cannot be set twice.');
					}
					++nb_hit$count;
					this.nbHit = com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input);
					break;
				case 18:
					if (nb_eva$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.nbEva cannot be set twice.');
					}
					++nb_eva$count;
					this.nbEva = com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input);
					break;
				case 19:
					if (nb_damage$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.nbDamage cannot be set twice.');
					}
					++nb_damage$count;
					this.nbDamage = com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input);
					break;
				case 20:
					if (nb_xixue$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.nbXixue cannot be set twice.');
					}
					++nb_xixue$count;
					this.nbXixue = com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input);
					break;
				case 21:
					if (nb_fanshang$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.nbFanshang cannot be set twice.');
					}
					++nb_fanshang$count;
					this.nbFanshang = com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input);
					break;
				case 22:
					if (nb_money$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.nbMoney cannot be set twice.');
					}
					++nb_money$count;
					this.nbMoney = com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input);
					break;
				case 23:
					if (nb_exp$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.nbExp cannot be set twice.');
					}
					++nb_exp$count;
					this.nbExp = com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input);
					break;
				case 24:
					if (main_gun$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.mainGun cannot be set twice.');
					}
					++main_gun$count;
					this.mainGun = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 25:
					if (nb_cridamage$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.nbCridamage cannot be set twice.');
					}
					++nb_cridamage$count;
					this.nbCridamage = com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input);
					break;
				case 26:
					if (curhp$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleheroS2C.curhp cannot be set twice.');
					}
					++curhp$count;
					this.curhp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
