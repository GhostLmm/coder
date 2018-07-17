package ui.mc
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	
	import core.PlayerGuideManager;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	

	public class GuideMc extends _McBase
	{
		private var _fnt_talk:FontField;
		private var _btn_queding:Button;
		
		public function GuideMc(data:*=null)
		{
			super();
			_scene = AssetManager.createMCForText(McXinshouYindao); 
			_scene.x=GlobalRef.width/2;
			_scene.y=GlobalRef.height/2;
			
			_btn_queding = new Button(_scene.mc_queding);
//			_btn_queding.name = "btn_queding";
			_fnt_talk  = new FontField(_scene.fnt_talk);

		}
		
		public function setButtonEnable(enable:Boolean):void
		{
//			this.
			this.mouseChildren=enable;
			this.mouseEnabled=enable;
			_btn_queding.visible=enable;
			
			if(enable){
				graphics.beginFill(0,0.5);
				graphics.drawRect(0,0,GlobalRef.width,GlobalRef.height);
				graphics.endFill();
			}
			
//			this.alpha=0.9;
		}
		
		
		public override function destory():void
		{
			
			if(_btn_queding){_btn_queding.destory();_btn_queding=null;}
			if(_fnt_talk){_fnt_talk.destory();_fnt_talk=null;}
			super.destory();
		}
		
		public function moveOffset(offset:Array):void{
			this.x=offset[0];
			this.y=offset[1];
		}
		
		public function pointTo(obj:DisplayObject,_step:int=0):void
		{
			/*var rect:Rectangle = obj.getRect(stage);
			if(rect.y+rect.height/2 < GlobalRef.width/2) {
				this.y = rect.y + rect.height;
			} else {
				this.y = rect.y - this.height;
			}
			if(_step==1025)
			{
				this.y+=320;
			}
			if(_step==1026)
			{
				this.y+=460;
			}
			if(_step==1027)
			{
				this.y+=330;
			}
			if(_step==1028)
			{
				this.y+=370;
			}
			if(this.y<=0)
			{
				this.y=rect.y+rect.height/2;
			}
			if(_step==1026||_step==1028)
			{
				if(_scene)
				{
					_scene.visible=false
				}
			}
			else
			{
				if(_scene)
				{
					_scene.visible=true
				}
			}*/
		}
		
		public function set desc(value:String):void
		{
			_fnt_talk.text = value;
		}


		public function get btn_queding():Button
		{
			return _btn_queding;
		}
		public function setSceneVisible(_value:Boolean):void
		{
			_scene.visible=_value;
		}

	}
}
