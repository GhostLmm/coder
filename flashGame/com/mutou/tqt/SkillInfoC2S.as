package com.mutou.tqt {
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
	public dynamic final class SkillInfoC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SKILLID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("com.mutou.tqt.SkillInfoC2S.skillId", "skillId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var skillId$field:Int64;

		public function clearSkillId():void {
			skillId$field = null;
		}

		public function get hasSkillId():Boolean {
			return skillId$field != null;
		}

		public function set skillId(value:Int64):void {
			skillId$field = value;
		}

		public function get skillId():Int64 {
			return skillId$field;
		}

		/**
		 *  @private
		 */
		public static const SKILLS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.SkillInfoC2S.skills", "skills", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var skills$field:String;

		public function clearSkills():void {
			skills$field = null;
		}

		public function get hasSkills():Boolean {
			return skills$field != null;
		}

		public function set skills(value:String):void {
			skills$field = value;
		}

		public function get skills():String {
			return skills$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSkillId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, skillId$field);
			}
			if (hasSkills) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, skills$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var skillId$count:uint = 0;
			var skills$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (skillId$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillInfoC2S.skillId cannot be set twice.');
					}
					++skillId$count;
					this.skillId = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (skills$count != 0) {
						throw new flash.errors.IOError('Bad data format: SkillInfoC2S.skills cannot be set twice.');
					}
					++skills$count;
					this.skills = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
