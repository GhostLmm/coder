package com.ghostlmm.lightMVC.impl
{
	import com.ghostlmm.lightMVC.api.IInjector;
	import com.ghostlmm.lightMVC.api.IMediator;
	import com.ghostlmm.lightMVC.api.IMediatorMap;
	import com.ghostlmm.lightMVC.api.IView;
	
	import flash.utils.Dictionary;
	
	import ui.layer.UiLayer;
	
	public class MediatorMap implements IMediatorMap
	{
		private var _inject:IInjector;
		private var _mdDic:Dictionary;
		public function MediatorMap($inject:IInjector)
		{
			_inject=$inject;
			_mdDic=new Dictionary();
		}
		
		public function map(viewType:Class, mediatorType:Class):void
		{
			_mdDic[viewType]=mediatorType;
			if(viewType==UiLayer){
				
				trace("mediator绑定成功："+viewType+" \t/ \t"+mediatorType);
			}
			
		}
		
		
		public function checkMap():void
		{
			for (var key:Object in _mdDic){
				var mediatorType:Class=_mdDic[key];
				var hasMap:Boolean=false;
				if(_inject.hasMapping(mediatorType)){
					hasMap=true;
				}
				trace("注入mediator检测： \t"+key+" / "+mediatorType+" / "+hasMap);
			}
		}
		
		public function activeMediator(view:Object):void
		{
			if(view["constructor"]==UiLayer){
				trace("");
			}
			var mediatorType:Class=_mdDic[view["constructor"]];
			if(mediatorType){
				if(!_inject.hasMapping(mediatorType)){
					_inject.mapSingletonValue(view["constructor"],view);
					_inject.mapSingleton(mediatorType,mediatorType);
					var mediator:IMediator=_inject.createInstance(mediatorType);
					var mediatorData:Object=null;
					if(view.hasOwnProperty("mediatorData"))
					{
						mediatorData=view.mediatorData;
					}
					mediator.initialize(mediatorData);
				}else{
					throw new Error("之前 的mediator没有回收： "+view["constructor"]+" / "+mediatorType);
				}
			}else{
				trace("没有绑定，无法注入： "+view["constructor"]);
			}
		}
		public function inactiveMediator(view:Object):void
		{
			if(view["constructor"]==UiLayer){
				trace("");
			}
			var mediatorType:Class=_mdDic[view["constructor"]];
			if(mediatorType){
				var mediator:IMediator=_inject.getInstance(mediatorType);
				if(mediator){
					mediator.destroy();
					_inject.unmap(mediatorType);
					_inject.unmap(view["constructor"]);
					trace("解绑："+view["constructor"]+" / "+mediator);
				}
			}
		}
		
		public function unmap(viewType:Class):void
		{
			if(viewType==UiLayer){
				trace("sdfsadf");
			}
			var mediatorType:Class=_mdDic[viewType];
			if(mediatorType ){
//				_inject.unmap(viewType);
				delete _mdDic[viewType];
				if(_inject.hasMapping(mediatorType))
				{
					trace("mediator 没有解绑： "+mediatorType);
					var mediator:IMediator=_inject.getInstance(mediatorType);
					if(mediator){
						mediator.destroy();
					}
					_inject.unmap(mediatorType);
				}
				if(_inject.hasMapping(viewType))
				{
					trace("mediator 没有解绑： "+viewType);
					_inject.unmap(viewType);
				}
				
			}
		}
	}
}