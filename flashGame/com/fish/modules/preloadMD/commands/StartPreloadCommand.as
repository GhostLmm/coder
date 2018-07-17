package com.fish.modules.preloadMD.commands
{
	import com.fish.modules.preloadMD.mediators.PreloadLayer;
	import com.fish.modules.preloadMD.models.SystemMD;
	import com.fish.modules.preloadMD.models.XMLLoader_MD;
	import com.ghostlmm.lightMVC.impl.Command;
	

	
	public class StartPreloadCommand extends Command
	{
		[Inject]
		public var xmlLoader:XMLLoader_MD;
		[Inject]
		public var systemMD:SystemMD;
		public function StartPreloadCommand()
		{
			super();
		}
		
		public override function excute():void
		{
//			xmlLoader.startLoadMainXml();
			var preload:PreloadLayer=new PreloadLayer();
			preload.show();
			
			Music.play(Music.MC_Loading,true);
		}
	}
}