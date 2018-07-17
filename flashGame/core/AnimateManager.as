package core
{
	import ui.animate.TransformAnimate;
	import ui.animate._AnimateBase;
	import ui.animate._AnimateInterface;
	
	import util.Queue;

	public class AnimateManager
	{
		private var _related:Queue = new Queue;
		private var _waiting:Queue = new Queue;
		private var _active:Queue = new Queue;
		
		private static var _instance:AnimateManager;
		private static function get instance():AnimateManager
		{
			if(_instance == null) {
				_instance = new AnimateManager;
			}
			return _instance;
		}
		
		public static function push(animate:_AnimateInterface):void
		{
			AnimateManager.instance.push(animate);
		}
		
		public static function run(target:*,duration:int,params:Object=null):void
		{
			if(params == null) {
				params = new Object;
			}
			var animClass:Class = TransformAnimate;
			if(params.hasOwnProperty("animate") && params.animate is Class) {
				animClass = params.animate;
			}
			AnimateManager.instance.push(new animClass(target,duration,params));
		}
		
		public function push(animate:_AnimateInterface):void
		{
			if(animate == null) {
				return;
			}
			_waiting.push(animate);
			startAnimates();
		}
		
		public static function remove(animate:_AnimateInterface,dontStop:Boolean=false):void
		{
			AnimateManager.instance.remove(animate,dontStop);
		}
		
		public function remove(animate:_AnimateInterface,dontStop:Boolean=false):void
		{
			if(!dontStop && !animate.done) {
				animate.stop();
			}
			animate.relatedObjects.forEach(function (object:Object,index:int,array:Array):void {
				_related.remove(object);
			});
			_active.remove(animate);
			startAnimates();
		}
		
		private function startAnimates():void
		{
			if(_waiting.length > 0 ) {
				var count:uint = _waiting.length;
				for(var i:uint=0;i<count;i++) {
					var item:_AnimateInterface = _waiting[i];
					var notConflict:Boolean = item.relatedObjects.every(function (object:Object,index:int,array:Array):Boolean {
						return _related.indexOf(object) == -1;
					});
					
					if(notConflict) {
						_waiting.removeAt(i--);
						count--;
						_active.push(item);
						_related.concat(item.relatedObjects);
						item.run();
					}
				}
			}
		}
		public static function clear():void
		{
			if(_instance)
			{
				_instance.clearAnimate();
			}
		}
		private function clearAnimate():void
		{
			for each(var animate:_AnimateInterface in _waiting)
			{
				animate.stop();
//				animate.destory();
				remove(animate);
			}
			for each(var animate:_AnimateInterface in _active)
			{
				animate.stop();
				remove(animate);
			}
			for each(var animate:_AnimateInterface in _related)
			{
				animate.stop();
				remove(animate);
			}
		}
	}
}