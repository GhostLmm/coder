package ui.widget
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Cubic;
	
	import flash.display.Sprite;
	
	import core.LayerController;
	
	import ui.mc._McBase;

	public class Flowtext extends _McBase
	{
		private var _fnt_flowtext:FontField;
		private var _defaultX:Number;
		public function Flowtext()
		{
			_scene = new (AssetManager.getAssetClass("McFlowText") as Class);
			
			_scene.x=-_scene.width/2;
			
			mouseChildren=false;
			mouseEnabled=false; 
			_defaultX=_scene.fnt_flowtext.x;
			_fnt_flowtext = new FontField(_scene.fnt_flowtext);
			
			this.mouseChildren = false;
			this.mouseEnabled = false;
		}
		
		private static var _instance:Flowtext;
		public static function flow(text:String):void{
			if(_instance==null) _instance=new Flowtext();
			_instance.go(text);
		}
		
		
		
		private function go(text:String):void
		{
			_fnt_flowtext.text = text;
			var container:Sprite;
			var layer:Sprite = LayerController.instance.floatLayer;
//			while(layer.numChildren>0){
//				layer.removeChildren();
//			}
			if(layer.numChildren){
				if(layer.getChildAt(0) is zhandouli_change){
					return ;
				}
			}
			TweenLite.killTweensOf(_fnt_flowtext);
			container=layer;
			
			container.addChild(this);
			
//			this.x=GlobalRef.width/2 - this.width/2;
			this.x=GlobalRef.width/2;
			this.y=GlobalRef.height * 0.2;
			_fnt_flowtext.x=0;
			TweenLite.from(this._fnt_flowtext,0.2,{"x":-_fnt_flowtext.width,ease:Cubic.easeIn,onComplete:onJinruComplete});
			/*TweenLite.fromTo(this._fnt_flowtext,0.2,{"x":-_fnt_flowtext.width},
				{
					"x":GlobalRef.width/2 - this.width/2,
					ease:Cubic.easeIn,
					onComplete:onJinruComplete
				});*/
		}
		private function onJinruComplete():void
		{
//			trace("执行进入的完成");
			TweenLite.to(this._fnt_flowtext,0.2,{"x":_fnt_flowtext.width+GlobalRef.width,delay:1,ease:Cubic.easeIn,onComplete:onChulaiComplete});
		}
		private function onChulaiComplete():void
		{
//			trace("执行退出的完成");
			if(this.parent && this.parent.contains(this))
			{
				this.parent.removeChild(this);
			}
		}       
	}
}

