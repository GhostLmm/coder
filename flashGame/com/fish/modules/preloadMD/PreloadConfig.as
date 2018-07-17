package com.fish.modules.preloadMD
{
	import com.fish.modules.preloadMD.commands.GameStartupCommand;
	import com.fish.modules.preloadMD.commands.LoginCommand;
	import com.fish.modules.preloadMD.commands.StartPreloadCommand;
	import com.fish.modules.preloadMD.events.PreloadEvent;
	import com.fish.modules.preloadMD.mediators.PreloadLayer;
	import com.fish.modules.preloadMD.mediators.PreloadMediatorNew;
	import com.fish.modules.preloadMD.models.LoaderLanguagerMD;
	import com.fish.modules.preloadMD.models.SystemMD;
	import com.fish.modules.preloadMD.models.UserInitialMD;
	import com.fish.modules.preloadMD.models.XMLLoader_MD;
	import com.ghostlmm.lightMVC.impl.ModuleCofig;
	
	public class PreloadConfig extends ModuleCofig
	{
		public static const NAME:String="preload";
		public function PreloadConfig()
		{
			super(NAME);
		}
		
		/**   注册model
		 * */
		protected override function registerModel():void
		{
			modelMap.map(XMLLoader_MD);
			modelMap.map(UserInitialMD);
			modelMap.map(SystemMD);
			modelMap.map(LoaderLanguagerMD);
		}
		
		protected override function registerMediator():void
		{
			mediatorMap.map(PreloadLayer,PreloadMediatorNew);
		}
		protected override function regitserCommand():void
		{
			commandMap.map(PreloadEvent.StartPreload,PreloadEvent,StartPreloadCommand,true);
			commandMap.map(PreloadEvent.StartLogin,PreloadEvent,LoginCommand);
			commandMap.map(PreloadEvent.GameStartup,PreloadEvent,GameStartupCommand,true);
		}
		
		protected override function unRegisterCommand():void
		{
			commandMap.unmap(PreloadEvent.StartPreload,PreloadEvent);
			commandMap.unmap(PreloadEvent.StartLogin,PreloadEvent);
			commandMap.unmap(PreloadEvent.GameStartup,PreloadEvent);
		}
		
		protected override function unRegisterMediator():void
		{
			mediatorMap.unmap(PreloadLayer)
		}
		protected override function unRegisterModel():void
		{
			modelMap.unmap(XMLLoader_MD);
			modelMap.unmap(LoaderLanguagerMD);
			modelMap.unmap(UserInitialMD);
		}
	}
}