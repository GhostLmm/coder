package util
{
	import flash.utils.Dictionary;
	
	public dynamic class Dict extends Dictionary
	{
		public function Dict(weakKeys:Boolean=false)
		{
			super(weakKeys);
		}
		
		public function get length():int
		{
			var count:int = 0;
			for(var key:* in this) {
				count++;
			}
			return count;
		}
		
		public function get randomKey():*
		{
			var count:int = Math.floor(Util.random()*length);
			for(var key:* in this) {
				if(count-- == 0) {
					return key;
				}
			}
			return key;
		}
		
		public function get randomItem():*
		{
			var count:int = Math.floor(Util.random()*length);
			for(var key:* in this) {
				if(count-- == 0) {
					return this[key];
				}
			}
			return this[key];
		}
	}
}