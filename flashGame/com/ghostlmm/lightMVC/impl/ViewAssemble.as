package com.ghostlmm.lightMVC.impl
{
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.api.IView;

	/**  view 装配工具，  
	 *   显示对象没有实现接口 iview， 可以使用 此类进行装配
	 * */
	public class ViewAssemble
	{
		public function ViewAssemble()
		{
		}
		
		public static function bindMediator(view:Object):void
		{
			if(view is IView){
				(view as IView).bindMediator();
			}else{
				Context.getInsance().mediatorMap.activeMediator(view);
			}
		}
		public static function unBindMediator(view:Object):void
		{
			if(view is IView){
				(view as IView).unBindMediator();
			}else{
				Context.getInsance().mediatorMap.inactiveMediator(view);
			}
		}
		
	}
}