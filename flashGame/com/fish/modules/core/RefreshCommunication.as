package com.fish.modules.core
{
	import com.fish.modules.core.models.TimerModel;

	public class RefreshCommunication
	{
		private var communicationFn:Function;
		private var msType:String;
		private var getRefreshTimeFn:Function;
		private var lock:Boolean=false;
		
		private var type:String;
		public function RefreshCommunication($type:String)
		{
			type=$type;
		}
		
		public function init($msType:String,$communicationFn:Function,$getRefreshTimeFn:Function):void{
			communicationFn=$communicationFn;
			msType=$msType;
			getRefreshTimeFn=$getRefreshTimeFn;
			S2CHanlder.instance.message_SN.add(onMessage);
			TimerModel.instance.secondTimer_SN.add(onTick);
		}
		public function destory():void{
			S2CHanlder.instance.message_SN.remove(onMessage);
//			TimerModel.instance.secondTimer_SN.remove(onTick);
			communicationFn=null;
			getRefreshTimeFn=null;
		}
		private function onTick():void{
			if(lock) return ;
			if(getRefreshTimeFn()==0) return ;
			if(TimerModel.instance.serverTime>getRefreshTimeFn()){
				lock=true;
				trace("[Refresh]:\t"+type);
				communicationFn();
			}
		}
		
		private function onMessage(msg:String):void{
			if(msg==msType){
				lock=false;
			}
		}
		
		
		
		
		
	}
}