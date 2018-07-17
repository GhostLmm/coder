package ui.layer
{
import flash.display.MovieClip;
	public class WebWaitLayer extends _LayerBase
	{
		public function WebWaitLayer()
		{
			super();
		}
		
		private var waitMovie:flash.display.MovieClip;
		private var battleWait:MovieClip; 
		
		public function showWait():void
		{
			if(waitMovie==null){
				
				waitMovie=new (AssetManager.getAssetClass("MaskLoading") as Class)();
				waitMovie.pos_bg.width=GlobalRef.width;
				waitMovie.pos_bg.height=GlobalRef.height;				waitMovie.x=GlobalRef.width/2;
				waitMovie.y=GlobalRef.height/2;
			}
			this.addChild(waitMovie);
			
//			GlobalRef.stage.mouseChildren=false;
			
		}
		
		/*public function showBattleWait():void{
			if(battleWait==null){
				battleWait=new loading_qiehuan();
				battleWait.x=GlobalRef.width/2;
				battleWait.y=GlobalRef.height/2;
			}
			this.addChild(battleWait);
		}
		public function hideBattleWait():void{
			if(battleWait && this.contains(battleWait)){
				this.removeChild(battleWait);
			}
			battleWait.stop();
			battleWait.stopAllMovieClips();
			battleWait=null;
		}*/
		
		public function hideWait():void
		{
			if(waitMovie && this.contains(waitMovie)){
				this.removeChild(waitMovie);
			}
//			GlobalRef.stage.mouseChildren=true;
		}
		public override function destory():void
		{
			removeChildren();
			waitMovie=null;
			super.destory();
		}
	}
}
