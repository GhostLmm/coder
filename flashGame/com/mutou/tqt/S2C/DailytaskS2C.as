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
	public dynamic final class DailytaskS2C extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const TASK_DETAIL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.DailytaskS2C.task_detail", "taskDetail", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var task_detail$field:String;

		public function clearTaskDetail():void {
			task_detail$field = null;
		}

		public function get hasTaskDetail():Boolean {
			return task_detail$field != null;
		}

		public function set taskDetail(value:String):void {
			task_detail$field = value;
		}

		public function get taskDetail():String {
			return task_detail$field;
		}

		/**
		 *  @private
		 */
		public static const TASK_FINISH:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("com.mutou.tqt.S2C.DailytaskS2C.task_finish", "taskFinish", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var task_finish$field:String;

		public function clearTaskFinish():void {
			task_finish$field = null;
		}

		public function get hasTaskFinish():Boolean {
			return task_finish$field != null;
		}

		public function set taskFinish(value:String):void {
			task_finish$field = value;
		}

		public function get taskFinish():String {
			return task_finish$field;
		}

		/**
		 *  @private
		 */
		public static const YUEKA_ENDTIME:FieldDescriptor$TYPE_FIXED64 = new FieldDescriptor$TYPE_FIXED64("com.mutou.tqt.S2C.DailytaskS2C.yueka_endtime", "yuekaEndtime", (3 << 3) | com.netease.protobuf.WireType.FIXED_64_BIT);

		private var yueka_endtime$field:UInt64;

		public function clearYuekaEndtime():void {
			yueka_endtime$field = null;
		}

		public function get hasYuekaEndtime():Boolean {
			return yueka_endtime$field != null;
		}

		public function set yuekaEndtime(value:UInt64):void {
			yueka_endtime$field = value;
		}

		public function get yuekaEndtime():UInt64 {
			return yueka_endtime$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasTaskDetail) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, task_detail$field);
			}
			if (hasTaskFinish) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, task_finish$field);
			}
			if (hasYuekaEndtime) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.FIXED_64_BIT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_FIXED64(output, yueka_endtime$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var task_detail$count:uint = 0;
			var task_finish$count:uint = 0;
			var yueka_endtime$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (task_detail$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailytaskS2C.taskDetail cannot be set twice.');
					}
					++task_detail$count;
					this.taskDetail = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (task_finish$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailytaskS2C.taskFinish cannot be set twice.');
					}
					++task_finish$count;
					this.taskFinish = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 3:
					if (yueka_endtime$count != 0) {
						throw new flash.errors.IOError('Bad data format: DailytaskS2C.yuekaEndtime cannot be set twice.');
					}
					++yueka_endtime$count;
					this.yuekaEndtime = com.netease.protobuf.ReadUtils.read$TYPE_FIXED64(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
