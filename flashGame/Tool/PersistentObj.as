package Tool
{
	import flash.net.SharedObject;
	import flash.utils.Dictionary;

	/**   用于保存持久化数据
	 * */
	public class PersistentObj
	{
		
		private var sharePath:String;
		
		private var vauleDic:Dictionary;
		private var keyArray:Array;
		
		private var soObj:SharedObject;
		
		
		public function PersistentObj(_path:String)
		{
			sharePath="PersistentObj."+_path;
			
			try
			{
				soObj=SharedObject.getLocal(sharePath);
			}
			catch(e:*)
			{
				trace("访问 "+_path+" 持久化数据失败");
			}
			
			vauleDic=new Dictionary();
			keyArray=[];
			
			if(soObj && null!=soObj.data)
			{
				for(var key:String in soObj.data)
				{
					
					
					var jsonData:String=soObj.data[key];
					var vaule:Object;
					try
					{
						vaule=JSON.parse(jsonData)
					}
					catch(e:*)
					{
						trace("反序列化 "+sharePath+" 下的 "+key+" 失败 .."+jsonData);
					}
					if(null!=vaule)
					{
						vauleDic[key]=vaule;
						keyArray.push(key);
					}
					
				}
			}
		}
		
		/**     返回所有key 的数组
		 * */
		public function getKeyArray():Array
		{
			return keyArray;
		}
		
		/**   设置持久化数据, 只能是比较低级的数据类型
		 * */
		public function setVaule(key:String,vaule:Object):void
		{
			vauleDic[key]=vaule;
			if(keyArray.indexOf(key)==-1)
			{
				keyArray.push(key);
			}
			
			if(soObj && soObj.data)
			{
				soObj.data[key]=JSON.stringify(vaule);
				soObj.flush();
			}
		}
		
		/**   删除持久化数据
		 * */
		public function deleteKey(key:String):void
		{
			var index:int=keyArray.indexOf(key);
			if(index!=-1)
			{
				keyArray.splice(index,1);
				delete vauleDic[key];
				
				if(soObj && soObj.data)
				{
					delete soObj.data[key];
					soObj.flush();
				}
			}
		}
		
		/**   清楚所有数据
		 * */
		public function clear():void
		{
			keyArray=[];
			vauleDic=new Dictionary();
			if(soObj)
			{
				soObj.clear();
			}
		}
		
		/**   获取
		 * */
		public function getValueByKey(key:String):Object
		{
			return vauleDic[key];
		}
	}
}