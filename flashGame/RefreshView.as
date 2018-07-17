package
{
import flash.display.MovieClip

	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	
	import ui.widget.FontField;
	import ui.widget.ProgressManager;
	
	public class RefreshView extends Sprite
	{
		private var _fnt_prg_loading:FontField;
		private var _prg:ProgressManager;
		
		private var _progress:int;
		
		private var _mc:flash.display.MovieClip; 
		
		
		public function get progress():int
		{
			return _progress;
		}
		public function set progress(value:int):void
		{
			_progress=value;
			if(_prg) _prg.progress=_progress;
			if(_fnt_prg_loading) _fnt_prg_loading.text=_progress+"%";
		}
			
		
		public function RefreshView()
		{
			super();
			_mc=new (AssetManager.getAssetClass("McShuaxinLoading") as Class)(); 
			this.addChild(_mc);
			_fnt_prg_loading=new FontField(_mc.mc_loading.fnt_prg_loading);
			_prg=new ProgressManager(_mc.mc_loading.prg_loading);
			
		}
		
		
		public function destory():void
		{
			this.removeChildren();
			if(_fnt_prg_loading) {_fnt_prg_loading.destory(); _fnt_prg_loading=null;}
			if(_prg) {_prg.destory(); _prg=null;}
			TweenLite.killTweensOf(this);
		}
		
		private var _waitComplete:Boolean=false;
		private var _messageComplete:Boolean=false;
		
		public function setMeassageComplete():void
		{
			_messageComplete=true;
			checkHide();
		}
		
		
		private function onComplete():void
		{
			_waitComplete=true;
			checkHide();
		}
		
		
		
		private function checkHide():void
		{
			if(_waitComplete && _messageComplete){
				hide();
			}
		}
		private function hide():void
		{
			if(parent){
				parent.removeChild(this);
			}
			destory();
		}
		
		public function showWait():void
		{
			_prg.devider=100;
			
			progress=0;
			
			TweenLite.to(this,3,{progress:100,onComplete:onComplete});
		}
		
	}
}
