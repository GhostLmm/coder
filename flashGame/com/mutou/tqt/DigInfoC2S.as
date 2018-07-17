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
	public dynamic final class DigInfoC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const REWARDGOODS:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.DigInfoC2S.rewardGoods", "rewardGoods", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var rewardGoods$field:String;

		public function clearRewardGoods():void {
			rewardGoods$field = null;
		}

		public function get hasRewardGoods():Boolean {
			return rewardGoods$field != null;
		}

		public function set rewardGoods(value:String):void {
			rewardGoods$field = value;
		}

		public function get rewardGoods():String {
			return rewardGoods$field;
		}

		/**
		 *  @private
		 */
		public static const DIGCOUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.DigInfoC2S.digCount", "digCount", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var digCount$field:int;

		private var hasField$0:uint = 0;

		public function clearDigCount():void {
			hasField$0 &= 0xfffffffe;
			digCount$field = new int();
		}

		public function get hasDigCount():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set digCount(value:int):void {
			hasField$0 |= 0x1;
			digCount$field = value;
		}

		public function get digCount():int {
			return digCount$field;
		}

		/**
		 *  @private
		 */
		public static const EQUIPSELLSTAR:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.DigInfoC2S.equipSellStar", "equipSellStar", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var equipSellStar$field:int;

		public function clearEquipSellStar():void {
			hasField$0 &= 0xfffffffd;
			equipSellStar$field = new int();
		}

		public function get hasEquipSellStar():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set equipSellStar(value:int):void {
			hasField$0 |= 0x2;
			equipSellStar$field = value;
		}

		public function get equipSellStar():int {
			return equipSellStar$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasRewardGoods) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, rewardGoods$field);
			}
			if (hasDigCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, digCount$field);
			}
			if (hasEquipSellStar) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, equipSellStar$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var rewardGoods$count:uint = 0;
			var digCount$count:uint = 0;
			var equipSellStar$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (rewardGoods$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigInfoC2S.rewardGoods cannot be set twice.');
					}
					++rewardGoods$count;
					this.rewardGoods = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (digCount$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigInfoC2S.digCount cannot be set twice.');
					}
					++digCount$count;
					this.digCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (equipSellStar$count != 0) {
						throw new flash.errors.IOError('Bad data format: DigInfoC2S.equipSellStar cannot be set twice.');
					}
					++equipSellStar$count;
					this.equipSellStar = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
