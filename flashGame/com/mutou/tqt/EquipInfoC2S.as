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
	public dynamic final class EquipInfoC2S extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const EQUIPID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("com.mutou.tqt.EquipInfoC2S.equipId", "equipId", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var equipId$field:Int64;

		public function clearEquipId():void {
			equipId$field = null;
		}

		public function get hasEquipId():Boolean {
			return equipId$field != null;
		}

		public function set equipId(value:Int64):void {
			equipId$field = value;
		}

		public function get equipId():Int64 {
			return equipId$field;
		}

		/**
		 *  @private
		 */
		public static const BAOSHIXID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.EquipInfoC2S.baoshiXid", "baoshiXid", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var baoshiXid$field:int;

		private var hasField$0:uint = 0;

		public function clearBaoshiXid():void {
			hasField$0 &= 0xfffffffe;
			baoshiXid$field = new int();
		}

		public function get hasBaoshiXid():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set baoshiXid(value:int):void {
			hasField$0 |= 0x1;
			baoshiXid$field = value;
		}

		public function get baoshiXid():int {
			return baoshiXid$field;
		}

		/**
		 *  @private
		 */
		public static const BAOSHIARMSTR:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.EquipInfoC2S.baoshiArmStr", "baoshiArmStr", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var baoshiArmStr$field:String;

		public function clearBaoshiArmStr():void {
			baoshiArmStr$field = null;
		}

		public function get hasBaoshiArmStr():Boolean {
			return baoshiArmStr$field != null;
		}

		public function set baoshiArmStr(value:String):void {
			baoshiArmStr$field = value;
		}

		public function get baoshiArmStr():String {
			return baoshiArmStr$field;
		}

		/**
		 *  @private
		 */
		public static const GRIDPOS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.EquipInfoC2S.gridPos", "gridPos", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var gridPos$field:int;

		public function clearGridPos():void {
			hasField$0 &= 0xfffffffd;
			gridPos$field = new int();
		}

		public function get hasGridPos():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set gridPos(value:int):void {
			hasField$0 |= 0x2;
			gridPos$field = value;
		}

		public function get gridPos():int {
			return gridPos$field;
		}

		/**
		 *  @private
		 */
		public static const IDLIST:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.EquipInfoC2S.idList", "idList", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var idList$field:String;

		public function clearIdList():void {
			idList$field = null;
		}

		public function get hasIdList():Boolean {
			return idList$field != null;
		}

		public function set idList(value:String):void {
			idList$field = value;
		}

		public function get idList():String {
			return idList$field;
		}

		/**
		 *  @private
		 */
		public static const EXTENDEQUIPID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("com.mutou.tqt.EquipInfoC2S.extendEquipId", "extendEquipId", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var extendEquipId$field:Int64;

		public function clearExtendEquipId():void {
			extendEquipId$field = null;
		}

		public function get hasExtendEquipId():Boolean {
			return extendEquipId$field != null;
		}

		public function set extendEquipId(value:Int64):void {
			extendEquipId$field = value;
		}

		public function get extendEquipId():Int64 {
			return extendEquipId$field;
		}

		/**
		 *  @private
		 */
		public static const MAINGUNXID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.EquipInfoC2S.mainGunXid", "mainGunXid", (7 << 3) | com.netease.protobuf.WireType.VARINT);

		private var mainGunXid$field:int;

		public function clearMainGunXid():void {
			hasField$0 &= 0xfffffffb;
			mainGunXid$field = new int();
		}

		public function get hasMainGunXid():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set mainGunXid(value:int):void {
			hasField$0 |= 0x4;
			mainGunXid$field = value;
		}

		public function get mainGunXid():int {
			return mainGunXid$field;
		}

		/**
		 *  @private
		 */
		public static const ARMGUNXIDLIST:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.EquipInfoC2S.armGunXidList", "armGunXidList", (8 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var armGunXidList$field:String;

		public function clearArmGunXidList():void {
			armGunXidList$field = null;
		}

		public function get hasArmGunXidList():Boolean {
			return armGunXidList$field != null;
		}

		public function set armGunXidList(value:String):void {
			armGunXidList$field = value;
		}

		public function get armGunXidList():String {
			return armGunXidList$field;
		}

		/**
		 *  @private
		 */
		public static const EQUIPTYPE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.EquipInfoC2S.equipType", "equipType", (9 << 3) | com.netease.protobuf.WireType.VARINT);

		private var equipType$field:int;

		public function clearEquipType():void {
			hasField$0 &= 0xfffffff7;
			equipType$field = new int();
		}

		public function get hasEquipType():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set equipType(value:int):void {
			hasField$0 |= 0x8;
			equipType$field = value;
		}

		public function get equipType():int {
			return equipType$field;
		}

		/**
		 *  @private
		 */
		public static const EQUIPBAOSHIGRID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.mutou.tqt.EquipInfoC2S.equipBaoshiGrid", "equipBaoshiGrid", (10 << 3) | com.netease.protobuf.WireType.VARINT);

		private var equipBaoshiGrid$field:int;

		public function clearEquipBaoshiGrid():void {
			hasField$0 &= 0xffffffef;
			equipBaoshiGrid$field = new int();
		}

		public function get hasEquipBaoshiGrid():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set equipBaoshiGrid(value:int):void {
			hasField$0 |= 0x10;
			equipBaoshiGrid$field = value;
		}

		public function get equipBaoshiGrid():int {
			return equipBaoshiGrid$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasEquipId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, equipId$field);
			}
			if (hasBaoshiXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, baoshiXid$field);
			}
			if (hasBaoshiArmStr) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, baoshiArmStr$field);
			}
			if (hasGridPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, gridPos$field);
			}
			if (hasIdList) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, idList$field);
			}
			if (hasExtendEquipId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_INT64(output, extendEquipId$field);
			}
			if (hasMainGunXid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, mainGunXid$field);
			}
			if (hasArmGunXidList) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, armGunXidList$field);
			}
			if (hasEquipType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, equipType$field);
			}
			if (hasEquipBaoshiGrid) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, equipBaoshiGrid$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var equipId$count:uint = 0;
			var baoshiXid$count:uint = 0;
			var baoshiArmStr$count:uint = 0;
			var gridPos$count:uint = 0;
			var idList$count:uint = 0;
			var extendEquipId$count:uint = 0;
			var mainGunXid$count:uint = 0;
			var armGunXidList$count:uint = 0;
			var equipType$count:uint = 0;
			var equipBaoshiGrid$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (equipId$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipInfoC2S.equipId cannot be set twice.');
					}
					++equipId$count;
					this.equipId = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 2:
					if (baoshiXid$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipInfoC2S.baoshiXid cannot be set twice.');
					}
					++baoshiXid$count;
					this.baoshiXid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (baoshiArmStr$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipInfoC2S.baoshiArmStr cannot be set twice.');
					}
					++baoshiArmStr$count;
					this.baoshiArmStr = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 4:
					if (gridPos$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipInfoC2S.gridPos cannot be set twice.');
					}
					++gridPos$count;
					this.gridPos = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (idList$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipInfoC2S.idList cannot be set twice.');
					}
					++idList$count;
					this.idList = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (extendEquipId$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipInfoC2S.extendEquipId cannot be set twice.');
					}
					++extendEquipId$count;
					this.extendEquipId = com.netease.protobuf.ReadUtils.read$TYPE_INT64(input);
					break;
				case 7:
					if (mainGunXid$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipInfoC2S.mainGunXid cannot be set twice.');
					}
					++mainGunXid$count;
					this.mainGunXid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 8:
					if (armGunXidList$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipInfoC2S.armGunXidList cannot be set twice.');
					}
					++armGunXidList$count;
					this.armGunXidList = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 9:
					if (equipType$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipInfoC2S.equipType cannot be set twice.');
					}
					++equipType$count;
					this.equipType = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 10:
					if (equipBaoshiGrid$count != 0) {
						throw new flash.errors.IOError('Bad data format: EquipInfoC2S.equipBaoshiGrid cannot be set twice.');
					}
					++equipBaoshiGrid$count;
					this.equipBaoshiGrid = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
