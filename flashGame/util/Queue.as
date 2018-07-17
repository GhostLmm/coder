package util
{
	public dynamic class Queue extends Array
	{
		public function remove(item:*):*
		{
			var index:int = indexOf(item);
			if(index == -1) {
				return false;
			}
			var removed:* = removeAt(index);
			return removed;
		}
		
		public function removeAt(index:int):*
		{
			return splice(index,1);
		}
		
		public function removeByValue(item:*):Boolean
		{
			var index:int = indexOf(item);
			if(index == -1) {
				return false;
			}
			removeAt(index);
			return true;
		}
		
		public function addItemAt(item:*,index:int):void
		{
			splice(index,0,item);
		}
	}
}