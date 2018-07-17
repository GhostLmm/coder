package com.fish.modules.core.models
{
	import com.fish.modules.core.S2CHanlder;
	import com.ghostlmm.lightMVC.impl.Model;
	
	import org.osflash.signals.Signal;
	
	public class BaseModel extends Model
	{
		public var modelUpdata_SN:Signal=new Signal();
		public function BaseModel()
		{
			super();
			S2CHanlder.instance.initCom_SN.addOnce(onGameInitComplete);
		}
		
		protected function onGameInitComplete():void
		{
			
		}
		
		public override function destory():void
		{
			if(modelUpdata_SN) { modelUpdata_SN.removeAll(); modelUpdata_SN=null; }
//			S2CHanlder.instance.initCom_SN.remove(onGameInitComplete);
			super.destory();
		}
		/*
		protected override function onGameInitComplete():void
		{
			
		}
		
		public override function destory():void
		{
			
			super.destory();
		}
		*/
		
	}
}