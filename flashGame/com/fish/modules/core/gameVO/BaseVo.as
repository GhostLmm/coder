package com.fish.modules.core.gameVO
{
	import com.netease.protobuf.Int64;
	import com.netease.protobuf.Message;
	import com.netease.protobuf.UInt64;
	
	import org.osflash.signals.Signal;

	public class BaseVo
	{
//		protected var _lock:Boolean=false;
		public function BaseVo()
		{
			changAttr_SN=new Signal(String,Object,Object,BaseVo);
			update_SN=new Signal();
			updateConpy_SN=new Signal(BaseVo,BaseVo);
		}
		
		
		public var changAttr_SN:Signal;
		public var update_SN:Signal;
		/**  发送两个vo，  第一个是 复制前的副本， 第二个是当前实例
		 * */
		public var updateConpy_SN:Signal;
		protected var initFlag:Boolean=false;
		
		protected function onChangeAttr(attrName:String,newValue:*,oldValue:*):void
		{
			changAttr_SN.dispatch(attrName,newValue,oldValue,this);
		}
		
		public function destory():void
		{
			if(changAttr_SN) {changAttr_SN.removeAll(); changAttr_SN=null;}
			if(update_SN) {update_SN.removeAll(); update_SN=null;}
			if(updateConpy_SN) {updateConpy_SN.removeAll(); updateConpy_SN=null;}
		}
		
		/*public function hasLock():Boolean
		{
			return _lock;
		}
		public function lock():void
		{
			_lock=true;
		}
		public function unLock():void
		{
			_lock=false;
//			update_SN.dispatch();
		}*/
		
		public function hasInit():Boolean
		{
			return initFlag;
		}
		
		public function clone():BaseVo
		{
			var copy:BaseVo=new (this["constructor"])();
			var attrArray:Array=this["constructor"]["Attributes"];
			for each(var attr:String in attrArray){
				copy[attr]=this[attr];
			}
			return copy;
		}
		
		public function setCloneDataByVo($vo:BaseVo):void
		{
			var attrArray:Array=this["constructor"]["Attributes"];
			for each(var attr:String in attrArray){
				this[attr]=$vo[attr];
			}
		}
		
		public function setMessageData(message:Message):void
		{
			var copy:BaseVo;
			if(updateConpy_SN.numListeners){
				copy=clone();
			}
			
			var cls:Class=this["constructor"];
			var array:Array=this["constructor"]["Attributes"];
			for each(var key:String in this["constructor"]["Attributes"])
			{
				
				if(judgeAttrUsable(message,key))
				{
					if(message[key] is Int64){
						this[key]=(message[key] as Int64).toNumber();
					}if(message[key] is UInt64){
						this[key]=(message[key] as UInt64).toNumber();
					}
					else{
						this[key]=message[key];
					}
				}
			}
			if(initFlag){
				update_SN.dispatch();
				if(updateConpy_SN.numListeners){
					updateConpy_SN.dispatch(copy,this);
				}
			}
			initFlag=true;
		}
		
		public static function judgeAttrUsable(message:Object,attr:String):Boolean
		{
			if(!message.hasOwnProperty(attr)){
				return false;
			}
			var s:String="has"+attr.charAt(0).toUpperCase()+attr.substr(1);
			if(message.hasOwnProperty(s)){
				if(!message[s]){
					return false;
				}
			}else{
				if(message[attr]==null){
					return false;
				}
			}
			return true;
		}
		
		public function toString():String
		{
			var s:String="{";
			
			var cls:Class=this["constructor"];
			var array:Array=this["constructor"]["Attributes"];
			for each(var key:String in this["constructor"]["Attributes"])
			{
				s+="\n";
				s+="\t"+key+" = "+this[key];
			}
			s+="\n}";
			return s;
				
		}
		
		/*public static function int64ToNumber(value:Int64):Number
		{
			return value.high*Number(uint.MAX_VALUE)+value.low;
		}*/
		
	}
}