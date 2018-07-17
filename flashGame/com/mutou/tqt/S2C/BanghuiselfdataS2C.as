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
	public dynamic final class BanghuiselfdataS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HIS_GONGXIAN:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BanghuiselfdataS2C.his_gongxian", "hisGongxian", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var his_gongxian$field:int;

		private var hasField$0:uint = 0;

		public function clearHisGongxian():void {
			hasField$0 &= 0xfffffffe;
			his_gongxian$field = new int();
		}

		public function get hasHisGongxian():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set hisGongxian(value:int):void {
			hasField$0 |= 0x1;
			his_gongxian$field = value;
		}

		public function get hisGongxian():int {
			return his_gongxian$field;
		}

		/**
		 *  @private
		 */
		public static const CUR_GONGXIAN:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BanghuiselfdataS2C.cur_gongxian", "curGongxian", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var cur_gongxian$field:int;

		public function clearCurGongxian():void {
			hasField$0 &= 0xfffffffd;
			cur_gongxian$field = new int();
		}

		public function get hasCurGongxian():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set curGongxian(value:int):void {
			hasField$0 |= 0x2;
			cur_gongxian$field = value;
		}

		public function get curGongxian():int {
			return cur_gongxian$field;
		}

		/**
		 *  @private
		 */
		public static const SHENGQING_LIST:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.BanghuiselfdataS2C.shengqing_list", "shengqingList", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var shengqing_list$field:String;

		public function clearShengqingList():void {
			shengqing_list$field = null;
		}

		public function get hasShengqingList():Boolean {
			return shengqing_list$field != null;
		}

		public function set shengqingList(value:String):void {
			shengqing_list$field = value;
		}

		public function get shengqingList():String {
			return shengqing_list$field;
		}

		/**
		 *  @private
		 */
		public static const BID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BanghuiselfdataS2C.bid", "bid", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var bid$field:int;

		public function clearBid():void {
			hasField$0 &= 0xfffffffb;
			bid$field = new int();
		}

		public function get hasBid():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set bid(value:int):void {
			hasField$0 |= 0x4;
			bid$field = value;
		}

		public function get bid():int {
			return bid$field;
		}

		/**
		 *  @private
		 */
		public static const BANGHUI_DAOJU:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.BanghuiselfdataS2C.banghui_daoju", "banghuiDaoju", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var banghui_daoju$field:String;

		public function clearBanghuiDaoju():void {
			banghui_daoju$field = null;
		}

		public function get hasBanghuiDaoju():Boolean {
			return banghui_daoju$field != null;
		}

		public function set banghuiDaoju(value:String):void {
			banghui_daoju$field = value;
		}

		public function get banghuiDaoju():String {
			return banghui_daoju$field;
		}

		/**
		 *  @private
		 */
		public static const JUANXIAN:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BanghuiselfdataS2C.juanxian", "juanxian", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var juanxian$field:int;

		public function clearJuanxian():void {
			hasField$0 &= 0xfffffff7;
			juanxian$field = new int();
		}

		public function get hasJuanxian():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set juanxian(value:int):void {
			hasField$0 |= 0x8;
			juanxian$field = value;
		}

		public function get juanxian():int {
			return juanxian$field;
		}

		/**
		 *  @private
		 */
		public static const CANBAI_COUNT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BanghuiselfdataS2C.canbai_count", "canbaiCount", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var canbai_count$field:int;

		public function clearCanbaiCount():void {
			hasField$0 &= 0xffffffef;
			canbai_count$field = new int();
		}

		public function get hasCanbaiCount():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set canbaiCount(value:int):void {
			hasField$0 |= 0x10;
			canbai_count$field = value;
		}

		public function get canbaiCount():int {
			return canbai_count$field;
		}

		/**
		 *  @private
		 */
		public static const HAS_CHUZHAN:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.S2C.BanghuiselfdataS2C.has_chuzhan", "hasChuzhan", (8 << 3) | com.netease.protobuf.WireType.VARINT);

		private var has_chuzhan$field:int;

		public function clearHasChuzhan():void {
			hasField$0 &= 0xffffffdf;
			has_chuzhan$field = new int();
		}

		public function get hasHasChuzhan():Boolean {
			return (hasField$0 & 0x20) != 0;
		}

		public function set hasChuzhan(value:int):void {
			hasField$0 |= 0x20;
			has_chuzhan$field = value;
		}

		public function get hasChuzhan():int {
			return has_chuzhan$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasHisGongxian) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, his_gongxian$field);
			}
			if (hasCurGongxian) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, cur_gongxian$field);
			}
			if (hasShengqingList) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, shengqing_list$field);
			}
			if (hasBid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, bid$field);
			}
			if (hasBanghuiDaoju) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, banghui_daoju$field);
			}
			if (hasJuanxian) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, juanxian$field);
			}
			if (hasCanbaiCount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, canbai_count$field);
			}
			if (hasHasChuzhan) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, has_chuzhan$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var his_gongxian$count:uint = 0;
			var cur_gongxian$count:uint = 0;
			var shengqing_list$count:uint = 0;
			var bid$count:uint = 0;
			var banghui_daoju$count:uint = 0;
			var juanxian$count:uint = 0;
			var canbai_count$count:uint = 0;
			var has_chuzhan$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (his_gongxian$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiselfdataS2C.hisGongxian cannot be set twice.');
					}
					++his_gongxian$count;
					this.hisGongxian = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (cur_gongxian$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiselfdataS2C.curGongxian cannot be set twice.');
					}
					++cur_gongxian$count;
					this.curGongxian = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (shengqing_list$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiselfdataS2C.shengqingList cannot be set twice.');
					}
					++shengqing_list$count;
					this.shengqingList = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (bid$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiselfdataS2C.bid cannot be set twice.');
					}
					++bid$count;
					this.bid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (banghui_daoju$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiselfdataS2C.banghuiDaoju cannot be set twice.');
					}
					++banghui_daoju$count;
					this.banghuiDaoju = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (juanxian$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiselfdataS2C.juanxian cannot be set twice.');
					}
					++juanxian$count;
					this.juanxian = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 7:
					if (canbai_count$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiselfdataS2C.canbaiCount cannot be set twice.');
					}
					++canbai_count$count;
					this.canbaiCount = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (has_chuzhan$count != 0) {
						throw new flash.errors.IOError('Bad data format: BanghuiselfdataS2C.hasChuzhan cannot be set twice.');
					}
					++has_chuzhan$count;
					this.hasChuzhan = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
