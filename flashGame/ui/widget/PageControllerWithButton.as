package ui.widget
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import util.Util;

	public class PageControllerWithButton extends PageController
	{
		private var _leftBtn:Button;
		private var _rightBtn:Button;
		private function get maxPageNum():int{
			if(_gridView){
				return _gridView.dataArray.length;
			}
			return _items.length;
		}
		public function PageControllerWithButton(position:Position,mc_left:MovieClip,mc_right:MovieClip, align:int=VERTICAL)
		{
			super(position, align);
			_leftBtn=new Button(mc_left);
			_rightBtn=new Button(mc_right);
			_leftBtn.addEventListener(TqtEvent.BUTTON_CLICK,onLeft);
			_rightBtn.addEventListener(TqtEvent.BUTTON_CLICK,onClickRight);
			Util.replace(position,this);
		}
		
		protected override function selectTab():void{
			super.selectTab();
			setBtnState();
		}
		
		private function setBtnState():void{
			_leftBtn.visible=(_target_index>0);
			_rightBtn.visible=(_target_index<maxPageNum-1);
		}
		
		
		
		private function onLeft(evt:Event):void{
			if(_target_index>0){
				setShowIndex(_target_index-1);
				setBtnState();
			}
		}
		private function onClickRight(evt:Event):void{
			if(_target_index<maxPageNum-1){
				setShowIndex(_target_index+1);
				setBtnState();
			}
		}
		
		public override function destory():void{
			if(_leftBtn) {_leftBtn.removeEventListener(TqtEvent.BUTTON_CLICK,onLeft);_leftBtn.destory();_leftBtn=null;}
			if(_rightBtn) {_rightBtn.removeEventListener(TqtEvent.BUTTON_CLICK,onLeft);_rightBtn.destory();_rightBtn=null;}
			super.destory();
		}
		
	}
}