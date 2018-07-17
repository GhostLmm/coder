package  com.ghostlmm.socketCommunication {
	
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;

	/**
	 * 数据头
	 * @author liyin
	 */
	public class PkgHead {

		public function PkgHead() : void {
			_index = 0;
		}

		public function get length() : uint {
			return _len;
		}

		public function get type() : uint {
			return _type;
		}
		
		public function get index() : uint {
			return _index;
		}

		public function set length( value : uint ) : void {
			_len = value;
		}

		public function set type( value : uint ) : void {
			_type = value;
		}

		public function Read( input : IDataInput ) : void {
			_len = input.readUnsignedShort();
			_type = input.readUnsignedShort();
			var index:int = input.readInt();
			if (index != _index + 1) {
//				ErrorManager.addError("消息丢失! expect:" + (_index + 1) + " get:" + index);
			}
			_index = index;
			/*if(_index == 6) {
				Logger.debug("收到消息：type: " + _type + " len: " + _len + " index:" + _index);
			}*/
		}

		public function Write( output : IDataOutput ) : void {
//			output.writeShort(_len);
//			output.writeShort(_type);
//			output.writeInt(0);
			output.writeInt(_len);
			//Logger.debug("发出消息：type: " + _type + " len: " + _len);
		}

		private var _type : uint = 0;
		private var _len : uint = 0;
		private var _index : int = 0;
		
		public static const ExtrLength:uint=4;
	}
}