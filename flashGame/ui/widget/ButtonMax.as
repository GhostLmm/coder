package ui.widget
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.utils.Dictionary;
	
	public class ButtonMax extends InterButton
	{
		
		private var _textDic:Dictionary;
		private var _firstText:FontField;
		public var defaultText:String;
		public function ButtonMax(view:MovieClip, container:MovieClip=null)
		{
			super(view, container);
			initText(view);
			if(_firstText){
				defaultText=_firstText.text;
			}
		}
		
		public function resetDefaultText():void{
			setText(defaultText);
		}
		
		private function initText($view:MovieClip):void
		{
			_textDic=new Dictionary();
			var childrenNum:int=$view.numChildren;
			for(var index:int=0; index<childrenNum; index++){
				var display:DisplayObject=$view.getChildAt(index);
				if(display && (display is TextField) && display.name.indexOf("instance")==-1)
				{
					var tf:FontField=new FontField(display as TextField);
					_textDic[display.name]=tf;
					if(_firstText==null){
						_firstText=tf;
					}
				}
			}
		}
		
		public function setText(text:String,tname:String=null):void
		{
			if(tname==null){
				_firstText && (_firstText.text=text);
			}
			if(_textDic[tname]){
				_textDic[tname].text=text;
			}
		}
		
		public override function destory():void{
			if(_textDic){
				for each(var txt:FontField in _textDic){
					txt.destory();
				}
				_textDic=null;
			}
			_firstText=null;
			super.destory();
		}
		
	}
}