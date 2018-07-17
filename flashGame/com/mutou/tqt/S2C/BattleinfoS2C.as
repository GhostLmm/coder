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
	public dynamic final class BattleinfoS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HEROHP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BattleinfoS2C.heroHp", "heroHp", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var heroHp$field:int;

		private var hasField$0:uint = 0;

		public function clearHeroHp():void {
			hasField$0 &= 0xfffffffe;
			heroHp$field = new int();
		}

		public function get hasHeroHp():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set heroHp(value:int):void {
			hasField$0 |= 0x1;
			heroHp$field = value;
		}

		public function get heroHp():int {
			return heroHp$field;
		}

		/**
		 *  @private
		 */
		public static const SKILLAVAILABLE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.BattleinfoS2C.skillAvailable", "skillAvailable", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var skillAvailable$field:String;

		public function clearSkillAvailable():void {
			skillAvailable$field = null;
		}

		public function get hasSkillAvailable():Boolean {
			return skillAvailable$field != null;
		}

		public function set skillAvailable(value:String):void {
			skillAvailable$field = value;
		}

		public function get skillAvailable():String {
			return skillAvailable$field;
		}

		/**
		 *  @private
		 */
		public static const SKILLCD:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.BattleinfoS2C.skillCD", "skillCD", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var skillCD$field:String;

		public function clearSkillCD():void {
			skillCD$field = null;
		}

		public function get hasSkillCD():Boolean {
			return skillCD$field != null;
		}

		public function set skillCD(value:String):void {
			skillCD$field = value;
		}

		public function get skillCD():String {
			return skillCD$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasHeroHp) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, heroHp$field);
			}
			if (hasSkillAvailable) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, skillAvailable$field);
			}
			if (hasSkillCD) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, skillCD$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var heroHp$count:uint = 0;
			var skillAvailable$count:uint = 0;
			var skillCD$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (heroHp$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleinfoS2C.heroHp cannot be set twice.');
					}
					++heroHp$count;
					this.heroHp = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (skillAvailable$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleinfoS2C.skillAvailable cannot be set twice.');
					}
					++skillAvailable$count;
					this.skillAvailable = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (skillCD$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleinfoS2C.skillCD cannot be set twice.');
					}
					++skillCD$count;
					this.skillCD = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
