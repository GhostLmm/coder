package com.ghostlmm.lightMVC
{
	import flash.events.Event;
	
	public class LightEvent extends Event
	{
		public function LightEvent(type:String, $args:Object=null)
		{
			var bubbles:Boolean=false;
			var cancelable:Boolean=false;
			
			if($args){
				if($args.hasOwnProperty("bubbles")){
					bubbles=$args.bubbles;
				}
				if($args.hasOwnProperty("cancelable")){
					cancelable=$args.cancelable;
				}
			}
			
			super(type, bubbles, cancelable);
			if($args){
				for(var key:String in $args){
					if(this.hasOwnProperty(key)){
						this[key]=$args[key];
					}
				}
			}
		}
	}
}