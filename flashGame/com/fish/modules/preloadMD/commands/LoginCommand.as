package com.fish.modules.preloadMD.commands
{
	import Tool.account.AccountControl;
	import Tool.login.LoginControl;
	import Tool.platform.PlatformManager;
	
	import com.fish.modules.preloadMD.mediators.PreloadLayer;
	import com.ghostlmm.lightMVC.api.IInjector;
	import com.ghostlmm.lightMVC.api.ILogger;
	import com.ghostlmm.lightMVC.impl.Command;
	
	public class LoginCommand extends Command
	{
		[Inject]
		public var log:ILogger;
		[Inject]
		public var inject:IInjector;
		public function LoginCommand()
		{
			super();
		}
		public override function excute():void
		{
			log.info("开始登陆");
//			AccountControl.getInstance().autoLogin();
//			var preloadLayer:PreloadLayer=inject.getInstance(PreloadLayer);
//			preloadLayer.showMC("account");
			PlatformManager.getInstance().init();
			PlatformManager.getInstance().initChongCheck();
			LoginControl.getInstance().showLoginInterface();
		}
	}
}