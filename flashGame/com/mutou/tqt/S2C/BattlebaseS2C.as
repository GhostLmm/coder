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
	public dynamic final class BattlebaseS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const BATTLE_MUST_END_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.BattlebaseS2C.battle_must_end_time", "battleMustEndTime", (1 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var battle_must_end_time$field:UInt64;

		public function clearBattleMustEndTime():void {
			battle_must_end_time$field = null;
		}

		public function get hasBattleMustEndTime():Boolean {
			return battle_must_end_time$field != null;
		}

		public function set battleMustEndTime(value:UInt64):void {
			battle_must_end_time$field = value;
		}

		public function get battleMustEndTime():UInt64 {
			return battle_must_end_time$field;
		}

		/**
		 *  @private
		 */
		public static const BATTLE_BEGIN_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.BattlebaseS2C.battle_begin_time", "battleBeginTime", (2 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var battle_begin_time$field:UInt64;

		public function clearBattleBeginTime():void {
			battle_begin_time$field = null;
		}

		public function get hasBattleBeginTime():Boolean {
			return battle_begin_time$field != null;
		}

		public function set battleBeginTime(value:UInt64):void {
			battle_begin_time$field = value;
		}

		public function get battleBeginTime():UInt64 {
			return battle_begin_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasBattleMustEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, battle_must_end_time$field);
			}
			if (hasBattleBeginTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, battle_begin_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var battle_must_end_time$count:uint = 0;
			var battle_begin_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (battle_must_end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattlebaseS2C.battleMustEndTime cannot be set twice.');
					}
					++battle_must_end_time$count;
					this.battleMustEndTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 2:
					if (battle_begin_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattlebaseS2C.battleBeginTime cannot be set twice.');
					}
					++battle_begin_time$count;
					this.battleBeginTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
