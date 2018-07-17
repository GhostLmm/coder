package snake.gameAsset
{
	internal class PoolObject
	{
		public var dataPool:Object={};
		public var keyReferencePool:Object={};
		
		public function PoolObject()
		{
			
		}
		
		public function add(key:String, value:*):void{
			dataPool[key]=value;
			if(!keyReferencePool.hasOwnProperty(key)){
				keyReferencePool[key]=0;
			}
			keyReferencePool[key]=keyReferencePool[key]+1;
		}
		
		public function getValue(key:String):*{
			return dataPool[key];
		}
		
		public function resetKeyReference(key:String):void{
			keyReferencePool[key]=0;
		}
		
		public function deleteKey(key:String):*{
			var value:*=dataPool[key];
			delete dataPool[key];
			delete keyReferencePool[key];
			return value;
		}
		
		
		
	}
}