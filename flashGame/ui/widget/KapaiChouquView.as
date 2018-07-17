package ui.widget
{
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	
	import ui.mc._McBase;
	
	public class KapaiChouquView extends _McBase
	{
		private var _front:Sprite;
		private var _back:Sprite;
		private var _position:Position;
		
		
		public function KapaiChouquView($front:Sprite,$back:Sprite,position:Position=null)
		{
			super();
			_scene = new Sprite;
			if(position!=null){
				_front=new Sprite();
				_back=new Sprite();
				
				_front.addChild($front);
				_back.addChild($back);
				
				$back.width=$front.width;
				$back.height=$front.height;
				
				$front.x=-$front.width/2;
				$front.y=-$front.height/2;
				$back.x=-$back.width/2;
				$back.y=-$back.height/2;
				
				_front.x=$front.width/2;
				_front.y=$front.height/2;
				
				_back.x=$back.width/2;
				_back.y=$back.height/2;
				
				_position=position;
			}else{
				_front = $front;
				_back = $back;
			}
			
			
			
		}
		
		public function loadData():void
		{
			addChild(_front);
			addChild(_back);
			if(_position==null){
				removeChild(_front);
			}
			//			removeChild(_front);
			_back.width = _front.width;
			_back.height = _front.height;
		}
		
		public function showSide(side:int):void{
			if(side>0){
				addChild(_front);
				_back.width=0;
			}else{
				addChild(_back);
				_front.width=0;
			}
		}
		
		private var _angle:Number=0;
		
		public function set angle(value:Number):void
		{
			if(value!=_angle){
				_angle=value;
				var r:Number=(_angle/360-int(_angle/360))*360;
				
				if(r>=0 && r<90){
					back.visible=false;
					front.visible=true;
					front.scaleX=1-r/90;
				}else if(r>=90 && r<270){
					front.visible=false;
					back.visible=true;
					back.scaleX=-1+Math.abs(r-180)/90;
				}else if(r>=270){
					front.visible=true;
					back.visible=false;
					front.scaleX=(r-270)/90;
				}
			}
		}
		public function get angle():Number
		{
			return _angle;
		}
		
		
		
		public function get front():*
		{
			return _front;
		}
		
		public function get back():Sprite
		{
			return _back;
		}
		
		public override function destory():void
		{
			_front=null;
			_back=null;
			TweenLite.killTweensOf(this);
			this.removeChildren();
			super.destory();
		}
		
		
		public function shilianXuanzhuan():TimelineLite
		{
			angle=180;
			_position.fillWithObject(this);
			this.x=x+650;
			var timeline:TimelineLite=new TimelineLite();
			timeline.append(TweenLite.to(this,0.3,{x:_position.rect.x}));
			timeline.append(TweenLite.to(this,1,{angle:0}));
			//			timeline.append(TweenLite.to(this,4,{angle:0}));
			return timeline;
		}
		
		
	}
}

