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
	public dynamic final class ShenmishangdianS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const REFRESH_TIME:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("com.mutou.tqt.S2C.ShenmishangdianS2C.refresh_time", "refreshTime", (1 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

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
		public static const GOUMAI_ITEMS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.ShenmishangdianS2C.goumai_items", "goumaiItems", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var goumai_items$field:String;

		public function clearGoumaiItems():void {
			goumai_items$field = null;
		}

		public function get hasGoumaiItems():Boolean {
			return goumai_items$field != null;
		}

		public function set goumaiItems(value:String):void {
			goumai_items$field = value;
		}

		public function get goumaiItems():String {
			return goumai_items$field;
		}

		/**
		 *  @private
		 */
		public static const BUY_ITEMS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.ShenmishangdianS2C.buy_items", "buyItems", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var buy_items$field:String;

		public function clearBuyItems():void {
			buy_items$field = null;
		}

		public function get hasBuyItems():Boolean {
			return buy_items$field != null;
		}

		public function set buyItems(value:String):void {
			buy_items$field = value;
		}

		public function get buyItems():String {
			return buy_items$field;
		}

		/**
		 *  @private
		 */
		public static const SHUAXIN_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.ShenmishangdianS2C.shuaxin_count", "shuaxinCount", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var shuaxin_count$field:int;

		public function clearShuaxinCount():void {
			hasField$0 &= 0xfffffffd;
			shuaxin_count$field = new int();
		}

		public function get hasShuaxinCount():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set shuaxinCount(value:int):void {
			hasField$0 |= 0x2;
			shuaxin_count$field = value;
		}

		public function get shuaxinCount():int {
			return shuaxin_count$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRefreshTime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, refresh_time$field);
			}
			if (hasGoumaiItems) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, goumai_items$field);
			}
			if (hasBuyItems) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, buy_items$field);
			}
			if (hasShuaxinCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, shuaxin_count$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var refresh_time$count:uint = 0;
			var goumai_items$count:uint = 0;
			var buy_items$count:uint = 0;
			var shuaxin_count$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (refresh_time$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShenmishangdianS2C.refreshTime cannot be set twice.');
					}
					++refresh_time$count;
					this.refreshTime = com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input);
					break;
				case 2:
					if (goumai_items$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShenmishangdianS2C.goumaiItems cannot be set twice.');
					}
					++goumai_items$count;
					this.goumaiItems = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (buy_items$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShenmishangdianS2C.buyItems cannot be set twice.');
					}
					++buy_items$count;
					this.buyItems = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (shuaxin_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: ShenmishangdianS2C.shuaxinCount cannot be set twice.');
					}
					++shuaxin_count$count;
					this.shuaxinCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
