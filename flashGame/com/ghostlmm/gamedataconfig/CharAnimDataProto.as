package com.ghostlmm.gamedataconfig {
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
	public dynamic final class CharAnimDataProto extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const HEAD_R:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.head_r", "headR", (1 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var headR:Array = [];

		/**
		 *  @private
		 */
		public static const HEAD_X:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.head_x", "headX", (2 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var headX:Array = [];

		/**
		 *  @private
		 */
		public static const HEAD_Y:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.head_y", "headY", (3 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var headY:Array = [];

		/**
		 *  @private
		 */
		public static const BODY_X:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.body_x", "bodyX", (4 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var bodyX:Array = [];

		/**
		 *  @private
		 */
		public static const BODY_Y:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.body_y", "bodyY", (5 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var bodyY:Array = [];

		/**
		 *  @private
		 */
		public static const BODY_R:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.body_r", "bodyR", (6 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var bodyR:Array = [];

		/**
		 *  @private
		 */
		public static const FOOT1_X:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.foot1_x", "foot1X", (7 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var foot1X:Array = [];

		/**
		 *  @private
		 */
		public static const FOOT1_Y:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.foot1_y", "foot1Y", (8 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var foot1Y:Array = [];

		/**
		 *  @private
		 */
		public static const FOOT1_R:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.foot1_r", "foot1R", (9 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var foot1R:Array = [];

		/**
		 *  @private
		 */
		public static const FOOT2_X:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.foot2_x", "foot2X", (10 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var foot2X:Array = [];

		/**
		 *  @private
		 */
		public static const FOOT2_Y:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.foot2_y", "foot2Y", (11 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var foot2Y:Array = [];

		/**
		 *  @private
		 */
		public static const FOOT2_R:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.foot2_r", "foot2R", (12 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var foot2R:Array = [];

		/**
		 *  @private
		 */
		public static const ANKLE1_X:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.ankle1_x", "ankle1X", (13 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var ankle1X:Array = [];

		/**
		 *  @private
		 */
		public static const ANKLE1_Y:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.ankle1_y", "ankle1Y", (14 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var ankle1Y:Array = [];

		/**
		 *  @private
		 */
		public static const ANKLE1_R:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.ankle1_r", "ankle1R", (15 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var ankle1R:Array = [];

		/**
		 *  @private
		 */
		public static const ANKLE2_X:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.ankle2_x", "ankle2X", (16 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var ankle2X:Array = [];

		/**
		 *  @private
		 */
		public static const ANKLE2_Y:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.ankle2_y", "ankle2Y", (17 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var ankle2Y:Array = [];

		/**
		 *  @private
		 */
		public static const ANKLE2_R:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.ankle2_r", "ankle2R", (18 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var ankle2R:Array = [];

		/**
		 *  @private
		 */
		public static const HAND1_X:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.hand1_x", "hand1X", (19 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var hand1X:Array = [];

		/**
		 *  @private
		 */
		public static const HAND1_Y:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.hand1_y", "hand1Y", (20 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var hand1Y:Array = [];

		/**
		 *  @private
		 */
		public static const HAND1_R:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.hand1_r", "hand1R", (21 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var hand1R:Array = [];

		/**
		 *  @private
		 */
		public static const HAND2_X:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.hand2_x", "hand2X", (22 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var hand2X:Array = [];

		/**
		 *  @private
		 */
		public static const HAND2_Y:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.hand2_y", "hand2Y", (23 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var hand2Y:Array = [];

		/**
		 *  @private
		 */
		public static const HAND2_R:RepeatedFieldDescriptor$TYPE_DOUBLE = new RepeatedFieldDescriptor$TYPE_DOUBLE("com.ghostlmm.gamedataconfig.CharAnimDataProto.hand2_r", "hand2R", (24 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		[ArrayElementType("Number")]
		public var hand2R:Array = [];

		/**
		 *  @private
		 */
		public static const MAXFRAMES:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ghostlmm.gamedataconfig.CharAnimDataProto.maxFrames", "maxFrames", (25 << 3) | com.netease.protobuf.WireType.VARINT);

		public var maxFrames:int;

		/**
		 *  @private
		 */
		public static const HEADROT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ghostlmm.gamedataconfig.CharAnimDataProto.headRot", "headRot", (26 << 3) | com.netease.protobuf.WireType.VARINT);

		public var headRot:int;

		/**
		 *  @private
		 */
		public static const HASHANDS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("com.ghostlmm.gamedataconfig.CharAnimDataProto.hasHands", "hasHands", (27 << 3) | com.netease.protobuf.WireType.VARINT);

		public var hasHands:int;

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			for (var headR$index:uint = 0; headR$index < this.headR.length; ++headR$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.headR[headR$index]);
			}
			for (var headX$index:uint = 0; headX$index < this.headX.length; ++headX$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.headX[headX$index]);
			}
			for (var headY$index:uint = 0; headY$index < this.headY.length; ++headY$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.headY[headY$index]);
			}
			for (var bodyX$index:uint = 0; bodyX$index < this.bodyX.length; ++bodyX$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.bodyX[bodyX$index]);
			}
			for (var bodyY$index:uint = 0; bodyY$index < this.bodyY.length; ++bodyY$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.bodyY[bodyY$index]);
			}
			for (var bodyR$index:uint = 0; bodyR$index < this.bodyR.length; ++bodyR$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.bodyR[bodyR$index]);
			}
			for (var foot1X$index:uint = 0; foot1X$index < this.foot1X.length; ++foot1X$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 7);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.foot1X[foot1X$index]);
			}
			for (var foot1Y$index:uint = 0; foot1Y$index < this.foot1Y.length; ++foot1Y$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 8);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.foot1Y[foot1Y$index]);
			}
			for (var foot1R$index:uint = 0; foot1R$index < this.foot1R.length; ++foot1R$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 9);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.foot1R[foot1R$index]);
			}
			for (var foot2X$index:uint = 0; foot2X$index < this.foot2X.length; ++foot2X$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 10);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.foot2X[foot2X$index]);
			}
			for (var foot2Y$index:uint = 0; foot2Y$index < this.foot2Y.length; ++foot2Y$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 11);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.foot2Y[foot2Y$index]);
			}
			for (var foot2R$index:uint = 0; foot2R$index < this.foot2R.length; ++foot2R$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 12);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.foot2R[foot2R$index]);
			}
			for (var ankle1X$index:uint = 0; ankle1X$index < this.ankle1X.length; ++ankle1X$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 13);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.ankle1X[ankle1X$index]);
			}
			for (var ankle1Y$index:uint = 0; ankle1Y$index < this.ankle1Y.length; ++ankle1Y$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 14);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.ankle1Y[ankle1Y$index]);
			}
			for (var ankle1R$index:uint = 0; ankle1R$index < this.ankle1R.length; ++ankle1R$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 15);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.ankle1R[ankle1R$index]);
			}
			for (var ankle2X$index:uint = 0; ankle2X$index < this.ankle2X.length; ++ankle2X$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 16);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.ankle2X[ankle2X$index]);
			}
			for (var ankle2Y$index:uint = 0; ankle2Y$index < this.ankle2Y.length; ++ankle2Y$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 17);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.ankle2Y[ankle2Y$index]);
			}
			for (var ankle2R$index:uint = 0; ankle2R$index < this.ankle2R.length; ++ankle2R$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 18);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.ankle2R[ankle2R$index]);
			}
			for (var hand1X$index:uint = 0; hand1X$index < this.hand1X.length; ++hand1X$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 19);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.hand1X[hand1X$index]);
			}
			for (var hand1Y$index:uint = 0; hand1Y$index < this.hand1Y.length; ++hand1Y$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 20);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.hand1Y[hand1Y$index]);
			}
			for (var hand1R$index:uint = 0; hand1R$index < this.hand1R.length; ++hand1R$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 21);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.hand1R[hand1R$index]);
			}
			for (var hand2X$index:uint = 0; hand2X$index < this.hand2X.length; ++hand2X$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 22);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.hand2X[hand2X$index]);
			}
			for (var hand2Y$index:uint = 0; hand2Y$index < this.hand2Y.length; ++hand2Y$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 23);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.hand2Y[hand2Y$index]);
			}
			for (var hand2R$index:uint = 0; hand2R$index < this.hand2R.length; ++hand2R$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 24);
				com.netease.protobuf.WriteUtils.write$TYPE_DOUBLE(output, this.hand2R[hand2R$index]);
			}
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 25);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.maxFrames);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 26);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.headRot);
			com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 27);
			com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, this.hasHands);
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var maxFrames$count:uint = 0;
			var headRot$count:uint = 0;
			var hasHands$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.headR);
						break;
					}
					this.headR.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 2:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.headX);
						break;
					}
					this.headX.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 3:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.headY);
						break;
					}
					this.headY.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 4:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.bodyX);
						break;
					}
					this.bodyX.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 5:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.bodyY);
						break;
					}
					this.bodyY.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 6:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.bodyR);
						break;
					}
					this.bodyR.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 7:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.foot1X);
						break;
					}
					this.foot1X.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 8:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.foot1Y);
						break;
					}
					this.foot1Y.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 9:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.foot1R);
						break;
					}
					this.foot1R.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 10:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.foot2X);
						break;
					}
					this.foot2X.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 11:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.foot2Y);
						break;
					}
					this.foot2Y.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 12:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.foot2R);
						break;
					}
					this.foot2R.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 13:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.ankle1X);
						break;
					}
					this.ankle1X.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 14:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.ankle1Y);
						break;
					}
					this.ankle1Y.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 15:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.ankle1R);
						break;
					}
					this.ankle1R.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 16:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.ankle2X);
						break;
					}
					this.ankle2X.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 17:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.ankle2Y);
						break;
					}
					this.ankle2Y.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 18:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.ankle2R);
						break;
					}
					this.ankle2R.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 19:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.hand1X);
						break;
					}
					this.hand1X.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 20:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.hand1Y);
						break;
					}
					this.hand1Y.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 21:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.hand1R);
						break;
					}
					this.hand1R.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 22:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.hand2X);
						break;
					}
					this.hand2X.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 23:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.hand2Y);
						break;
					}
					this.hand2Y.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 24:
					if ((tag & 7) == com.netease.protobuf.WireType.LENGTH_DELIMITED) {
						com.netease.protobuf.ReadUtils.readPackedRepeated(input, com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE, this.hand2R);
						break;
					}
					this.hand2R.push(com.netease.protobuf.ReadUtils.read$TYPE_DOUBLE(input));
					break;
				case 25:
					if (maxFrames$count != 0) {
						throw new flash.errors.IOError('Bad data format: CharAnimDataProto.maxFrames cannot be set twice.');
					}
					++maxFrames$count;
					this.maxFrames = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 26:
					if (headRot$count != 0) {
						throw new flash.errors.IOError('Bad data format: CharAnimDataProto.headRot cannot be set twice.');
					}
					++headRot$count;
					this.headRot = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 27:
					if (hasHands$count != 0) {
						throw new flash.errors.IOError('Bad data format: CharAnimDataProto.hasHands cannot be set twice.');
					}
					++hasHands$count;
					this.hasHands = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
