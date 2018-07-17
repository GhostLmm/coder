package view.module
{
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import ui.widget.IGridItem;
	
	import view.Base_Item;

	public class TelescopicSlide extends Sprite
	{
		public static const VERTICAL:int = 1;
		public static const HORIZONTAL:int = 2;
		private static var der:int=0;
		private static var DerTime:Number=0.5;
		
		private var itemClass:Class;
		private var baseMc:MovieClip;
		private var align:int;
		private var dataArray:Array;
		
		private var m_container:Sprite;
		
		private var show:int;
		private var hide:int;
		
		private var maskSprite:Sprite;
		
		private var isHide:Boolean=false;
		
		public function TelescopicSlide()
		{
		}
		public function init(_itemClass:Class,_baseMc:MovieClip,_align:int=VERTICAL,_isHide:Boolean=false):void
		{
			itemClass=_itemClass;
			baseMc=_baseMc;	
			align=_align;
			isHide=_isHide;
			
			initContainer();			
		}
		private function initContainer():void
		{
			m_container=new Sprite();
			this.addChild(m_container);
		}
		private var itemsArray:Array;
		private function initItems():void
		{
			itemsArray=[];
			var index:int;
			for(index=0;index<dataArray.length;index++)
			{
				var item:Base_Item=new itemClass() as Base_Item;
				(item as Base_Item).setData(dataArray[index]);
				if(align==VERTICAL)
				{
					item.x=0;
					item.y=(item.height+der)*index;
				}
				else
				{
					item.y=0;
					item.x=(item.width+der)*index;
				}
				m_container.addChild(item);
				itemsArray.push(item);
			}
		}
		public function showMc(_isTween:Boolean=true):void
		{
			if(_isTween)
			{
				m_container.visible=true;
				if(align==VERTICAL)
				{
					TweenLite.to(m_container,DerTime,{y:show});
				}
				else
				{
					TweenLite.to(m_container,DerTime,{x:show});
				}	
			}
			else
			{
				m_container.visible=true;
				if(align==VERTICAL)
				{
					m_container.y=show;
				}
				else
				{
					m_container.x=show;
				}
			}
		}
		public function hideMc(_isTween:Boolean=true):void
		{
			if(_isTween)
			{
				var complete:Function=function():void
				{
					m_container.visible=false;
				}
				if(align==VERTICAL)
				{
					TweenLite.to(m_container,DerTime,{y:hide,"onComplete":complete});
				}
				else
				{
					TweenLite.to(m_container,DerTime,{x:hide,"onComplete":complete});
				}	
			}
			else
			{
				if(align==VERTICAL)
				{
					m_container.y=hide;
				}
				else
				{
					m_container.x=hide;
				}
			}
		}
		public function setData(_dataArray:Array):void
		{
			dataArray=_dataArray;
			initItems();
			initPos();
			initMask();
			if(isHide)
			{
				hideMc(false);
			}
			else
			{
				showMc(false);
			}
		}
		private function initPos():void
		{
			if(align==HORIZONTAL)
			{
				hide=0;
				show=hide-m_container.width;
				m_container.x=show;
			}
			else
			{
				show=baseMc.height;
				hide=show-m_container.height;
				m_container.y=show;
			}
			
		}
		private function initMask():void
		{
			maskSprite=new Sprite();
			maskSprite.graphics.beginFill(0xff0000);
			if(align==HORIZONTAL)
			{
				maskSprite.graphics.drawRect(-m_container.width,hide,m_container.width,m_container.height);
			}
			else
			{
				maskSprite.graphics.drawRect(0,show,m_container.width,m_container.height);
			}
			maskSprite.graphics.endFill();
			this.mask=maskSprite;
			this.addChild(maskSprite);
		}
		public function destory():void
		{
			TweenLite.killTweensOf(m_container);
			m_container.removeChildren();
			for each(var item:Base_Item in itemsArray)
			{
				(item as Base_Item).destory();
				item=null;
			}
			itemsArray=null;
			this.removeChildren();
			m_container=null;		
		}
	}
}