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
	public dynamic final class SaodangresultS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const DROP_ITEMS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.SaodangresultS2C.drop_items", "dropItems", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var drop_items$field:String;

		public function clearDropItems():void {
			drop_items$field = null;
		}

		public function get hasDropItems():Boolean {
			return drop_items$field != null;
		}

		public function set dropItems(value:String):void {
			drop_items$field = value;
		}

		public function get dropItems():String {
			return drop_items$field;
		}

		/**
		 *  @private
		 */
		public static const DROP_COLLECTS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.SaodangresultS2C.drop_collects", "dropCollects", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var drop_collects$field:String;

		public function clearDropCollects():void {
			drop_collects$field = null;
		}

		public function get hasDropCollects():Boolean {
			return drop_collects$field != null;
		}

		public function set dropCollects(value:String):void {
			drop_collects$field = value;
		}

		public function get dropCollects():String {
			return drop_collects$field;
		}

		/**
		 *  @private
		 */
		public static const REFRESH_TIME:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("com.mutou.tqt.S2C.SaodangresultS2C.refresh_time", "refreshTime", (3 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var refresh_time$field:Number;

		private var hasField$0:uint = 0;

		public function clearRefreshTime():void {
			hasField$0 &= 0xfffffffe;
			refresh_time$field = new Number();
		}

		public function get hasRefreshTime():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set refreshTime(value:Number):void {
			hasField$0 |= 0x1;
			refresh_time$field = value;
		}

		public function get refreshTime():Number {
			return refresh_time$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasDropItems) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, drop_items$field);
			}
			if (hasDropCollects) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, drop_collects$field);
			}
			if (hasRefreshTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, refresh_time$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var drop_items$count:uint = 0;
			var drop_collects$count:uint = 0;
			var refresh_time$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (drop_items$count != 0) {
						throw new flash.errors.IOError('Bad data format: SaodangresultS2C.dropItems cannot be set twice.');
					}
					++drop_items$count;
					this.dropItems = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (drop_collects$count != 0) {
						throw new flash.errors.IOError('Bad data format: SaodangresultS2C.dropCollects cannot be set twice.');
					}
					++drop_collects$count;
					this.dropCollects = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (refresh_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: SaodangresultS2C.refreshTime cannot be set twice.');
					}
					++refresh_time$count;
					this.refreshTime = com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
