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
	public dynamic final class YunYingC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const PLATNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.YunYingC2S.platname", "platname", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var platname$field:String;

		public function clearPlatname():void {
			platname$field = null;
		}

		public function get hasPlatname():Boolean {
			return platname$field != null;
		}

		public function set platname(value:String):void {
			platname$field = value;
		}

		public function get platname():String {
			return platname$field;
		}

		/**
		 *  @private
		 */
		public static const CDKEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.YunYingC2S.cdkey", "cdkey", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var cdkey$field:String;

		public function clearCdkey():void {
			cdkey$field = null;
		}

		public function get hasCdkey():Boolean {
			return cdkey$field != null;
		}

		public function set cdkey(value:String):void {
			cdkey$field = value;
		}

		public function get cdkey():String {
			return cdkey$field;
		}

		/**
		 *  @private
		 */
		public static const LVHUODONGREWARDID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.YunYingC2S.lvHuodongRewardId", "lvHuodongRewardId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var lvHuodongRewardId$field:int;

		private var hasField$0:uint = 0;

		public function clearLvHuodongRewardId():void {
			hasField$0 &= 0xfffffffe;
			lvHuodongRewardId$field = new int();
		}

		public function get hasLvHuodongRewardId():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set lvHuodongRewardId(value:int):void {
			hasField$0 |= 0x1;
			lvHuodongRewardId$field = value;
		}

		public function get lvHuodongRewardId():int {
			return lvHuodongRewardId$field;
		}

		/**
		 *  @private
		 */
		public static const PAYHUODONGREWARDID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.YunYingC2S.payHuodongRewardId", "payHuodongRewardId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var payHuodongRewardId$field:int;

		public function clearPayHuodongRewardId():void {
			hasField$0 &= 0xfffffffd;
			payHuodongRewardId$field = new int();
		}

		public function get hasPayHuodongRewardId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set payHuodongRewardId(value:int):void {
			hasField$0 |= 0x2;
			payHuodongRewardId$field = value;
		}

		public function get payHuodongRewardId():int {
			return payHuodongRewardId$field;
		}

		/**
		 *  @private
		 */
		public static const COLLECTID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.YunYingC2S.collectId", "collectId", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var collectId$field:int;

		public function clearCollectId():void {
			hasField$0 &= 0xfffffffb;
			collectId$field = new int();
		}

		public function get hasCollectId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set collectId(value:int):void {
			hasField$0 |= 0x4;
			collectId$field = value;
		}

		public function get collectId():int {
			return collectId$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasPlatname) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, platname$field);
			}
			if (hasCdkey) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, cdkey$field);
			}
			if (hasLvHuodongRewardId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, lvHuodongRewardId$field);
			}
			if (hasPayHuodongRewardId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, payHuodongRewardId$field);
			}
			if (hasCollectId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, collectId$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var platname$count:uint = 0;
			var cdkey$count:uint = 0;
			var lvHuodongRewardId$count:uint = 0;
			var payHuodongRewardId$count:uint = 0;
			var collectId$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (platname$count != 0) {
						throw new flash.errors.IOError('Bad data format: YunYingC2S.platname cannot be set twice.');
					}
					++platname$count;
					this.platname = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (cdkey$count != 0) {
						throw new flash.errors.IOError('Bad data format: YunYingC2S.cdkey cannot be set twice.');
					}
					++cdkey$count;
					this.cdkey = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (lvHuodongRewardId$count != 0) {
						throw new flash.errors.IOError('Bad data format: YunYingC2S.lvHuodongRewardId cannot be set twice.');
					}
					++lvHuodongRewardId$count;
					this.lvHuodongRewardId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (payHuodongRewardId$count != 0) {
						throw new flash.errors.IOError('Bad data format: YunYingC2S.payHuodongRewardId cannot be set twice.');
					}
					++payHuodongRewardId$count;
					this.payHuodongRewardId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (collectId$count != 0) {
						throw new flash.errors.IOError('Bad data format: YunYingC2S.collectId cannot be set twice.');
					}
					++collectId$count;
					this.collectId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
