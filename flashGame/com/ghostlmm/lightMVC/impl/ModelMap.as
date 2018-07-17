package com.ghostlmm.lightMVC.impl
{
	import com.ghostlmm.lightMVC.api.IInjector;
	import com.ghostlmm.lightMVC.api.IModel;
	import com.ghostlmm.lightMVC.api.IModelMap;
	
	public class ModelMap implements IModelMap
	{
		private var _inject:IInjector;
		public function ModelMap($inject:IInjector)
		{
			_inject=$inject;
		}
		
		public function map(modelType:Class, interfaceType:Class=null):void
		{
//			_inject.map(interfaceType).toSingleton().seal()
			if(interfaceType){
				_inject.mapSingleton(interfaceType,modelType);
			}else{
				_inject.mapSingleton(modelType,modelType);
			}
			_inject.createInstance(modelType);
		}
		
		public function mapValue(modelType:Class, value:*):void
		{
			_inject.mapSingletonValue(modelType,value);
		}
		
		public function unmap(modelType:Class):void
		{
			if(_inject.hasMapping(modelType)){
				var model:IModel=_inject.getInstance(modelType);
				model.destory();
				_inject.unmap(modelType);
			}
			
		}
	}
}