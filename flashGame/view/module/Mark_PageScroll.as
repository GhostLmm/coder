package view.module
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class Mark_PageScroll extends Sprite
	{
		private var itemClass:Class;
		private var itemNum:int;
		private var derX:int=20;
		public function Mark_PageScroll()
		{
			super();
		}
		public function setBaseData(_itemClass:Class,_itemNum:int):void
		{
			itemClass=_itemClass;
			itemNum=_itemNum;
			init();
		}
		private function init():void
		{
			initContainer();
			initItems();
			adjustContainerPos();
			this.mouseChildren=false;
		}
		private function adjustContainerPos():void
		{
			m_container.x=-m_container.width/2;
		}
		private var itemsArray:Array;
		private function initItems():void
		{
			itemsArray=[];
			var index:int;
			for(index=0;index<itemNum;index++)
			{
				var item:MovieClip=new itemClass() as MovieClip;
				item.x=item.width*index+derX;
				item.y=0;
				item.gotoAndStop(1);
				m_container.addChild(item);
				itemsArray.push(item);
			}
		}
		/**
		 * 当前翻到第几页
		 */
		public function changeToMark(_MakrIndex:int):void
		{
			var index:int=0;
			for(index=0;index<itemsArray.length;index++)
			{
				var item:MovieClip=itemsArray[index] as MovieClip;
				if(index==_MakrIndex)
				{
					item.gotoAndStop(1);
				}
				else
				{
					item.gotoAndStop(2);
				}
			}
		}
		private var m_container:Sprite;
		private function  initContainer():void
		{
			m_container=new Sprite();
			this.addChild(m_container);
		}
		public function destory():void
		{
			if(null==m_container)
			{
				return;
			}
			m_container.removeChildren();
			for each(var item:MovieClip in itemsArray)
			{
				item=null;
			}
			itemsArray=null;
			this.removeChildren();
			m_container=null;		
		}
	}
}