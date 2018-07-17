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
	public dynamic final class JinyanS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const START_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.JinyanS2C.start_time", "startTime", (1 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var start_time$field:UInt64;

		public function clearStartTime():void {
			start_time$field = null;
		}

		public function get hasStartTime():Boolean {
			return start_time$field != null;
		}

		public function set startTime(value:UInt64):void {
			start_time$field = value;
		}

		public function get startTime():UInt64 {
			return start_time$field;
		}

		/**
		 *  @private
		 */
		public static const END_TIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.JinyanS2C.end_time", "endTime", (2 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var end_time$field:UInt64;

		public function clearEndTime():void {
			end_time$field = null;
		}

		public function get hasEndTime():Boolean {
			return end_time$field != null;
		}

		public function set endTime(value:UInt64):void {
			end_time$field = value;
		}

		public function get endTime():UInt64 {
			return end_time$field;
		}

		/**
		 *  @private
		 */
		public static const JINYAN_SHIJIE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.JinyanS2C.jinyan_shijie", "jinyanShijie", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var jinyan_shijie$field:int;

		private var hasField$0:uint = 0;

		public function clearJinyanShijie():void {
			hasField$0 &= 0xfffffffe;
			jinyan_shijie$field = new int();
		}

		public function get hasJinyanShijie():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set jinyanShijie(value:int):void {
			hasField$0 |= 0x1;
			jinyan_shijie$field = value;
		}

		public function get jinyanShijie():int {
			return jinyan_shijie$field;
		}

		/**
		 *  @private
		 */
		public static const JINYAN_BANGHUI:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.JinyanS2C.jinyan_banghui", "jinyanBanghui", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var jinyan_banghui$field:int;

		public function clearJinyanBanghui():void {
			hasField$0 &= 0xfffffffd;
			jinyan_banghui$field = new int();
		}

		public function get hasJinyanBanghui():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set jinyanBanghui(value:int):void {
			hasField$0 |= 0x2;
			jinyan_banghui$field = value;
		}

		public function get jinyanBanghui():int {
			return jinyan_banghui$field;
		}

		/**
		 *  @private
		 */
		public static const DESC:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.JinyanS2C.desc", "desc", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var desc$field:String;

		public function clearDesc():void {
			desc$field = null;
		}

		public function get hasDesc():Boolean {
			return desc$field != null;
		}

		public function set desc(value:String):void {
			desc$field = value;
		}

		public function get desc():String {
			return desc$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasStartTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, start_time$field);
			}
			if (hasEndTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, end_time$field);
			}
			if (hasJinyanShijie) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, jinyan_shijie$field);
			}
			if (hasJinyanBanghui) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, jinyan_banghui$field);
			}
			if (hasDesc) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, desc$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var start_time$count:uint = 0;
			var end_time$count:uint = 0;
			var jinyan_shijie$count:uint = 0;
			var jinyan_banghui$count:uint = 0;
			var desc$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (start_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinyanS2C.startTime cannot be set twice.');
					}
					++start_time$count;
					this.startTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 2:
					if (end_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinyanS2C.endTime cannot be set twice.');
					}
					++end_time$count;
					this.endTime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				case 3:
					if (jinyan_shijie$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinyanS2C.jinyanShijie cannot be set twice.');
					}
					++jinyan_shijie$count;
					this.jinyanShijie = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (jinyan_banghui$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinyanS2C.jinyanBanghui cannot be set twice.');
					}
					++jinyan_banghui$count;
					this.jinyanBanghui = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (desc$count != 0) {
						throw new flash.errors.IOError('Bad data format: JinyanS2C.desc cannot be set twice.');
					}
					++desc$count;
					this.desc = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
