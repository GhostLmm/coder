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
	public dynamic final class RankoptS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const LEVEL_CHONGBAI:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.RankoptS2C.level_chongbai", "levelChongbai", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var level_chongbai$field:String;

		public function clearLevelChongbai():void {
			level_chongbai$field = null;
		}

		public function get hasLevelChongbai():Boolean {
			return level_chongbai$field != null;
		}

		public function set levelChongbai(value:String):void {
			level_chongbai$field = value;
		}

		public function get levelChongbai():String {
			return level_chongbai$field;
		}

		/**
		 *  @private
		 */
		public static const LEITAI_CHONGBAI:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.RankoptS2C.leitai_chongbai", "leitaiChongbai", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var leitai_chongbai$field:String;

		public function clearLeitaiChongbai():void {
			leitai_chongbai$field = null;
		}

		public function get hasLeitaiChongbai():Boolean {
			return leitai_chongbai$field != null;
		}

		public function set leitaiChongbai(value:String):void {
			leitai_chongbai$field = value;
		}

		public function get leitaiChongbai():String {
			return leitai_chongbai$field;
		}

		/**
		 *  @private
		 */
		public static const TUHAO_CHONGBAI:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.RankoptS2C.tuhao_chongbai", "tuhaoChongbai", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var tuhao_chongbai$field:String;

		public function clearTuhaoChongbai():void {
			tuhao_chongbai$field = null;
		}

		public function get hasTuhaoChongbai():Boolean {
			return tuhao_chongbai$field != null;
		}

		public function set tuhaoChongbai(value:String):void {
			tuhao_chongbai$field = value;
		}

		public function get tuhaoChongbai():String {
			return tuhao_chongbai$field;
		}

		/**
		 *  @private
		 */
		public static const LIANSHEN_CHONGBAI:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.RankoptS2C.lianshen_chongbai", "lianshenChongbai", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var lianshen_chongbai$field:String;

		public function clearLianshenChongbai():void {
			lianshen_chongbai$field = null;
		}

		public function get hasLianshenChongbai():Boolean {
			return lianshen_chongbai$field != null;
		}

		public function set lianshenChongbai(value:String):void {
			lianshen_chongbai$field = value;
		}

		public function get lianshenChongbai():String {
			return lianshen_chongbai$field;
		}

		/**
		 *  @private
		 */
		public static const TUHAO_BISHI:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.RankoptS2C.tuhao_bishi", "tuhaoBishi", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var tuhao_bishi$field:String;

		public function clearTuhaoBishi():void {
			tuhao_bishi$field = null;
		}

		public function get hasTuhaoBishi():Boolean {
			return tuhao_bishi$field != null;
		}

		public function set tuhaoBishi(value:String):void {
			tuhao_bishi$field = value;
		}

		public function get tuhaoBishi():String {
			return tuhao_bishi$field;
		}

		/**
		 *  @private
		 */
		public static const IS_HIDE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.RankoptS2C.is_hide", "isHide", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var is_hide$field:int;

		private var hasField$0:uint = 0;

		public function clearIsHide():void {
			hasField$0 &= 0xfffffffe;
			is_hide$field = new int();
		}

		public function get hasIsHide():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set isHide(value:int):void {
			hasField$0 |= 0x1;
			is_hide$field = value;
		}

		public function get isHide():int {
			return is_hide$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasLevelChongbai) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, level_chongbai$field);
			}
			if (hasLeitaiChongbai) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, leitai_chongbai$field);
			}
			if (hasTuhaoChongbai) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, tuhao_chongbai$field);
			}
			if (hasLianshenChongbai) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, lianshen_chongbai$field);
			}
			if (hasTuhaoBishi) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, tuhao_bishi$field);
			}
			if (hasIsHide) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, is_hide$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var level_chongbai$count:uint = 0;
			var leitai_chongbai$count:uint = 0;
			var tuhao_chongbai$count:uint = 0;
			var lianshen_chongbai$count:uint = 0;
			var tuhao_bishi$count:uint = 0;
			var is_hide$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (level_chongbai$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankoptS2C.levelChongbai cannot be set twice.');
					}
					++level_chongbai$count;
					this.levelChongbai = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (leitai_chongbai$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankoptS2C.leitaiChongbai cannot be set twice.');
					}
					++leitai_chongbai$count;
					this.leitaiChongbai = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (tuhao_chongbai$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankoptS2C.tuhaoChongbai cannot be set twice.');
					}
					++tuhao_chongbai$count;
					this.tuhaoChongbai = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (lianshen_chongbai$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankoptS2C.lianshenChongbai cannot be set twice.');
					}
					++lianshen_chongbai$count;
					this.lianshenChongbai = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (tuhao_bishi$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankoptS2C.tuhaoBishi cannot be set twice.');
					}
					++tuhao_bishi$count;
					this.tuhaoBishi = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (is_hide$count != 0) {
						throw new flash.errors.IOError('Bad data format: RankoptS2C.isHide cannot be set twice.');
					}
					++is_hide$count;
					this.isHide = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
