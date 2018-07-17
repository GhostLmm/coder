package com.ghostlmm.lightMVC.impl
{
	import com.ghostlmm.lightMVC.api.IInjector;
	
	import flash.utils.Dictionary;
	
	public class MyInjector implements IInjector
	{
		private var pointDic:Dictionary;
		public function MyInjector()
		{
			pointDic=new Dictionary();
		}
		
		public function hasMapping(type:Class):Boolean
		{
			var point:InjectPoint=pointDic[type];
			if(point!=null && point.mapFlag){
				return true;
			}
			return false;
		}
		
		public function mapSingleton(interfaceType:Class,targetType:Class=null):void
		{
			if(targetType==null) targetType=interfaceType;
			var point:InjectPoint=pointDic[interfaceType];
			if(point==null){
				point=new InjectPoint(this);
				pointDic[interfaceType]=point;
			}
			if(point.mapFlag){
				trace(interfaceType+" 已经map过了， 想要重新绑定，先调用unmap");
			}else{
				point.mapClass(targetType,interfaceType);
			}
		}
		
		public function mapSingletonValue(interfaceType:Class,value:*,targetType:Class=null):void
		{
			mapSingleton(interfaceType,targetType);
			var point:InjectPoint=pointDic[interfaceType];
			point.mapValue(value);
		}
		
		public function unmap(type:Class):void
		{
			var point:InjectPoint=pointDic[type];
			if(point!=null && point.mapFlag){
				point.unmap();
			}else{
				trace(type+" 类型没有绑定， 解绑错误");
			}
		}
		
		public function createInstance(type:Class):*
		{
			var point:InjectPoint=pointDic[type];
			if(point!=null && point.mapFlag){
				return point.createInstance();
			}
			return null;
		}
		
		public function getInstance(type:Class):*
		{
			var point:InjectPoint=pointDic[type];
			if(point!=null && point.mapFlag){
				return point.getInstacne();
			}
			return null;
		}
	}
}