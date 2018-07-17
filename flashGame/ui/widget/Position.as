package ui.widget
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import ui.mc._McBase;
	
	import util.Util;
	
	import view.login.MC_Yindao;
	

	public class Position extends Sprite  implements IComponent
	{
		private var _rect:Rectangle;
		private var _autoDestory:Boolean=false;
		
		private var _parent:DisplayObjectContainer;
		private var _childIndex:int;
		
		public function Position(_view:MovieClip)
		{
			_rect = new Rectangle(_view.x,_view.y,_view.width,_view.height);
			_parent=_view.parent;
			_childIndex=_parent.getChildIndex(_view);
			Util.replace(_view,this);
//			addChild(view);
//			view.visible = false;
		}
		
		public function get rect():Rectangle
		{
			return _rect;
		}

		public function reset():void{
			if(_parent){
				_parent.addChildAt(this,_childIndex);
			}
		}
		
		public function set rect(value:Rectangle):void
		{
			_rect = value;
		}

		
		public function getDisplayObject():DisplayObject{
			if(this.numChildren){
				return getChildAt(this.numChildren-1);
			}
			return null;
			
		}
		
		public function fillWithObject(obj:DisplayObject,rejustSize:Boolean=true,autoDestory:Boolean=false,_noButton:Boolean=false):void
		{
			destoryChild();
			removeChildren();
			addChild(obj);
			
			_autoDestory=autoDestory;
			
			if(obj is Button){
				if(_noButton)
				{
					x=_rect.width/2;
					y=_rect.height/2;
				}
				else
				{
					x=(obj as Button).width/2;
					y=(obj as Button).height/2;
				}
			}
			else if(obj is MC_Yindao)
			{
				x=(obj as MC_Yindao).width/2;
				y=(obj as MC_Yindao).height/2;
			}
			else
			{
				x=0;
				y=0;
			}
			if(rejustSize){
				Util.reshapeAsRect(obj,_rect);
			}else{
				this.x=_rect.x;
				this.y=_rect.y;
			}
		}
		public function destory():void
		{
			destoryChild();
			this.removeChildren();
		}
		public function destoryChild():void
		{
			if(_autoDestory){
				try{
					(this.getChildAt(0) as Object).destory();
				}catch(e:Error){}
			}else if(this.numChildren){
				(this.getChildAt(0) is IComponent) && (this.getChildAt(0) as IComponent).destory();
				
				(this.getChildAt(0) is _McBase) && (this.getChildAt(0) as _McBase).destory();
			}
		}
		
//		public function fillKapaiByImageName(imageName:String):void
//		{
//			destoryChild();
//			var image:KapaiImage=new KapaiImage(imageName);
//			fillWithObject(image);
//		}
		
//		public function fillTouxiangByTouxiangName(touxiang:String):void
//		{
//			destoryChild();
//			var image:KakaiTouxiangImage=new KakaiTouxiangImage(touxiang);
//			fillWithObject(image);
//		}
		
		public function fillWithBitmapByClassName(className:String):void
		{
			destoryChild();
			
//			if(className.indexOf("image_touxiang_")!=-1 && className.indexOf("image_kapai_back")==-1){
//				fillTouxiangByTouxiangName(className);
//				return ;
//			}
//			
//			if(className.indexOf("image_kapai_")!=-1){
//				fillKapaiByImageName(className);
//				return ;
//			}
			
			var image:ImageBitmap=new ImageBitmap(className);
			fillWithObject(image);
			/*try {
				var cls:Class = getDefinitionByName(className) as Class;
				if(MemoryShare.bitmap[className] == null) {
					MemoryShare.bitmap[className] = new cls as BitmapData;
				}
				var kapaiBitmap:Bitmap = new Bitmap(MemoryShare.bitmap[className]);
				fillWithObject(kapaiBitmap);
			} catch (e:ReferenceError) {
				
			}*/
		}
	}
}