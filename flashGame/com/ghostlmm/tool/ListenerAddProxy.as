package com.ghostlmm.tool
{
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;

	public class ListenerAddProxy
	{
		public function ListenerAddProxy()
		{
		}
		
		private var evtDic:Dictionary=new Dictionary();
		
		public function addListener(target:Object,type:String,listener:Function,useCapture:Boolean=false,priority:int=0,useWeek:Boolean=false):void
		{
			
			(target as IEventDispatcher).addEventListener(type,listener,useCapture,priority,useWeek);
			if(evtDic[target]==null){
				evtDic[target]=[];
			}
			var needPush:Boolean=true;
			for each(var t:Object in evtDic[target]){
				if(t.type==type && t.listener==listener && t.useCapture==useCapture){
					needPush=false;
					break;
				}
			}
			if(needPush){
				var obj:Object={};
				obj.type=type;
				obj.listener=listener;
				obj.traget=target;
				obj.useCapture=useCapture;
				
				evtDic[target].push(obj);
			}
			
		}
		
		public function removeListener(target:Object,type:String,listener:Function,useCapture:Boolean=false):void
		{
			(target as IEventDispatcher).removeEventListener(type,listener,useCapture);
			var arry:Array=evtDic[target];
			if(arry){
				var index:int=0
				for(index=0; index<arry.length; index++){
					var t:Object=arry[index];
					if(t.type==type && t.listener==listener && t.useCapture==useCapture){
						break;
					}
				}
				if(index<arry.length){
					arry.splice(index,1);
				}
			}
		}
		
		public function clear():void{
			if(evtDic){
//				for each(var arry:Array in evtDic)
				for (var key:* in evtDic)
				{
					var arry:Array=evtDic[key];
					for each(var obj:Object in arry){
						(obj.traget as IEventDispatcher).removeEventListener(obj.type,obj.listener,obj.useCapture);
						obj.traget=null;
						obj.listener=null;
					}
					arry.length=0;
					delete evtDic[key];
				}
				evtDic=new Dictionary();
			}
		}
		
		public function clearOneDispatcher(target:Object):void
		{
			if(target && evtDic && evtDic[target]){
				var arry:Array=evtDic[target];
				for each(var obj:Object in arry){
					(obj.traget as IEventDispatcher).removeEventListener(obj.type,obj.listener,obj.useCapture);
					obj.traget=null;
					obj.listener=null;
				}
				arry.length=0;
				delete evtDic[target];
			}
		}
	}
}